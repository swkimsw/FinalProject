$( document ).ready(function() {
    
    "use strict";
    
    var todo = function() { 
        $(".card-body").on("click",'.todo-list .todo-item input', function() {
        if($(this).is(':checked')) {
            //DB에 update
            $.ajax({
                url:"/basket/updateChecked",
                type:"post",
                data:{

                },
            }).done(function(){
                $(this).parent().parent().parent().toggleClass('complete');
            });
        } else {
            $.ajax({
                url:"/basket/updateUnchecked",
                type:"post",
                data:{

                },
            }).done(function(){
                $(this).parent().parent().parent().toggleClass('complete');
            });
        }
       });
    
    $(".card-body").on("click",'.todo-nav .all-task', function() {
        $('.todo-list').removeClass('only-active');
        $('.todo-list').removeClass('only-complete');
        $('.todo-nav li.active').removeClass('active');
        $(this).addClass('active');
    });
    
    $(".card-body").on("click",'.todo-nav .active-task', function() {
        $('.todo-list').removeClass('only-complete');
        $('.todo-list').addClass('only-active');
        $('.todo-nav li.active').removeClass('active');
        $(this).addClass('active');
    });
    
    $(".card-body").on("click",'.todo-nav .completed-task', function() {
        $('.todo-list').removeClass('only-active');
        $('.todo-list').addClass('only-complete');
        $('.todo-nav li.active').removeClass('active');
        $(this).addClass('active');
    });
    
    $(".card-body").on("click",'#uniform-all-complete input', function() {
        if($(this).is(':checked')) {
            $('.todo-item .checker span:not(.checked) input').click();
        } else {
            $('.todo-item .checker span.checked input').click();
        }
    });
    
    $(".card-body").on("click",'.remove-todo-item', function() {
        $(this).parent().remove();
    });
    };
    
    todo();
    
    $(".add-task").keypress(function (e) {
        if ((e.which == 13)&&(!$(this).val().length == 0)) {
            // DB에 입력하기
            $.ajax({
                url:"/basket/insertOne",
                type:"post",
                data:{
                    name:$(this).val(),
                },
            }).done(function(){
                $('<div class="todo-item position-relative"><div class="checker"><span class=""><input type="checkbox" class="checkOne"></span></div> <span>' + $(this).val() + '</span> <a href="javascript:void(0);" class="float-right remove-todo-item"><i class="icon-close"></i></a><button type="button" class="btn btn-success position-absolute btnDeleteOne">X</button></div>').insertAfter('.todo-list .todo-item:last-child');
                $(this).val('');
            });

        } else if(e.which == 13) {
            alert('재료의 이름을 입력해주세요.');
        }
        $(document).on('.todo-list .todo-item.added input').click(function() {
            if($(this).is(':checked')) {
                $(this).parent().parent().parent().toggleClass('complete');
            } else {
                $(this).parent().parent().parent().toggleClass('complete');
            }
        });
        $('.todo-list .todo-item.added .remove-todo-item').click(function() {
            $(this).parent().remove();
        });
    });
}); 