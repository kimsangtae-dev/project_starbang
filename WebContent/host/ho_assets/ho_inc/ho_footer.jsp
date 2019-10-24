<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<style>
/* ---------------------------------------
 / 하단 부분
  ---------------------------------------- */

/* footer 전체 설정 */
#footer {
	border-top: solid 3px black;
	vertical-align: baseline;
	margin: 0px;
	padding: 0px;
	border-width: 0px;
	width: 100%;
	min-width: 1440px;
	height: 253px;
	background-color: white;
}

/* footer 내 div 내용 크기 설정 */
.footer-content {
	box-sizing: border-box;
	border-width: 0px;
	height: 100%;
	padding: 60px 180px;
	margin: 0px auto;
	font-size: 13px;
	line-hight: 13px;
	border-top: 1px solid rgb(220, 220, 220);
}

/* footer div내 h1요소 조정 */
.footer-content>h1 {
	font-size: 25px;
	padding-bottom: 15px;
}
/* 작은 소개글 요소 설정 */
.min_t {
	font-size: 12px;
	color: gray;
	margin-bottom: 20px;
	display: inline-block;
}

.last>li {
	float: left;
	list-style: none;
}

.last>li>a {
	color: #888888;
	font-size: 13px;
	text-decoration: none;
}

.last>li+li::before {
	content: "";
	float: left;
	height: 12px;
	margin-left: 8px;
	padding-left: 9px;
	position: relative;
	bottom: -3px;
	border-left: 1px solid rgb(211, 211, 211);
}

.last::after {
	display: block;
	content: "";
	clear: both;
}

div>p>span {
	line-height: 180%;
	letter-spacing: 2px;
}
</style>
<div class="footer-content">
	<h1>이젠 아카데미 학원 파이썬 기반 빅데이터 분석 1조</h1>
	<p>
		<span>팀원 : 조수민, 김기홍, 이명섭, 김상태, 박지원, 김수진</span> <br /> <span>주소:
			서울특별시 서초구 서초대로 77길 54 서초더블유 타워13층</span> <br /> <span class="tel">고객센터:02-532-6500</span>
		<br /> <span class="min_t">사이트에 대한 문의사항은 aaa@gmail.com으로
			부탁드립니다.</span>
	</p>
	<ul class="last">
		<li><a target="_blank" rel="noopener noreferrer" href="" class="">회사소개</a></li>
		<li><a target="_blank" rel="noopener noreferrer" class=""
			href="/term/9">이용약관</a></li>
		<li><a target="_blank" rel="noopener noreferrer" class=""
			href="/term/10">개인정보처리방침</a></li>
	</ul>
</div>