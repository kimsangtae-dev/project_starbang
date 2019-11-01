<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../assets/inc/meta.jsp"%>

<link rel="stylesheet" type="text/css" href="../main/ma_assets/ma_mypager.css" />

</head>
<body>
	<!-- 상단 영역 -->
	<%@ include file="./ma_assets/ma_inc/top.jsp"%>

	 <!-- 중앙 영역 -->
			<div id="content" class="container box">
				<div class="h">
					<h1 class="h1">MY별방</h1>
				</div>
				<div class="div2">
					<div id="imgupload" class="imgupload">
						<img src="ma_assets/ma_img/mypa.png" >
					</div>
					<br/>
					<div class="filebox">
						<label for="ex_file">프로필 사진 변경</label>
						<input type="file" id="ex_file">
					</div>
				</div>
				<br/>
				<div id="textcontent">
					<h3 class="h31">본인 성명</h3>
					<input type="text" name="myname" value="홍길동" class="input" >
					<h3 class="h32">이메일주소</h3>

					<input type="text" name="email" id="email" disabled value="dlekdse@gmail.com" class="email">
					<button type="button" class="btn btn-default focse ponbutton" id="reemail">변경</button>
					<div id="emailinumberdiv">
						<input type="number" name="emailinumber" id="emailinumber" class="emailinumber email">
						<button type="button" class="btn btn-default focse reemailinumber" id="reemailinumber">인증번호</button>
					</div>
					<h3 class="h33">휴대폰 번호</h3>
					<input type="number" name="pont1" id="pon1" value="010" disabled class=" pon input"> - 
					<input type="number" name="pont2" id="pon2" value="3434" disabled class="pon input"> - 
					<input type="number" name="pont3" id="pon3" value="3463" disabled class="pon input">
					<button type="button" class="btn btn-default focse ponbutton" id="repon">변경</button>
					<h3 class="h34">휴대폰 번호</h3>
					<input type="passwd" name="pwd1" id="pwd1" class="pwd input" placeholder="현재비밀번호를 입력하세요">
					<br/>
					<input type="passwd" name="pwd2" id="pwd2" class="pwd input" placeholder="변경될 비밀번호를 입력하세요" >
					<br/>  
					<input type="passwd" name="pwd3" id="pwd3" class="pwd2 input" placeholder="변경될 비밀번호를 한 번 더 입력하세요" >
					<br/>
				</div>
				<hr class="hr" />
				<button type="resert" id="resert" class="btn btn-default">취소</button>
				<button type="submit" id="submit" class="btn btn-default">확인</button>
				<p class="rhdrks"></p>
				<button type="button" id="out" class="btn btn-link">회원탈퇴</button>
				<p class="rhdrks2"></p>
			</div>
			
			<!-- 하단 영역 -->
	<%@ include file="./ma_assets/ma_inc/bottom.jsp"%>
    
    <!-- Javascript -->
	<script src="../assets/js/jquery-1.10.2.min.js"></script>
	<script src="../assets/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	$(function() {
	    /** 변경 버튼 */
		$("#reemail").click(function(e) {
			var reemail = document.getElementById('reemail'); 
			var email = document.getElementById('email'); 
			var email = document.getElementById('email'); 
			var reemailinumber = document.getElementById("reemailinumber");
		    var emailinumber = document.getElementById("emailinumber");
		    var emailinumberdiv = document.getElementById("emailinumberdiv");
			email.readonly = true;
	
			$reemail = $('#email').attr('disabled', true);
			$reemail = $('#email').attr('disabled', false);
			reemailinumber.style.display = 'block';
			emailinumber.style.display = 'block';
			emailinumberdiv.style.height = '60px';
		});
	    
		$("#repon").click(function(e) {
			var repon = document.getElementById('repon'); 
			var pon1 = document.getElementById('pon1');
			var pon2 = document.getElementById('pon2');
			var pon3 = document.getElementById('pon3');
	
			$repon = $('#pon1').attr('disabled', true);
			$repon = $('#pon1').attr('disabled', false);
			
			$repon = $('#pon2').attr('disabled', true);
			$repon = $('#pon2').attr('disabled', false);
			
			$repon = $('#pon3').attr('disabled', true);
			$repon = $('#pon3').attr('disabled', false);
			
		});
	});
		</script>
		
</body>




