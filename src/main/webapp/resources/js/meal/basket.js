$(document).ready(function () {

    "use strict";
    let initCheck=0;

    $(".checkOne").each((i, e) => {
        if (e.getAttribute("status") == "4002") {
            e.parentElement.parentElement.parentElement.classList.toggle('complete');
            e.checked = true;
            initCheck++;
        }
    });

    if(initCheck==$(".checkOne").length){
        document.getElementsByClassName("checkAll")[0].checked = true;
    }

    var todo = function () {
        $(".card-body").on("click", '.todo-list .todo-item input', function () {
            let target = $(this);
            if (target.is(':checked')) {
                //DB에 update
                $.ajax({
                    url: "/basket/updateChecked",
                    type: "post",
                    data: {
                        code: target.prop("id"),
                    },
                }).done(function (resp) {
                    target.attr("status", "4002");
                    target.parent().parent().parent().toggleClass('complete');
                    initCheck++;
                    if(initCheck==$(".checkOne").length){
                    	document.getElementsByClassName("checkAll")[0].checked = true;
                    }
                    else{
                    	document.getElementsByClassName("checkAll")[0].checked = false;
                    }
                });
            } else {
                $.ajax({
                    url: "/basket/updateUnchecked",
                    type: "post",
                    data: {
                        code: target.prop("id"),
                    },
                }).done(function (resp) {
                    target.attr("status", "4001");
                    target.parent().parent().parent().toggleClass('complete');
                    initCheck--;
                    if(initCheck==$(".checkOne").length){
                    	document.getElementsByClassName("checkAll")[0].checked = true;
                    }
                    else{
                    	document.getElementsByClassName("checkAll")[0].checked = false;
                    }
                });
            }
        });

        // $(".card-body").on("click",'.todo-nav .all-task', function() {
        //     console.log(222222);
        //     console.log(this);
        //     $('.todo-list').removeClass('only-active');
        //     $('.todo-list').removeClass('only-complete');
        //     $('.todo-nav li.active').removeClass('active');
        //     $(this).addClass('active');
        // });

        // $(".card-body").on("click",'.todo-nav .active-task', function() {
        //     console.log(333333);
        //     console.log(this);
        //     $('.todo-list').removeClass('only-complete');
        //     $('.todo-list').addClass('only-active');
        //     $('.todo-nav li.active').removeClass('active');
        //     $(this).addClass('active');
        // });

        // $(".card-body").on("click",'.todo-nav .completed-task', function() {
        //     console.log(444444);
        //     console.log(this);
        //     $('.todo-list').removeClass('only-active');
        //     $('.todo-list').addClass('only-complete');
        //     $('.todo-nav li.active').removeClass('active');
        //     $(this).addClass('active');
        // });

        // $(".card-body").on("click",'#uniform-all-complete input', function() {
        //     console.log(555555);
        //     console.log(this);
        //     if($(this).is(':checked')) {
        //         $('.todo-item .checker span:not(.checked) input').click();
        //     } else {
        //         $('.todo-item .checker span.checked input').click();
        //     }
        // });

        // $(".card-body").on("click",'.remove-todo-item', function() {
        //     console.log(666666);
        //     console.log(this);
        //     $(this).parent().remove();
        // });
    };

    todo();

    $(".add-task").keypress(function (e) {
        if ((e.which == 13) && (!$(this).val().length == 0)) {
            // DB에 입력하기
            let inputBox = $(this);
            let name = $(this).val();
            $.ajax({
                url: "/basket/insertOne",
                type: "post",
                data: {
                    name: name,
                },
            }).done(function (code) {
                inputBox.val("");
                $(`<div class="todo-item position-relative"><div class="checker"><span class=""><input type="checkbox" class="checkOne" id=${code} status="4001"></span></div> <span>${name}</span> <a href="javascript:void(0);" class="float-right remove-todo-item"><i class="icon-close"></i></a><button type="button" class="btn btn-success position-absolute btnDeleteOne">X</button></div>`).insertAfter('.todo-list .todo-item:last-child');
            });

        } else if (e.which == 13) {
            alert('재료의 이름을 입력해주세요.');
            return false;
        }
        $(document).on('.todo-list .todo-item.added input').click(function () {
            if ($(this).is(':checked')) {
                $(this).parent().parent().parent().toggleClass('complete');
            } else {
                $(this).parent().parent().parent().toggleClass('complete');
            }
        });
        $('.todo-list .todo-item.added .remove-todo-item').click(function () {
            $(this).parent().remove();
        });
    });
    
    //전체 체크 이벤트
    $(".checkAll").off("click").on("click", function(){
        let checkAll = $(this);
        if (checkAll.is(':checked')) {
            $.ajax({
                url:"/basket/checkAll",
                type:"post",
            }).done(function(resp){
                $(".checkOne").each((i, e) => {
                    if(e.getAttribute("status")=="4001"){
                        e.setAttribute("status","4002");
                        e.parentElement.parentElement.parentElement.classList.toggle('complete');
                        e.checked = true;
                        initCheck++;
                    }
                });
            });
        }else{
            $.ajax({
                url:"/basket/uncheckAll",
                type:"post",
            }).done(function(resp){
                $(".checkOne").each((i, e) => {
                    if(e.getAttribute("status")=="4002"){
                        e.setAttribute("status","4001");
                        e.parentElement.parentElement.parentElement.classList.toggle('complete');
                        e.checked = false;
                        initCheck--;
                    }
                });
            }); 
        }
    });

    //삭제 이벤트
    $(".btnDeleteAll").off("click").on("click", function () {
        if($(".todo-list").html().trim()==""){
            alert("등록된 재료가 없습니다.");
            return false;
        }
        if (confirm("장바구니를 모두 삭제 하시겠습니까?")) {
            $.ajax({
                type: "post",
                url: "/basket/deleteAllBasket"
            }).done(function (resp) {
                $(".todo-list").children().remove();
                alert("장바구니가 모두 삭제되었습니다");
            });
        }
    });

    $(".todo-list").off("click").on("click", ".btnDeleteOne", function () {
        let delBtn = $(this);
        let basketCode = delBtn.parent().find(".checkOne").val();
        $.ajax({
            type: "post",
            url: "/basket/deleteBasket",
            data: {
                "basketCode": basketCode
            }
        }).done(function (resp) {
            delBtn.parent().remove();
        });
    });


});

