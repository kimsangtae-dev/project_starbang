<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<%@ include file="assets/inc/meta.jsp"%>

<!-- css 적용 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/ma_css/main.css">

<!--  slider css -->

<%--쓰지 않을 css --%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/plugin/slick/slick.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/plugin/slick/slick-theme.css">
<!-- <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/> -->


</head>
<body>

	<!----------------------------------------
-	header 								     -
----------------------------------------->
	<%@ include file="assets/inc/ma_top.jsp"%>


	<!---------------------------------------\
    /    content                             /
    ----------------------------------------->
	<!-- 중앙 영역 시작 -->
	<div id="content">


		<!---------------------------------------\
    /    검색창                                /
    ----------------------------------------->
		<div id="search">
			<div class="text-center">
				<p class="text-center">
					<span class="text-center">어떤 동네, 어떤 방</span>에서
				</p>
				<p>살고 싶으신가요?</p>
			</div>
			<form method="get"
				action="${pageContext.request.contextPath}/main/search.do">
				<div>
					<input type="text" name="keyword" id="keyword" value="${keyword}">
					<i class="glyphicon glyphicon-search"></i>
					<button type="submit" href="#" class="btn btn-primary">방
						찾기</button>
				</div>
			</form>
		</div>
		<!-- 검색창 끝 -->


		<!---------------------------------------\
    /    쉬운 방 찾기 시작                       /
    ----------------------------------------->
		<div id="easyfind">
			<div class="text-center easy-box1">
				<span>쉬운 방찾기</span>
				<p>방 찾기 초보를 위한 초간단 솔루션!</p>
			</div>
			<div class="slide-div1">
				<div class="slide-div2">
					<div class="slide-div3 slider regular" style="right: 0px;">

						<div>
							<a class="slide-a"
								href="${pageContext.request.contextPath}/main/search.do?depositFrom=0&depositTo=999999&monthFrom=0&monthTo=50&buyingFrom=0&buyingTo=999999&feeFrom=0&feeTo=999999&sizeFrom=0&sizeTo=999999&roomtype=원룸">
								<div class="slide-a-div1">
									<div class="slide-a-div1-up1"></div>
									<div class="slide-a-div1-down">
										<p>부담없는 월세</p>
										<p>50이하 원룸</p>
									</div>
								</div>
							</a>
						</div>

						<div>
							<a class="slide-a"
								href="${pageContext.request.contextPath}/main/search.do?depositFrom=0&depositTo=500&monthFrom=0&monthTo=999999&buyingFrom=0&buyingTo=999999&feeFrom=0&feeTo=999999&sizeFrom=0&sizeTo=999999&roomtype=원룸">
								<div class="slide-a-div1">
									<div class="slide-a-div1-up2"></div>
									<div class="slide-a-div1-down">
										<p>믿음직한 보증금</p>
										<p>500이하 원룸</p>
									</div>
								</div>
							</a>
						</div>

						<div>
							<a class="slide-a"
								href="${pageContext.request.contextPath}/main/search.do?depositFrom=0&depositTo=999999&monthFrom=0&monthTo=999999&buyingFrom=0&buyingTo=999999&feeFrom=0&feeTo=999999&sizeFrom=0&sizeTo=999999&roomtype=원룸&region_2depth_name=송파구">
								<div class="slide-a-div1">
									<div class="slide-a-div1-up3"></div>
									<div class="slide-a-div1-down">
										<p>살기좋은</p>
										<p>송파구 원룸</p>
									</div>
								</div>
							</a>
						</div>

						<div>
							<a class="slide-a"
								href="${pageContext.request.contextPath}/main/search.do?depositFrom=0&depositTo=20000&monthFrom=0&monthTo=999999&buyingFrom=0&buyingTo=999999&feeFrom=0&feeTo=999999&sizeFrom=0&sizeTo=999999&dealingtype=전세&roomtype=투룸">
								<div class="slide-a-div1">
									<div class="slide-a-div1-up4"></div>
									<div class="slide-a-div1-down">
										<p>2억이하</p>
										<p>전세 투쓰리룸</p>
									</div>
								</div>
							</a>
						</div>

						<div>
							<a class="slide-a"
								href="${pageContext.request.contextPath}/main/search.do?depositFrom=0&depositTo=30000&monthFrom=0&monthTo=999999&buyingFrom=0&buyingTo=999999&feeFrom=0&feeTo=999999&sizeFrom=0&sizeTo=999999&roomtype=전세">
								<div class="slide-a-div1">
									<div class="slide-a-div1-up5"></div>
									<div class="slide-a-div1-down">
										<p>중산층을 위한</p>
										<p>3억 이하 전세</p>
									</div>
								</div>
							</a>
						</div>

						<div>
							<a class="slide-a"
								href="${pageContext.request.contextPath}/main/search.do?depositFrom=0&depositTo=10000&monthFrom=0&monthTo=999999&buyingFrom=0&buyingTo=999999&feeFrom=0&feeTo=999999&sizeFrom=0&sizeTo=999999&roomtype=오피스텔">
								<div class="slide-a-div1">
									<div class="slide-a-div1-up6"></div>
									<div class="slide-a-div1-down">
										<p>보증금1억이하</p>
										<p>오피스텔</p>
									</div>
								</div>
							</a>
						</div>

						<div>
							<a class="slide-a"
								href="${pageContext.request.contextPath}/main/search.do?depositFrom=0&depositTo=999999&monthFrom=0&monthTo=999999&buyingFrom=0&buyingTo=20000&feeFrom=0&feeTo=999999&sizeFrom=0&sizeTo=999999&dealingtype=매매">
								<div class="slide-a-div1">
									<div class="slide-a-div1-up7"></div>
									<div class="slide-a-div1-down">
										<p>신혼부부를 위한</p>
										<p>2억이하 매매</p>
									</div>
								</div>
							</a>
						</div>

						<div>
							<a class="slide-a"
								href="${pageContext.request.contextPath}/main/search.do?depositFrom=0&depositTo=999999&monthFrom=0&monthTo=999999&buyingFrom=0&buyingTo=999999&feeFrom=0&feeTo=999999&sizeFrom=0&sizeTo=999999&region_2depth_name=강남구">
								<div class="slide-a-div1">
									<div class="slide-a-div1-up8"></div>
									<div class="slide-a-div1-down">
										<p>놀기 좋은 접근성 좋은</p>
										<p>강남구 원룸</p>
									</div>
								</div>
							</a>
						</div>

						<div>
							<a class="slide-a"
								href="${pageContext.request.contextPath}/main/search.do?depositFrom=0&depositTo=999999&monthFrom=0&monthTo=50&buyingFrom=0&buyingTo=999999&feeFrom=0&feeTo=999999&sizeFrom=0&sizeTo=999999&roomtype=원룸">
								<div class="slide-a-div1">
									<div class="slide-a-div1-up9"></div>
									<div class="slide-a-div1-down">
										<p>부담없는 월세</p>
										<p>50이하 원룸</p>
									</div>
								</div>
							</a>
						</div>

					</div>
				</div>

				<!-- 
          다방 버전 오른쪽 화살표 
          <div class="">
          <button class="slide-button">
            <svg width="10" height="16" viewBox="0 0 10 16">
              <path fill="none" fill-rule="evenodd" stroke="#666" d="M2 14l6-6-6-6"></path>
            </svg>
          </button>
          </div> -->

				<!-- 
        다방 버전 페이징
        
        <div class="slidepage-div">
          <p class="slidepage-p1">01</p>
          <p class="slidepage-p2">02</p>
        </div>
       -->
			</div>
		</div>
		<!-- 쉬운방찾기 끝 -->


		<!---------------------------------------\
    /    최근본방/찜한 방                        /
    ----------------------------------------->
		<div class="recent">
			<div class="recent-div0">
				<!-- 				<div class="recent-div1">
				</div>
				<div class="recent-div2">
				</div> -->

				<ul class="tabs" id="tabs">
					<li id="tab1"><c:choose>
							<c:when test="${loginInfo == null }">최근 본 방
				</c:when>
							<%-- 컨트롤러에서 식별한 세션 있을 때 --%>
							<c:otherwise>
								${loginInfo.name}님의 최근 본 방</a>
							</c:otherwise>
						</c:choose></li>
					<li id="tab2"><c:choose>
							<%-- 컨트롤러에서 식별한 세션 없을 때 --%>
							<c:when test="${loginInfo == null }">
								<a href="${pageContext.request.contextPath}/modal/login.do"
									data-toggle="modal"
									data-target="#loginModal">찜한 방</a>
							</c:when>
							<%-- 컨트롤러에서 식별한 세션 있을 때 --%>
							<c:otherwise>
							${loginInfo.name}님의 찜한방
							</c:otherwise>
						</c:choose></li>
				</ul>
				<div class="recent-div3">
					<span>최근에 본 방과 찜한방을 볼 수 있어요</span>
				</div>

				<div class="tab_container" id="tab_con">
					<div class="recent-div4">
					<c:choose>
								<%-- 조회 결과가 없는 경우 --%>
								<c:when test="${output == null || fn:length(output) == 0}">
					<div class="recent-div5-vacant margin">
						<p class="recent-div5-vacant-p">아직 못 본 더 많은 방이 있어요.</p>
					</div>
										<div class="recent-div5-vacant margin">
						<p class="recent-div5-vacant-p">아직 못 본 더 많은 방이 있어요.</p>
					</div>
										<div class="recent-div5-vacant margin">
						<p class="recent-div5-vacant-p">아직 못 본 더 많은 방이 있어요.</p>
					</div>
										<div class="recent-div5-vacant margin">
						<p class="recent-div5-vacant-p">아직 못 본 더 많은 방이 있어요.</p>
					</div>
								</c:when>
					</c:choose>								
					
