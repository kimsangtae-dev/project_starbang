<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<%@ include file="../assets/inc/meta.jsp"%>

<!-- css 적용 -->
<link rel="stylesheet" type="text/css" href="../assets/header_white.css" />
<link rel="stylesheet" type="text/css" href="../assets/footer_black.css" />
<link rel="stylesheet" type="text/css" href="ma_assets/ma_wish.css">
<link rel="stylesheet" type="text/css" href="ma_assets/ma_wish_comp.css" />

</head>
<body>

<!----------------------------------------
-	header 							     -
----------------------------------------->
<%@ include file="./ma_assets/ma_inc/top.jsp"%>

<!----------------------------------------
-	content 							 -
----------------------------------------->

<!-- content - title -->
	<h1 class="content1-title">관심목록</h1>
	
	<!-- content-navigation -->
	<div class="content2-d">
		<a class="content2-d-a" href="ma_rtrm.jsp" aria-current="">최근 본 방</a>
		<a class="content2-d-a active" href="#">찜한 방</a>
	</div>


	<!-----------------------------------
	|   content-gallery
	------------------------------------>
	<!--본문영역시작 gallery 시작 -->
	<div class="gallery-wholebox">

		<!-- 총 카운트 count -->
		<p class="count-p">총 <span>8개</span>의 찜한 방이 있습니다</p>   

	<!-- 메인 갤러리 시작 -->
	<ul class="gallery-ul">

		<!-- li 하나당 한개의 매물 - 외부박스 -->
		<li class="gallery-li">
			<!-- 내부박스 거래 완료되었을 때 덮는 박스( 완료된 방은 하트가 없다.) -->
			<div class="complete-whcover">
				<div class="complete-smcover" height="186">
					<h1 class="complete-h1">비공개</h1>
					<p class="complete-p">아쉽게도 조금 늦었네요!</p>
					<p class="complete-p">비슷한 방을 확인해보세요</p>
					<div class="complete-plusbtn"></div>
				</div>
			</div>
			<!-- 거래완료시 덮는박스 끝 -->

			<!-- 원래 매물 -->
			<div class="gallery-d1" height="321">
				<a target="_blank" rel="noopener noreferrer" class="gallery-d1-a" href="ma_rmdt.jsp">
					<div class="gallery-d2-pic"></div>
					<div class="gallery-d2-confirm">
						<div class="gallery-d3-confirm" type="confirm">
							<span>확인매물</span>
							<font>19.09.16</font>
						</div>
					</div>
					<p class="gallery-p1 gallery-p-common">원룸</p>
					<p class="gallery-p2 gallery-p-common">
						<span>전세 1억</span>
					</p>
					<p class="gallery-p-common">1층, 23.14m², 관리비 7만</p>
					<p class="gallery-p-common">🌟🍀🎊✌//love//신축 첫입주 원룸</p>
				</a>
			</div>
		</li>

		<!-- 마진을 포함한 매물 하나의 전체박스 -->
		<li class="gallery-li">

			<!-- 마진을 포함하지 않은 전체박스 -->
			<div class="gallery-d1" height="321">

				<!-- 하트 -->
				<div class="gallery-heart-d2">
					<div class="gallery-heart-d3"></div>
				</div>

				<!-- 전체클릭 가능하도록 만드는 a태그 -->
				<a target="_blank" rel="noopener noreferrer" class="gallery-d1-a" href="ma_rmdt.jsp">
					<div class="gallery-d2-pic"></div>
					<div class="gallery-d2-conform">
						<div class="gallery-d3-confirm" type="confirm">
							<span>확인매물</span>
							<font>19.10.11</font>
						</div>
					</div>
					<p class="gallery-p-common gallery-p1">쓰리룸</p>
					<p class="gallery-p-common gallery-p1">
						<span class="gallery-p2">전세 1억1000</span>
					</p>
					<p class="gallery-p-common">3층, 82.5m², 관리비 5만</p>
					<p class="gallery-p-common">🆕 🌸 신규 🌸  향남 2지구 신축급 깨끗하고 입지 최상 쓰리룸 전세 ♡</p>
				</a>
			</div>
		</li>


		<!-- 하나의 매물 시작 -->
		<li class="gallery-li">

			<!-- 완료된 매물 덮개 -->
			<div class="complete-whcover">
				<div class="complete-smcover">
					<h1 class="complete-h1">거래완료</h1>
					<p class="complete-p">아쉽게도 조금 늦었네요!</p>
					<p class="complete-p">비슷한 방을 확인해보세요</p>
					<div class="complete-plusbtn"></div>
				</div>
			</div>
			<!-- 완료된 매물 덮개 끝 -->

			<!-- 원래 매물 -->
			<div class="gallery-d1" height="321">
				<a target="_blank" rel="noopener noreferrer" class="gallery-d1-a" href="ma_rmdt.jsp">
					<div class="gallery-d2-pic"></div>
					<p class="gallery-p1 gallery-p-common">투룸</p>
					<p class="gallery-p2 gallery-p-common">
						<span>월세 2000/60</span>
					</p>
					<p class="gallery-p-common">5층, 49.5m², 관리비 1만</p>
					<p class="gallery-p-common">🔷실보유금 1500만🔷 통베란다+ 1.5룸 등촌역초역세권 정남향[보증금조절가능]🔷</p>
				</a>
			</div>
		</li>

		<!-- 마진을 포함한 매물 하나의 전체박스 -->
		<li class="gallery-li">

			<!-- 마진을 포함하지 않은 전체박스 -->
			<div class="gallery-d1" height="321">

				<!-- 하트 -->
				<div class="gallery-heart-d2">
					<div class="gallery-heart-d3"></div>
				</div>

				<!-- 전체클릭 가능하도록 만드는 a태그 -->
				<a target="_blank" rel="noopener noreferrer" class="gallery-d1-a" href="ma_rmdt.jsp">
					<div class="gallery-d2-pic"></div>
					<div class="gallery-d2-conform">
						<div class="gallery-d3-confirm" type="confirm">
							<span>확인매물</span>
							<font>19.10.11</font>
						</div>
					</div>
					<p class="gallery-p1 gallery-p-common">쓰리룸</p>
					<p class="gallery-p2 gallery-p-common">
						<span>전세 1억1000</span>
					</p>
					<p class="gallery-p-common">3층, 82.5m², 관리비 5만</p>
					<p class="gallery-p-common">🆕 🌸 신규 🌸  향남 2지구 신축급 깨끗하고 입지 최상 쓰리룸 전세 ♡</p>
				</a>
			</div>
		</li>

		<!-- 마진을 포함한 매물 하나의 전체박스 -->
		<li class="gallery-li">

			<!-- 마진을 포함하지 않은 전체박스 -->
			<div class="gallery-d1" height="321">

				<!-- 하트 -->
				<div class="gallery-heart-d2">
					<div class="gallery-heart-d3"></div>
				</div>

				<!-- 전체클릭 가능하도록 만드는 a태그 -->
				<a target="_blank" rel="noopener noreferrer" class="gallery-d1-a" href="ma_rmdt.jsp">
					<div class="gallery-d2-pic"></div>
					<div class="gallery-d2-conform">
						<div class="gallery-d3-confirm" type="confirm">
							<span>확인매물</span>
							<font>19.10.11</font>
						</div>
					</div>
					<p class="gallery-p-common gallery-p1">쓰리룸</p>
					<p class="gallery-p-common gallery-p1">
						<span class="gallery-p2">전세 1억1000</span>
					</p>
					<p class="gallery-p-common">3층, 82.5m², 관리비 5만</p>
					<p class="gallery-p-common">🆕 🌸 신규 🌸  향남 2지구 신축급 깨끗하고 입지 최상 쓰리룸 전세 ♡</p>
				</a>
			</div>
		</li>

		<!-- 마진을 포함한 매물 하나의 전체박스 -->
		<li class="gallery-li">

			<!-- 마진을 포함하지 않은 전체박스 -->
			<div class="gallery-d1" height="321">

				<!-- 하트 -->
				<div class="gallery-heart-d2">
					<div class="gallery-heart-d3"></div>
				</div>

				<!-- 전체클릭 가능하도록 만드는 a태그 -->
				<a target="_blank" rel="noopener noreferrer" class="gallery-d1-a" href="ma_rmdt.jsp">
					<div class="gallery-d2-pic"></div>
					<div class="gallery-d2-conform">
						<div class="gallery-d3-confirm" type="confirm">
							<span>확인매물</span>
							<font>19.10.11</font>
						</div>
					</div>
					<p class="gallery-p-common gallery-p1">쓰리룸</p>
					<p class="gallery-p-common gallery-p1">
						<span class="gallery-p2">전세 1억1000</span>
					</p>
					<p class="gallery-p-common">3층, 82.5m², 관리비 5만</p>
					<p class="gallery-p-common">🆕 🌸 신규 🌸  향남 2지구 신축급 깨끗하고 입지 최상 쓰리룸 전세 ♡</p>
				</a>
			</div>
		</li>

		<!-- 마진을 포함한 매물 하나의 전체박스 -->
		<li class="gallery-li">

			<!-- 마진을 포함하지 않은 전체박스 -->
			<div class="gallery-d1" height="321">

				<!-- 하트 -->
				<div class="gallery-heart-d2">
					<div class="gallery-heart-d3"></div>
				</div>

				<!-- 전체클릭 가능하도록 만드는 a태그 -->
				<a target="_blank" rel="noopener noreferrer" class="gallery-d1-a" href="ma_rmdt.jsp">
					<div class="gallery-d2-pic"></div>
					<div class="gallery-d2-conform">
						<div class="gallery-d3-confirm" type="confirm">
							<span>확인매물</span>
							<font>19.10.11</font>
						</div>
					</div>
					<p class="gallery-p-common gallery-p1">쓰리룸</p>
					<p class="gallery-p-common gallery-p1">
						<span class="gallery-p2">전세 1억1000</span>
					</p>
					<p class="gallery-p-common">3층, 82.5m², 관리비 5만</p>
					<p class="gallery-p-common">🆕 🌸 신규 🌸  향남 2지구 신축급 깨끗하고 입지 최상 쓰리룸 전세 ♡</p>
				</a>
			</div>
		</li>

		<!-- 마진을 포함한 매물 하나의 전체박스 -->
		<li class="gallery-li">

			<!-- 마진을 포함하지 않은 전체박스 -->
			<div class="gallery-d1" height="321">

				<!-- 하트 -->
				<div class="gallery-heart-d2">
					<div class="gallery-heart-d3"></div>
				</div>

				<!-- 전체클릭 가능하도록 만드는 a태그 -->
				<a target="_blank" rel="noopener noreferrer" class="gallery-d1-a" href="ma_rmdt.jsp">
					<div class="gallery-d2-pic"></div>
					<div class="gallery-d2-conform">
						<div class="gallery-d3-confirm" type="confirm">
							<span>확인매물</span>
							<font>19.10.11</font>
						</div>
					</div>
					<p class="gallery-p-common gallery-p1">쓰리룸</p>
					<p class="gallery-p-common gallery-p1">
						<span class="gallery-p2">전세 1억1000</span>
					</p>
					<p class="gallery-p-common">3층, 82.5m², 관리비 5만</p>
					<p class="gallery-p-common">🆕 🌸 신규 🌸  향남 2지구 신축급 깨끗하고 입지 최상 쓰리룸 전세 ♡</p>
				</a>
			</div>
		</li>




	</ul>
	<!-- ul 끝 -->


	<!-- 갤러리 쪽번호 시작 -->
	<div class="page-d1">
		<div class="page-d2">
			<div class="page-d3">
				<button class="page-d3-btn1">
					<svg width="12" height="12" viewBox="0 0 512 512">
						<path d="m380 439l-201-179 201-180c11-7 11-21 0-32-7-11-18-11-29-4l-219 197c-4 4-8 11-8 19 0 7 4 11 8 18l219 197c11 8 22 8 33 0 7-14 7-29-4-36z" transform="scale(1 1)"></path>
					</svg>
				</button>
				<ul class="page-d3-ul">
					<li>
						<a class="page-ul-a-clicked">1</a>
					</li>
					<li>
						<a class="page-ul-a-unclicked">2</a>
					</li>
				</ul>
				<button class="page-d3-btn2">
					<svg width="12" height="12" viewBox="0 0 512 512">
						<path d="m132 80l201 180-201 179c-11 7-11 22 0 33 7 11 22 11 33 0l219-198c4-3 7-11 7-18 0-7-3-11-7-18l-219-198c-11-3-26-3-33 8-11 7-11 21 0 32z" transform="scale(1 1)"></path>
					</svg>
				</button>
			</div>
		</div>
	</div>
