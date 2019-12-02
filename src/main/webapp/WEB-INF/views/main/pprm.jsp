<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../assets/inc/meta.jsp"%>

<!-- css 참조 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/etc/reset.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/ma_css/pprm.css">
</head>

<body>
	<!-- 브라우저에 보여질 부분 -->
	<!-- 페이지의 전체 폭을 결정하기 위한 영역 -->
	<div>
		<!-- 상단 헤더 -->
		<%@ include file="../assets/inc/ma_top.jsp"%>

		<!-- 중앙 영역 -->
		<div id="content">
			<!-- 최근본방/찜한 방 -->
			<div id="hit" class="hit_bang">
				<h1 class="hit_title">인기매물</h1>
				<div class="tab-text">
					<div class="re-div1">
						<p>
							인기매물은 최대 <span>50개</span>까지 보여집니다
						</p>
					</div>
				</div>
				<!-- 갤러리 전체 박스 -->
				<div class="hit-div4">
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
										<div class="hit-div5">
											<div class="hit-div6">
												<%-- 좋아요 버튼 --%>
												<div class="hit-div7">
													<div class="hit-div8 off" data-value="on"></div>
												</div>
												<%-- 좋아요 끝 --%>
												<%-- 전체 링크화 --%>
												<a target="_blank" rel="" class="hit-a"
													href="${pageContext.request.contextPath}/main/rmdt.do">
													<!-- 이미지 -->
													<div class="hit-a-div"></div> <c:if
														test="${item.confirmdate != null}">
														<%-- 확인매물 div --%>
														<div class="hit-a-confirm">
															<div class="hit-a-confirm-div">
																<span class="bold">확인매물</span> <span>${item.confirmdate}</span>
															</div>
														</div>
														<%-- 확인매물 끝 --%>
													</c:if>
													<p class="hit-a-p1">${item.roomtype}</p>
													<p class="hit-a-p2">
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
													<p class="hit-a-p34">${item.floor}층,${item.area}m²,
														관리비 ${item.fee}만</p>
													<p class="hit-a-p34">${item.title}</p>
												</a>
											</div>
										</div>
									</li>
								</c:forEach>
							</c:otherwise>
							<%-- 각 갤러리 끝 --%>
						</c:choose>
					</ul>
					<!-- 갤러리 하단 영역 -->
						<div class="gallery-footer">
							<%-- gallery-index --%>
							<div class="gallery-index">
							<!-- 페이지 번호 구현 -->
							<%-- 이전 그룹에 대한 링크 --%>
						    <c:choose>
						        <%-- 이전 그룹으로 이동 가능하다면? --%>
						        <c:when test="${pageData.prevPage > 0}">
						            <%-- 이동할 URL 생성 --%>
						            <c:url value="/main/pprm.do" var="prevPageUrl">
						                <c:param name="page" value="${pageData.prevPage}" />
						            </c:url>
						            <a href="${prevPageUrl}">
						            	<button class="prev-btn">
											<span>&lt;</span>
										</button>
									</a>
						        </c:when>
						        <c:otherwise>
						            <button class="prev-btn">
										<span>&lt;</span>
									</button>
						        </c:otherwise>
						    </c:choose>
						    
						    <%-- 페이지 번호 (시작 페이지 부터 끝 페이지까지 반복) --%>
						    <ul class="index-list">
						    <c:forEach var="i" begin="${pageData.startPage}" end="${pageData.endPage}" varStatus="status">
						        <%-- 이동할 URL 생성 --%>
						        <c:url value="/main/pprm.do" var="pageUrl">
						            <c:param name="page" value="${i}" />
						        </c:url>
						        
						        <%-- 페이지 번호 출력 --%>
						        <c:choose>
						            <%-- 현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
						            <c:when test="${pageData.nowPage == i}">
						            	<li><a class="index-indiv index-active">${i}</a></li>
						            </c:when>
						            <%-- 나머지 페이지의 경우 링크 적용함 --%>
						            <c:otherwise>
						            	<li><a class="index-indiv" href="${pageUrl}">${i}</a></li>
						            </c:otherwise>
						        </c:choose>
						    </c:forEach>
						    </ul>
						    
						    <%-- 다음 그룹에 대한 링크 --%>
						    <c:choose>
						        <%-- 다음 그룹으로 이동 가능하다면? --%>
						        <c:when test="${pageData.nextPage > 0}">
						            <%-- 이동할 URL 생성 --%>
						            <c:url value="/main/pprm.do" var="nextPageUrl">
						                <c:param name="page" value="${pageData.nextPage}" />
						                <c:param name="keyword" value="${keyword}" />
						            </c:url>
						            <a href="${nextPageUrl}">
						            	<button class="next-btn">
											<span>&gt;</span>
										</button>
									</a>
						        </c:when>
						        <c:otherwise>
						            <button class="next-btn">
										<span>&gt;</span>
									</button>
						        </c:otherwise>
						    </c:choose>
							</div>
							<%-- gallery-index --%>
						</div>
						<!-- 갤러리 하단 영역 끝 -->
					</div>
					<!-- 갤러리 내용 + 하단 영역 끝 -->
				</div>
					<%--  <!-- 각각 갤러리 시작 -->
              <!-- 1번째 갤러리 -->
              <div class="hit-div5">
                <div class="hit-div6">
                  <!-- 좋아요 버튼 -->
                  <div class="hit-div7">
                    <div class="hit-div8 off" data-value="on"></div>
                  </div>
                  <!-- 좋아요 끝 -->
                  <!-- 전체 링크화 -->
                  <a target="_blank" rel="" class="hit-a" href="${pageContext.request.contextPath}/main/rmdt.do">
                    <!-- 이미지 -->
                    <div class="hit-a-div"></div>
                    <!-- 확인매물 div -->
                    <div class="hit-a-confirm">
                      <div class="hit-a-confirm-div" type="">
                        <span class="bold">확인매물</span>
                        <span>19.09.25</span>
                      </div>
                    </div>
                    <!-- 확인매물 끝 -->
                    <p class="hit-a-p1">투룸</p>
                    <p class="hit-a-p2">
                      <span>전세 1억4000</span>
                    </p>
                    <p class="hit-a-p34">5층, 33.05m², 관리비 3만</p>
                    <p class="hit-a-p34">▶▶화곡동 최저가 2룸 전세◀◀</p>
                  </a>
                </div>
              </div>
              <!-- 첫번째 갤러리 끝 -->

              <!-- 2번째 갤러리 -->
              <div class="hit-div5 margin">
                <div class="hit-div6">
                  <!-- 좋아요 버튼 -->
                  <div class="hit-div7">
                    <div class="hit-div8 off" data-value="on"></div>
                  </div>
                  <!-- 좋아요 끝 -->
                  <!-- 전체 링크화 -->
                  <a target="_blank" rel="" class="hit-a" href="${pageContext.request.contextPath}/main/rmdt.do">
                    <!-- 이미지 -->
                    <div class="hit-a-div"></div>
                    <!-- 확인매물 div -->
                    <div class="hit-a-confirm">
                      <div class="hit-a-confirm-div" type="">
                        <span class="bold">확인매물</span>
                        <span>19.09.25</span>
                      </div>
                    </div>
                    <!-- 확인매물 끝 -->
                    <p class="hit-a-p1">투룸</p>
                    <p class="hit-a-p2">
                      <span>전세 1억4000</span>
                    </p>
                    <p class="hit-a-p34">5층, 33.05m², 관리비 3만</p>
                    <p class="hit-a-p34">▶▶화곡동 최저가 2룸 전세◀◀</p>
                  </a>
                </div>
              </div>
              <!-- 두번째 갤러리 끝 -->

              <!-- 세번째 갤러리 -->
              <div class="hit-div5 margin">
                <div class="hit-div6">
                  <!-- 좋아요 버튼 -->
                  <div class="hit-div7">
                    <div class="hit-div8 off" data-value="on"></div>
                  </div>
                  <!-- 좋아요 끝 -->
                  <!-- 전체 링크화 -->
                  <a target="_blank" rel="" class="hit-a" href="${pageContext.request.contextPath}/main/rmdt.do">
                    <!-- 이미지 -->
                    <div class="hit-a-div"></div>
                    <!-- 확인매물 div -->
                    <div class="hit-a-confirm">
                      <div class="hit-a-confirm-div" type="">
                        <span class="bold">확인매물</span>
                        <span>19.09.25</span>
                      </div>
                    </div>
                    <!-- 확인매물 끝 -->
                    <p class="hit-a-p1">투룸</p>
                    <p class="hit-a-p2">
                      <span>전세 1억4000</span>
                    </p>
                    <p class="hit-a-p34">5층, 33.05m², 관리비 3만</p>
                    <p class="hit-a-p34">▶▶화곡동 최저가 2룸 전세◀◀</p>
                  </a>
                </div>
              </div>
              <!-- 세번째 갤러리 끝 -->

              <!-- 네번째 갤러리 -->
              <div class="hit-div5 margin">
                <div class="hit-div6">
                  <!-- 좋아요 버튼 -->
                  <div class="hit-div7">
                    <div class="hit-div8 off" data-value="on"></div>
                  </div>
                  <!-- 좋아요 끝 -->
                  <!-- 전체 링크화 -->
                  <a target="_blank" rel="" class="hit-a" href="${pageContext.request.contextPath}/main/rmdt.do">
                    <!-- 이미지 -->
                    <div class="hit-a-div"></div>
                    <!-- 확인매물 div -->
                <!--     <div class="hit-a-confirm">
                      <div class="hit-a-confirm-div" type="">
                        <span class="bold">확인매물</span>
                        <span>19.09.25</span>
                      </div>
                    </div> -->
                    <!-- 확인매물 끝 -->
                    <p class="hit-a-p1">투룸</p>
                    <p class="hit-a-p2">
                      <span>전세 1억4000</span>
                    </p>
                    <p class="hit-a-p34">5층, 33.05m², 관리비 3만</p>
                    <p class="hit-a-p34">▶▶화곡동 최저가 2룸 전세◀◀</p>
                  </a>
                </div>
              </div>
              <!-- 네번째 갤러리 끝 --> --%>
				</div>
				<!-- 갤러리 전체 끝 -->
			</div>
			<!-- 최근본방/찜한 방 끝-->
		</div>
		<!-- content 끝 -->

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
				$(".hit-div8").click(function(e) {
					$(this).toggleClass('on off');
				});
			});
		</script>
</body>
</html>