<%-- 						<c:forEach var="item" items="${output3}" varStatus="status"
							end="4">
							<li>
								<div class="recent-div5">
									<div class="recent-div6">
										좋아요 버튼
										<div class="recent-div7">
											<div class="recent-div8 off" data-value="on"></div>
										</div>
										좋아요 끝
										전체 링크화
										<a target="_blank" rel="" class="recent-a"
											href="${pageContext.request.contextPath}/main/rmdt.do?roomno=${item.roomno}">
											<!-- 이미지 -->
											<div class="recent-a-div">
												<img
													src="${pageContext.request.contextPath}/assets/img/upload/${item.filename}" />
											</div> <c:if test="${item.confirmdate != null}">
												확인매물 div
												<div class="recent-a-confirm">
													<div class="recent-a-confirm-div">
														<span class="bold">확인매물</span> <span>${item.confirmdate}</span>
													</div>
												</div>
												확인매물 끝
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
											<p class="recent-a-p34">${item.floor}층,${item.area}m²,관리비
												${item.fee}만</p>
											<p class="recent-a-p34">${item.title}</p>
										</a>
									</div>
								</div>
							</li>
						</c:forEach> --%>
					</div>

				</div>
				<!-- 갤러리 전체 박스 -->
				<!-- 				<div class="recent-div4"> -->
				<%-- 					<c:forEach var="item" items="${output3}" varStatus="status" end="4">
						<li>
							<div class="recent-div5">
								<div class="recent-div6">
									좋아요 버튼
									<div class="recent-div7">
										<div class="recent-div8 off" data-value="on"></div>
									</div>
									좋아요 끝
									전체 링크화
									<a target="_blank" rel="" class="recent-a"
										href="${pageContext.request.contextPath}/main/rmdt.do?roomno=${item.roomno}">
										<!-- 이미지 -->
										<div class="recent-a-div">
											<img
												src="${pageContext.request.contextPath}/assets/img/upload/${item.filename}" />
										</div> <c:if test="${item.confirmdate != null}">
											확인매물 div
											<div class="recent-a-confirm">
												<div class="recent-a-confirm-div">
													<span class="bold">확인매물</span> <span>${item.confirmdate}</span>
												</div>
											</div>
											확인매물 끝
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
										<p class="recent-a-p34">${item.floor}층,${item.area}m²,관리비
											${item.fee}만</p>
										<p class="recent-a-p34">${item.title}</p>
									</a>
								</div>
							</div>
						</li>
					</c:forEach> --%>
				<%-- <!-- 각각 갤러리 시작 -->
					<!-- 1번째 갤러리 시작 -->
					<div class="recent-div5">
						<div class="recent-div6">
							<!-- 좋아요 버튼 -->
							<div class="recent-div7">
								<div class="recent-div8 off" data-value="on"></div>
							</div>
							<!-- 좋아요 끝 -->
							<!-- 전체 링크화 -->
							<a target="_blank" rel="" class="recent-a"
								href="${pageContext.request.contextPath}/main/rmdt.do"> <!-- 이미지 -->
								<div class="recent-a-div"></div> <!-- 확인매물 div -->
								<div class="recent-a-confirm">
									<div class="recent-a-confirm-div" type="">
										<span class="bold">확인매물</span> <span>19.09.25</span>
									</div>
								</div> <!-- 확인매물 끝 -->
								<p class="recent-a-p1">투룸</p>
								<p class="recent-a-p2">
									<span>전세 1억4000</span>
								</p>
								<p class="recent-a-p34">5층, 33.05m², 관리비 3만</p>
								<p class="recent-a-p34">▶▶화곡동 최저가 2룸 전세◀◀</p>
							</a>
						</div>
					</div>
					<!-- 1번째 갤러리 끝 -->

					<!-- 2번째 갤러리 -->
					<div class="recent-div5 margin">
						<div class="recent-div6">
							<!-- 좋아요 버튼 -->
							<div class="recent-div7">
								<div class="recent-div8 off" data-value="on"></div>
							</div>
							<!-- 좋아요 끝 -->
							<!-- 전체 링크화 -->
							<a target="_blank" rel="" class="recent-a"
								href="${pageContext.request.contextPath}/main/rmdt.do"> <!-- 이미지 -->
								<div class="recent-a-div recent-a-div2"></div> <!-- 확인매물 div -->
								<div class="recent-a-confirm">
									<div class="recent-a-confirm-div" type="">
										<span class="bold">확인매물</span> <span>19.09.22</span>
									</div>
								</div> <!-- 확인매물 끝 -->
								<p class="recent-a-p1">원룸</p>
								<p class="recent-a-p2">
									<span>월세 1000/45</span>
								</p>
								<p class="recent-a-p34">4층, 33.05m², 관리비 5만</p>
								<p class="recent-a-p34">신대방역 역세권 넓고 깔끔한 원룸</p>
							</a>
						</div>
					</div>
					<!-- 두번째 갤러리 끝 -->

					<!-- 3번째 갤러리 시작 -->
					<div class="recent-div5-vacant margin">
						<p class="recent-div5-vacant-p">아직 못 본 더 많은 방이 있어요.</p>
					</div>
					<!-- 4번째 갤러리 끝 -->

					<!-- 4번째 갤러리 시작 -->
					<div class="recent-div5-vacant margin">
						<p class="recent-div5-vacant-p">아직 못 본 더 많은 방이 있어요.</p>
					</div>
					<!-- 4번째 갤러리 끝 -->

				</div>
				<!--  갤러리 전체박스 끝 --> --%>

			</div>
			<!-- div0 끝 -->

		</div>
		<!-- 최근본방 / 찜한방 끝  -->

		<!---------------------------------------\
    /    인기있는 방 시작                        /
    ----------------------------------------->
		<div class="pop-entire">
			<div class="pop-entire-d2">
				<div class="pop-title1">
					<a href="#">인기 있는 방</a>
				</div>
				<div class="pop-title2">많은 사람들이 찾아본 이곳, 궁금하지 않으세요?</div>

				<!-- 갤러리 전체 박스 -->
				<div class="hit-div4">
					<ul id="gallery-list">
						<c:choose>
							<%-- 조회 결과가 없는 경우 --%>
							<c:when test="${output == null || fn:length(output) == 0}">
					<div class="recent-div5-vacant margin">
						<p class="recent-div5-vacant-p">아직 못 본 더 많은 방이 있어요.</p>
					</div>
										<div class="recent-div5-vacant margin">
						<p class="recent-div5-vacant-p">아직 못 본 더 많은 방이 있어요.</p>
					</div>
										<div class="recent-div5-vacant margin">
						<p class="recent-div5-vacant-p">아직 못 본 더 많은 방이 있어요.</p>
					</div>
										<div class="recent-div5-vacant margin">
						<p class="recent-div5-vacant-p">아직 못 본 더 많은 방이 있어요.</p>
					</div>
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
													href="${pageContext.request.contextPath}/main/rmdt.do?roomno=${item.roomno}">
													<!-- 이미지 -->
													<div class="hit-a-div">
														<img
															src="${pageContext.request.contextPath}/assets/img/upload/${item.filename}" />
													</div> <c:if test="${item.confirmdate != null}">
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
													<p class="hit-a-p34">${item.floor}층,${item.area}m²,관리비
														${item.fee}만</p>
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

					<%-- <!-- 갤러리 전체 박스 -->
        <div class="pop-gallery-d"> 
          <!-- 각각 갤러리 시작 -->
          <!-- 1번째 갤러리 시작 -->
          <div class="each-d1">
            <div class="each-d2">

              <!-- 좋아요 버튼 -->
              <div class="recent-div7">
                <div class="recent-div8 off" data-value="on"></div>
              </div>
              <!-- 좋아요 끝 -->

              <!-- 전체 링크화 -->
              <a target="_blank" rel="" class="gallery-a" href="${pageContext.request.contextPath}/main/rmdt.do">
                <!-- 이미지 -->
                <div class="gallery-pic pic1"></div>
                <!-- 확인매물 div -->
                <div class="gallery-confirm">
                  <div class="gallery-confirm-d" type="">
                    <span class="bold">확인매물</span>
                    <span>19.10.26</span>
                  </div>
                </div>
                <!-- 확인매물 끝 -->
                <p class="gallery-p1">투룸</p>
                <p class="gallery-p2">
                  <span>전세 1억6500</span>
                </p>
                <p class="gallery-p34">2층, 49.58m², 관리비 3만</p>
                <p class="gallery-p34">2016년준공!!신축급 투룸!!신혼부부 강추매물!</p>
              </a>
            </div>
          </div>
          <!-- 1번째 갤러리 끝 -->

          <!-- 2번째 갤러리 시작 -->
          <div class="each-d1">
            <div class="each-d2">

              <!-- 좋아요 버튼 -->
              <div class="recent-div7">
                <div class="recent-div8 off" data-value="on"></div>
              </div>
              <!-- 좋아요 끝 -->

              <!-- 전체 링크화 -->
              <a target="_blank" rel="" class="gallery-a" href="${pageContext.request.contextPath}/main/rmdt.do">
                <!-- 이미지 -->
                <div class="gallery-pic pic2"></div>
                <!-- 확인매물 div -->
                <div class="gallery-confirm">
                  <div class="gallery-confirm-d" type="">
                    <span class="bold">확인매물</span>
                    <span>19.10.25</span>
                  </div>
                </div>
                <!-- 확인매물 끝 -->
                <p class="gallery-p1">원룸</p>
                <p class="gallery-p2">
                  <span>월세 500/45</span>
                </p>
                <p class="gallery-p34">2층, 26.44m², 관리비 5만</p>
                <p class="gallery-p34">💝크기💝구조💝위치💝금액💝 ✨팔방미인 원룸✨</p>
              </a>
            </div>
          </div>
          <!-- 2번째 갤러리 끝 -->

          <!-- 3번째 갤러리 시작 -->
          <div class="each-d1">
            <div class="each-d2">

              <!-- 좋아요 버튼 -->
              <div class="recent-div7">
                <div class="recent-div8 off" data-value="on"></div>
              </div>
              <!-- 좋아요 끝 -->

              <!-- 전체 링크화 -->
              <a target="_blank" rel="" class="gallery-a" href="${pageContext.request.contextPath}/main/rmdt.do">
                <!-- 이미지 -->
                <div class="gallery-pic pic3"></div>
                <!-- 확인매물 div -->
                <div class="gallery-confirm">
                  <div class="gallery-confirm-d" type="">
                    <span class="bold">확인매물</span>
                    <span>19.09.25</span>
                  </div>
                </div>
                <!-- 확인매물 끝 -->
                <p class="gallery-p1">투룸</p>
                <p class="gallery-p2">
                  <span>전세 1억4000</span>
                </p>
                <p class="gallery-p34">5층, 33.05m², 관리비 3만</p>
                <p class="gallery-p34">▶▶화곡동 최저가 2룸 전세◀◀</p>
              </a>
            </div>
          </div>
          <!-- 3번째 갤러리 끝 -->

          <!-- 4번째 갤러리 시작 -->
          <div class="each-d1">
            <div class="each-d2">

              <!-- 좋아요 버튼 -->
              <div class="recent-div7">
                <div class="recent-div8 off" data-value="on"></div>
              </div>
              <!-- 좋아요 끝 -->

              <!-- 전체 링크화 -->
              <a target="_blank" rel="" class="gallery-a" href="${pageContext.request.contextPath}/main/rmdt.do">
                <!-- 이미지 -->
                <div class="gallery-pic pic4"></div>
                <!-- 확인매물 div -->
                <div class="gallery-confirm">
                  <div class="gallery-confirm-d" type="">
                    <span class="bold">확인매물</span>
                    <span>19.09.25</span>
                  </div>
                </div>
                <!-- 확인매물 끝 -->
                <p class="gallery-p1">오피스텔</p>
                <p class="gallery-p2">
                  <span>월세 1000/40</span>
                </p>
                <p class="gallery-p34">4층, 23.49m², 관리비 7만</p>
                <p class="gallery-p34">♠벽지새로해드립니다 5호선 저렴한 월세방♠ 이 나왔습니다.</p>
              </a>
            </div>
          </div>
          <!-- 4번째 갤러리 끝 -->

          
        </div>
        <!--  갤러리 전체박스 끝 --> --%>

				</div>
				<!-- div0 끝 -->

			</div>
			<!-- 인기 있는 방 끝  -->


			<button class="btn-searchrm" style="bottom: 30px;">
				<svg width="20" height="20" viewBox="0 0 20 20">
    		<g fill="none" fill-rule="evenodd" stroke="#FFF" stroke-width="2">
    			<circle cx="8.5" cy="8.5" r="6.5"></circle>
    			<path d="M13 13l5 5"></path>
    		</g>
    	</svg>
				<span>방 찾기</span>
			</button>


		</div>
		<!-- content 끝 -->

		<!----------------------------------------