<!-- 갤러리 쪽번호 끝 -->



	<!-----------------------------------
	|   content-compare bar
	------------------------------------>

	<!-- 비교하기버튼 -->
	<button class="btn-compare">방 비교하기</button>

	<!-- 비교하기 바 -->
	<div class="compare-d1" style="right: 0px; bottom: 0px;"> 
		<div class="compare-d2">
			
			<div class="compare-exp-d3" width="213">
				<p class="compare-exp-p1">방 비교하기</p>
				<p class="compare-exp-p2" size="13">최대 3개까지 비교할 수 있습니다.</p>
			</div>
			
			<div class="compare-select">
				<div class="compare-select-d">
					<svg width="30" height="30" viewBox="0 0 32 32">
						<g fill="none" fill-rule="evenodd">
							<path stroke="#FFF" stroke-dasharray="2" d="M16 31c8.284 0 15-6.716 15-15 0-8.284-6.716-15-15-15C7.716 1 1 7.716 1 16c0 8.284 6.716 15 15 15z" opacity=".5"></path>
							<text fill="#FFF" font-family="Noto Sans KR" font-size="15" font-weight="700" transform="translate(1 1)">
								<tspan x="11" y="20.2">1</tspan>
							</text>
						</g>
					</svg>
				</div>
				<p class="compare-select-p">비교할 방을 선택해주세요</p>
			</div>
			
			<div class="compare-select">
				<div class="compare-select-d">
					<svg width="30" height="30" viewBox="0 0 32 32">
						<g fill="none" fill-rule="evenodd">
							<path stroke="#FFF" stroke-dasharray="2" d="M16 31c8.284 0 15-6.716 15-15 0-8.284-6.716-15-15-15C7.716 1 1 7.716 1 16c0 8.284 6.716 15 15 15z" opacity=".5"></path>
							<text fill="#FFF" font-family="Noto Sans KR" font-size="15" font-weight="700" transform="translate(1 1)">
								<tspan x="11" y="20.2">2</tspan>
							</text>
						</g>
					</svg>
				</div>
				<p class="compare-select-p">비교할 방을 선택해주세요</p>
			</div>
			
			<div class="compare-select">
				<div class="compare-select-d">
					<svg width="30" height="30" viewBox="0 0 32 32">
						<g fill="none" fill-rule="evenodd">
							<path stroke="#FFF" stroke-dasharray="2" d="M16 31c8.284 0 15-6.716 15-15 0-8.284-6.716-15-15-15C7.716 1 1 7.716 1 16c0 8.284 6.716 15 15 15z" opacity=".5"></path>
							<text fill="#FFF" font-family="Noto Sans KR" font-size="15" font-weight="700" transform="translate(1 1)">
								<tspan x="11" y="20.2">3</tspan>
							</text>
						</g>
					</svg>
				</div>
				<p class="compare-select-p">비교할 방을 선택해주세요</p>
			</div>
			
			<div class="compare-btn-box" width="238">
					<button class="compare-btn-cancel" width="80">취소</button>
				<a href="ma_wish_comp.jsp" data-toggle="modal" data-target="#myModal">
					<button class="compare-btn-compare"><!-- disabled="" -->비교하기</button>
				</a>
			</div>

		</div>
	</div>

	

</div>
<!-- 갤러리 끝 -->





<!----------------------------------------
-	footer 							     -
----------------------------------------->
<%@ include file="./ma_assets/ma_inc/bottom.jsp"%>


<script src="../assets/js/jquery-1.10.2.min.js"></script>
<script src="../assets/js/bootstrap.min.js"></script>
<script>
	$(function() {
		$(".compare-btn-compare").click(function(){
			var atag = '<a href="ma_wish_comp.html" data-toggle="modal" data-target="#myModal"></a>'
			$(this).(atag)
		});
	});


</script>
</body>
</html>