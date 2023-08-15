<!DOCTYPE html>
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="../assets/css/sign.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Hind&display=swap" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" charset="utf-8"></script>
    <style>

        </style>
  </head>
  <body>
    <div class="login-form">
      <div class="logo"><img src="../assets/img/logo.png" alt=""></div>
      <div class="social-media">
        <button class="fb"><img src="../assets/img/facebook1.png" alt=""></button>
        <button class="google"><img src="../assets/img/g.png" alt=""></button>
        <button class="apple"><img src="../assets/img/apple (1).png" alt=""></button>
        <button class="and"><img src="../assets/img/android.svg" alt=""></button>
      </div>
      <h6>Sign In</h6>
      <form method="post" action="check.jsp">
        <div class="textbox">
          <input type="text" placeholder="Username Or Email" name="id">
          <span class="check-message hidden">Required</span>
        </div>
        <div class="textbox">
          <input type="password" placeholder="Password" name="pwd">
          <span class="check-message hidden">Required</span>
        </div>
        <div class="options">
          <label class="remember-me">
            <span class="checkbox">
              <input type="checkbox">
              <span class="checked"></span>
            </span>
            Remember me
          </label>
          <a href="#">Forgot Your Password</a>
        </div>
        <input type="submit" value="Log In Now" class="login-btn" disabled>
        <div class="privacy-link">
          <a href="#">Privacy Policy</a>
        </div>
      </form>
      <div class="privacy-link1">
        <a href="./index.jsp">Back to home</a>
      </div>
      <div class="dont-have-account">
        Don't have an Epic Games account?
        <a href="./registered.jsp">Sign Up</a>
      </div>
    </div>
    <script type="text/javascript">
      $(".textbox input").focusout(function(){
        if($(this).val() == ""){
          $(this).siblings().removeClass("hidden");
          $(this).css("background","#554343");
        }else{
          $(this).siblings().addClass("hidden");
          $(this).css("background","#484848");
        }
      });
      $(".textbox input").keyup(function(){
        var inputs = $(".textbox input");
        if(inputs[0].value != "" && inputs[1].value){
          $(".login-btn").attr("disabled",false);
          $(".login-btn").addClass("active");
        }else{
          $(".login-btn").attr("disabled",true);
          $(".login-btn").removeClass("active");
        }
      });
    </script>
  </body>
</html>