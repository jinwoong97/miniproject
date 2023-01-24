<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Main CSS : Header, Main, Footer -->
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/login.css">


<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- Bootstarp JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>
	.container {
		    display: flex;
		    justify-content: center;
	}
</style>

<div class="container">
<div class="logindiv">
  <h1 class="logo">동네친구</h1>
  <form id="myform" action="loginAction" method="post">
      <input type="text" placeholder="ID" id="user_id" class="account" name="user_id">
      <input type="password" placeholder="Password" id="user_pw" class="account" name="user_pw">
      <input type="submit" value="login" id="login" class="account">
  </form>
      <button id="join" class="account"><a href="/join">회원가입</a></button>
      <p id="alert" class="account"></p>    
</div>  
</div>