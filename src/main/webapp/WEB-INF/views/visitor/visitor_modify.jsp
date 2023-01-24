<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- c태그 꼭 써야 foreach문 사용 가능 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- Main CSS : Header, Main, Footer -->
<link rel="stylesheet" href="/css/visitor_modify.css">
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

<div class="container">
<aside class="asideGuest">
    <div class="profileGuest">
        <img src="images/logo.jpeg" alt="" style="height: 300px; margin-bottom: 20px;">
        <button class="addfriend">친구 추가</button> 
        <div>
            <input type="text" name="" id="intro">
        </div>
    </div>
</aside>
<section class="sectionGuest">
    <div class="section2guest">
        <div class="guestBook">
            <h5>방명록</h5>
            <div>
            <form action="visitor_modifyAction" method="post">
                <div class="writeBook">
                    <div class="bookContents"> 
                    <div class="guestimg"> 
                        <img src="images/logo.jpeg" alt="">
                    </div>
                    <div class="guestContents">
                    	<textarea class="writeguest" name="visitor_contents">${dto.visitor_contents}</textarea>
                    </div>
                </div>
                </div>
                <div class="writeButton">
                    <input type="submit" value="수정하기" class="reviseBtn">
                    <input
					type="button" value="삭제하기" class="deleteBtn"
					onclick="location.href='visitor_delete?visitor_idx=${dto.visitor_idx}'"
					style="margin-left: 10px;">
                </div>
                <input type="hidden" name="visitor_idx" value="${dto.visitor_idx}">
                <input type="hidden" value="${dto.visitor_date}">
                <input type="hidden" value="${dto.visitor_user_name}">
                <input type="hidden" value="${dto.visitor_user_idx}">
                </form>
    </div>
</section>
</div>