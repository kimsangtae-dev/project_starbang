<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../assets/inc/meta.jsp"%>

<!-- css 참조 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/etc/reset.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/ma_css/rtrm.css">
</head>

<body>
	<!-- 페이지의 전체 폭을 결정하기 위한 영역 -->
	<div class="root">

		<!-- 상단 헤더 -->
		<%@ include file="../assets/inc/ma_top.jsp"%>

		<!-- 중앙 영역 -->
		<div id="content">
			<!-- 최근본방/찜한 방 -->
			<div id="recent" class="recent">
				<h1 class="interest">관심목록</h1>
				<div class="tab-menu">
					<a class="st-bang active" href="#">최근 본 방</a> <a class="st-bang"
						href="${pageContext.request.contextPath}/main/wish.do">찜한 방</a>
				</div>
				<div class="tab-text">
					<div class="re-div1">
						<p>총 ${totalCount}개의 최근 본 방이 있습니다</p>
					</div>
					<div class="re-div2">
						<p>최근에 본 방은 최대 50개까지 저장됩니다</p>
					</div>
				</div>
				<%-- -------------------쿠키 섹션 시작 ------------------ --%>
				<%-- ------ 컨트롤러에서 Model 객체를 통해 넘어온 값 출력하기 ------ --%>
				<c:choose>
					<c:when test="${newRoomNo == ''}">
						<h2>저장된 쿠키 없음</h2>
					</c:when>
					<c:otherwise>
						<h2>저장된 쿠키 = ${newRoomNo}</h2>
					</c:otherwise>
				</c:choose>
				<%-- -------------------쿠키 섹션 끝 ------------------ --%>

				<div class="gallery-container">
					<!-- 갤러리 내용 영역 -->
					<div class="gallery-content clearfix">
						<ul id="gallery-list">
							<c:choose>
								<%-- 조회 결과가 없는 경우 --%>
								<c:when test="${output == null || fn:length(output) == 0}">
									<p>조회 결과가 없습니다.</p>
								</c:when>
								<%-- 갤러리 시작 --%>
								<c:otherwise>
									<c:forEach var="item" items="${output}" varStatus="status">
										<li>
											<div class="recent-div5">
												<div class="recent-div6">
													<%-- 좋아요 버튼 --%>
													<div class="recent-div7">
														<div class="recent-div8 off" data-value="on"></div>
													</div>
													<%-- 좋아요 끝 --%>
													<%-- 전체 링크화 --%>
													<a target="_blank" rel="" class="recent-a"
														href="${pageContext.request.contextPath}/main/rmdt.do">
														<!-- 이미지 -->
														<div class="recent-a-div"></div> <c:if
															test="${item.confirmdate != null}">
															<%-- 확인매물 div --%>
															<div class="recent-a-confirm">
																<div class="recent-a-confirm-div">
																	<span class="bold">확인매물</span> <span>${item.confirmdate}</span>
																</div>
															</div>
															<%-- 확인매물 끝 --%>
														</c:if>
														<p class="recent-a-p1">${item.roomtype}</p>
														<p class="recent-a-p2">
															<c:choose>
																<c:when test="${item.dealingtype == '월세'}">
																	<span>${item.dealingtype}&nbsp;${item.deposit}/${item.price}</span>
																</c:when>
																<c:otherwise>
																	<span>${item.dealingtype}&nbsp;</span>
																	<span id="prc">${item.price}</span>
																</c:otherwise>
															</c:choose>
														</p>
														<p class="recent-a-p34">${item.floor}층,
															${item.area}m², 관리비 ${item.fee}만</p>
														<p class="recent-a-p34">${item.title}</p>
													</a>
												</div>
											</div>
										</li>
									</c:forEach>
								</c:otherwise>
								<%-- 각 갤러리 끝 --%>
							</c:choose>
						</ul>
					</div>
					<!-- 갤러리 내용 영역 -->
				</div>
				<!-- 최근본방/찜한 방 끝-->
			</div>
			<!-- content 끝 -->
		</div>
		<!-- root 끝 -->

		<!-- 하단 영역 -->
		<%@ include file="../assets/inc/ma_bottom.jsp"%>

		<!-- Javascript -->
		<script
			src="${pageContext.request.contextPath}/assets/js/jquery-1.10.2.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			/* 좋아요 클릭 -> 하트 색 변경 */
			$(function() {
				$(".recent-div8").click(function(e) {
					$(this).toggleClass('on off');
				});
			});
		</script>
</body>
</html>