<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Animated Login Form</title>

  <link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
  <script src="https://kit.fontawesome.com/a81368914c.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <link rel="stylesheet" href="/css/login.css">
</head>

<body>
<!-- 헤더위치 -->
<%@ include file="/WEB-INF/views/comm/header.jsp"%>

<div class="login-page">
  <img class="wave" src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/wave.png">
  <div class="container">
    <div class="img">
      <img src="/img/hanaCharacter.png">
    </div>

    <!-- 로그인 폼 -->
    <div class="login-content">
      <form id="loginForm" method="post">
        <img src="https://raw.githubusercontent.com/sefyudem/Responsive-Login-Form/master/img/avatar.svg">
        <h2 class="title">Welcome</h2>
              <div class="input-div one">
                 <div class="i">
                    <i class="fas fa-user"></i>
                 </div>
                 <div class="div">
                    <h5>ID</h5>
                    <input type="text" class="input" id="id">
                 </div>
              </div>
              <div class="input-div pass">
                 <div class="i">
                    <i class="fas fa-lock"></i>
                 </div>
                 <div class="div">
                    <h5>Password</h5>
                    <input type="password" class="input" id="password">
                 </div>
              </div>
              <a href="#">Forgot Password?</a>
                <input type="button" class="btn" value="Login" onclick="loginFormFunc(); return false;">
            </form>

        </div>
    </div>
<script>
    const inputs = document.querySelectorAll(".input");

    function addcl(){
      let parent = this.parentNode.parentNode;
      parent.classList.add("focus");
    }

    function remcl(){
      let parent = this.parentNode.parentNode;
      if(this.value == ""){
        parent.classList.remove("focus");
      }
    }


    inputs.forEach(input => {
      input.addEventListener("focus", addcl);
      input.addEventListener("blur", remcl);
    });
    //Source :- https://github.com/sefyudem/Responsive-Login-Form/blob/master/img/avatar.svg

    <!-- 로그인 -->
    function loginFormFunc() {
            var id = $("#id").val();
            var password = $("#password").val();

            // Ajax를 통해 서버에 요청 전송
            $.ajax({
                type: "POST",
                url: "/customer/login-logic",
                data: JSON.stringify({
                    id: id,
                    password: password
                }),
                contentType: 'application/json',
                error: function (xhr, status, error) {
                    alert(error + "error");
                },
                success: function (response) {
                    if (response === "로그인 성공") {
                        // 로그인 성공 시 처리
                        alert("로그인 성공");
                        console.error("로그인 성공");
                        var link = document.createElement("a");
                        link.href = "/home";
                        link.click();
                    } else {
                        // 로그인 실패 시 처리
                        console.error("로그인 실패");
                    }
                }
            });
        }
</script>
</div>

<!-- 푸터위치 -->
<%@ include file="/WEB-INF/views/comm/footer.jsp"%>
</body>

</html>