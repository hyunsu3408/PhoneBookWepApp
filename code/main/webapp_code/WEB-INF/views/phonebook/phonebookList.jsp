<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
   crossorigin="anonymous">
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
   crossorigin="anonymous"></script>
<style>
element.style {
   
}

hr {
   width: 100%;
   margin-left: auto;
   margin-right: auto;
   display: block;
   unicode-bidi: isolate;
   margin-block-start: 3%;
   margin-block-end: 3%;
   margin-inline-start: auto;
   margin-inline-end: auto;
   overflow: hidden;
}

.btn-group-lg>.btn, .btn-lg {
   padding: 0.3rem 1rem;
   font-size: 0.90rem;
   border-radius: 0.25rem;
}

.form-label {
   color: #000000;
   margin-bottom: 0.5rem;
}

.card {
   position: relative;
   display: flex;
   flex-direction: column;
   min-width: 0;
   word-wrap: break-word;
   color: #000000;
   background-clip: border-box;
   border: 1px solid rgba(0, 0, 0, .125);
   border-radius: 0.25rem;
}

.card-body {
   flex: 1 1 auto;
   padding: 1rem 1rem;
}

body {
   font-weight: 700;
   min-height: 97vh;
   background: -webkit-gradient(linear, left bottom, right top, from(#92b5db),
      to(#1d466c));
   background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
   background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
   background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
   background: linear-gradient(to top right, #968c7b 0%, #1d466c 100%);
}

#back {
   background-image: url('https://i.imgur.com/zriTlfS.jpg');
   position: absolute;
   z-index: -5;
   top: 0;
   bottom: 0;
   width: 100%;
   height: 100%;
   background-size: 100%;
}

.login_success_area>a {
   font-size: 15px;
   font-weight: 900;
   display: inline-block;
   margin-top: 5px;
   background: #e1e5e8;
   width: 70px;
   height: 0px;
   line-height: 22px;
   border-radius: 25px;
   color: #ededed;
   margin: 0;
}

.btn-danger {
   color: #fff;
   background-color: #ffc700;
   border-color: #000000;
}

.btn-primary {
   color: #fff;
   background-color: #26559b;
   border-color: #000000;
}

.btn-outline-info {
   color: #d0d1d3;
   border-color: #ffffff;
}

.table { -
   -bs-table-bg: transparent; -
   -bs-table-striped-color: #212529; -
   -bs-table-striped-bg: rgba(0, 0, 0, 0.05); -
   -bs-table-active-color: #212529; -
   -bs-table-active-bg: rgba(0, 0, 0, 0.1); -
   -bs-table-hover-color: #212529; -
   -bs-table-hover-bg: rgba(0, 0, 0, 0.075);
   width: 100%;
   margin-bottom: 1rem;
   color: #b8b8b8;
   vertical-align: top;
   border-color: #dee2e6;
   margin-left: auto;
   margin-right: auto;
}

.table>:not(caption)>*>* {
   padding: 0.5rem 0.5rem;
   background-color: #353c50;
   border-bottom-width: 2px;
   box-shadow: inset 0 0 0 9999px var(- -bs-table-accent-bg);
   margin: auto;
}

.table, th, td {
   text-align: center;
}

.input-form {
   max-width: 500px;
   -webkit-border-radius: 10px;
   -moz-border-radius: 10px;
   border-radius: 10px;
   -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
   -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
   box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
}

.ph_ok {
   color: #008000;
   display: none;
}

.ph_already {
   color: #6A82FB;
   display: none;
}
.ph_ln {
   color: #6A82FB;
   display: none;
}
#relative {
   bottom: 20%;
   left: 100%;
   float: right;
}

#member {
   position: absolute; /* 절대 위치 설정 */
   top: 50px;
   left: 50%; /* 가운데로 이동 */
   transform: translateX(-50%);
   font-family: Georgia;
   color: #b1b1b1;
}
</style>
<title>전화번호 List</title>
</head>
<script type="text/javascript">
 window.history.forward();
 function noBack(){window.history.forward();}
</script>
<body>

   <body onload="noBack();" onpageshow="if(event.persisted) noBack();"
   onunload="">
   <nav><br>

   <h3 id="member">${loginid}님의전화번호목록</h3>
   <div id="back"></div>
   <div class="container">
      <div class="login_success_area" id="relative">
         <form method="get" action="/phonebook/logout.do"
            enctype="multipart/form-data">
            <button class="btn btn-primary btn-lg btn-block" type="submit">로그아웃</button>
         </form>
      </div>
   </div>
   </nav>
   <div class="container">
      <hr>
      <table class="table table-hover">
         <thead>
            <tr>
               <th>이름</th>
               <th>전화번호</th>
               <th>주소</th>
               <th>그룹</th>
               <th>수정</th>
               <th>삭제</th>
            </tr>
         </thead>
         <tbody>
            <c:forEach var="phonebook" items="${phonebookList}"
               varStatus="status">
               <tr>
                  <td align="center">${phonebook.username}</td>
                  <td align="center">${phonebook.userph}</td>
                  <td align="center">${phonebook.useraddr}</td>
                  <td align="center">${phonebook.groupname}</td>
                  <td align="center">
                     <button type="button" class="btn btn-primary"
                        data-bs-toggle="collapse"
                        data-bs-target="#updateForm${phonebook.userph}"
                        aria-expanded="false" aria-controls="updateForm">수정하기</button>
                     <div class="collapse" id="updateForm${phonebook.userph}">
                        <div class="card card-body">
                           <form method="post" action="/phonebook/update"
                              class="validation-form" enctype="multipart/form-data"
                              novalidate>
                              <label class="form-label">이름</label> <input type="text"
                                 name="username" class="form-control" required>
                              <div class="invalid-feedback">이름을 입력하세요.</div>
                              <br> <label class="form-label">전화번호</label> <input
                                 type="text" name="userph" class="form-control"
                                 value="${phonebook.userph}" readonly required> <br>
                              <label class="form-label">주소</label> <input type="text"
                                 name="useraddr" class="form-control" required>
                              <div class="invalid-feedback">주소를 입력하세요.</div>
                              <br> <label class="form-label">그룹</label><br>
                              <div class="form-check form-check-inline">
                                 <input class="form-check-input" type="radio" name="groupid"
                                    id="groupid" value="10" required> <label
                                    class="form-check-label" for="inlineCheckbox1"> 가족 </label>
                              </div>
                              <div class="form-check form-check-inline">
                                 <input class="form-check-input" type="radio" name="groupid"
                                    id="groupid" value="20" required> <label
                                    class="form-check-label" for="inlineCheckbox2"> 친구 </label>
                              </div>
                              <div class="form-check form-check-inline">
                                 <input class="form-check-input" type="radio" name="groupid"
                                    id="groupid" value="30" required> <label
                                    class="form-check-label" for="inlineCheckbox3"> 기타 </label>
                              </div>
                              <button type="submit" class="btn btn-success mt-3">저장</button>
                           </form>
                        </div>
                     </div>
                  </td>
                  <td align="center">
                     <button type="button" class="btn btn-danger"
                        data-bs-toggle="modal"
                        data-bs-target="#exampleModal${phonebook.userph}">삭제하기</button>
                     <form method="post" action="/phonebook/delete"
                        enctype="multipart/form-data">
                        <div class="modal fade" id="exampleModal${phonebook.userph}"
                           tabindex="-1" aria-labelledby="exampleModalLabel"
                           aria-hidden="true">
                           <div class="modal-dialog">
                              <div class="modal-content">
                                 <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">삭제하시겠습니까?</h5>
                                    <button type="button" class="btn-close"
                                       data-bs-dismiss="modal" aria-label="Close"></button>
                                 </div>
                                 <div class="modal-body">"${phonebook.username}"님을
                                    삭제하시겠습니까?</div>
                                 <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary"
                                       data-bs-dismiss="modal">취소</button>
                                    <button type="submit" class="btn btn-primary" name="userph"
                                       value="${phonebook.userph}">삭제하기</button>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </form>
                  </td>
               </tr>
            </c:forEach>
         </tbody>
      </table>
      <hr>
      <c:if test="${error != null}">
         <div class="alert">
            에러 발생: ${error}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
         </div>
      </c:if>
      <button class="btn btn-outline-info mb-3" type="button"
         data-bs-toggle="collapse" data-bs-target="#addForm"
         aria-expanded="false" aria-controls="addForm">전화번호 추가</button>
      <div class="collapse" id="addForm">
         <div class="input-form col-md-12 mx-auto">
            <div class="card card-body">
               <form class="validation-form" method="post" action="/phonebook/add"
                  enctype="multipart/form-data" novalidate>
                  <div class="row">
                     <div class="col-md-6 mb-3">
                        <label for="username">이름</label> <input type="text"
                           class="form-control" id="username" name="username"
                           placeholder="이름을 입력해주세요" required="required">
                        <div class="invalid-feedback">이름을 입력하세요.</div>
                     </div>
                     <div class="mb-3">
                        <label for="userph">전화번호</label> <input type="text"
                           class="form-control" id="userph" name="userph"
                           placeholder="전화번호를 입력하세요." oninput="checkph(userph.value)"
                           minlength="11" maxlength="11" required="required"> <span class="ph_ok">등록 가능한 사용자입니다.</span> 
                           <span class="ph_ln">전화번호 11자리 입력해주세요.</span> 
                           <span class="ph_already">이미 저장된 사용자입니다. 다시입력하세요.</span>
                        <div class="invalid-feedback">전화번호를 입력하세요.</div>
                     </div>

                     <div class="mb-3">
                        <label for="useraddr">주소</label> <input type="text"
                           class="form-control" id="useraddr" name="useraddr"
                           placeholder="주소를 입력하세요." required="required">
                        <div class="invalid-feedback">주소를 입력하세요.</div>
                     </div>
                     <div class="mb-3">
                        <label class="form-label">그룹</label> <br> <input
                           type="radio" name="groupid" value="10" checked="checked">가족
                        <input type="radio" name="groupid" value="20">친구 <input
                           type="radio" name="groupid" value="30">기타
                        <div class="invalid-feedback">그룹을 선택하십시오.</div>
                        <button type="submit" class="btn btn-success mt-3">저장</button>
                     </div>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
   <!--  전화번호 확인 -->
   <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
   <script>
      function checkph(userph) {
         $.ajax({
            url : '/phonebook/checkph',
            type : 'post',
            data : {userph : userph},
            success : function(cnt) {
                if (userph.length != 11) {
                   $('.ph_already').css("display", "none");
                    $('.ph_ln').css("display", "inline-block");
                    $('.ph_ok').css("display", "none");
                } else if(cnt == 0) {
                   $('.ph_ok').css("display", "inline-block");
                    $('.ph_ln').css("display", "none");
                    $('.ph_already').css("display", "none");
                }else {
                   $('.ph_already').css("display", "inline-block");
                   $('.ph_ln').css("display", "none");
                   $('.ph_ok').css("display", "none");
                   $('userph').val('');
                }
             },

            error : function() {
               alert("에러입니다");
            }
         });
      };
   </script>
   <script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }
          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  </script>
</body>


</html>