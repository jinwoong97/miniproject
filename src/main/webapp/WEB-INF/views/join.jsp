<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Main CSS : Header, Main, Footer -->
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/join.css">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- Bootstarp JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>


<!--  회원가입 유효성 검사 -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">	


        function Validation() {
    	
        //정규식 부분입니다
         var nameExp = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{1,10}$/; // 이름 유효성 검사
         var RegExp = /^[a-zA-Z0-9]{4,12}$/; // 아이디 유효성 검사
         var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; // 이메일 유효성 검사
         var patternPhone=/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}/; //핸드폰 번호 유효성 검사
         var reg = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,}$/; //비밀번호 유효성 검사
         var reg2 = /(\w)\1\1\1/;
        	

         //변수 선언 부분입니다
         var userId = document.getElementById("userid");
         
         var userPs = document.getElementById("userPs");
         
         var userPc = document.getElementById("userPc");
         
         var userM = document.getElementById("userm");
         
         var userN = document.getElementById("usern");
         
         var userR = document.getElementById("userRe");
         
         var phonenum = document.getElementById("phonenum");
         
         var chk1 = document.join.terms_1.checked; // chk1(약관1 체크박스)의 체크여부를 true로 설정 
         
         var chk2 = document.join.terms_2.checked; // chk2(약관2 체크박스)의 체크여부를 true로 설정

         
         // 이름이 영문자 섞여서 입력될 경우
         
         if(nameExp.test(userN.value) == false){
         
         	alert("이름형식이 맞지 않습니다.");
        
         	return false;
        
        } 

        // 이메일이 이메일 형식과 맞지 않을 경우
         
        if(exptext.test(userM.value) == false){
         
        	alert("이메일형식이 맞지 않습니다.");
        
        	return false;
        
        }

        //핸드폰 번호가 제대로 입력 안될 경우
        if (patternPhone.test(phonenum.value) == false || phonenum.value=="") {
        	
        	alert("핸드폰 번호를 다시 확인해주세요.");
        
        	return false;
        
        }

        //----------------------------------------------------------
        
         // 아이디에 아무것도 안들어가있을 경우
         
         if(userId.value == ""){
         
         	alert("아이디를 입력해주세요.");
         
         	return false;
         
         }
         
         // 아이디가 4~12자리 영문대소문자와 숫자로만 입력
         
         if(!RegExp.test(userId.value)){
         
         	alert("아이디를 4~12자리 문자,숫자로 해주세요.");
         
         	return false;
         
         }
         
         //id와 password가 같을 경우
         
         if(userId.value == userPs.value){
         
         	alert("아이디와 비밀번호가 같습니다.");
         
         	return false;
         
         }

         //==============================================================
         
         //password가 입력되지 않을 경우
         
         if(userPs.value==""){
         
         	alert("비밀번호가 입력되지 않았습니다.");
         
         	return false;
         
         }
         
         //비밀번호를 8자 이상으로 입력하지 않을 경우
         
         if(userPs.value.length <8){
         
         	alert("비밀번호는 8자 이상으로 작성해주세요.");
         
         	return false;
         
         }

         //정규식 이용한 비밀번호 유효성 검사
         
         if( !reg.test(userPs.value)){
         
         	alert("비밀번호는 8자이상,숫자,영문자,특수문자 포함입니다.");
         
         	return false;
         
         }

         //같은 문자 4번 이상으로 비밀번호 불가
         
         if(/(\w)\1\1\1/.test(userPs.value)) {
        	 
        	 alert("같은 문자를 4번 이상 사용하실 수 없습니다.");
        	 
        	 return false;
         }
         
         //----------------------------------------------------------------
         
         //비밀번호 확인이 입력되지 않을 경우
         
         if(userPc.value==""){
         
         	alert("비밀번호 확인이 입력되지 않았습니다.");
         
         	return false;
         
         }

         //정규식 이용한 비밀번호 확인 유효성 검사
         
         if(!reg.test(userPc.value)){
         
         	alert("비밀번호 확인을 4~12자리 영문대소문자와 숫자로만 입력해주세요.");
         
         	return false;
         
         }

         // 비밀번호와 비밀번호 확인이 같지 않을 경우
         if(userPs.value != userPc.value) {
        	 
        	 alert("비밀번호와 비밀번호 확인이 맞지 않습니다.");
        	 
        	 return false;
         }
         
         //----------------------------------------------------------------    

         //chk1의 반전값이 true일 경우 alert창 띄우고 return false 
         if(!chk1) { 
        	 
        	 alert("약관 동의가 모두 체크되어 있지 않습니다.");
        	 
        	 return false;
         }
       	//chk2의 반전값이 true일 경우 alert창 띄우고 return false
         if(!chk2) {
        	 
        	 alert("약관 동의가 모두 체크되어 있지 않습니다.");
        	 
        	 return false;
         }

	}

        </script>
        <script>
        function isBirthday(dateStr) {

          var year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
          var month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
          var day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일)
          var today = new Date(); // 날짜 변수 선언
          var yearNow = today.getFullYear(); // 올해 연도 가져옴
        
          if (dateStr.length <=8) {
          // 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환합니다.
            if (1900 > year || year > yearNow){
              return false;
            } else if (month < 1 || month > 12) {
              return false;
            } else if (day < 1 || day > 31) {
              return false;
            } else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
              return false;
            } else if (month == 2) {
        
              var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
              if (day>29 || (day==29 && !isleap)) {
                return false;
              } else {
                return true;
              } //end of if (day>29 || (day==29 && !isleap))
            } else {
              return true;
            }//end of if
          }
          else {
            //1.입력된 생년월일이 8자 초과할때 :  auth:false
            return false;
          }
        }
      </script>
        
