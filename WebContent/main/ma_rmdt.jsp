<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../assets/inc/meta.jsp"%>
<link rel="stylesheet" type="text/css"
	href="../main/ma_assets/billboard.min.css" />
<link rel="stylesheet" type="text/css"
	href="../main/ma_assets/ma_rmdt.css" />
<link rel="stylesheet" type="text/css"
	href="../assets/plugin/sweetalert/sweetalert2.css" />

</head>

<body>
	<!-- 상단 헤더 -->
	<%@ include file="./ma_assets/ma_inc/top.jsp"%>
	<!--별방 방찾기 상세페이지 헤더 시작-->
	<!--스크롤 발생 시 움직이는 파란색바 시작-->
	<div id="bluebar">
		<div id="lol">
			<h1 class="textht pull-left texthth1">월세 200/30</h1>
			<div class="recent-div8 on" data-value="off"></div>
			<span>0</span> <span
				class="glyphicon glyphicon glyphicon-link textht3"></span> <a
				href="#"><span
				class="nowqt glyphicon glyphicon glyphicon-bullhorn"></span></a>
			<div id="plrt">
				<button type="submit" class="textht inbl">
					<span class="quest">문의하기</span>
				</button>
				<span class="textht skyblue lvc"> 조수민님</span> <span
					class="texthtlvc">방주인</span>
			</div>
		</div>
	</div>
	<!--스크롤 발생 시 움직이는 파란색바 끝-->
	<!--별방 방찾기 헤더 끝-->
	<!-- 중앙 영역 -->
	<div id="content">
		<!-- 전체 면적 설정 -->
		<div id="summury">
			<!--상단 내용 시작-->
			<ul id="box1">
				<li class="pull-left abc"><span class="greyfont1">매물종류(원룸)</span>
					<h1 class="monthman">
						월세 3000/55<span class="greyfontwon1">만원</span>
					</h1></li>
				<li class="pull-left abc" id="month"><span class="greyfont1">전용면적</span>
					<h1 id="chnum">43.33<span>㎡</span></h1>
					<button type="button" class="chbt">
						<span class="glyphicon glyphicon-refresh">평</span>
					</button></li>
				<li class="pull-right">
					<!--방주인 이메일보기-->
					<p class="honame">방주인 조수민님</p>
					<button type="button" class="btn btn-primary grml">
						<span class="glyphicon glyphicon-envelope">문의하기</span>
					</button>
				</li>
			</ul>
		</div>
		<!--상단 내용 끝-->
		<div id="iconlist">
			<!--찜,이메일,공유,허위매물신고 시작-->
			<div class="recent-div9 off" data-value="on"></div>
			<span id="lkct">1</span>
			<span class="glyphicon glyphicon glyphicon-stop"></span> <a href="#"><span
				class="glyphicon glyphicon glyphicon-link"></span></a> <span
				class="glyphicon glyphicon glyphicon-stop"></span> <a href="#"><span
				class="glyphicon glyphicon glyphicon-bullhorn"></span></a> <span
				class="greyfontnm1">허위매물신고</span>
		</div>
		<!--찜,이메일,공유,허위매물신고 끝-->
		<div id="confirm room">
			<!--확인매물 푸른색바 시작-->
			<div class="eTgAil confirm">
				<p class="gknGpv onfirm">
					확인매물<span>19.09.18</span>
				</p>
				<p class="cETKtB">
					<span class="confirmsm">방주인과 공인중개사가 거래정보를 확인한 매물입니다.</span>
					<button class="mola">
						<img src="ma_assets/ma_img/confirmq.png">
					</button>
				</p>
			</div>
		</div>
		<!--확인매물 푸른색바 끝-->
		<div id="summury-option">
			<!--방등록시 상세 옵션값들 시작-->
			<ul class="iuNQqL clearfix" id="list">
				<li class="gWdVQs">
					<p class=" gPsGgb">해당층/건물층</p>
					<div class="gbAeEp">5층 / 6층</div>
				</li>
				<li class="gWdVQs">
					<p class=" gPsGgb">전용/공급면적</p>
					<div class="gbAeEp"></div> <span>26.44 / 33.05㎡</span>
					<button type="button" class="bHPFKV">
						<span class="glyphicon glyphicon-refresh">평</span>
					</button>
				<li class="gWdVQs">
					<p class=" gPsGgb">난방종류</p>
					<div class="gbAeEp">개별난방</div>
				</li>
				<li class="gWdVQs">
					<p class=" gPsGgb">빌트인</p>
					<div class="gbAeEp">아님</div>
				</li>
				<li class="gWdVQs">
					<p class=" gPsGgb">엘리베이터</p>
					<div class="gbAeEp">있음</div>
				</li>
				<li class="gWdVQs">
					<p class=" gPsGgb">반려동물</p>
					<div class="gbAeEp">가능</div>
				</li>
				<li class="gWdVQs">
					<p class=" gPsGgb">베란다/발코니</p>
					<div class="gbAeEp">없음</div>
				</li>
				<li class="gWdVQs">
					<p class=" gPsGgb">전세자금대출</p>
					<div class="gbAeEp">가능</div>
				</li>
				<li class="gWdVQs">
					<p class=" gPsGgb">입주가능일</p>
					<div class="gbAeEp">즉시 입주</div>
				</li>
				<li></li>
				<li></li>
				<li></li>
			</ul>
		</div>
		<!--방등록시 상세 옵션값들 끝-->
		<div id="bigview">
			<!--매물 이미지 시작-->
			<ul class="bigviewul">
				<li class="bigviewigli"><a href="#"><img
						src="../main/ma_assets/ma_img/roph01.jfif" /></a></li>
				<li class="bigviewiglism"><a href="#"><img
						src="../main/ma_assets/ma_img/roph02.jfif" /></a></li>
				<li class="bigviewiglism"><a href="#"><img
						src="../main/ma_assets/ma_img/roph03.jfif" /></a></li>
				<li class="bigviewiglism"><a href="#"><img
						src="../main/ma_assets/ma_img/roph04.jfif" /></a></li>
				<li class="bigviewiglism"><a href="#"><img
						src="../main/ma_assets/ma_img/roph04.jfif" /></a></li>
			</ul>
		</div>

		<div id="explanall">
			<!--사용자 매물 설명 시작-->
			<div id="bigexplan">
				<div class="explan1">중동역 인근. 방욕실베란다3. 단독세대. 주인분이 깔끔하게 관리.</div>
			</div>
			<!--매물 설명 큰 폰트-->
			<div id="smallexplan">
				<div class="explan-off" data-value="explan-on">
					<div>
						<span class="smexp"> ※해당매물은 직접 현장 답사하여 찍은 100% 실제 사진과
							모습입니다※<br /> <br /> ※낚시성 매물로 손님들을 현혹하지 않습니다<br /> <br /> ※부동산
							어플에 허위매물이 절반이상입니다. 말도 안되게 저렴한매물에 속지마세요<br /> <br /> ※진실된
							정보만(ONLY FACT) 제공하겠습니다<br /> <br /> ※해당매물은 직접 현장 답사하여 찍은 100%
							실제 사진과 모습입니다※<br /> <br /> ※낚시성 매물로 손님들을 현혹하지 않습니다<br /> <br />
							※부동산 어플에 허위매물이 절반이상입니다. 말도 안되게 저렴한매물에 속지마세요<br /> <br /> ※진실된
							정보만(ONLY FACT) 제공하겠습니다<br /> <br /> ※해당매물은 직접 현장 답사하여 찍은 100%
							실제 사진과 모습입니다※<br /> <br /> ※낚시성 매물로 손님들을 현혹하지 않습니다<br /> <br />
							※부동산 어플에 허위매물이 절반이상입니다. 말도 안되게 저렴한매물에 속지마세요<br /> <br /> ※진실된
							정보만(ONLY FACT) 제공하겠습니다<br /> <br />
						</span>
					</div>
				</div>
				<button class="jQYbpN more">상세설명 더보기</button>
			</div>
			<!--매물 설명 작은 폰트-->
		</div>
		<!--사용자 매물 설명 끝-->
		<div id="smhead">
			<div class="xOEdU">
				<a class="eYDrrB" href="#rader">다방면 스코어</a> <a class="eYDrrB"
					href="#priceinfo">가격정보</a> <a class="eYDrrB" href="#pictogram">옵션</a>
				<a class="eYDrrB" href="#location">위치</a>
				<!-- <a class="eYDrrB">인기매물</a> -->
			</div>
		</div>
		<!-- 파란색 헤더바 여기서 부터 시작 -->
		<div id="radar">
			<!-- 다방면 스코어 시작-->
			<div class="jFMhNO kBQneM">
				<h1 class="dbrfvk kBQneM">다방면 스코어</h1>
				<div class="fCword">
					<h1>
						75.5<span>점</span>
					</h1>
					<p>가격대비 괜찮은 방!</p>
				</div>
				<div id="radarChart"></div>
			</div>
		</div>
	</div>
	<!--다방면스코어 끝-->
	<div id="priceinfo" class="jFMhNO kBQneM">
		<!--가격정보 시작-->
		<h1 class="GYLAC">가격정보</h1>
		<div class="taln">
			<!-- 표 영역 -->
			<table class="tabdln">
				<!-- 제목 영역 -->
				<thead class="bdlnthd">
					<tr class="bdlntr">
						<th class="bdlnth">월세</th>
						<th class="bdlnth">전세</th>
						<th class="bdlnth">관리비</th>
						<th class="bdlnth">주차비</th>
						<th class="bdlnth">단기임대</th>
					</tr>
				</thead>
				<!-- 본문 영역 -->
				<tbody class="bdlntdy">
					<tr class="bdlnbtr">
						<td class="bdlntd">-</td>
						<td class="bdlntd">9500만원</td>
						<td class="bdlntd">7만원</td>
						<td class="bdlntd">10만원</td>
						<td class="bdlntd">불가능</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<!--가격정보 끝 -->
	<div id="pictogram" class="jFMhNO kBQneM">
		<!--상세 옵션들 아이콘으로 보여줌 시작-->
		<h1 class="GYLAC">옵션</h1>

		<div class="dDctva">
			<div class="gqtsIc">
				<div class="dNeTFF"></div>
				<p>에어컨</p>
			</div>
			<div class="gqtsIc">
				<div class="bisIQz"></div>
				<p>세탁기</p>
			</div>
			<div class="gqtsIc">
				<div class="ecqNej"></div>
				<p>옷장</p>
			</div>
			<div class="gqtsIc">
				<div class="gdTorF"></div>
				<p>TV</p>
			</div>
			<div class="gqtsIc">
				<div class="fuJjGK"></div>
				<p>신발장</p>
			</div>
			<div class="gqtsIc">
				<div class="gdMhEY"></div>
				<p>냉장고</p>
			</div>
			<div class="gqtsIc">
				<div class="dQLnLP"></div>
				<p>가스레인지</p>
			</div>
			<div class="gqtsIc">
				<div class="krFgu"></div>
				<p>인덕션</p>
			</div>
			<div class="gqtsIc">
				<div class="cnLAIn"></div>
				<p>전자레인지</p>
			</div>
			<div class="gqtsIc">
				<div class="fkeEgq"></div>
				<p>전자도어락</p>
			</div>
			<div class="gqtsIc">
				<div class="iAeGhw"></div>
				<p>비데</p>
			</div>
			<div class="gqtsIc">
				<div class="mCsgX"></div>
				<p>침대</p>
			</div>
			<div class="gqtsIc">
				<div class="gaOEWf"></div>
				<p>책상</p>
			</div>
		</div>
	</div>
	<!--상세 옵션들 아이콘으로 보여줌 끝-->
	<!-- 지도 시작 -->
	<div id="location" class="jFMhNO kBQneM">
		<h1 class="fIqmuM">위치</h1>
		<p class="hwnvlX">서울시 강남구 역삼동 824-9</p>

		<!-- 맵 api 시작-->

		<div id="map"></div>

		<!-- 맵 api 끝-->
		<!--위치 30미터 반경만 표시-->
	</div>
	<!-- 지도 끝 -->


	<!--매물 이미지 끝-->
	<!-- 하단 영역 -->
	<%@ include file="./ma_assets/ma_inc/bottom.jsp"%>

	<!-- Javascript -->
	<script src="../assets/js/jquery-3.2.1.min.js"></script>
	<script src="../assets/js/bootstrap.min.js"></script>
	<script src="../assets/plugin/sweetalert/sweetalert2.min.js"></script>

	<script>
		$(function() {
			/*문의하기 클릭*/
			$(".grml")
					.click(
							function() {
								// 메시지 내용만 적용하여 확인창 표시
								swal("조수민님의 이메일입니다.<br/><br/>aaa@gmail.com<br/><br/>*문의에티켓을 지켜주세요.");
							});
			/*허위매물신고 클릭*/
			$(".nowqt").click(
					function() {
						swal('확인매물이란?',
								'확인매물은 아래 절차를 모두 통과한 가장 믿을 수 있는 매물정보입니다.',
								'question');
					});
			/*확인매물 바의 물음표 클릭*/
			$(".mola")
					.click(
							function() {
								swal(
										'확인매물이란?<br/>',
										'확인매물은 절차를 모두 통과한 가장 믿을 수 있는 매물정보입니다.<hr /> 방주인 확인 -<br><br>방주인이 직접 거래가격, 위치, 중개사무소까지 확인했어요! <hr /> 인증날짜 확인 - <br><br>인증날짜를 확인하세요.<br>최근에 인증된 방이 더욱 믿을 수 있어요!',
										'question');
							});
		});
	</script>

	<script src="https://d3js.org/d3.v5.min.js"></script>
	<script src="../main/ma_assets/billboard.min.js"></script>
	<script type="text/javascript">
		var chart = bb.generate({
			data : {
				x : "x",
				columns : [ [ "x", "가격", "관리비", "옵션", "편의시설", "교통" ],
						[ "data1", 70, 50, 50, 80, 70 ]
				// ["data2", 130, 100, 30, 200, 80],
				// ["data3", 230, 153, 85, 300, 250]
				],
				type : "radar",
				labels : true
			},
			radar : {
				axis : {
					max : 100
				},
				level : {
					depth : 1
				},
				direction : {
					clockwise : true
				},
				line : {
					connectNull : true,
					classes : [ "line-class1", "line-class2" ]
				},

			},
			bindto : "#radarChart"
		});

		chart.data.colors({
			data1 : "#0040FF",
		});
	</script>

	<script type="text/javascript">
		$(function() {
			$(".more").click(
					function(e) {
						$("#smallexplan > div").toggleClass(
								'explan-on explan-off', 400);
					});
		});
	</script>

	<script>
		/* 좋아요 클릭 -> 하트 색 변경 */
		$(function() {
			$(".recent-div9").click(function(e) {
				$(this).toggleClass('on off');
			})
		});
	</script>

	<script>
		/* 파란색 헤더바 좋아요 클릭 -> 하트 색 변경 */
		$(function() {
			$(".recent-div8").click(function(e) {
				$(this).toggleClass('on off');
			})
		});
	</script>

	<!-- 평수 바꾸기 -->
	<script type="text/javascript">
	$(function() {
		v1 = 44.33;
		result = v1;

		$(".chbt").click(function(e) {

				if (result == v1) {
					result = Math.floor(v1/3.3);
					$('#chnum').html("<span>" + result + "평</span>");

				} else {
					result = v1;
					$('#chnum').html("<span>" + result + "㎡</span>");
					result = v1;
					
				}
			});
		});
