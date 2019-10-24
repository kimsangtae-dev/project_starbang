<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../assets/inc/meta.jsp"%>
<link rel="stylesheet" type="text/css" href="../assets/header_white.css" />
<link rel="stylesheet" type="text/css" href="../assets/footer_black.css" />

<link rel="stylesheet" type="text/css" href="../main/ma_assets/ma_mypage.css" />

</head>
<body>
	<!-- 상단 영역 -->
	<%@ include file="./ma_assets/ma_inc/top.jsp"%>

	 <!-- 중앙 영역 -->
			<div id="content" class="container box">
				<div class="h">
					<h1>MY별방</h1>
				</div>
				<div class="div2">
					<img src="ma_assets/ma_img/mypa.png" >
					<br/>
					<button type="button" class="btn btn-link" class="blue">프로필 사진 변경</button>
				</div>
				<br/>
				<div class="textcontent">
					<h3>본인 성명</h3>
					<input type="text" name="myname" value="홍길동">
					<h3>이메일주소</h3>
					<input type="text" name="pon" readonly value="dlekdse@gmail.com" class="focus">
					<h3>휴대폰 번호</h3>
					<input type="number" name="pont1" id="pon1" placeholder="010" readonly class="focus"> - 
					<input type="number" name="pont2" id="pon2" placeholder="3434" readonly class="focus"> - 
					<input type="number" name="pont3" id="pon3" placeholder="3463" readonly class="focus">
					<button type="button" class="btn btn-default">변경</button>
					<h3>휴대폰 번호</h3>
					<input type="passwd" name="pwd1" id="pwd1" class="pwd" placeholder="현재비밀번호를 입력하세요" >
					<br/>
					<input type="passwd" name="pwd2" id="pwd2" class="pwd" placeholder="변경될 비밀번호를 입력하세요" >
					<br/>  
					<input type="passwd" name="pwd3" id="pwd3" class="pwd" placeholder="변경될 비밀번호를 한 번 더 입력하세요" >
					<br/>
				</div>
				<hr/>
				<button type="resert" id="resert" class="btn btn-default">취소</button>
				<button type="submit" id="submit" class="btn btn-default">확인</button>
				<br/>
				<button type="button" id="out" class="btn btn-link">회원탈퇴</button>
			</div>
			
			<!-- 하단 영역 -->
	<%@ include file="./ma_assets/ma_inc/bottom.jsp"%>
    
    <!-- Javascript -->
	<script src="../assets/js/jquery-1.10.2.min.js"></script>
	<script src="../assets/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		</script>
		
</body>








