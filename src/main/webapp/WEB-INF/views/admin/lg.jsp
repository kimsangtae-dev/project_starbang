<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>별방 관리자 로그인</title>
<%@ include file="../assets/inc/meta.jsp"%>
<!-- CSS적용 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/ad_css/lg.css">
<style type="text/css">
</style>
</head>

<body>
	<div id="admin">
		<div class="header">
			<div class="title">
				<img src="${pageContext.request.contextPath}/assets/ico/logo_blue.png"></img>
				<p>관리자 사이트</p>
			</div>
		</div>
		<div id="content">
			<div class="loginf form-group">
				<form name="login_form" method="post" action="${pageContext.request.contextPath}/admin/login_ok.do">
					<label for="admin_id"> 
					<input autocomplete="off" class="idpass" type="text" placeholder="아이디" name="email" id="loginid" value=""/>
					</label> <br /> 
					<label for="admin_password"> 
					<input autocomplete="off" class="idpass" type="password" placeholder="비밀번호" name="passwd" id="passwd" value=""/><br /> 
					<input type="submit" id="loginbtn" value="로그인" />
					</label>
				</form>
			</div>
		</div>
	</div>

	<!-- Javascript -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery-1.10.2.min.js"></script>
  	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
  	<script type="text/javascript">
   $("#loginbtn").click(function(){
        if($("#loginid").val() == "admin" && $("#passwd").val() == "admin") {
        	alert("관리자페이지로 이동합니다.");
    } 
	}); 
 </script>
</body>
</html>