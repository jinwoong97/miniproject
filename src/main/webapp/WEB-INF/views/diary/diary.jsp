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

<script>
    $(function() {
        //input을 datepicker로 선언
        $("#datepicker").datepicker({
            dateFormat: 'yy-mm-dd' //달력 날짜 형태
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
            ,changeYear: true //option값 년 선택 가능
            ,changeMonth: true //option값  월 선택 가능                
            ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
            ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
            ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
            ,buttonText: "선택" //버튼 호버 텍스트              
            ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
            ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
            ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
        });                    
        
        //초기값을 오늘 날짜로 설정해줘야 합니다.
        $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
    });
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
        <div class="calender">
            <p>조회기간을 선택해주세요 
                <input type="text" id="datepicker">
            </p>
        </div>
        <div class="writeBtn">
        	<input class="writebtn" type="button" value="글쓰기"
        	onclick="location.href='/diary_write'">
        </div>
        	<c:forEach var="dto" items="${ folder_list }">
        		<input name="diary_title" readonly="readonly" value="${dto.diary_title}">	
        		<input type="hidden" name="diary_idx" readonly="readonly" value="${dto.diary_idx}">
        	<div class="date">
            	<input name="diary_date" readonly="readonly" value=
            	<c:set var="diaryvar" value="${dto.diary_date}"/>
            	<fmt:formatDate value="${diaryvar}" pattern="yyyy-MM-dd"/>>
            </div>
				<div class="diary-contents"> 
					<textarea rows="15" 
					onkeydown="resize(this)" onkeyup="resize(this)" name="diary_contents">${dto.diary_contents}</textarea>
                </div>
                <div class="modifyBtn">
                	<input	
                	type="button" value="수정" class="modifyBtn"
                	onclick="location.href='diary_modify?diary_idx=${dto.diary_idx}'">
                 	<input
					type="button" value="삭제" class="deleteBtn"
					onclick="location.href='diary_delete?diary_idx=${dto.diary_idx}'"
					style="margin-left: 10px;">
                </div>
                <input type="hidden" value="${dto.diary_folder_idx}">
                <input type="hidden" value="${dto.diary_img}">
                <input type="hidden" value="${dto.diary_user_idx}">
                </c:forEach>
    </section>
    </form>
  </div>
  </div>