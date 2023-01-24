<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- c태그 꼭 써야 foreach문 사용 가능 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- Main CSS : Header, Main, Footer -->
<link rel="stylesheet" href="/css/promlist.css">
<link rel="stylesheet" href="/css/main.css">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css " rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- Bootstarp JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<!-- datepicker -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
  <!-- 메인 -->
  <!-- 다이어리 -->
  <div class="container">
  <aside class="asideProm">
  <div class="profileProm">
      <img src="images/logo.jpeg" alt="" style="height: 300px; margin-bottom: 20px;">
      <button class="addfriend">친구 추가</button> 
      <div>
          <input type="text" name="" id="intro">
      </div>
  </div>
</aside>
    <section class="sectionDiary">
    	<form action="promlist_modifyAction" method="post">
    	<div class="promOption">
			<input name="promlist_title" type="text" value="${dto.promlist_title}">
			<p>수정 전 날짜 : <fmt:formatDate value="${dto.promlist_date}" pattern="yyyy-MM-dd"/></p>
			<input name="promlist_date" type="date" value="<fmt:formatDate value="${dto.promlist_date}" pattern="yyyy-MM-dd"/>">
			<input name="promlist_friends" type="text" value="${dto.promlist_friends}">
	    </div>
		<div class="promlist-contents">
			<textarea rows="15"
			onkeydown="resize(this)" onkeyup="resize(this)" name="promlist_contents">${dto.promlist_contents}</textarea>
        </div>
        <div class="writeBtn">
         	<input type="submit" value="수정">
         	<input
			type="button" value="삭제" class="deleteBtn"
			onclick="location.href='promlist_delete?promlist_idx=${dto.promlist_idx}'"
			>
         	<a href="promlist"><input type="button" value="취소"></a>
        </div>
        <input type="hidden" value="${dto.promlist_idx}" name="promlist_idx"> 
        <input type="hidden" value="${dto.promlist_user_id}"> 
        </form>
    </section>
  </div>
