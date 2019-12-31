<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>

<%@ include file="../assets/inc/meta.jsp"%>

<!-- css 적용 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/ma_css/wish.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/modal_css/compare.css">

</head>
<body>

<!----------------------------------------
-   header                               -
----------------------------------------->
<%@ include file="../assets/inc/ma_top.jsp"%>

<!----------------------------------------
-   content                              -
----------------------------------------->

<!-- content - title -->
    <h1 class="content1-title">관심목록</h1>

    <!-- content-navigation -->
    <div class="content2-d">
        <a class="content2-d-a" href="${pageContext.request.contextPath}/main/rtrm.do" aria-current="">최근 본 방</a>
        <a class="content2-d-a active" href="#">찜한 방</a>
    </div>


    <!-----------------------------------
    |   content-gallery
    ------------------------------------>
    <!--본문영역시작 gallery 시작 -->
    <div class="gallery-wholebox">

        <!-- 총 카운트 count -->
        <p class="count-p">
            총 <span class="room-count">0</span><span>개</span>의 찜한 방이 있습니다
        </p>

        <!-- 메인 갤러리 시작 -->
<!--        <ul class="gallery-ul"> -->
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
                                                <input type="hidden" value="${item.roomno}">
                                                <div class="hit-div7">
                                                    <div class="hit-div8 on" data-value="off"></div>
                                                </div>
                                                <%-- 좋아요 끝 --%>
                                                <%-- 전체 링크화 --%>
                                                <a target="_blank" rel="" class="hit-a"
                                                    href="${pageContext.request.contextPath}/main/rmdt.do?roomno=${item.roomno}">
                                                    <!-- 이미지 -->
                                                    <div class="hit-a-div gallery-d2-pic">
                                                        <img src="${pageContext.request.contextPath}/assets/img/upload/${item.filename}"/>
                                                        <input type="hidden" name="getroomno" value="${item.roomno}" />
                                                        <input type="hidden" id="getuserno" name="getuserno" value="${userno}" />
                                                        </div>
                                                    <c:if
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

                    <%-- gallery-index --%>
                    <div class ="gallery-footer">
                        <div class="gallery-index">
                                    <!-- 페이지 번호 구현 -->
                                    <%-- 이전 그룹에 대한 링크 --%>
                                    <c:choose>
                                        <%-- 이전 그룹으로 이동 가능하다면? --%>
                                        <c:when test="${pageData.prevPage > 0}">
                                            <%-- 이동할 URL 생성 --%>
                                            <c:url value="/main/wish.do" var="prevPageUrl">
                                                <c:param name="keyword" value="${keyword}" />
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
                                            <c:url value="/main/wish.do" var="pageUrl">
                                                <c:param name="keyword" value="${keyword}" />
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
                                            <c:url value="/main/wish.do" var="nextPageUrl">
                                                <c:param name="keyword" value="${keyword}" />
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
                                </div>
    <!-----------------------------------
    |   content-compare bar
    ------------------------------------>
        <!-- 비교하기 버튼 -->
        <div id="bar-compare">
            <button class="btn-compare">방 비교하기</button>
        </div>
        <!-- 비교하기 바가 붙는 위치 -->
        <div id="summon">
            <!-- 비교하기 바 -->
            <div class="compare-d1" id="compare-d1" style="right: 0px; bottom: 0px;">
                <div class="compare-d2">
                    <div class="compare-exp-d3" width="213">
                        <p class="compare-exp-p1">방 비교하기</p>
                        <p class="compare-exp-p2" size="13">최대 3개까지 비교할 수 있습니다.</p>
                    </div>
                    <div class="compare-select" id="select1">
                        <div class="compare-select-d">
                            <svg width="30" height="30" viewBox="0 0 32 32">
                    <g fill="none" fill-rule="evenodd">
                        <path stroke="#FFF" stroke-dasharray="2"
                                    d="M16 31c8.284 0 15-6.716 15-15 0-8.284-6.716-15-15-15C7.716 1 1 7.716 1 16c0 8.284 6.716 15 15 15z"
                                    opacity=".5"></path>
                        <text fill="#FFF" font-family="Noto Sans KR" font-size="15"
                                    font-weight="700" transform="translate(1 1)">
                            <tspan class="331" x="11" y="20.2">1</tspan>
                        </text>
                    </g>
                </svg>
                        </div>
                        <p class="compare-select-p">비교할 방을 선택해주세요</p>
                    </div>
                    <div class="compare-select" id="select2">
                        <div class="compare-select-d">
                            <svg width="30" height="30" viewBox="0 0 32 32">
                    <g fill="none" fill-rule="evenodd">
                        <path stroke="#FFF" stroke-dasharray="2"
                                    d="M16 31c8.284 0 15-6.716 15-15 0-8.284-6.716-15-15-15C7.716 1 1 7.716 1 16c0 8.284 6.716 15 15 15z"
                                    opacity=".5"></path>
                        <text fill="#FFF" font-family="Noto Sans KR" font-size="15"
                                    font-weight="700" transform="translate(1 1)">
                            <tspan class="332" x="11" y="20.2">2</tspan>
                        </text>
                    </g>
                </svg>
                        </div>
                        <p class="compare-select-p">비교할 방을 선택해주세요</p>
                    </div>

                    <div class="compare-select" id="select3">
                        <div class="compare-select-d">
                            <svg width="30" height="30" viewBox="0 0 32 32">
                    <g fill="none" fill-rule="evenodd">
                        <path stroke="#FFF" stroke-dasharray="2"
                                    d="M16 31c8.284 0 15-6.716 15-15 0-8.284-6.716-15-15-15C7.716 1 1 7.716 1 16c0 8.284 6.716 15 15 15z"
                                    opacity=".5"></path>
                            <text fill="#FFF" font-family="Noto Sans KR" font-size="15"
                                    font-weight="700" transform="translate(1 1)">
                            <tspan x="11" y="20.2">3</tspan>
                        </text>
                    </g>
                </svg>
                        </div>
                        <p class="compare-select-p">비교할 방을 선택해주세요</p>
                    </div>

                    <div class="compare-btn-box" width="238">
                        <button class="compare-btn-cancel" width="80">취소</button>
                        <a class="dis-block" href="${pageContext.request.contextPath}/modal/compare.do"
                                data-toggle="modal" data-target="#compareModal">
                        <button class="compare-btn-compare">
                                비교하기
                        </button></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 갤러리 끝 -->


