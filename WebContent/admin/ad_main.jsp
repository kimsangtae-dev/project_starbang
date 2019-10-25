<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="utf-8" />
	<meta name="viewport"
		content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>Admin_main</title>

	<!-- 모바일 웹 페이지 설정 -->
	<link rel="shortcut icon" href="assets/ico/logo_bb.png" />
	<link rel="apple-touch-icon-precomposed" href="assets/ico/logo_bb.png" />

	<!-- reset.css -->
	<link rel="stylesheet" type="text/css" href="../assets/css/reset.css" />

	<!-- bootstrap -->
	<link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css" />

	<!-- CSS적용 -->
	<link rel="stylesheet" type="text/css" href="ad_assets/ad_main.css">

	<!-- 나눔고딕 웹 폰트 적용 -->
	<link rel="stylesheet" type="text/css" href="../assets/css/nanumfont.css" />

	<!-- 반응형 웹을 지원하지 않을 경우 -->
	<!-- <link rel="stylesheet" href="assets/css/non-responsive.css" /> -->

	<!-- IE8 이하 버전 지원 -->
	<!--[if lt IE 9]>
		<script type="text/javascript" src="assets/js/html5shiv.js"></script>
		<script type="text/javascript" src="assets/js/respond.min.js"></script>
		<![endif]-->

	<!-- IE10 반응형 웹 버그 보완 -->
	<!--[if gt IE 9]>
		<link rel="stylesheet" type="text/css" href="assets/css/ie10.css" />
		<script type="text/javascript" src="assets/js/ie10.js"></script>
		<![endif]-->
	<style type="text/css">

	</style>
</head>

<body>
	<!-- 브라우저에 보여질 부분 -->
	<div id="ad_main">
		<!-- 상단 헤더 -->
		<div id="header">
			<div class="title">
				<img src="../assets/ico/logo_blue.png"></img>
				<p>별방 관리자 사이트</p>
			</div>
		</div>
		</div>
		<!-- 중앙 영역 -->
		<div id="content">
			<div class="box1">
				<!--부트스트랩 버튼 요소 적용-->
				<a class="btn btn-primary btn-lg" href="ad_rmli.jsp" role="button">방관리</a>
				<a class="btn btn-primary btn-lg" href="ad_userli.jsp" role="button">회원관리</a>
				<!-- 부트스트랩 드롭다운 요소 적용을 위한 선언-->
				<div class="dropdown">
						<a id="dLabel" data-target="ad_edit.jsp" href="http://example.com" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false"><span >문의관리
								<span class="caret"></span>
						</span></a>
				<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
					<li><a href="ad_faq.jsp">자주묻는질문</a></li>
					<li class="divider"></li>
					<li><a href="ad_notice.jsp">공지사항</a></li>
					<!--<li><a href="#">리스트3</a></li>-->
				</ul>
			</div>
		</div>
	</div>
	<!-- 하단 영역 -->
	<div id="footer">
	</div>

		<!-- Javascript -->
		<script src="../assets/js/jquery-1.10.2.min.js"></script>
		<script src="../assets/js/bootstrap.min.js"></script>
</body>

</html>