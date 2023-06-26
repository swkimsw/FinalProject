<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<!-- JQuery-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Bootstrap - CSS only -->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
   crossorigin="anonymous">
<!-- Bootstrap - JavaScript Bundle with Popper -->
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
   crossorigin="anonymous"></script>
<!-- Bootstrap - icon -->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css"
   rel="stylesheet">
<!-- Font 기본 : {font-family: 'NanumSquareNeoBold'}-->
<link
   href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
   rel="stylesheet">
<!-- awesome font -icon -->
<link
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
   rel="stylesheet"
   integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
   crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- gbn css -->
<link href="${path}/resources/css/gnb.css" rel="stylesheet"
   type="text/css">
<style>
* {
   font-family: NanumSquareNeoBold;
}

.container {
   margin-top: 100px;
}

body {
   margin-top: 20px;
   background: #f8f8f8;
}

.todo-nav {
   margin-top: 10px
}

.todo-list {
   margin: 10px 0
}

.todo-list .todo-item {
   padding: 15px;
   margin: 5px 0;
   border-radius: 0;
   background: #f7f7f7
}

.todo-list.only-active .todo-item.complete {
   display: none
}

.todo-list.only-active .todo-item:not(.complete) {
   display: block
}

.todo-list.only-complete .todo-item:not(.complete) {
   display: none
}

.todo-list.only-complete .todo-item.complete {
   display: block
}

.todo-list .todo-item.complete span {
   text-decoration: line-through
}

.remove-todo-item {
   color: #ccc;
   visibility: hidden
}

.remove-todo-item:hover {
   color: #5f5f5f
}

.todo-item:hover .remove-todo-item {
   visibility: visible
}

div.checker {
   width: 18px;
   height: 18px
}

div.checker input, div.checker span {
   width: 18px;
   height: 18px
}

div.checker span {
   display: -moz-inline-box;
   display: inline-block;
   zoom: 1;
   text-align: center;
   background-position: 0 -260px;
}

div.checker, div.checker input, div.checker span {
   width: 19px;
   height: 19px;
}

div.checker, div.radio, div.uploader {
   position: relative;
}

div.button, div.button *, div.checker, div.checker *, div.radio, div.radio *,
   div.selector, div.selector *, div.uploader, div.uploader * {
   margin: 0;
   padding: 0;
}

div.button, div.checker, div.radio, div.selector, div.uploader {
   display: -moz-inline-box;
   display: inline-block;
   zoom: 1;
   vertical-align: middle;
}

.card {
   padding: 25px;
   margin-bottom: 20px;
   border: initial;
   background: #fff;
   border-radius: calc(.15rem - 1px);
   box-shadow: 0 1px 15px rgba(0, 0, 0, 0.04), 0 1px 6px
      rgba(0, 0, 0, 0.04);
}

.card-white {
   min-height: 700px;
}

.btnDeleteOne {
   right: 1rem;
   --bs-btn-padding-y: .25rem;
   --bs-btn-padding-x: .5rem; 
   --bs-btn-font-size: .75rem;
}

.checkOne {
   accent-color: #007936;
}

.groceryImg {
   width: 80%;
}

.extraBox {
   background-color: #ffffc2;
   box-shadow: 0 1px 15px rgba(0, 0, 0, 0.04), 0 1px 6px rgba(0, 0, 0, 0.04);
}
#extraText{
   background-color:#ffffff;
   padding:.5rem;
   border-radius:10px;
   box-shadow:1px 1px 3px gray;
}
.selectAllBox{
   align-items:center;
   padding:10px 15px 0px 15px;
}
.checkAll{
   accent-color:#007936;
   width:19px;
   height:19px;
}
.btnDeleteAll{
   --bs-btn-padding-y: .25rem;
    --bs-btn-padding-x: .5rem;
    --bs-btn-font-size: .75rem;
}
</style>
</head>
<body>

   <header>
      <c:import url="../commons/gnb.jsp">
      </c:import>
   </header>

   <main>
      <div class="container">
         <div class="header title">
            <h2 class="text-center p-4">나의 장바구니 목록</h2>
         </div>
         <div class="row">
            <div class="col-6 d-none d-md-block col-md-6 extraBox">
               <div class="d-flex justify-content-center">
                  <img src="/resources/img/grocery.png" alt="logo"
                     class="groceryImg p-5">
               </div>
               <div class="text-center"><span id="extraText">즐거운 장보기 되세요!</span></div>
            </div>
            <div class="col-12 col-md-6">
               <div class="card card-white m-0">
                  <div class="card-body">
                     <form action="javascript:void(0);">
                        <input type="text" class="form-control add-task"
                           placeholder="새로운 재료 등록...">
                     </form>
                     <div class="selectAllBox d-flex justify-content-between">
                        <input type="checkbox" class="checkAll">
                        <button type="button" class="btn btn-success btnDeleteAll">X</button>
                     </div>
                     <div class="todo-list">
                        <div class="todo-item position-relative">
                           <div class="checker">
                              <span class=""><input type="checkbox" class="checkOne"></span>
                           </div>
                           <span>쌀</span> <a href="javascript:void(0);"
                              class="float-right remove-todo-item"><i class="icon-close"></i></a>
                           <button type="button"
                              class="btn btn-success position-absolute btnDeleteOne">X</button>
                        </div>
                        <div class="todo-item position-relative">
                           <div class="checker">
                              <span class=""><input type="checkbox" class="checkOne"></span>
                           </div>
                           <span>우유</span> <a href="javascript:void(0);"
                              class="float-right remove-todo-item"><i class="icon-close"></i></a>
                           <button type="button"
                              class="btn btn-success position-absolute btnDeleteOne">X</button>
                        </div>

                        <div class="todo-item position-relative">
                           <div class="checker">
                              <span class=""><input type="checkbox" class="checkOne"></span>
                           </div>
                           <span>시리얼</span> <a href="javascript:void(0);"
                              class="float-right remove-todo-item"><i class="icon-close"></i></a>
                           <button type="button"
                              class="btn btn-success position-absolute btnDeleteOne">X</button>
                        </div>
                        <div class="todo-item position-relative">
                           <div class="checker">
                              <span><input type="checkbox" class="checkOne"></span>
                           </div>
                           <span>햄스터</span> <a href="javascript:void(0);"
                              class="float-right remove-todo-item"><i class="icon-close"></i></a>
                           <button type="button"
                              class="btn btn-success position-absolute btnDeleteOne">X</button>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </main>

   <script>
$( document ).ready(function() {
    
    "use strict";
    
    var todo = function() { 
        $(".card-body").on("click",'.todo-list .todo-item input', function() {
        if($(this).is(':checked')) {
            $(this).parent().parent().parent().toggleClass('complete');
        } else {
            $(this).parent().parent().parent().toggleClass('complete');
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
            $('<div class="todo-item position-relative"><div class="checker"><span class=""><input type="checkbox" class="checkOne"></span></div> <span>' + $(this).val() + '</span> <a href="javascript:void(0);" class="float-right remove-todo-item"><i class="icon-close"></i></a><button type="button" class="btn btn-success position-absolute btnDeleteOne">X</button></div>').insertAfter('.todo-list .todo-item:last-child');
            $(this).val('');
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
</script>
</body>
</html>