<!----------------------------------------
-   footer                               -
----------------------------------------->
<%@ include file="../assets/inc/ma_bottom.jsp"%>

<!-- 비교하기용 모달 로더 -->
<div class="modal fade" id="compareModal">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">

        </div>
    </div>
</div>

<!-- 비슷한 방 추천 모달 로더 -->
<div class="modal fade" id="similarModal">
    <div class="modal-dialog modal-sm">
        <div class="modal-content modal-recomand" width="940">

            <header class="modal-head">
                <h1>비슷한 조건의 다른 방</h1>
                <button class="modal-head-btn" data-dismiss="modal">
                    <svg width="30" height="30" viewBox="0 0 32 32">
                        <g fill="none" fill-rule="evenodd" transform="translate(1 1)">
                            <circle class="Circle" cx="15" cy="15" r="15"></circle>
                            <g class="Close" stroke-linecap="round" stroke-width="2">
                                <path d="M19.243 19.243l-8.486-8.486M19.243 10.757l-8.486 8.486"></path>
                            </g>
                        </g>
                    </svg>
                </button>
            </header>
            <div class="mg-whole-d">
                <div class="mg-1d">
                    <div class="mg-2d">
                        <div class="mg-heart-d">
                            <div class="mg-heart-2d off" data-value="on"></div>
                        </div>
                        <a target="_blank" rel="noopener noreferrer" class="mg-a" href="${pageContext.request.contextPath}/main/rmdt.do">
                            <div class="mg-a-pic1"></div>
                            <p class="mg-roomtype">쓰리룸</p>
                            <p class="mg-price">
                                <span>월세 1000/80</span>
                            </p>
                            <p class="mg-p34"> 11층, 38.64m², 관리비 7만</p> <!-- jBkVAv -->
                            <p class="mg-p34">⭐️까치산역 초역세권 옵션 투룸 귀한 월세⭐️ // 빠른입주가능. 대리석바닥. 막힘없는 11층 고층 뷰!</p>
                        </a>
                    </div>
                </div>

                <div class="mg-1d">
                    <div class="mg-2d">
                        <div class="mg-heart-d">
                            <div class="mg-heart-2d off" data-value="on"></div>
                        </div>
                        <a target="_blank" rel="noopener noreferrer" class="mg-a" href="${pageContext.request.contextPath}/main/rmdt.do">
                            <div class="mg-a-pic1 mg-a-pic2"></div> <!-- jBvkCW -->
                            <p class="mg-roomtype">쓰리룸</p>
                            <p class="mg-price">
                                <span>전세 2억4900</span>
                            </p>
                            <p class="mg-p34">2층, 66m², 관리비 3만</p>
                            <p class="mg-p34">😍 [안심대출HUG가능] 깔끔 쓰리룸 . 좋은 가격 . 입주 하시가능 . 골목 없는 집 !!</p>
                        </a>
                    </div>
                </div>
                <div class="mg-1d">
                    <div class="mg-2d">
                        <div class="mg-heart-d">
                            <div class="mg-heart-2d off" data-value="on"></div>
                        </div>
                        <a target="_blank" rel="noopener noreferrer" class="mg-a" href="${pageContext.request.contextPath}/main/rmdt.do"> <!-- kpKjGs -->
                            <div class="mg-a-pic1 mg-a-pic3"></div> <!-- eunTmP -->
                            <p class="mg-roomtype">투룸</p>
                            <p class="mg-price">
                                <span>전세 1억3000</span>
                            </p>
                            <p class="mg-p34">4층, 52.89m², 관리비 1만</p>
                            <p class="mg-p34">⭐️안심전세90%가능⭐️탁트인 전망.채광굿.정남향.바로입주가능.주차가능.올수리!리모델링 투룸.중소기업청년전세 가능!~</p>
                        </a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>


