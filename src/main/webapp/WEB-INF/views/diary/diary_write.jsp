<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Main CSS : Header, Main, Footer -->
<link rel="stylesheet" href="/css/diary.css">
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

  <!-- 메인 -->
  <!-- 다이어리 -->
  <div class="container">
  <div id="diary">
    <aside class="asideDiary">
        <div>
            <p>다이어리 목록 입니다</p>
        </div>
        <div class="list-diary">
            <a href="#" class="list-group-item list-group-item-action">다이어리 1</a>
            <a href="#" class="list-group-item list-group-item-action">다이어리 2</a>
            <a href="#" class="list-group-item list-group-item-action">다이어리 3</a>
            <a class="list-group-item list-group-item-action disabled">다이어리 비활성화</a>
          </div>
    </aside>
    <section class="sectionDiary">
    	<form action="diaryWriteAction" method="post">
			<input name="diary_title" type="text" value="">	
			<select name="folder">
				<option value="1">다이어리</option>
				<option value="2">개발일지</option>
				<option value="3">비밀일기</option>
			</select>
		<div class="diary-contents"> 
			<textarea rows="15"
			onkeydown="resize(this)" onkeyup="resize(this)" name="diary_contents"></textarea>
        </div>
        <div class="writeBtn">
         	<input type="submit" value="글쓰기">
         	<a href="diary"><input type="button" value="취소"></a>
        </div>
        </form>
    </section>
  </div>
  </div>