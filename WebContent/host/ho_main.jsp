<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Host_main</title>

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="assets/ico/logo_bb.png" />
<link rel="apple-touch-icon-precomposed" href="assets/ico/logo_bb.png" />

<!-- reset.css -->
<link rel="stylesheet" type="text/css" href="../assets/css/reset.css" />

<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="../assets/css/bootstrap.min.css" />

<!-- 나눔고딕 웹 폰트 적용 -->
<link rel="stylesheet" type="text/css"
	href="../assets/css/nanumfont.css" />

<!-- css 적용 -->
<!--<link rel="stylesheet" type="text/css" href="ho_assets/ho_main.css">  -->

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
@charset "utf-8";
/* ---------------------------------------
 / 전체 페이지 부분
  ---------------------------------------- */

#root {
    background-color: rgb(67, 131, 255);
    /*background: url("https://t1.daumcdn.net/cfile/tistory/27532234572323F611") center center / cover no-repeat;*/
    background-size: cover;
    z-index: 3;
    width: auto;
}

img{
    width: 120px;
    padding-bottom: 40px;

}
/* ---------------------------------------
 / 상단 부분
  ---------------------------------------- */
  
    /* 왼쪽 메뉴 박스 크기 및 위치 설정(absolute) */
.leftf {
    position: absolute;
    left: 215px;
    top: 4px;
}

    /* 왼쪽 메뉴 로고 이미지 설정 */
.navbar>.leftf>a>img {
    width: 65px;
}

    /* 왼쪽 메뉴 텍스트 박스 크기 위치 설정*/
.navbar>.leftf> div {
    position: absolute;
    width: 100px;
    top: 20px;
    left: 80px;
    font-size: 1.3em;
}
    /* 박스 내 a 링크 처리 */
.navbar>.leftf> div > a{
    text-decoration: none;
    color:white;
}
    /* 오른쪽 메뉴 박스 위치 설정 */
.navbar>.pull-right{
    width: 520px;
    padding-top:24px;
}
    /* 오른쪽 메뉴 박스 a링크 설정 */
.navbar>.pull-right>a{
    display: inline-block;
    font-size: 13.7px;
    text-decoration: none;
    color:white;
    font-weight: 700;
    padding: 0 17px;
    
}
    /* 3번째 요소에 대한 텍스트 조정 */
.navbar>.pull-right>a:nth-child(3){
    font-weight: 500;
}

/* ---------------------------------------
 / 본문 부분
  ---------------------------------------- */

      /* body 전체 구성 설정 */
#body {
    min-height: 800px;
    box-sizing: border-box;
    height: 540px;
    padding-top: 165px;
    text-align: center;
}
    /* 본문 title */
#body>div>h1 {
    box-sizing: border-box;
    vertical-align: baseline;
    margin: 0px;
    padding: 0px;
    margin-bottom: 10px;
    color: rgb(255, 255, 255);
    font-size: 42px;
    font-weight: 700;
    line-height: 62px;
    letter-spacing: -1.5px;
}
    /* 본문 description */
#body>div>.desc {
    box-sizing: border-box;
    vertical-align: baseline;
    margin: 0px;
    padding: 0px;
    border-width: 0px;
    color: rgb(255, 255, 255);
    font-size: 18px;
    line-height: 30px;
}

    /* 링크박스 크기 및 위치 설정(부트스트랩 버튼으로 변경 가능) */
#body>div>.link-sc {
    box-sizing: border-box;
    margin: 0px;
    padding: 0px;
    display: inline-block;
    width: 160px;
    height: 50px;
    margin-top: 31px;
    color: rgb(255, 255, 255);
    font-size: 17px;
    font-weight: bold;
    text-align: center;
    line-height: 50px;
    box-shadow: rgba(16, 16, 16, 0.18) 0px 8px 19px 0px;
    background-color: #FFE400;
    text-decoration: none;
    border-width: 1px;
    border-style: solid;
    border-color: transparent;
    border-radius: 5px;
}


</style>
</head>

<body>
	<!-- 브라우저에 보여질 부분 -->
	<!-- 페이지의 전체 폭을 결정하기 위한 영역 -->
	<div id="root">
		<!-- 상단 헤더 -->
		<div id="header">
			<div class="navbar" role="navigation">
				<div class="leftf">
					<a href="../main/ma_main.html"><img
						src="../assets/ico/logo_white.png"></a>
					<div class="menu-left">
						<a href="../main/ma_main.html">회원사이트</a>
					</div>
				</div>
				<!-- 메뉴 항목 -->
				<div class="pull-right">
					<a href="ho_rm_add.html">공실 등록하기</a> <a href="ho_rmli.jsp">공실관리</a>
					<a href="../main/ma_login.html">로그인</a>
				</div>
			</div>
		</div>
		<!-- 중앙 영역 -->
		<div id="body">
			<div class="bgimg">
				<h1 class="title">
					공실 광고<img src="../assets/ico/logo_white.png">에서 무제한 무료
				</h1>
				<p class="desc">방주인에 제한없이 공실 등록하고 무료로 광고하세요.</p>
				<p class="desc">별방에 광고를 원하시면 지금 당장 방주인을 시작하세요</p>
				<a class="link-sc" href="ho_rm_add.html">방주인 시작하기</a>
			</div>
		</div>
	</div>
	<!-- 하단 영역 -->
	<div id="footer">
		<%@ include file="ho_assets/ho_inc/ho_footer.jsp" %> 
	</div>
	<!-- Javascript -->
	<script src="../assets/js/jquery-1.10.2.min.js"></script>
	<script src="../assets/js/bootstrap.min.js"></script>
</body>

</html>