<script src="${pageContext.request.contextPath}/assets/js/jquery-1.10.2.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

<script type="text/javascript">
    	function delectstar(x) {
    		$.ajax({
                url: "delectstar.do",
                method: "get",
                data: {"x" : x},
                success: function(req){
    				alert(x + "delectstar");
                },
                error : function() {
					swal("delectstar발송에러 발생");
				}
    		});
    	}
</script>

<script>
    $(function(){

        /* 방 비교하기 버튼 눌렀을 때 보이도록 발생하는 이벤트 */
        $(document).on('click', '.btn-compare', function(e) {

            $(".compare-d1").css("display","block");

            /* 방 비교하기 버튼 지우기 */
            $("#bar-compare").empty();

            /* checkbox 만들기 */
            var chbox = "";
            chbox += '<div class="comp-chkbox-d">'
            chbox += '<label class="clearfix comp-chkbox-l" size="22">'
            chbox += '<input type="checkbox" class="comp-chkbox-i" name="newroomno" value="" />'
            chbox += '<span class="comp-chkbox-s"></span></label></div>'

            /* checkbox 붙이기 */
            $(".gallery-d2-pic").append(chbox);

            /** roomno 스크립트로 가져오기 */
            $(document).on('click', '.comp-chkbox-i', function(e){
                var roomno =$(this).parents(".gallery-d2-pic").children('input[name=getroomno]').val();
                nwroomno = roomno*1; // 문자를 숫자로 바꿈
                $(this).val(nwroomno);
            });

        }); /* END OF 방 비교하기 버튼 눌렀을 때 보이도록 발생하는 이벤트 */



        /**-------------체크 하기 & 체크 풀기------------------------- */
          var i=1;
          $(document).on('click', '.comp-chkbox-i', function(e) {
          var check = $(this).is(":checked")

             if (check == true) {

                var type = $(this).parents(".hit-a").children(".hit-a-p1").html();
                  var price = $(this).parents(".hit-a").find(".hit-a-p2").html();

                var put = '<span class="compbar-newspan">' + type + '</span>';
                   put += '<p class="compbar-newp">' + price + '</p>';
                   put += '<button class="compbar-newbtn"></button>';
                   //$(".comp-chkbox-i").prop("checked", true);

                   // 순차적으로 값 입력
                   $("#select"+i).html(put);
                   i++;
                   return;
             } else {
                i--;
                $("#select"+i).html("체크가 해제되었습니다.");
                return;
             }
          });



          /**-------------체크 된 값 가지고 ajax로 보내기------------------------- */

          $(".compare-btn-compare").click(function sendCompare() {
                // 사용자 ID를 갖고 온다.
                var userId = $("#getuserno").val();

                // name이 같은 체크박스의 값들을 배열에 담는다.
                var checkboxValues = [];
                $("input[name='newroomno']:checked").each(function(i) {
                    checkboxValues.push($(this).val());
                });

                // 사용자 ID(문자열)와 체크박스 값들(배열)을 name/value 형태로 담는다.
                var allData = { "userId": userId, "checkArray": checkboxValues };

                $.ajax({
                    url:"${pageContext.request.contextPath}/modal/comparelist.do",
                    type:'POST',
                    data: allData,
                    success: function(data){
                        $("#compareModal").empty();
                        $("#compareModal").append(data);
                    },
                    error : function(request, status, error){
                        console.log("AJAX_ERROR");
                    }
                });
            });


        /* 취소하기 눌렀을 때, 비교하기 바 지우고 다시 방 비교하기 버튼 생성 */
        $(document).on('click', '.compare-btn-cancel', function(e) {

            /* 비교하기바 숨기기 */
            $(this).parents(".compare-d1").css("display","none");
            $("#bar-compare").html("<button class='btn-compare'>방 비교하기</button>");

            /* 체크박스 지우기 */
            $(".comp-chkbox-d").remove();
        });
    });

    /* footer와 비교하기바가 겹치지 않기위한 이벤트 */
    $(function() {
        $(window).scroll(function() {

            /* 스크롤 이벤트시, footer 위에 붙기 */
            if ($(window).scrollTop() + $(window).height() - 250 < $(document).height() ) {
                var control = 0;
                control = 250 - ($(document).height() - $(window).scrollTop() - $(window).height()) ;
                $(".compare-d1").css("bottom", 0);
            }
            console.log($(window).scrollTop());

            /* 스크롤 올릴 때, 더 올라가는 버그 수정 */
            if ($(document).height() < $(window).scrollTop() + $(window).height() + 250 ) {
                var control = 0;
                control = 250 - ($(document).height() - $(window).scrollTop() - $(window).height()) ;
                $(".compare-d1").css("bottom", control+"px");
            }
        });
    });

    /* script용 모달열기 */
    $(function () {
        $(".complete-smcover").click(function(e) {
            // 스크립트를 사용하여 특정 Modal을 강제로 열기
            $("#similarModal").modal('show');
            // 아래는 창을 강제로 닫기 처리
            //$("#myModal").modal('hide');
        });
    });

    /* 하트 toggle */
    $(function() {
        $(".hit-div8").click(function(e) {
        	$(this).toggleClass('on off');
		    var onoff = $(this).hasClass("on");
    		alert(onoff);
        	var a = $(this).parent().prev().val();
        	alert(a);
			delectstar(a);
			var http = "${pageContext.request.contextPath}/main/wish.do"
			location.replace(http);
        });
    });
</script>
    <script type="text/javascript">
        /* 조건에 맞는 방 개수 */
        $(function() {
            var n = $(".hit-div5").length;
            $(".room-count").html(n);
        });
        </script>
        <script>
if ($('.hit-div5').length) {
/*     alert('값이 있어요!'); */

}
/* 체크박스 클릭했을 때, 비우고 다른내용으로 채우기  */
$(document).on('click', '.compbar-newbtn', function(e) {
    alert("hi")
    $(".compare-select").hide();
    $(".compare-select").show();
});
</script>
</body>
</html>