-	footer 							     -
----------------------------------------->
		<%@ include file="assets/inc/ma_bottom.jsp"%>


		<script
			src="${pageContext.request.contextPath}/assets/js/jquery-1.10.2.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/assets/plugin/slick/slick.min.js"
			type="text/javascript" charset="utf-8"></script>


		<script>
				/* 슬라이더 세팅 */

				$(".regular").slick({
					dots : true,
					infinite : true,
					slidesToShow : 6,
					slidesToScroll : 5
				});

				/* 좋아요 클릭 -> 하트 색 변경 */
				$(function() {
					$(".recent-div8").click(function(e) {
						$(this).toggleClass('on off');
					});
				})

				/* 스크롤 내렸을 때 방찾기 버튼 나타내기 */
				$(function() {
					$(window).scroll(
							function() {

								if ($(window).scrollTop() > 370) {
									$(".btn-searchrm").fadeIn(1).css("display",
											"block").css("bottom", "30px");
								} else {
									$(".btn-searchrm").fadeOut(1);
								}

								if ($(document).height() < $(window)
										.scrollTop()
										+ $(window).height() + 250) {
									var control = 0;
									control = 280 - ($(document).height()
											- $(window).scrollTop() - $(window)
											.height());
									$(".btn-searchrm").css("bottom",
											control + "px");
								}
							});

					$(".btn-searchrm").click(function() {
						$("#searching-for").focus();
					});
				});
				/* 좋아요 클릭 -> 하트 색 변경 */
				$(function() {
					$(".hit-div8").click(function(e) {
						$(this).toggleClass('on off');
					});
				});
			</script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js">
  $(document).ready(function() {
    $( "#tabs" ).tabs();
  } );
  
  </script>
		<!-- Handlebar 템플릿 코드 -->
		<script id="prof-list-tmpl" type="text/x-handlebars-template">
{{#each item}}
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
													href="${pageContext.request.contextPath}/main/rmdt.do?roomno={{roomno}}">
													<!-- 이미지 -->
													<div class="hit-a-div">
														<img
															src="${pageContext.request.contextPath}/assets/img/upload/{{filename}}" />
													</div>
														<%-- 확인매물 div --%>
				  										{{#if confirmdate}}
														<div class="hit-a-confirm">
															<div class="hit-a-confirm-div">
																<span class="bold">확인매물</span> <span>{{confirmdate}}</span>
															</div>
														</div>
														<%-- 확인매물 끝 --%>
				  									{{/if}}
													<p class="hit-a-p1">{{roomtype}}</p>
													<p class="hit-a-p2">
					{{#isMonth dealingtype}}
                     <span>{{dealingtype}} {{isOver2 deposit}}/{{isOver price}}</span>
					{{else}}
					 <span>{{dealingtype}} {{isOver price}}</span>
					{{/isMonth}}													
</p>
													<p class="hit-a-p34">{{floor}}층,{{area}}m²,관리비
														{{fee}}만</p>
													<p class="hit-a-p34">{{title}}</p>
												</a>
											</div>
										</div>
									</li>
{{/each}}
	</script>
		<!-- 값이 없을때 -->
		<script id="no-list-tmpl" type="text/x-handlebars-template">	
	<div class="recent-div5-vacant margin">
		<p class="recent-div5-vacant-p">아직 못 본 더 많은 방이 있어요.</p>
	</div>
	</script>
		<!-- user code -->
		<script
			src="${pageContext.request.contextPath}/assets/js/jquery-1.10.2.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/assets/plugin/handlebars-v4.0.11.js"></script>
		<script>
	$(function(){
	$("#tab2").click(function(){
		alert("안녕");
		
		
		$.get("${pageContext.request.contextPath}/professor",
				{"userno":2}
		,function(json){	
			var source = $("#prof-list-tmpl").html()//템플릿코드
			var template = Handlebars.compile(source);// 템플릿 컴파일
			var result = template(json);
			var a = Object.keys({item:[]});
			console.log(a); //json 데이터 알아보기
			$(".tabs > li:nth-child(2)").css("color","black");
			$(".tabs > li:nth-child(1)").css("color","gray");

			if(a == "item"){
				var source2 =$("#no-list-tmpl").html()
				var template = Handlebars.compile(source2);// 템플릿 컴파일
				$(".recent-div4").append(template);
			}
			
			$(".recent-div4").empty(); 
			$(".recent-div4").append(result);
		});
		});
	
	$(document).ready(function(){

		$.get("${pageContext.request.contextPath}/professor2",
				{"userno":1}
		,function(json){
			Handlebars.registerHelper('isMonth', function(dealingtype, options) {
         		  if (dealingtype == '월세') {
         		    return options.fn(this);
         		  } else {
         		    return options.inverse(this);
         		  }
         		});
         		
         		Handlebars.registerHelper('isOver', function(price, options) {
           		if (price >= 10000 && price%10000 != 0) {
           			return Math.floor(price/10000) +"억" + price%10000;
           		} else {
           			return price;
           		}
           	});
         		
         		Handlebars.registerHelper('isOver2', function(deposit, options) {
           		if (deposit >= 10000 && deposit%10000 != 0) {
           			return Math.floor(deposit/10000) +"억" + deposit%10000;
           		} else {
           			return deposit;
           		}
           	});
         		
			var source = $("#prof-list-tmpl").html()//템플릿코드
			var template = Handlebars.compile(source);// 템플릿 컴파일
			var result = template(json);
			
			$(".tabs > li:nth-child(1)").css("color","black");
			$(".tabs > li:nth-child(2)").css("color","gray");
			$(".recent-div4").empty();
			$(".recent-div4").append(result);
		});
		});
	$("#tab1").click(function(){
		alert("테스트중");

		$.get("${pageContext.request.contextPath}/professor2",
				{"userno":1}
		,function(json){
			Handlebars.registerHelper('isMonth', function(dealingtype, options) {
         		  if (dealingtype == '월세') {
         		    return options.fn(this);
         		  } else {
         		    return options.inverse(this);
         		  }
         		});
         		
         		Handlebars.registerHelper('isOver', function(price, options) {
           		if (price >= 10000 && price%10000 != 0) {
           			return Math.floor(price/10000) +"억" + price%10000;
           		} else {
           			return price;
           		}
           	});
         		
         		Handlebars.registerHelper('isOver2', function(deposit, options) {
           		if (deposit >= 10000 && deposit%10000 != 0) {
           			return Math.floor(deposit/10000) +"억" + deposit%10000;
           		} else {
           			return deposit;
           		}
           	});
         		
			var source = $("#prof-list-tmpl").html()//템플릿코드
			var template = Handlebars.compile(source);// 템플릿 컴파일
			var result = template(json);
			
			$(".tabs > li:nth-child(1)").css("color","black");
			$(".tabs > li:nth-child(2)").css("color","gray");
			$(".recent-div4").empty();
			$(".recent-div4").append(result);
		});
		});
	});
	</script>
</body>
</html>