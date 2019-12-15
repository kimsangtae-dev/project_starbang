<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../assets/inc/meta.jsp"%>
    <!-- css 참조 -->
    <link rel="stylesheet" type="text/css"
    href="${pageContext.request.contextPath}/assets/css/ma_css/search.css">

    <link rel="stylesheet"
    href="${pageContext.request.contextPath}/assets/plugin/ion.rangeSlider.css">

</head>

<body>
	<!-- 브라우저에 보여질 부분 -->
	<!-- 페이지의 전체 폭을 결정하기 위한 영역 -->
	<div>
		<!-- 상단 헤더 -->
		<%@ include file="../assets/inc/ma_top.jsp"%>
		<!-- 중앙 영역 -->
		<div id="content">
			<div id="search" class="clearfix">
				<div class="searchtab">
					<form id="search-form" method="get" action="${pageContext.request.contextPath}/main/search.do">
						<input type="search" placeholder="검색바" name="search" id="keyword"
							value="${keyword}" /> <i class="glyphicon glyphicon-search"></i>
						<button type="submit">검색</button>
					</form>
				</div>
				<!-- 전체 필터 -->
				<div class="filters clearfix">
					<!-- 개별 필터 -->
					<div class="btn-group filter">
						<button type="button" class="btn dropdown-toggle btn-rt"
							data-toggle="dropdown">
							원룸,투룸 쓰리룸<span class="caret"></span>
						</button>
						<div class="dropdown-menu width1" role="menu">
							<form id="room-type">
								<h1>방종류</h1>
								<p>중복 선택이 가능합니다.</p>
								<ul>
									<li><label> <input type="checkbox"
											name="room-type" value="oneroom" checked /> <span
											class="checkBox"></span> <span class="checkText">원룸</span>
									</label></li>
									<li><label> <input type="checkbox"
											name="room-type" value="tworoom" checked /> <span
											class="checkBox"></span> <span class="checkText">투·쓰리룸</span>
									</label></li>
									<li><label> <input type="checkbox"
											name="room-type" value="officetel" checked /> <span
											class="checkBox"></span> <span class="checkText">오피스텔</span>
									</label></li>
								</ul>
							</form>
						</div>
					</div>
					<!-- 개별 필터 끝 -->
					<!-- 개별 필터 -->
					<div class="btn-group filter">
						<button type="button" class="btn dropdown-toggle btn-st"
							data-toggle="dropdown">
							월세,전세,매매 <span class="caret"></span>
						</button>
						<div class="dropdown-menu width1" role="menu">
							<h1>매물종류</h1>
							<p>중복 선택이 가능합니다.</p>
							<ul>
								<li><label> <input type="checkbox" name="sale-type"
										value="monthly" checked /> <span class="checkBox"></span> <span
										class="checkText">월세</span>
								</label></li>
								<li><label> <input type="checkbox" name="sale-type"
										value="charter" checked /> <span class="checkBox"></span> <span
										class="checkText">전세</span>
								</label></li>
								<li><label> <input type="checkbox" name="sale-type"
										value="buying" checked /> <span class="checkBox"></span> <span
										class="checkText">매매</span>
								</label></li>
							</ul>
						</div>
					</div>
					<!-- 개별 필터 끝 -->
					<!-- 개별 필터 -->
					<div class="btn-group filter">
						<button type="button" class="btn dropdown-toggle"
							data-toggle="dropdown">
							가격대 <span class="caret"></span>
						</button>
						<div class="dropdown-menu width2" role="menu">
							<div class="filter-slide">
								<h1>
									보증금/전세가
									<p class="inf" id="filter1-value">무제한</p>
								</h1>
								<input type="text" id="slide-price1" name="">
								<ul>
									<li>0</li>
									<li>1억 2000만원</li>
									<li>무제한</li>
								</ul>
							</div>
							<div class="filter-slide mar-top">
								<h1>
									월세
									<p class="inf" id="filter2-value">무제한</p>
								</h1>
								<input type="text" id="slide-price2" name="">
								<ul>
									<li>0</li>
									<li>60만원</li>
									<li>무제한</li>
								</ul>
							</div>
							<div class="filter-slide mar-top">
								<h1>
									매매가
									<p class="inf" id="filter3-value">무제한</p>
								</h1>
								<input type="text" id="slide-price3" name="">
								<ul>
									<li>0</li>
									<li>5억원</li>
									<li>무제한</li>
								</ul>
							</div>
							<button type="button" id="filter-reset1" class="filter-reset">
								<i class="glyphicon glyphicon-refresh"></i>조건삭제
							</button>
						</div>
					</div>
					<!-- 개별 필터 끝 -->
					<!-- 개별 필터 -->
					<div class="btn-group filter">
						<button type="button" class="btn dropdown-toggle"
							data-toggle="dropdown">
							관리비 <span class="caret"></span>
						</button>
						<div class="dropdown-menu width2" role="menu">
							<div class="filter-slide">
								<h1>
									관리비
									<p class="inf" id="filter4-value">무제한</p>
								</h1>
								<input type="text" id="slide-price4" name="">
								<ul>
									<li>0</li>
									<li>20만원</li>
									<li>무제한</li>
								</ul>
							</div>
							<button type="button" id="filter-reset2" class="filter-reset">
								<i class="glyphicon glyphicon-refresh"></i>조건삭제
							</button>
						</div>
					</div>
					<!-- 개별 필터 끝 -->
					<!-- 개별 필터 -->
					<div class="btn-group filter">
						<button type="button" class="btn dropdown-toggle"
							data-toggle="dropdown">
							방크기 <span class="caret"></span>
						</button>
						<div class="dropdown-menu pull-right width2" role="menu">
							<div class="filter-slide">
								<h1>
									방크기
									<p class="inf" id="filter5-value">무제한</p>
								</h1>
								<input type="text" id="slide-size" name="">
								<ul>
									<li>0㎡(0평)</li>
									<li>33㎡(10평)</li>
									<li>무제한</li>
								</ul>
							</div>
							<button type="button" id="filter-reset3" class="filter-reset">
								<i class="glyphicon glyphicon-refresh"></i>조건삭제
							</button>
						</div>
					</div>
					<!-- 개별 필터 끝 -->
				</div>
				<!-- 전체 필터 끝 -->
				<!-- 초기화 버튼 -->
				<div id="filters-reset" class="filters-reset">
					<i class="glyphicon glyphicon-refresh"></i>초기화
				</div>
			</div>
			<div id="contentbox" class="clearfix">
				<div class="gallery">
					<!-- 갤러리 상단 영역 -->
					<div class="gallery-header">
						<span>조건에 맞는 방 </span> <span class="room-count" id="room-count">${totalCount}</span><span>개</span>
					</div>
					<!-- 갤러리 상단 영역 끝 -->
					<!-- 갤러리 내용 + 하단 영역 -->
					<div class="gallery-container">
						<!-- 갤러리 내용 영역 -->
						<div class="gallery-content clearfix">
								<c:choose>
									<%-- 조회 결과가 없는 경우 --%>
									<c:when test="${output == null || fn:length(output) == 0}">
										<div class="noresultbox">
											<p class="noresulticon">
												<i class="glyphicon glyphicon-home noresulticon"></i>
											</p>
											<p class="noresult">조건에 맞는 방이 없습니다.</p>
											<p class="noresult">맞춤필터를 해제해보세요.</p>
										</div>
									</c:when>
									<c:otherwise>
									<ul id="gallery-list">
									<%-- 갤러리 시작 --%>
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
														<%-- -------------------쿠키 굽기---------------------- --%>

														<%-- 파라미터 GET으로 보내기 작업 --%>
														<a target="_blank" rel="" class="recent-a"
															href="${pageContext.request.contextPath}/main/rmdtsave.do?roomno=${item.roomno}">

															<%-- -------------------쿠키 굽기---------------------- --%>

															<!-- 이미지 -->
															<div class="recent-a-div">
																<img src="${pageContext.request.contextPath}/assets/img/upload/${item.filename}" />
															</div> 
															<c:if test="${item.confirmdate != null}">
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
																	<%-- 월세인 경우 --%>
																	<c:when test="${item.dealingtype == '월세'}">
																		<span>${item.dealingtype}&nbsp;<!--
														--> <fmt:formatNumber value="${item.deposit}"
																				pattern="#,####" var="eok1"></fmt:formatNumber> <c:set
																				var="patternprice1"
																				value="${fn:replace(eok1, ',', '억')}" /> <!--
														-->${patternprice1}/${item.price}</span>
																	</c:when>
																	<%-- 전세 혹은 매매인 경우 --%>
																	<c:otherwise>
																		<span>${item.dealingtype}&nbsp;<!--
														--> <fmt:formatNumber value="${item.price}"
																				pattern="#,####" var="eok2"></fmt:formatNumber> <c:set
																				var="patternprice2"
																				value="${fn:replace(eok2, ',', '억')}" /> <!--
														-->${patternprice2}</span>
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
										<%-- 각 갤러리 끝 --%>
									</ul>
									</c:otherwise>
								</c:choose>
						</div>
						<!-- 갤러리 내용 영역 -->
						<!-- 갤러리 하단 영역 -->
						<c:if test="${output != null && fn:length(output) != 0}">
							<div class="gallery-footer">
								<%-- gallery-index --%>
								<div class="gallery-index">
									<!-- 페이지 번호 구현 -->
									<%-- 이전 그룹에 대한 링크 --%>
									<c:choose>
										<%-- 이전 그룹으로 이동 가능하다면? --%>
										<c:when test="${pageData.prevPage > 0}">
											<%-- 이동할 URL 생성 --%>
											<c:url value="/main/search.do" var="prevPageUrl">
												<%-- <c:param name="roomtype" value="${roomtype}" /> --%>
												<c:param name="depositFrom" value="${param.depositFrom}" />
												<c:param name="depositTo" value="${param.depositTo}" />
												<c:param name="monthFrom" value="${param.monthFrom}" />
												<c:param name="monthTo" value="${param.monthTo}" />
												<c:param name="buyingFrom" value="${param.buyingFrom}" />
												<c:param name="buyingTo" value="${param.buyingTo}" />
												<c:param name="feeFrom" value="${param.feeFrom}" />
												<c:param name="feeTo" value="${param.feeTo}" />
												<c:param name="sizeFrom" value="${param.sizeFrom}" />
												<c:param name="sizeTo" value="${param.sizeTo}" />
												<c:param name="page" value="${pageData.prevPage}" />
											</c:url>
											<a href="${prevPageUrl}" id="temp">
												<button class="prev-btn">
													<span>&lt;</span>
												</button>
											</a>
										</c:when>
										<c:otherwise>
											<button class="prev-btn" id="temp">
												<span>&lt;</span>
											</button>
										</c:otherwise>
									</c:choose>

									<%-- 페이지 번호 (시작 페이지 부터 끝 페이지까지 반복) --%>
									<ul class="index-list">
										<c:forEach var="i" begin="${pageData.startPage}"
											end="${pageData.endPage}" varStatus="status">
											<%-- 이동할 URL 생성 --%>
											<c:url value="/main/search.do" var="pageUrl">
												<%-- <c:param name="roomtype" value="${roomtype}" /> --%>
												<c:param name="depositFrom" value="${param.depositFrom}" />
												<c:param name="depositTo" value="${param.depositTo}" />
												<c:param name="monthFrom" value="${param.monthFrom}" />
												<c:param name="monthTo" value="${param.monthTo}" />
												<c:param name="buyingFrom" value="${param.buyingFrom}" />
												<c:param name="buyingTo" value="${param.buyingTo}" />
												<c:param name="feeFrom" value="${param.feeFrom}" />
												<c:param name="feeTo" value="${param.feeTo}" />
												<c:param name="sizeFrom" value="${param.sizeFrom}" />
												<c:param name="sizeTo" value="${param.sizeTo}" />
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
											<c:url value="/main/search.do" var="nextPageUrl">
												<%-- <c:param name="roomtype" value="${roomtype}" /> --%>
												<c:param name="depositFrom" value="${param.depositFrom}" />
												<c:param name="depositTo" value="${param.depositTo}" />
												<c:param name="monthFrom" value="${param.monthFrom}" />
												<c:param name="monthTo" value="${param.monthTo}" />
												<c:param name="buyingFrom" value="${param.buyingFrom}" />
												<c:param name="buyingTo" value="${param.buyingTo}" />
												<c:param name="feeFrom" value="${param.feeFrom}" />
												<c:param name="feeTo" value="${param.feeTo}" />
												<c:param name="sizeFrom" value="${param.sizeFrom}" />
												<c:param name="sizeTo" value="${param.sizeTo}" />
												<c:param name="page" value="${pageData.nextPage}" />
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
						</c:if>
						<!-- 갤러리 하단 영역 끝 -->
					</div>
					<!-- 갤러리 내용 + 하단 영역 끝 -->
				</div>
				<!-- 지도 -->
				<div class="map-container">
					<div id="map"></div>
					<div class="zoom">
						<button class="zoom-in">+</button>
						<button class="zoom-out">-</button>
					</div>
				</div>
				<!-- 지도 끝 -->
			</div>
		</div>
		<!-- 하단 영역 -->
		<div id="footer"></div>
	</div>
	<!-- Javascript -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery-1.10.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=49ad4eb7ef14b56eb0eca723e4dd1eaa&libraries=clusterer,services"></script>
	<script src="${pageContext.request.contextPath}/assets/plugin/ion.rangeSlider.js"></script>
	<script type="text/javascript">
	    /* 브라우저 크기에 따라 갤러리와 지도영역 높이 변경 */
	    function contentSize() {
	        var wHeight = $(window).height();
	        var gHeight = wHeight - 206;
	        var mHeight = wHeight - 136;
	        $(".gallery-container").css("height", gHeight);
	        $(".map-container").css("height", mHeight);
	
	        // 조회 결과가 없는 경우를 위한 크기 조정
	        $(".noresultbox").css("height", gHeight-60);
	    }
	    $(function() {
	        contentSize();
	        $(window).resize(function(e) {
	            contentSize();
	        });
	
	        /** 좋아요 */
	        $(".recent-div8").click(function(e) {
	            $(this).toggleClass('on off');
	        });
	    });
	</script>
	
	<!-- Ajax로 읽어온 내용을 출력하는데 사용될 템플릿 -->
   <script src="${pageContext.request.contextPath}/assets/plugin/handlebars-v4.0.11.js"></script>
   <script id="gallery-data" type="text/x-handlebars-template">
      {{#each output}}
      <li>
         <div class="recent-div5">
            <div class="recent-div6">
               {{!-- 좋아요 버튼 --}}
               <div class="recent-div7">
                  <div class="recent-div8 off" data-value="on"></div>
               </div>
               {{!-- 좋아요 끝 --}}
               {{!-- 전체 링크화 --}}
               <a target="_blank" rel="" class="recent-a" href="${pageContext.request.contextPath}/main/rmdt.do">
                  {{!-- 이미지 --}}
                  <div class="recent-a-div">
					<img src="${pageContext.request.contextPath}/assets/img/upload/{{filename}}" />
				  </div>
                  {{!-- 확인매물 div --}}
                  <div class="recent-a-confirm">
                     <div class="recent-a-confirm-div">
                        <span class="bold">확인매물</span> <span class="confirm-date">{{confirmdate}}</span>
                     </div>
                  </div>
                  {{!-- 확인매물 끝 --}}
                  <p class="recent-a-p1">{{roomtype}}</p>
                  <p class="recent-a-p2">
                     <span>{{dealingtype}} {{price}}</span>
                  </p>
                  <p class="recent-a-p34">{{floor}}층, {{area}}m², 관리비 {{fee}}만</p>
                  <p class="recent-a-p34">{{title}}</p>
               </a>
            </div>
         </div>
      </li>
      {{/each}}
   </script>
   <script type="text/javascript">
   $(function() {
	   var total_count = ${totalCount};
	   var deposit_from = ${param.depositFrom};
	   var deposit_to = ${param.depositTo};
	   var buying_from = ${param.buyingFrom};
	   var buying_to = ${param.buyingTo};
	   var fee_from = ${param.feeFrom};
	   var fee_to = ${param.feeTo};
	   var size_from = ${param.sizeFrom};
	   var size_to = ${param.sizeTo};
	   var prev_page = ${pageData.prevPage};
      /* gallery.json을 가져와 화면에 출력 */
      function get_gallery() {
         $.get('${pageContext.request.contextPath}/main/search',
        	{
        	 "depositFrom": deposit_from,
        	 "depositTo": deposit_to,
        	 "buyingFrom": buying_from,
        	 "buyingTo": buying_to,
        	 "feeFrom": fee_from,
        	 "feeTo": fee_to,
        	 "sizeFrom": size_from,
        	 "sizeTo": size_to
        	},
        	function(req) {
            var template = Handlebars.compile($("#gallery-data").html());
            var html = template(req);
            $("#gallery-list").html(html);
 
            $(".recent-div8").click(function(e) {
               $(this).toggleClass('on off');
            });
		});
	}
   })
   </script>

    <!-- 지도 api -->
    <script type="text/javascript">
	var deposit_from = ${param.depositFrom};
	var deposit_to = ${param.depositTo};
	var buying_from = ${param.buyingFrom};
	var buying_to = ${param.buyingTo};
	var fee_from = ${param.feeFrom};
	var fee_to = ${param.feeTo};
	var size_from = ${param.sizeFrom};
	var size_to = ${param.sizeTo};
		
	function getMapPosition(west,east,south,north) {
		$.ajax({
           	url: "${pageContext.request.contextPath}/main/search",
           	method: "get",
           	data: {
				"depositFrom": deposit_from,
				"depositTo": deposit_to,
				"buyingFrom": buying_from,
				"buyingTo": buying_to,
				"feeFrom": fee_from,
				"feeTo": fee_to,
				"sizeFrom": size_from,
				"sizeTo": size_to,
				"east": east,
				"west": west,
				"north": north,
				"south": south
           	},
           	success: function(req){
				//alert(east + ", " + west + ", " + north + ", " + south);
			    var total_count = ${totalCount};
				var template = Handlebars.compile($("#gallery-data").html());
				var html = template(req);
				$("#gallery-list").html(html);
				//$("#room-count").html(total_count);
				
				$(".recent-div8").click(function(e) {
					$(this).toggleClass('on off');
		        });
           	}
		});
	}
        /* kakao map API */
        $(function() {
        	/** 지도 생성하기 */
            var container = document.getElementById('map');
            var options = {
                center : new kakao.maps.LatLng(37.5642135, 126.9743207), // 지도의 중심 좌표
                level : 9,
                maxLevel : 9	// 지도 확대 레벨
			};
			var map = new kakao.maps.Map(container, options);

			
            /** 마커 클러스터러 생성하기 */
            var clusterer = new kakao.maps.MarkerClusterer({
                map : map,					// 마커들을 클러스터로 관리하고 표시할 지도 객체
                averageCenter : false,		// 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
                minLevel : 1,				// 클러스터 할 최소 지도 레벨
                disableClickZoom : true,	// 클릭 시 확대기능 해제
                styles : [ {				// calculator에 적용될 스타일
                    minWidth : '40px',
                    height : '40px',
                    padding : '5px 11px',
                    background : 'rgb(20, 118, 252)',
                    borderRadius : '40px',
                    border : '3px solid rgb(20, 118, 252)',
                    color : '#fff',
                    fontSize : '13px',
                    textAlign : 'center',
                    fontWeight : 'bold',
                    lineHeight : '24px'
                } ]
            });

            /** 매물 데이터 가져오기 */
            $.get('${pageContext.request.contextPath}/assets/roomposition',
                function(data) {
                    var markers = $(data.output).map(function(i, position) {
                        return new kakao.maps.Marker({
                            position : new kakao.maps.LatLng(position.latitude, position.longitude)
                        });
                    });

                    clusterer.setMinClusterSize(1);

                    // 지도 레벨에 따라 마커 생성/제거
                    var changeMarker = function() {
                        var level = map.getLevel();

                        if (1 <= level && level <= 7) {
                            clusterer.addMarkers(markers);
                        } else if (8 <= level && level <= 10) {
                            clusterer.removeMarkers(markers);
                        }
                    };

                    kakao.maps.event.addListener(map, 'zoom_changed', changeMarker);
                    changeMarker();

                    kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {
                        /* var markers = cluster.getMarkers();
                        for(var idx=0; idx<markers.length; idx++){
                            console.log(markers[idx].getPosition());
                            console.log(data.output.roomno);
                        } */
                        var southwest = cluster.getBounds().getSouthWest();
                        var northeast = cluster.getBounds().getNorthEast();
                        var east = northeast.getLat();
                        var west = southwest.getLat();
                        var north = northeast.getLng();
                        var south = southwest.getLng();
                        
                        getMapPosition(west,east,south,north);
                    });

			}); // end $.get(address.json)

			
            /** 서울시 구 별로 마커 생성하기 */
            $.getJSON("${pageContext.request.contextPath}/assets/guposition",
                function(data) {
                    var guPosition = data.guPositions;
                    var gumark;
                    for (var i = 0; i < guPosition.length; i++) {
                        gumark = '<div class="gu-marker" id="gu-marker' + i + '">';
                        gumark += '<div class="gu-count">' + guPosition[i].guCount + '</div>';
                        gumark += '<div class="gu-name">' + guPosition[i].guName + '</div>';
                        gumark += '<span id="lat" style="display:none;">' + guPosition[i].guLat + '</span>'; // 해당 구의 위도 저장
                        gumark += '<span id="lng" style="display:none;">' + guPosition[i].guLng + '</span>'; // 해당 구의 경도 저장
                        gumark += '</div>';
                        var customOverlay = new kakao.maps.CustomOverlay({
							position : new kakao.maps.LatLng(guPosition[i].guLat, guPosition[i].guLng),
                            clickable : false,
                            content : gumark,
                            zIndex : 3
                        });

                        customOverlay.setMap(map);

                        // 마커 클릭 시 마커를 중심으로 지도 확대 이벤트
                        $("#gu-marker" + i).click(function() {
                            var poslat = $(this).children("#lat").html();
							var poslng = $(this).children("#lng").html();
                            map.setCenter(new kakao.maps.LatLng(poslat,poslng));
                            map.setLevel(map.getLevel() - 2,{animate : true});
						});

					} // end for

                    $("#map > div > div > div > div").hover(
                        function() {$(this).css("z-index", "100");},
                        function() {$(this).css("z-index", "0");}
					); // end hover()
				});

			
            /** 검색값 가져와서 지도 위치 변경하기 */
            $("#search-form").submit(function(e) {
                e.preventDefault();

                // 장소 검색 객체 생성
                var ps = new kakao.maps.services.Places();
                // input값 가져오기
                var value = $('input[name=search]').val();

                // 키워드로 장소 검색
                ps.keywordSearch(value, placesSearchCB);

                // 키워드 검색 완료 시 호출되는 콜백함수
                function placesSearchCB(data, status, pagination) {
                    if (status === kakao.maps.services.Status.OK) {

                        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                        // LatLngBounds 객체에 좌표 추가
                        var bounds = new kakao.maps.LatLngBounds();

                        for (var i = 0; i < data.length; i++) {
                            /* displayMarker(data[i]); */
                            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
                        }

                        // 검색된 장소 위치를 기준으로 지도 범위 재설정
                        map.setBounds(bounds);
                    }
                }; // end placesSearchCB()
            }); // end submit()

            
            // 지도 확대 메서드
            function zoomIn() { map.setLevel(map.getLevel() - 1); }
            // 지도 축소 메서드
            function zoomOut() { map.setLevel(map.getLevel() + 1); }

            // 버튼 클릭과 기능 연결
            $(".zoom-in").click(function() { zoomIn(); });
            $(".zoom-out").click(function() { zoomOut(); });
            
            
            kakao.maps.event.addListener(map, 'dragend', function() {
            	var bounds = map.getBounds();
            	var southwest = bounds.getSouthWest();
                var northeast = bounds.getNorthEast();
                var east = northeast.getLat();
                var west = southwest.getLat();
                var north = northeast.getLng();
                var south = southwest.getLng();
                
                getMapPosition(west,east,south,north);
            });
            
            
            kakao.maps.event.addListener(map, 'zoom_changed', function() {
            	var bounds = map.getBounds();
            	var southwest = bounds.getSouthWest();
                var northeast = bounds.getNorthEast();
                var east = northeast.getLat();
                var west = southwest.getLat();
                var north = northeast.getLng();
                var south = southwest.getLng();
                
                getMapPosition(west,east,south,north);
            });

        });
    </script>

    <!-- 필터 -->
    <script type="text/javascript">
        /* 필터 -드롭다운 - 자동 toggle 해제 */
        $('.dropdown-menu').click(function(e) { e.stopPropagation(); })

        // 금액별로 단위 표시(만/억)를 위한 메서드
        function fix(val) {
            if (val < 10000) {
                var won = val + "만 원";
            } else if (val % 10000 == 0) {
                var won = val / 10000 + "억 원";
            } else {
                var mil = Math.floor(val / 10000);
                var won = mil + "억 " + (val - mil * 10000) + "만 원";
            }
            return won;
        } // end fix()

        /* 필터 - Range plugin(ion.rangeSlider) */
        // 보증금/전세가
        var price1_value = [ 0, 100, 200, 300, 400, 500, 1000, 1500, 2000,
        2500, 3000, 3500, 4000, 4500, 5000, 5500, 6000, 6500, 7000,
        7500, 8000, 8500, 9000, 9500, 10000, 11000, 12000, 13000,
        14000, 15000, 16000, 17000, 18000, 19000, 20000, 25000, 30000,
        35000, 40000, 45000, 50000, 55000, 60000, 65000, 70000, 75000,
        80000, 85000, 90000, 999999 ];
        var deposit_from = ${param.depositFrom};
        var deposit_to = ${param.depositTo};
        var price1_from = price1_value.indexOf(deposit_from);
        var price1_to = price1_value.indexOf(deposit_to);
        $("#slide-price1").ionRangeSlider(
        {
            type : "double",
            from : price1_from,
            to : price1_to,
            values : price1_value,
            to_min : price1_value.indexOf(100),
            from_max : price1_value.indexOf(90000),
            skin : "round",
            onStart : function(data) {
                if (deposit_from == 0 && deposit_to == 999999) {
                    $("#filter1-value").html("무제한");
                } else if (deposit_from != 0 && deposit_to == 999999) {
                    $("#filter1-value").html(
                        fix(deposit_from) + " ~ 무제한");
                } else {
                    $("#filter1-value").html(
                        fix(deposit_from) + " ~ " + fix(deposit_to));
                }
            },
            onChange : function(data) {
                if (data.from_value == 0 && data.to_value == 999999) {
                    $("#filter1-value").html("무제한");
                } else if (data.to_value == 999999) {
                    $("#filter1-value").html(
                        fix(data.from_value) + " ~ 무제한");
                } else {
                    $("#filter1-value").html(
                        fix(data.from_value) + " ~ " + fix(data.to_value));
                }
            },
            onFinish: function(data) {
                var low = data.from_value;
                var high = data.to_value;

                var feehref = '${pageContext.request.contextPath}/main/search.do?depositFrom='+low+'&depositTo='+high+'&monthFrom=${param.monthFrom}&monthTo=${param.monthTo}&buyingFrom=${param.buyingFrom}&buyingTo=${param.buyingTo}&feeFrom=${param.feeFrom}&feeTo=${param.feeTo}&sizeFrom=${param.sizeFrom}&sizeTo=${param.sizeTo}';
                location.replace(feehref);
            },
            hide_from_to : true,
            hide_min_max : true
        });
        var slide1_value = $("#slide-price1").data("ionRangeSlider");

        // 월세
        var price2_value = [ 0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60,
        65, 70, 80, 90, 100, 110, 120, 130, 140, 150, 999999 ];
        var month_from = ${param.monthFrom};
        var month_to = ${param.monthTo};
        var price2_from = price2_value.indexOf(month_from);
        var price2_to = price2_value.indexOf(month_to);
        $("#slide-price2").ionRangeSlider(
        {
            type : "double",
            from : price2_from,
            to : price2_to,
            values : price2_value,
            to_min : price2_value.indexOf(5),
            from_max : price2_value.indexOf(150),
            skin : "round",
            onStart : function(data) {
                if (month_from == 0 && month_to == 999999) {
                    $("#filter2-value").html("무제한");
                } else if (month_from != 0 && month_to == 999999) {
                    $("#filter2-value").html(month_from + "만 원 ~ 무제한");
                } else {
                    $("#filter2-value").html(month_from + "만 원 ~" + month_to + "만 원");
                }
            },
            onChange : function(data) {
                if (data.from_value == 0 && data.to_value == 999999) {
                    $("#filter2-value").html("무제한");
                } else if (data.from_value != 0 && data.to_value == 999999) {
                    $("#filter2-value").html(data.from_value + "만 원 ~ 무제한");
                } else {
                    $("#filter2-value").html(data.from_value + "만 원 ~" + data.to_value + "만 원");
                }
            },
            onFinish: function(data) {
                var low = data.from_value;
                var high = data.to_value;
                
                var sizehref = '${pageContext.request.contextPath}/main/search.do?depositFrom=${param.depositFrom}&depositTo=${param.depositTo}&monthFrom='+low+'&monthTo='+high+'&buyingFrom=${param.buyingFrom}&buyingTo=${param.buyingTo}&feeFrom=${param.feeFrom}&feeTo=${param.feeTo}&sizeFrom=${param.sizeFrom}&sizeTo=${param.sizeTo}';
                location.replace(sizehref);
            },
            hide_from_to : true,
            hide_min_max : true
        });
        var slide2_value = $("#slide-price2").data("ionRangeSlider");

        // 매매가
        var price3_value = [ 0, 3000, 5000, 10000, 15000, 20000, 25000, 30000,
        35000, 40000, 45000, 50000, 60000, 70000, 80000, 90000, 100000,
        110000, 120000, 130000, 140000, 150000, 999999 ];
        var buying_from = ${param.buyingFrom};
        var buying_to = ${param.buyingTo};
        var price3_from = price3_value.indexOf(buying_from);
        var price3_to = price3_value.indexOf(buying_to);
        $("#slide-price3").ionRangeSlider(
        {
            type : "double",
            from : price3_from,
            to : price3_to,
            values : price3_value,
            to_min : price3_value.indexOf(3000),
            from_max : price3_value.indexOf(150000),
            skin : "round",
            onStart : function(data) {
                if (buying_from == 0 && buying_to == 999999) {
                    $("#filter3-value").html("무제한");
                } else if (buying_from != 0 && buying_to == 999999) {
                    $("#filter3-value").html(
                        fix(buying_from) + " ~ 무제한");
                } else {
                    $("#filter3-value").html(
                        fix(buying_from) + " ~ " + fix(buying_to));
                }
            },
            onChange : function(data) {
                if (data.from_value == 0 && data.to_value == 999999) {
                    $("#filter3-value").html("무제한");
                } else if (data.from_value != 0 && data.to_value == 999999) {
                    $("#filter3-value").html(
                        fix(data.from_value) + " ~ 무제한");
                } else {
                    $("#filter3-value").html(
                        fix(data.from_value) + " ~ " + fix(data.to_value));
                }
            },
            onFinish: function(data) {
                var low = data.from_value;
                var high = data.to_value;

                var feehref = '${pageContext.request.contextPath}/main/search.do?depositFrom=${param.depositFrom}&depositTo=${param.depositTo}&monthFrom=${param.monthFrom}&monthTo=${param.monthTo}&buyingFrom='+low+'&buyingTo='+high+'&feeFrom=${param.feeFrom}&feeTo=${param.feeTo}&sizeFrom=${param.sizeFrom}&sizeTo=${param.sizeTo}';
                location.replace(feehref);
            },
            hide_from_to : true,
            hide_min_max : true
        });
        var slide3_value = $("#slide-price3").data("ionRangeSlider");

        // 관리비
        var price4_value = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14,
        15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
        31, 32, 33, 34, 35, 36, 38, 40, 42, 44, 46, 48, 50, 999999 ];
        var fee_from = ${param.feeFrom};
        var fee_to = ${param.feeTo};
        var price4_from = price4_value.indexOf(fee_from);
        var price4_to = price4_value.indexOf(fee_to);
        $("#slide-price4").ionRangeSlider(
        {
            type : "double",
            from : price4_from,
            to : price4_to,
            values : price4_value,
            to_min : price4_value.indexOf(1),
            from_max : price4_value.indexOf(50),
            skin : "round",
            onStart : function(data) {
                if (fee_from == 0 && fee_to == 999999) {
                    $("#filter4-value").html("무제한");
                } else if (fee_from != 0 && fee_to == 999999) {
                    $("#filter4-value").html(fee_from + "만 원 ~ 무제한");
                } else {
                    $("#filter4-value").html(fee_from + "만 원 ~" + fee_to + "만 원");
                }
            },
            onChange : function(data) {
                if (data.from_value == 0 && data.to_value == 999999) {
                    $("#filter4-value").html("무제한");
                } else if (data.from_value != 0 && data.to_value == 999999) {
                    $("#filter4-value").html(data.from_value + "만 원 ~ 무제한");
                } else {
                    $("#filter4-value").html(data.from_value + "만 원 ~" + data.to_value + "만 원");
                }
            },
            onFinish: function(data) {
                var low = data.from_value;
                var high = data.to_value;

                var feehref = '${pageContext.request.contextPath}/main/search.do?depositFrom=${param.depositFrom}&depositTo=${param.depositTo}&monthFrom=${param.monthFrom}&monthTo=${param.monthTo}&buyingFrom=${param.buyingFrom}&buyingTo=${param.buyingTo}&feeFrom='+low+'&feeTo='+high + '&sizeFrom=${param.sizeFrom}&sizeTo=${param.sizeTo}';
                location.replace(feehref);
            },
            hide_from_to : true,
            hide_min_max : true
        });

        // 방크기
        var size_from = ${param.sizeFrom};
        var size_to = ${param.sizeTo};
        $("#slide-size").ionRangeSlider(
        {
            type : "double",
            min : 0,
            max : 115,
            step : 1,
            from : size_from,
            to : size_to,
            to_min : 1,
            from_max : 114,
            skin : "round",
            onStart : function(data) {
                var from_p = size_from / 3.3;
                var to_p = size_to / 3.3;
                if (size_from == 0 && size_to == 999999) {
                    $("#filter5-value").html("무제한");
                } else if (size_from != 0 && size_to == 999999) {
                    $("#filter5-value").html(
                        size_from + "㎡(" + Math.floor(from_p) + "평) ~ 무제한");
                } else {
                    $("#filter5-value").html(
                        size_from + "㎡(" + Math.floor(from_p) + "평) ~ " + size_to + "㎡(" + Math.floor(to_p) + "평)");
                }
            },
            onChange : function(data) {
                var from_p = data.from / 3.3;
                var to_p = data.to / 3.3;
                if (data.from == 0 && data.to == 115) {
                    $("#filter5-value").html("무제한");
                } else if (data.from_value != 0 && data.to == 115) {
                    $("#filter5-value").html(
                        data.from + "㎡(" + Math.floor(from_p) + "평) ~ 무제한");
                } else {
                    $("#filter5-value").html(
                        data.from + "㎡(" + Math.floor(from_p) + "평) ~ " + data.to + "㎡(" + Math.floor(to_p) + "평)");
                }
            },
            onFinish: function(data) {
                var low = data.from;
                var high = data.to;
                
                if(high == 115) {
                    high = 999999;
                }

                var sizehref = '${pageContext.request.contextPath}/main/search.do?depositFrom=${param.depositFrom}&depositTo=${param.depositTo}&monthFrom=${param.monthFrom}&monthTo=${param.monthTo}&buyingFrom=${param.buyingFrom}&buyingTo=${param.buyingTo}&feeFrom=${param.feeFrom}&feeTo=${param.feeTo}&sizeFrom='+low+'&sizeTo='+high;
                location.replace(sizehref);

            },
            hide_from_to : true,
            hide_min_max : true
        });
        var slide5_value = $("#slide-size").data("ionRangeSlider");

        // 체크박스 클릭 시 드롭다운 버튼 내용 변경 ***추후 구현
        /* var getCheck = $("input[type='checkbox']");

        var rt = $("input[name='room-type']").map(function() {return this.value;}).get().join(",");
        rt = rt.replace("oneroom", "원룸").replace("tworoom", "투·쓰리룸").replace("officetel", "오피스텔");
        $(".btn-rt").html(rt + " <span class='caret'></span>"); */
        /* $("#room-type label").click(function() {
            var rt = $("input[name='room-type']").map(function() {return this.value;}).get().join(",");
            rt = rt.replace("oneroom", "원룸").replace("tworoom", "투·쓰리룸").replace("officetel", "오피스텔");
            $(".btn-rt").html(rt + " <span class='caret'></span>");
        }); */
        /* $(function(){
            $("#room-type").on("change", "input:checkbox", function(e){
                e.preventDefault();
                $("#room-type").submit();
            });
        }); */

        // 필터 초기화
        $(function() {
            // 가격대 조건삭제
            $("#filter-reset1").click(function(e) {
                e.preventDefault();
                var pricehref = '${pageContext.request.contextPath}/main/search.do?depositFrom=0&depositTo=999999&monthFrom=0&monthTo=999999&buyingFrom=0&buyingTo=999999&feeFrom=${param.feeFrom}&feeTo=${param.feeTo}&sizeFrom=${param.sizeFrom}&sizeTo=${param.sizeTo}';
                location.replace(pricehref);
            })

            // 관리비 조건삭제
            $("#filter-reset2").click(function(e) {
                e.preventDefault();
                /* slide4_value.reset();
                $("#filter4-value").html("무제한"); */
                var feehref = '${pageContext.request.contextPath}/main/search.do?depositFrom=${param.depositFrom}&depositTo=${param.depositTo}&monthFrom=${param.monthFrom}&monthTo=${param.monthTo}&buyingFrom=${param.buyingFrom}&buyingTo=${param.buyingTo}&feeFrom=0&feeTo=999999&sizeFrom=${param.sizeFrom}&sizeTo=${param.sizeTo}';
                location.replace(feehref);
            })

            // 방크기 조건삭제
            $("#filter-reset3").click(function(e) {
                e.preventDefault();
                var sizehref = '${pageContext.request.contextPath}/main/search.do?depositFrom=${param.depositFrom}&depositTo=${param.depositTo}&monthFrom=${param.monthFrom}&monthTo=${param.monthTo}&buyingFrom=${param.buyingFrom}&buyingTo=${param.buyingTo}&feeFrom=${param.feeFrom}&feeTo=${param.feeTo}&sizeFrom=0&sizeTo=999999';
                location.replace(sizehref);
            })

            // 전체 필터 초기화
            $("#filters-reset").click(function(e) {
                e.preventDefault();
                $("input[type='checkbox']").prop('checked', true);
                var resetUrl = "${pageContext.request.contextPath}/main/search.do?depositFrom=0&depositTo=999999&monthFrom=0&monthTo=999999&buyingFrom=0&buyingTo=999999&feeFrom=0&feeTo=999999&sizeFrom=0&sizeTo=999999";
                location.replace(resetUrl);
            });


            var checkboxValues = $("input[name='sale-type']:checked");
            var ccc = checkboxValues.map(function() {return this.value;}).get().join(",");

        })
    </script>
</body>
</html>