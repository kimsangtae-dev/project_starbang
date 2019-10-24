<!-- 회원가입(동의) -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../assets/inc/meta.jsp"%>
<!-- css 참조 -->
<link rel="stylesheet" type="text/css" href="ma_assets/ma_search.css">
<link rel="stylesheet" type="text/css" href="../assets/header_white.css">

</head>

<body>
	<!-- 브라우저에 보여질 부분 -->
	<!-- 페이지의 전체 폭을 결정하기 위한 영역 -->
	<div>
		<!-- 상단 헤더 -->
		<%@ include file="./ma_assets/ma_inc/top.jsp"%>
		
		<!-- 중앙 영역 -->
		<div id="content">
			
		</div>

		<!-- 하단 영역 -->
		<%@ include file="./ma_assets/ma_inc/bottom.jsp"%>
	</div>
	<!-- Javascript -->
	<script src="../assets/js/jquery-1.10.2.min.js"></script>
	<script src="../assets/js/bootstrap.min.js"></script>
	<script type="text/javascript">

	</script>
</body>
</html>