</script>

	<script>
		$(window).scroll(function() {
			//스크롤 이벤트 발생 시 
			var contentHeight = $(window).height();
			//content의 높이 변수 선언 
			var scrollValue = $(window).scrollTop();
			//현재 scroll 위치 변수 선언 
			if (scrollValue > contentHeight) {
				//현재 scroll 위치가 content의 높이보다 높을 경우
				$("#bluebar").css("display", "block");
				//이벤트 stop 
			} else {
				$("#bluebar").css("display", "none");
				//button이 스크롤따라 움직임 
			}
		});
	</script>

	<!-- <script>
		// Hide Header on on scroll down 
		var didScroll;
		var lastScrollTop = 0;
		var delta = 0;
		var navbarHeight = $("#smhead").outerHeight();
		$(window).scroll(function(event) {
			didScroll = true;
		});
		setInterval(function() {
			if (didScroll) {
				hasScrolled();
				didScroll = false;
			}
		}, 250);
		function hasScrolled() {
			var st = $(this).scrollTop();
			// Make sure they scroll more than delta 
			if (Math.abs(lastScrollTop - st) <= delta)
				return;
			// If they scrolled down and are past the navbar, add class .nav-up. 
			// This is necessary so you never see what is "behind" the navbar. 
			if (st > lastScrollTop && st > navbarHeight) {
				// Scroll Down 
				$("#bluebar").css("display", "block");
			} else {
				// Scroll Up 
				if (st + $(window).height() < $(document).height()) {
					$("#bluebar").css("display", "none");
				}
			}
			lastScrollTop = st;
		}
	</script> -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=49ad4eb7ef14b56eb0eca723e4dd1eaa"></script>
	<script type="text/javascript">
		/* kakao map API */
		$(function() {
			var container = document.getElementById('map');

			var options = {
				center : new kakao.maps.LatLng(37.5025398, 127.0243207),
				level : 2
			};

			var map = new kakao.maps.Map(container, options);

			var circle = new kakao.maps.Circle({
				center : new kakao.maps.LatLng(37.5025398, 127.0243207), // 원의 중심좌표 입니다 
				radius : 30, // 미터 단위의 원의 반지름입니다 
				strokeWeight : 2, // 선의 두께입니다 
				strokeColor : '#1564f9', // 선의 색깔입니다
				strokeOpacity : 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
				strokeStyle : 'solid', // 선의 스타일 입니다
				fillColor : '#1564f9', // 채우기 색깔입니다
				fillOpacity : 0.3
			// 채우기 불투명도 입니다   
			});

			// 지도에 원을 표시합니다 
			circle.setMap(map);
		})
	</script>

</body>
</html>