<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Open+Sans);

#loginBox form input[type="text"], #loginBox form input[type="password"]
   {
   display: block;
   width: 100%;
   padding: 10px;
   margin-bottom: 15px;
   border-radius: 5px;
   border: 1px solid #ccc;
}

#loginBoxTitle {
   color: #ffffff;
   font-size: 24px;
   font-weight: bold;
   margin-bottom:20px;
}

.btn {
   display: inline-block;
   *display: inline;
   *zoom: 1;
   padding: 4px 10px 4px;
   margin-bottom: 0;
   font-size: 13px;
   line-height: 18px;
   color: #333333;
   text-align: center;
   text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75);
   vertical-align: middle;
   background-color: #f5f5f5;
   background-image: -moz-linear-gradient(top, #ffffff, #e6e6e6);
   background-image: -ms-linear-gradient(top, #ffffff, #e6e6e6);
   background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff),
      to(#e6e6e6));
   background-image: -webkit-linear-gradient(top, #ffffff, #e6e6e6);
   background-image: -o-linear-gradient(top, #ffffff, #e6e6e6);
   background-image: linear-gradient(top, #ffffff, #e6e6e6);
   background-repeat: repeat-x;
   filter: progid:dximagetransform.microsoft.gradient(startColorstr=#ffffff,
      endColorstr=#e6e6e6, GradientType=0);
   border-color: #e6e6e6 #e6e6e6 #e6e6e6;
   border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
   border: 1px solid #e6e6e6;
   -webkit-border-radius: 4px;
   -moz-border-radius: 4px;
   border-radius: 4px;
   -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px
      rgba(0, 0, 0, 0.05);
   -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px
      rgba(0, 0, 0, 0.05);
   box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px
      rgba(0, 0, 0, 0.05);
   cursor: pointer;
   *margin-left: .3em;
}

.btn:hover, .btn:active, .btn.active, .btn.disabled, .btn[disabled] {
   background-color: #e6e6e6;
}

.btn-large {
   padding: 9px 14px;
   font-size: 15px;
   line-height: normal;
   -webkit-border-radius: 5px;
   -moz-border-radius: 5px;
   border-radius: 5px;
}

.btn:hover {
   color: #333333;
   text-decoration: none;
   background-color: #e6e6e6;
   background-position: 0 -15px;
   -webkit-transition: background-position 0.1s linear;
   -moz-transition: background-position 0.1s linear;
   -ms-transition: background-position 0.1s linear;
   -o-transition: background-position 0.1s linear;
   transition: background-position 0.1s linear;
}

.btn-primary, .btn-primary:hover {
   text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
   color: #ffffff;
}

.btn-primary.active {
   color: rgba(255, 255, 255, 0.75);
}

.btn-primary {
   background-color: #4a77d4;
   background-image: -moz-linear-gradient(top, #6eb6de, #4a77d4);
   background-image: -ms-linear-gradient(top, #6eb6de, #4a77d4);
   background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#2f5888),
      to(#5d6e8f));
   background-image: -webkit-linear-gradient(top, #2f5888, #5d6e8f);
   background-image: -o-linear-gradient(top, #6eb6de, #4a77d4);
   background-image: linear-gradient(top, #6eb6de, #4a77d4);
   background-repeat: repeat-x;
   filter: progid:dximagetransform.microsoft.gradient(startColorstr=#6eb6de,
      endColorstr=#4a77d4, GradientType=0);
   border: 1px solid #3762bc;
   text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.4);
   box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px
      rgba(0, 0, 0, 0.5);
   border-color: red;
}

.btn-primary:hover, .btn-primary:active, .btn-primary.active,
   .btn-primary.disabled, .btn-primary[disabled] {
   filter: none;
   background-color: #4a77d4;
}

.btn-block {
   width: 100%;
   display: block;
}

* {
   -webkit-box-sizing: border-box;
   -moz-box-sizing: border-box;
   -ms-box-sizing: border-box;
   -o-box-sizing: border-box;
   box-sizing: border-box;
}

html {
   width: 100%;
   height: 100%;
   overflow: hidden;
}

#back {
   background-image:
      url('https://www.bizhankook.com/upload/bk/article/201903/thumb/17469-37943-sample.jpg');
   position: absolute;
   z-index: -5;
   top: 0;
   bottom: 0;
   width: 100%;
   height: 100%;
   background-size: 100%;
}

.login {
   position: absolute;
   top: 50%;
   left: 45%;
   margin: -170px 0 0 -150px;
   width: 420px;
   height: 300px;
}

.login h1 {
   color: #c0c0c0;
   text-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
   letter-spacing: 1px;
   text-align: center;
}

input {
   width: 100%;
   margin-bottom: 15px;
   background: rgba(0, 0, 0, 0.3);
   border: none;
   outline: none;
   padding: 10px;
   font-size: 13px;
   color: #fff;
   text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.8);
   border: 1px solid rgba(0, 0, 0, 0.1);
   border-radius: 5px;
   box-shadow: inset 0 -5px 45px rgba(100, 100, 100, 30), 0 1px 1px
      rgba(255, 255, 255, 0.2);
   -webkit-transition: box-shadow .5s ease;
   -moz-transition: box-shadow .5s ease;
   -o-transition: box-shadow .5s ease;
   -ms-transition: box-shadow .5s ease;
   transition: box-shadow .5s ease;
}

input:focus {
   box-shadow: inset 0 -5px 45px rgba(100, 100, 100, 0.4), 0 1px 1px
      rgba(255, 255, 255, 0.2);
}

</style>
<title>로그인</title>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
   crossorigin="anonymous">
<link rel="stylesheet" href="css/login.css?v=1234">
</head>
<body class="text-center">
   <div id="back"></div>
   <div id="container">
      <div id="loginBox">
         <div class="col-md-6">
            <div class="login">
               <div id="loginBoxTitle">NASA LogIn</div>
               <form method="post" action="/phonebook/loginrequest"
                  enctype="multipart/form-data" >
                  <input type="text" name="loginid" placeholder="id"
                     required="required" autocomplete="off"  /> 
                     <input type="password" name="loginpw"
                     placeholder="Password" required="required" autocomplete="off" />
                  <button type="submit" class="btn btn-primary btn-block btn-large" style="border-color:#3d4551;" id="loginBtn">Login</button>
                  <div style="padding-bottom : 8px;" id ="loginck"></div>
               </form>
               <form method="get" action="/phonebook/signup">
                  <button type="submit" class="btn btn-primary btn-block btn-large" style="border-color:#3d4551;">SignUp</button>
               </form>
            </div>
         </div>
      </div>
   </div>


   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous">
      
   </script>
   <c:if test="${error != null}">
      <div class="alert alert-danger alert-dismissible fade show mt-3">
         에러 발생: ${error}
         <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
      </div>
   </c:if>
</body>
</html>