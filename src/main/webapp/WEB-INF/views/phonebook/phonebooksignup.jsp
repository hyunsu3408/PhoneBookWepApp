<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
   integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
   crossorigin="anonymous">

<style>
@import url(https://fonts.googleapis.com/css?family=Open+Sans);

body {
   min-height: 100vh;
   background: -webkit-gradient(linear, left bottom, right top, from(#92b5db),
      to(#1d466c));
   background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
   background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
   background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
   background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
}

.btn-primary {
    color: #fff;
    background-color: #71879f;
    border-color: #b8b8b8;
}

.input-form {
   max-width: 680px;
   margin-top: 80px;
   padding: 32px;
   background-color: #ffffff;
   background-color: rgba( 255, 255, 255, 0.9 );
   -webkit-border-radius: 10px;
   -moz-border-radius: 10px;
   border-radius: 10px;
   -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
   -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
   box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
}
.id_ok{
color:#008000;
display: none;
}

.id_already{
color:#6A82FB; 
display: none;
}
.pw_ok{
color:#008000; 
display: none;
}
.pw_nok{
color:#6A82FB; 
display: none;
}

#back{
	   background-image: url('https://www.bizhankook.com/upload/bk/article/201903/thumb/17469-37943-sample.jpg');
	   position:absolute;
	   z-index:-5;
	   top:0;
	   bottom:0;
	   width:100%;
	   height:100%;
	   background-size: 100%;
	   
</style>
</head>

<body>
  <div id="back"></div>
   <div class="container">
      <div class="input-form-backgroud row">
         <div class="input-form col-md-12 mx-auto">
            <h4 class="mb-3">회원가입</h4>
               <form class="validation-form" method="post" action="/phonebook/signrequest" enctype="multipart/form-data" novalidate>
               <div class="row">
                  <div class="col-md-6 mb-3">
                     <label for="loginid">ID</label>
                     <input type="text" class="form-control" id="loginid" name="loginid" placeholder="ID를 입력해주세요" oninput="checkId(loginid.value)" required>
                     <!-- id ajax 중복체크 -->
					<span class="id_ok">사용 가능한 아이디입니다.</span>
				    <span class="id_already">누군가 이 아이디를 사용하고 있어요.</span>
                     <div class="invalid-feedback">ID를 입력해주세요.</div>
	                  </div>
	               </div>
	               <div class="mb-3">
	                  <label for="loginpw">PW</label>
	                  <input type="password" class="form-control" id="loginpw" name="loginpw" placeholder="PASSWORD를 입력하세요." required>
	                  <div class="invalid-feedback">PASSWORD를 입력하세요.</div>
	               </div>
	               <div class="mb-3">
	                  <label for="loginpw">PW 확인</label>
	                  <input type="password" class="form-control" id="passwordconfirm" name="passwordconfirm" placeholder="PASSWORD를 입력하세요." oninput="passConfirm()" required>
	                  <span class="pw_ok">비밀번호 일치</span>
				    	  <span class="pw_nok">비밀번호 불일치. 다시 입력하세요.</span>
	                  <div class="invalid-feedback">PASSWORD를 입력하세요.</div>
	               </div>
	               <div class="mb-3">
	                  <label for="loginph">전화번호</label>
	                  <input type="text" class="form-control" id="loginph" name="loginph" placeholder="01012345678" required>
	                  <div class="invalid-feedback">전화번호를 입력해주세요.</div>
	               </div>
	
	               <hr class="mb-4">
	               <div class="custom-control custom-checkbox">
	                  <input type="checkbox" class="custom-control-input" id="aggrement"
	                     required> <label class="custom-control-label"
	                     for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
	               </div>
	               <div class="mb-4"></div>
	               <button class="btn btn-primary btn-lg btn-block" type="submit">가입완료</button>
              </form>
              <form method="get" action="/phonebook/login" enctype="multipart/form-data">
              	 <button class="btn btn-primary btn-lg btn-block" type="submit">로그인화면으로 돌아가기</button>
              </form>
         </div>
      </div>
      <footer class="my-3 text-center text-small">
         <p class="mb-1">&copy; 2023 윤영팀이 짱이다</p>
      </footer>
   </div>
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
 <!--  id 확인 -->
   <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script>
	 function checkId(loginid){
      $.ajax({
          url:'/phonebook/idcheck',
          type:'post',
          data:{loginid:loginid},
          success:function(cnt){
              if(cnt == 0){
                  $('.id_ok').css("display","inline-block"); 
                  $('.id_already').css("display", "none");
              } else {
                  $('.id_already').css("display","inline-block");
                  $('.id_ok').css("display", "none");
                  $('loginid').val('');
              }
          },
          error:function(){
              alert("에러입니다");
          }
      });
      };
  </script>
  <!-- 비밀번호 확인 -->
  <script type="text/javascript">
	function passConfirm() {
		var password = document.getElementById('loginpw').value;
		var passwordConfirm = document.getElementById('passwordconfirm').value;
		if(password == passwordConfirm){
			 $('.pw_ok').css("display","inline-block"); 
             $('.pw_nok').css("display", "none");
		}else{
			$('.pw_nok').css("display","inline-block");
            $('.pw_ok').css("display", "none");
            $('passwordconfirm').val('');
		}
	}
</script>
</body>
</html>