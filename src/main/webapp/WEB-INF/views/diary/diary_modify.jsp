<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- c태그 꼭 써야 foreach문 사용 가능 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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

<script>
function resize(obj) {
    obj.style.height = '1px';
    obj.style.height = (12 + obj.scrollHeight) + 'px';
}
</script>
  <!-- 메인 -->
  <!-- 다이어리 -->
  <div class="container">
  <div id="diary">
  <form action="diary_folder_view">
    <aside class="asideDiary">
        <div>
            <p>다이어리 목록 입니다</p>
        </div>
        <div class="list-diary">
        <a href="diary_folder_view?diary_folder_idx=1" 
        class="list-group-item list-group-item-action">다이어리</a>
        <a href="diary_folder_view?diary_folder_idx=2"  
        class="list-group-item list-group-item-action">개발일지</a>
        <a href="diary_folder_view?diary_folder_idx=3" 
        class="list-group-item list-group-item-action">비밀일기</a>
        <a class="list-group-item list-group-item-action disabled">다이어리 비활성화</a>
      </div>
    </aside>
    <section class="sectionDiary"> 
        <form action="diary_modifyAction" method="post">
        		<input name="diary_title" value="${dto.diary_title}">	
        		<input name="diary_idx" readonly="readonly" value="${dto.diary_idx}">
				<div class="diary-contents"> 
					<textarea rows="15" 
					onkeydown="resize(this)" onkeyup="resize(this)" name="diary_contents">${dto.diary_contents}</textarea>
                </div>
                <div class="modifyBtn">
                 	<input type="submit" value="수정">
                 	<input
					type="button" value="삭제" class="deleteBtn"
					onclick="location.href='diary_delete?diary_idx=${dto.diary_idx}'"
					style="margin-left: 10px;">
                </div>
                <input type="hidden" value="${dto.diary_folder_idx}"> 
                <input type="hidden" value="${dto.diary_img}"> 
                <input type="hidden" value="${dto.diary_user_idx}"> 
         </form>
    </section>
    </form>
  </div>
  </div>