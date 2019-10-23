<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../assets/inc/meta.jsp"%>
<link rel="stylesheet" type="text/css"
	href="../main/ma_assets/ma_rmdt.css" />
<link rel="stylesheet" type="text/css" href="../assets/header_white.css" />
<link rel="stylesheet" type="text/css" href="../assets/footer_black.css" />
</head>

<body>
	<!-- 상단 헤더 -->
	<%@ include file="./ma_assets/ma_inc/top.jsp"%>
	<!--별방 방찾기 상세페이지 헤더 시작-->
	<!--스크롤 발생 시 움직이는 파란색바 시작-->
	<div id="bluebar">
		<div id="lol">
		<h1 class="textht pull-left texthth1">월세 200/30</h1>
		<span class="glyphicon glyphicon glyphicon-star-empty textht2">0</span>
		<span class="glyphicon glyphicon glyphicon-link textht3"></span> <a
			href="#"><span
			class="nowqt glyphicon glyphicon glyphicon-bullhorn pull-right "></span></a>	
		<button type="submit" class="pull-right textht inbl">
				<span class="quest">문의하기</span>
		</button>
		<span class="textht pull-right skyblue lvc"> 조수민님</span> <span
			class="textht pull-right lvc">방주인</span>
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
				<li class="pull-left abc"><span class="greyfont">매물종류(원룸)</span>
					<h1>
						월세 3000/55<span class="greyfontwon">만원</span>
					</h1></li>
				<li class="pull-left abc" id="month"><span class="greyfont">전용면적</span>
					<h1>36.36㎡</h1>
					<button type="button" class="chbt">
						<span class="glyphicon glyphicon-refresh">평</span>
					</button></li>
				<li class="pull-right">
					<!--방주인 이메일보기-->
					<p class="honame">방주인 조수민님</p>
					<button type="button" class="grml">
						<span class="glyphicon glyphicon-envelope">문의하기</span>
					</button>
				</li>
			</ul>
		</div>
		<!--상단 내용 끝-->
		<div id="iconlist">
			<!--찜,이메일,공유,허위매물신고 시작-->
			<a href="#"><span
				class="glyphicon glyphicon glyphicon-star-empty"></span></a> <span
				class="glyphicon glyphicon glyphicon-stop"></span> <a href="#"><span
				class="glyphicon glyphicon glyphicon-link"></span></a> <span
				class="glyphicon glyphicon glyphicon-stop"></span> <a href="#"><span
				class="glyphicon glyphicon glyphicon-bullhorn"></span></a> <span
				class="greyfontnm">허위매물신고</span>
		</div>
		<!--찜,이메일,공유,허위매물신고 끝-->
		<div id="confirm room">
			<!--확인매물 푸른색바 시작-->
			<div class="eTgAil" type="confirm">
				<p class="gknGpv" type="confirm">
					확인매물<span>19.09.18</span>
				</p>
				<p class="cETKtB">
					<span class="confirmsm">방주인과 공인중개사가 거래정보를 확인한 매물입니다.</span> <a
						href="#" class="mola"> <img
						src="ma_assets/ma_img/confirmq.png">
					</a>
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
					<div class="gbAeEp">
						<span>26.44 / 33.05㎡</span>
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
				<div>
					<span class="smexp"> ※해당매물은 직접 현장 답사하여 찍은 100% 실제 사진과 모습입니다※<br />
						<br /> ※낚시성 매물로 손님들을 현혹하지 않습니다<br /> <br /> ※부동산 어플에 허위매물이
						절반이상입니다. 말도 안되게 저렴한매물에 속지마세요<br /> <br /> ※진실된 정보만(ONLY FACT)
						제공하겠습니다<br /> <br />
					</span>
				</div>
				<button class="styled__ShowBtn-sc-1xkewlx-jQYbpN">
					상세설명 더보기
					<svg width="16" height="12" viewBox="0 0 16 12">
				            <path fill="none" fill-rule="evenodd" stroke="#1476FC"
							d="M3l6 6 6-6"></path>
						    </svg>
				</button>
			</div>
			<!--매물 설명 작은 폰트-->
		</div>
		<!--사용자 매물 설명 끝-->
		<div id="smhead">
		<div class="xOEdU">
			<a class="eYDrrB">다방면 스코어</a> <a class="eYDrrB">가격정보</a> <a
				class="eYDrrB">옵션</a> <a class="eYDrrB">위치</a> <a class="eYDrrB">인기매물</a>
		</div>
	</div>
		<div id="rader">
			<!-- 다방면 스코어 시작-->
			<div class="styled__Block-sc-123hsgh-0 kZTRnS" name="score"
				id="score" style="border-top: 0px;">
				<div
					class="styled__ContentBox-sc-123hsgh-jFMhNO styled__Box-sc-123hsgh-1 jFMhNO kBQneM">
					<h1 class="styled__Title-ce0o94-0 dbrfvk kBQneM">다방면 스코어</h1>
					<div class="styled__ChartWrap-ce0o94-1 fCword">
						<h1>
							75.5<span>점</span>
						</h1>
						<p>가격대비 괜찮은 방!</p>
						<div class="styled__Labels-ce0o94-yKDHp">
							<p>
								<svg width="19" height="23" viewBox="0 0 16 19">
				                        <path fill="#5E90F3" fill-rule="evenodd"
										d="M7.995.5L.5 4.827v8.655l7.495 4.327 7.495-4.327V4.827z"></path>
				                    </svg>
								<span>이 방</span>
							</p>
							<p>
								<svg width="19px" height="23px" viewBox="0 0 16 19">
				                        <path fill="none" fill-rule="evenodd"
										stroke="#000" stroke-dasharray="1,2,1,2"
										stroke-linecap="round" stroke-linejoin="round"
										d="M7.995.5L.5 4.827v8.655l7.495 4.327 7.495-4.327V4.827z"></path>
				                    </svg>
								<span>이 지역 평균</span>
							</p>
						</div>
						<svg width="400" height="330" viewBox="0 0 400 330">
				                <defs>
				                    <filter x="0" y="0" width="1" height="1"
								id="solid">
				                        <feFlood
								flood-color="rgba(255, 255, 255, 0.5)"></feFlood>
				                        <feComposite in="SourceGraphic"></feComposite>
				                    </filter>
				                </defs>
				                <g transform="translate(200.0000,175.0000)">
				                    <g>
				                        <path cx="0" cy="0"
								d="M0.0000,-140.0000L133.1479,-43.2624L82.2899,113.2624L-82.2899,113.2624L-133.1479,-43.2624z"
								stroke="#dfdfdf" fill="none"></path>
				                        <path cx="0" cy="0"
								d="M0.0000,-70.0000L66.5740,-21.6312L41.1450,56.6312L-41.1450,56.6312L-66.5740,-21.6312z"
								stroke="#dfdfdf" fill="none"></path>
				                    </g>
				                    <g>
				                        <polyline
								points="0.0000,0.0000 0.0000,-140.0000" stroke="#dfdfdf"></polyline>
				                        <polyline
								points="0.0000,0.0000 133.1479,-43.2624" stroke="#dfdfdf"></polyline>
				                        <polyline
								points="0.0000,0.0000 82.2899,113.2624" stroke="#dfdfdf"></polyline>
				                        <polyline
								points="0.0000,0.0000 -82.2899,113.2624" stroke="#dfdfdf"></polyline>
				                        <polyline
								points="0.0000,0.0000 -133.1479,-43.2624" stroke="#dfdfdf"></polyline>
				                    </g>
				                    <g>
				                        <text x="1" y="-135" filter="url(#solid)"
								fill="rgba(0, 0, 0, 0.7)" font-size="12" text-anchor="middle">100</text>
				                        <text x="0" y="-65" filter="url(#solid)"
								fill="rgba(0, 0, 0, 0.7)" font-size="12" text-anchor="middle">50</text>
				                    </g>
				                    <g>
				                        <text x="0.0000" y="-159.1250" dy="8"
								font-size="16" text-anchor="middle">가격</text>
				                        <text x="160.3719" y="-49.1723" dy="8"
								font-size="16" text-anchor="middle">관리비</text>
				                        <text x="99.1153" y="128.7348" dy="8"
								font-size="16" text-anchor="middle">옵션</text>
				                        <text x="-99.1153" y="128.7348" dy="8"
								font-size="16" text-anchor="middle">편의시설</text>
				                        <text x="-160.3719" y="-49.1723" dy="8"
								font-size="16" text-anchor="middle">교통</text>
				                    </g>
				                    <g>
				                        <path
								d="M0.0000,-112.0000L106.5183,-34.6099L65.8319,90.6099L-65.8319,90.6099L-106.5183,-34.6099z"
								stroke="#232323" stroke-width="2" stroke-dasharray="3,3"
								fill="none"></path>
				                    </g>
				                    <g>
				                        <path
								d="M0.0000,-99.7500L79.8887,-25.9574L74.0609,101.9361L-65.8319,90.6099L-106.5183,-34.6099z"
								stroke="none" fill="#0755ED" fill-opacity=".65"></path>
				                    </g>
				                </g>
				            </svg>
					</div>
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
		</div> 

	<!--매물 이미지 끝-->
	<!-- 하단 영역 -->
	<%@ include file="./ma_assets/ma_inc/bottom.jsp"%>
	
	
	<!-- Javascript -->
	<script src="../assets/js/jquery-1.10.2.min.js"></script>
	<script src="../assets/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=49ad4eb7ef14b56eb0eca723e4dd1eaa"></script>
	<script type="text/javascript">
		/* 브라우저 크기에 따라 갤러리와 지도영역 높이 변경 */
		function contentSize() {
			var wHeight = $(window).height();
			var gHeight = wHeight - 206;
			var mHeight = wHeight - 136;
			$(".gallery-container").css("height", gHeight);
			$(".map").css("height", mHeight);
		}
		$(function() {
			contentSize();
			$(window).resize(function(e) {
				contentSize();
			});
		});

		/* kakao map API */
		$(function() {
			var container = document.getElementById('map');
			var options = {
				center : new kakao.maps.LatLng(37.5025398, 127.0243207),
				level : 3
			};

			var map = new kakao.maps.Map(container, options);
		})
	</script>
</body>
</html>