<script type="text/javascript">
	
	function idcheck() {
		

		var user_id = $('#user_id').val();
		
		$.ajax({
		
			url : 'http://3.34.21.88:8090/idcheck?user_id='+ user_id,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복됨, 0 = 중복안됨 : "+ data);							
				
				var data_num = Number(data);
				if(data_num >=1) {
					
					alert("아이디가 중복됩니다");
					$('#user_id_check').val("no");
				}else {
					alert("사용 가능한 아이디입니다.");
					$('user_id_check').val("yes" s);
				}
				error : function fail() {
					console.log("실패");
				}
				
			}
		})
		
	}


</script>        

<script type="text/javascript">
        	function checkall(){
        		   if(document.getElementById("check_terms").checked==true){  //id 를 사용하여 하나의 객체만을 호출
        		         for(var i=0;i<3;i++)   document.getElementsByName("termsck")[i].checked = true;   //name 을 사용하여 배열 형태로 담아 호출
        		      }
        		      if(document.getElementById("check_terms").checked==false){
        		         for(var i=0;i<3;i++)   document.getElementsByName("termsck")[i].checked=false;  
        		      }
        	}
        </script>
<!-- 메인 -->
<!-- 방명록 -->
<div class="container">
      <div class="contents">
        <h1 class="logo">회원가입</h1>
        <form name="join" action="/joinAction" onsubmit="return Validation();" method="post">
          <div id="insert">
            <div>
              <input type="text" placeholder="이름" name="name" id="usern">
            </div>
            <div>
              <input type="email" placeholder="이메일" name="email" id="userm">
            </div>
            <div>
              <input type="text" placeholder="전화번호('-'까지 입력해주세요)" id="phonenum"
                name="phone">
            </div>
            <div>
              <input type="text" placeholder="아이디" name="id" id="userid">
              <input  id="id_check" type="button" onclick="idcheck();" value="아이디 중복 확인">
              <!-- <button onclick="idcheck();">아이디 중복 확인</button> -->
              <input type="hidden" name="member_id_check" id="member_id_check" value="no">
            </div>	
            <div>
              <input type="password" placeholder="비밀번호" name="password"
                id="userPs">
            </div>
            <div>
              <input type="password" placeholder="비밀번호 확인" name="password_check"
                id="userPc">
            </div>
            <div class="genderchoice">
            성별
            <div class="gender" id="gender_female">
              <input type="radio" name="room" value="female" />여성
            </div>
            <div class="gender" id="gender_male">
              <input type="radio" name="room" value="male" />남성
            </div>
            </div>
            <input type="text" placeholder="생년월일(8자리)" name="birthday"
                id="dateStr">
            <input type="text" id="sample4_postcode" placeholder="우편번호">
            <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
            <input type="text" id="sample4_roadAddress" name="addr1" placeholder="도로명주소" size="60" ><br>
            <input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"  size="60">
            <span id="guide" style="color:#999;display:none"></span>
            <input type="text" id="sample4_detailAddress" name="addr2" placeholder="상세주소"  size="60"><br>
            <input type="hidden" id="sample4_extraAddress" placeholder="참고항목"  size="60">
            <input type="hidden" id="sample4_engAddress" placeholder="영문주소"  size="60" ><br>
          <div id="checkForm">
            <hr>
            <div class="check">
              <input type="checkbox" id="check_terms" onclick=checkall()>
              <p style="margin: 0 0 0 5px">아래 약관에 모두 동의합니다.</p>
            </div>
            <br>
            <div class="check">
              <input type="checkbox" class="agreeck" id="terms_1" name="termsck">
              <p style="margin: 0 0 0 5px">약관 1</p>
            </div>
            <textarea name="terms_1_content" rows="1" readonly
              style="resize: none;">약관내용1</textarea>
            <div class="check">
              <input type="checkbox" class="agreeck" id="terms_2" name="termsck">
              <p style="margin: 0 0 0 5px">약관 2</p>
            </div>
            <textarea name="terms_2_content" rows="1" readonly
              style="resize: none;">약관내용2</textarea>
          </div>
          <div>
            <input type="submit" value="회원가입" id="joinbtn">
          </div>
        </div>
          <br>
        </form>
      </div>
    
    </div>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script>
        //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
        function sample4_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                    var extraRoadAddr = ''; // 참고 항목 변수

                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraRoadAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                       extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraRoadAddr !== ''){
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample4_postcode').value = data.zonecode;
                    document.getElementById("sample4_roadAddress").value = roadAddr;
                    document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
             
                    document.getElementById("sample4_engAddress").value = data.addressEnglish;
                           
                    // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                    if(roadAddr !== ''){
                        document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                    } else {
                        document.getElementById("sample4_extraAddress").value = '';
                    }

                    var guideTextBox = document.getElementById("guide");
                    // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                    if(data.autoRoadAddress) {
                        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                        guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                        guideTextBox.style.display = 'block';

                    } else if(data.autoJibunAddress) {
                        var expJibunAddr = data.autoJibunAddress;
                        guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                        guideTextBox.style.display = 'block';
                    } else {
                        guideTextBox.innerHTML = '';
                        guideTextBox.style.display = 'none';
                    }
                }
            }).open();
        }
    </script>