<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<style>
/* 브라우저 최소 넓이 지정 */
body { min-width: 1366px; }

/* 텍스트 기본 설정 */
body * { color: rgb(34, 34, 34); }
a { text-decoration: none !important; }

 /*------------------------------
/	header
----------------------------------*/
/* 메뉴바 크기, 여백, 테두리 */
#header .navbar {
	height: 70px;
	padding: 0 30px;
	border: 0;
	border-bottom: 1px solid #eee;
	margin: 0;
}

/* 로고 이미지 크기, 위치 설정 */
#header .navbar img { 
	height: 45px;
	margin: 8px 0 12px 0;
}

/* 방주인사이트 여백 설정 */
#header .menu-left {
	display: inline-block;
	margin-left: 20px;
}

/* 메뉴 세로 가운데 정렬 */
#header a {
	display: inline-block;
	line-height: 70px;
	font-size: 15px;
}

/* 방주인사이트, 회원가입로그인 글씨 크기 및 색상 설정 */
#header .small-font a {
	font-size: 13px;
	color: #777;
}

/* 메뉴에 마우스오버 시 색 변경 설정 */
#header a:hover {
	color: rgb(21, 100, 249);
}

/* 각 메뉴들 간 여백 설정 */
.padding-l {
	margin-left: 35px;
}

/* 메뉴 우측 정렬 */
#header .pull-right div {
	display: inline-block;
}

#con {
	height: 800px;
}
</style>
<!-- 상단 헤더 -->
<div id="header">
	<div class="navbar" role="navigation">
		<a href="ma_main.html"><img src="../assets/ico/logo_blue.png"></a>
		<div class="menu-left small-font">
			<a href="../host/ho_main.html">방주인 사이트</a>
		</div>
		<!-- 메뉴 항목 -->
		<div class="pull-right">
			<div>
				<a href="ma_search.html">방찾기</a> <a href="ma_rtrm.html"
					class="padding-l">관심목록</a> <a href="ma_faq.html" class="padding-l">문의하기</a>
			</div>
			<div class="small-font">
				<a href="ma_mypage.html" class="padding-l">회원가입 · 로그인</a>
			</div>
		</div>
	</div>
</div>