<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- footer -->
<style>
    *{
      box-sizing: border-box;
    }
    
    .footer{
      display: flex;
      width: 100%;
      background-color: rgba(0, 0, 0, 0.76);
      flex-flow: row wrap;
      justify-content: center;
    }
    
    .abox{
      flex:1 100%;
      display: flex;
      justify-content: center;
      margin-top: 50px;
      height: 40px;
    }
    .abox a{
      margin-left: 10px;
      color: rgba(240, 248, 255, 0.856);
    }
    
    .Ftext{
      color: gray;
      flex:1 100%;
      text-align: center;
      height: 100px;
    }
    .iconbox{
      margin-bottom: 50px;
      display: flex;
      height: 40px;
    }
    .iconbox .ibox2{
      margin-left: 10px;
    }
    .iconbox .ibox3{
      margin-left: 10px;
    }
    .iconbox .ibox4{
      margin-left: 10px;
    }
    .abox .a1{
      list-style: none;
      float: left;
      padding: 0 15px;
    }
    
    .a1::after {
      content: "|";
      float: right;
      color: rgba(204, 204, 204, 0.589);
      margin-right: -17px;
    }
    
    .a1:last-child::after {
      content: "";
    }
    
    </style>
    <div class="footer">
      <div class="abox">
        <a href="#" class="a1">회사소개</a>
        <a href="#" class="a1">개인정보정책</a>
        <a href="#" class="a1">이메일무단수집</a>
        <a href="#" class="a1">묻고답하지</a>
        <a href="#" class="a2">오시는길</a>
      </div>
      <div class="Ftext">
        회사 : 동네친구, 주소 : 서울특별시 용산구 이태원로 241, 대표 : 홍진웅,<br>
        고객지원 : 010-7323-9117, FAX : 070-777-5555, EMAIL : dongnechin955@daum.net, 사업자등록번호 : 780-42-00047, 통신판매업 : 제2015-경기-00974호<br>
        COPYRIGHT(C) 2022 DONGNECHIN9. ALL RIGHT RESERVED.
      </div>
      <div class="iconbox">
        <div class="ibox1">
          <a href="#"><img src="/img/mf-icon01.png"></a></div>
        <div class="ibox2">
          <a href="#"><img src="/img/mf-icon02.png"></a></div>
        <div class="ibox3">
          <a href="#"><img src="/img/mf-icon03.png"></a></div>
        <div class="ibox4">
          <a href="#"><img src="/img/mf-icon04.png"></a></div>
      </div>
    
      
    
        
    
      </div>
    