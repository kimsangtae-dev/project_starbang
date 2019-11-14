<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>별방 관리자 메인 페이지</title>
<%@ include file="../../assets/inc/meta_inc/meta.jsp"%>
<!-- CSS적용 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/assets_jsp/ad_assets/ad_main.css">
<style type="text/css">
</style>
</head>

<body>
	<!-- 브라우저에 보여질 부분 -->
	<div id="ad_main">
		<!-- 상단 헤더 -->
		<div id="header">
			<div class="title">
				<img src="${pageContext.request.contextPath}/assets/assets_etc/ico/logo_blue.png"></img>
				<p>별방 관리자 사이트</p>
			</div>
		</div>

		<!-- 중앙 영역 -->
		<div id="content">
			<div class="box1">
				<!--부트스트랩 버튼 요소 적용-->
				<a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/jsp/admin/ad_rmli.do" role="button">방관리</a>
				<a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/jsp/admin/ad_userli.do" role="button">회원관리</a>
				<!-- 부트스트랩 드롭다운 요소 적용을 위한 선언-->
				<div class="dropdown">
					<a id="dLabel" data-target="#" href="ad_edit.jsp"
						data-toggle="dropdown" aria-haspopup="true" role="button"
						aria-expanded="false"><span>문의관리 <span class="caret"></span>
					</span></a>
					<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
						<li><a href="${pageContext.request.contextPath}/jsp/admin/faq.do">자주묻는질문</a></li>
						<li class="divider"></li>
						<li><a href="${pageContext.request.contextPath}/jsp/admin/ad_notice.do">공지사항</a></li>
						<!--<li><a href="#">리스트3</a></li>-->
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 하단 영역 -->
	<div id="footer"></div>

	<!-- Javascript -->
	<script src="<c:url value="/assets/assets_etc/js/jquery-3.2.1.min.js" />"></script>
	<script src="<c:url value="/assets/assets_etc/js/bootstrap.min.js" />"></script>
</body>
</html>