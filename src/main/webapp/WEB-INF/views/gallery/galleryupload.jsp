<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html xmlns:th="http://www.thymeleaf.org"
xmlns:layout="http://www.ultraq.net.nz/web/thymeleaf/layout">


<!-- c태그 꼭 써야 foreach문 사용 가능 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- Main CSS : Header, Main, Footer -->
<link rel="stylesheet" href="/css/galleryupload.css">
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
<aside class="asidePhoto">
    <div class="profilePhoto">
        <img src="images/logo.jpeg" alt="" style="height: 300px; margin-bottom: 20px;">
        <button class="addfriend">친구 추가</button> 
        <div>
            <input type="text" name="" id="intro">
        </div>
    </div>
</aside>
<section class="sectionPhoto">
    <h5>사진첩</h5>
        <div class="maincontents">
        	<div class="gallery-contents">
        		<div class="img-cover">
                <div class="gray-text" id="basic-text">
                <input name="gallery_title" id="title" type="text" value="" placeholder="제목을 작성하세요"></div>
                <div class="album-photo">
                <div class="main_img">
                <h3>대표 이미지</h3>
                <div style="margin-bottom:10px;">
                <label for="chooseFile">사진선택</label>
                <input type="file"
				id="chooseFile" accept="image/*" required multiple
				onchange="loadFile(this)">
                </div>
                <div class="mirivogi">
                	<img src="images/logo.jpeg" id="img" class="item image" alt="">	
                </div>
                </div>
                </div>
                <div class="detail" id="basic-text">
                <textarea rows="15"
    			onkeydown="resize(this)" onkeyup="resize(this)" id="contents" placeholder="내용을 작성하세요" name="gallery_contents"></textarea>
                </div>  
                <div class="writeBtn">
             	<input type="button" id="btn" value="사진작성">
             	<a href="diary"><input type="button" value="취소"></a>
             	</div>
            </div>
            </div>
        </div>
</section>
</div>
<script
src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
function loadFile(input) {
	//console.log(input);
	var file = input.files[0];
	//console.log(file);
	var img_cover = document.getElementById("img");
	img_cover.src = URL.createObjectURL(file);
}

$("#btn").click(function() {
	var form = new FormData();
	form.append("title", $("#title").val());
	form.append("chooseFile", $("#chooseFile")[0].files[0]);
	form.append("contents", $("#contents").val());

	$.ajax({
		url : "/gallery_insert",
		type : "POST",
		processData : false,
		contentType : false,
		data : form,
		success : function(data) {
			alert("성공하였습니다.");
			location.href = '/gallery';
		},
		error : function(jqXHR) {
			alert(jqXHR.responseText);
		}
	});
});
</script>