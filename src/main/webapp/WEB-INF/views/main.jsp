<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Main CSS : Header, Main, Footer -->
<link rel="stylesheet" href="/css/main.css">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- Bootstarp JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>


<div class="container">
    <aside class="asideMain">
        <div class="profile">
            <img src="images/logo.jpeg" alt="" style="height: 300px; margin-bottom: 20px;">
        	<c:forEach var="dto" items="${user_list}">
            	<div class="user_name">${ dto.user_name }</div>
            </c:forEach>
            <button class="addfriend">친구 추가</button> 
            <div>
                <input type="text" name="" id="intro">
            </div>
     
        </div>
    </aside>
    <section class="sectionMain">
        <div class="section1">
            <h5>자기소개</h5>
            <textarea name="" id="" cols="30" rows="5"></textarea>
        </div>
        <div class="section2">
            <h5>방명록</h5>
            <textarea name="" id="" cols="50" rows="10"></textarea>
        </div>
    <div class="S4imgbox">
    <div class="gallery">
        <h5>사진첩</h5>
    </div>
    <c:forEach var="dto" items="${ re_list }">
        <a href="gallery" class="S4img1">
          <figure>
            <div class="S4img1-1">
            <img src="../upload/${ dto.gallery_img }" alt="이미지2" class="gimg1">
            </div>
          <p style="font-size: 20px; color: black;">${dto.gallery_title}</p>
        </figure>
        </c:forEach>   
      </div>
    </section>
</div>>