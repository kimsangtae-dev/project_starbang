<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
<link rel="stylesheet" type="text/css"
    href="<%=request.getContextPath()%>/assets/css/modal_css/compare.css" />
</head>

<!-- .modal -->
<!-- <div id="myModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true"> -->
<!-- .modal-dialog -->
<!-- 여백잡아주는박스  -->
<!-- <div class="modal-dialog marginbox"> -->
<!-- .modal-content -->
<!-- 여기가 나오는부분 -->
<div class="modal-content mainbox">
    <div id="header" class="height">
        <h1>방 비교하기</h1>
    </div>
    <div class="content">
        <table class="tableconfig">
            <colgroup>
                <col width="33.3%">
                <col width="33.3%">
                <col width="33.3%">
            </colgroup>

            <c:choose>
                <%-- 조회 결과가 없는 경우 --%>
                <c:when test="${output == null || fn:length(output) == 0}">
                    <p>조회 결과가 없습니다.</p>
                </c:when>
                <%-- 갤러리 시작 --%>
                <c:otherwise>
                    <c:forEach var="item" items="${output}" varStatus="status">

                        <!-- table 1번째 시작 -->
                        <tbody>
                            <tr>
                                <td>
                                    <!-- 닫기버튼 -->
                                    <button class="bclose">
                                        <svg width="9" height="9" viewbox="0 0 9 9">
                                        <g fill="none" fill-rule="evenodd" stroke="#222"
                                                stroke-width=".6">
                                            <path d="M.543.814l7.936 7.937M.543 8.75L8.479.815"></path>
                                        </g>
                                    </svg>
                                    </button>
                                    <p class="tbody-top-p">매물번호 ${item.roomno}</p>
                                </td>
                                <td>
                                    <button class="bclose">
                                        <svg width="9" height="9" viewbox="0 0 9 9">
                                        <g fill="none" fill-rule="evenodd" stroke="#222"
                                                stroke-width=".6">
                                            <path d="M.543.814l7.936 7.937M.543 8.75L8.479.815"></path>
                                        </g>
                                    </svg>
                                    </button>
                                    <p class="tbody-top-p">매물번호 ${item.roomno}</p>
                                </td>
                                <td>
                                    <button class="bclose">
                                        <svg width="9" height="9" viewbox="0 0 9 9">
                                        <g fill="none" fill-rule="evenodd" stroke="#222"
                                                stroke-width=".6">
                                            <path d="M.543.814l7.936 7.937M.543 8.75L8.479.815"></path>
                                        </g>
                                    </svg>
                                    </button>
                                    <p class="tbody-top-p">매물번호 ${item.roomno}</p>
                                </td>
                            </tr>
                            <tr>
                                <td><div class="compare-img1"></div></td>
                                <td><div class="compare-img2"></div></td>
                                <td><div class="compare-img3"></div></td>
                            </tr>
                            <tr>
                                <td><p class="room-num">${item.roomtype}</p></td>
                                <td><p class="room-num">${item.roomtype}</p></td>
                                <td><p class="room-num">${item.roomtype}</p></td>
                            </tr>
                            <tr>
                                <td><p class="room-price">
                                        <c:choose>
                                            <c:when test="${item.dealingtype == '월세'}">
                                                <span>${item.dealingtype}&nbsp;${item.deposit}/${item.price}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span>${item.dealingtype}&nbsp;</span>
                                                <span id="prc">${item.price}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </p></td>
                                <td><p class="room-price">
                                        <c:choose>
                                            <c:when test="${item.dealingtype == '월세'}">
                                                <span>${item.dealingtype}&nbsp;${item.deposit}/${item.price}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span>${item.dealingtype}&nbsp;</span>
                                                <span id="prc">${item.price}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </p></td>
                                <td><p class="room-price">
                                        <c:choose>
                                            <c:when test="${item.dealingtype == '월세'}">
                                                <span>${item.dealingtype}&nbsp;${item.deposit}/${item.price}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span>${item.dealingtype}&nbsp;</span>
                                                <span id="prc">${item.price}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </p></td>
                            </tr>
                        </tbody>
                        <!-- 테이블 1번째 끝 -->

                        <!-- 테이블 2번째 시작 -->
                        <table class="tableconfig">
                            <colgroup>
                                <col width="33.3%">
                                <col width="33.3%">
                                <col width="33.3%">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>가격대</th>
                                    <th>가격대</th>
                                    <th>가격대</th>
                                </tr>
                                <tr>
                                    <td class="table2-margin">
                                        <p class="table2-price-lp">가격</p>
                                        <p class="table2-price-rp">
                                            <span><c:choose>
                                                    <c:when test="${item.dealingtype == '월세'}">
                                                        <span>${item.dealingtype}&nbsp;${item.deposit}/${item.price}</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span>${item.dealingtype}&nbsp;</span>
                                                        <span id="prc">${item.price}</span>
                                                    </c:otherwise>
                                                </c:choose></span> <span><c:choose>
                                                    <c:when test="${item.dealingtype == '월세'}">
                                                        <span>${item.dealingtype}&nbsp;${item.deposit}/${item.price}</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span>${item.dealingtype}&nbsp;</span>
                                                        <span id="prc">${item.price}</span>
                                                    </c:otherwise>
                                                </c:choose></span> <span><c:choose>
                                                    <c:when test="${item.dealingtype == '월세'}">
                                                        <span>${item.dealingtype}&nbsp;${item.deposit}/${item.price}</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span>${item.dealingtype}&nbsp;</span>
                                                        <span id="prc">${item.price}</span>
                                                    </c:otherwise>
                                                </c:choose></span>
                                        </p>
                                    </td>
                                    <td class="table2-margin">
                                        <p class="table2-price-lp">가격</p>
                                        <p class="table2-price-rp">
                                            <span> <c:choose>
                                                    <c:when test="${item.dealingtype == '월세'}">
                                                        <span>${item.dealingtype}&nbsp;${item.deposit}/${item.price}</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span>${item.dealingtype}&nbsp;</span>
                                                        <span id="prc">${item.price}</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </span>
                                        </p>
                                    </td>
                                    <td class="table2-margin">
                                        <p class="table2-price-lp">가격</p>
                                        <p class="table2-price-rp">
                                            <span> <c:choose>
                                                    <c:when test="${item.dealingtype == '월세'}">
                                                        <span>${item.dealingtype}&nbsp;${item.deposit}/${item.price}</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span>${item.dealingtype}&nbsp;</span>
                                                        <span id="prc">${item.price}</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </span>
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="table2-margin" style="padding-bottom: 20px;">
                                        <p class="table2-price-lp">관리비</p>
                                        <p class="table2-price-rp">
                                            <c:choose>
                                                <c:when test="${room.fee =='0'}">
                                        없음
                                    </c:when>
                                                <c:otherwise>
                                    ${item.fee}만 원
                                    </c:otherwise>
                                            </c:choose>
                                            <input type="hidden" name="getfeeitem"
                                                value="${item.feeitem}" /> <span id="apeend_feeitem"></span>
                                        </p>
                                    </td>
                                    <td class="table2-margin" style="padding-bottom: 20px;">
                                        <p class="table2-price-lp">관리비</p>
                                        <p class="table2-price-rp">
                                            <c:choose>
                                                <c:when test="${room.fee =='0'}">
                                        없음
                                    </c:when>
                                                <c:otherwise>
                                    ${item.fee}만 원
                                    </c:otherwise>
                                            </c:choose>
                                            <input type="hidden" name="getfeeitem"
                                                value="${item.feeitem}" /> <span id="apeend_feeitem"></span>
                                        </p>
                                    </td>
                                    <td class="table2-margin" style="padding-bottom: 20px;">
                                        <p class="table2-price-lp">관리비</p>
                                        <p class="table2-price-rp">
                                            <c:choose>
                                                <c:when test="${room.fee =='0'}">
                                        없음
                                    </c:when>
                                                <c:otherwise>
                                    ${item.fee}만 원
                                    </c:otherwise>
                                            </c:choose>
                                            <input type="hidden" name="getfeeitem"
                                                value="${item.feeitem}" /> <span id="apeend_feeitem"></span>
                                        </p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <!-- 테이블 2번째 끝 -->

                        <!-- 테이블 3번째 -->
                        <table class="tableconfig">
                            <colgroup>
                                <col width="33.3%">
                                <col width="33.3%">
                                <col width="33.3%">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>상세정보</th>
                                    <th>상세정보</th>
                                    <th>상세정보</th>
                                </tr>
                                <tr>
                                    <td class="table3-padding">
                                        <p class="table3-detail-lp">주소</p>
                                        <p class="table3-detail-rp">${item.address}</p>
                                    </td>
                                    <td class="table3-padding">
                                        <p class="table3-detail-lp">주소</p>
                                        <p class="table3-detail-rp">${item.address}</p>
                                    </td>
                                    <td class="table3-padding">
                                        <p class="table3-detail-lp">주소</p>
                                        <p class="table3-detail-rp">${item.address}</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="table3-padding">
                                        <p class="table3-detail-lp">면적</p>
                                        <p class="table3-detail-rp">${item.area}㎡(${item.supplyarea}㎡)</p>
                                    </td>
                                    <td class="table3-padding">
                                        <p class="table3-detail-lp">면적</p>
                                        <p class="table3-detail-rp">${item.area}㎡(${item.supplyarea}㎡)</p>
                                    </td>
                                    <td class="table3-padding">
                                        <p class="table3-detail-lp">면적</p>
                                        <p class="table3-detail-rp">${item.area}㎡(${item.supplyarea}㎡)</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="table3-padding">
                                        <p class="table3-detail-lp">층수</p>
                                        <p class="table3-detail-rp">${item.floor}층</p>
                                    </td>
                                    <td class="table3-padding">
                                        <p class="table3-detail-lp">층수</p>
                                        <p class="table3-detail-rp">${item.floor}층</p>
                                    </td>
                                    <td class="table3-padding">
                                        <p class="table3-detail-lp">층수</p>
                                        <p class="table3-detail-rp">${item.floor}층</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="table3-padding" style="padding-bottom: 20px;">
                                        <p class="table3-detail-lp">주차</p>
                                        <p class="table3-detail-rp">
                                            <c:choose>
                                                <c:when test="${item.parking =='-1'}">
                                        불가
                                    </c:when>
                                                <c:when test="${item.parking =='0'}">
                                        가능(무료)
                                    </c:when>
                                                <c:otherwise>
                                    ${info.parking}만 원
                                    </c:otherwise>
                                            </c:choose>
                                        </p>
                                    </td>
                                    <td class="table3-padding" style="padding-bottom: 20px;">
                                        <p class="table3-detail-lp">주차</p>
                                        <p class="table3-detail-rp">
                                        <c:choose>
                                                <c:when test="${item.parking =='-1'}">
                                        불가
                                    </c:when>
                                                <c:when test="${item.parking =='0'}">
                                        가능(무료)
                                    </c:when>
                                                <c:otherwise>
                                    ${info.parking}만 원
                                    </c:otherwise>
                                            </c:choose>
                                        </p>
                                    </td>
                                    <td class="table3-padding" style="padding-bottom: 20px;">
                                        <p class="table3-detail-lp">주차</p>
                                        <p class="table3-detail-rp">
                                        <c:choose>
                                                <c:when test="${item.parking =='-1'}">
                                        불가
                                    </c:when>
                                                <c:when test="${item.parking =='0'}">
                                        가능(무료)
                                    </c:when>
                                                <c:otherwise>
                                    ${info.parking}만 원
                                    </c:otherwise>
                                            </c:choose>
                                        </p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <!-- 테이블 3번째 끝 -->

                        <!-- 테이블 4번째 -->
                        <table class="tableconfig">
                            <colgroup>
                                <col width="33.3%">
                                <col width="33.3%">
                                <col width="33.3%">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>옵션</th>
                                    <th>옵션</th>
                                    <th>옵션</th>
                                </tr>
                                <tr>
                                    <td class="table4-padding">-</td>
                                    <td class="table4-padding">
                                        <p class="table4-option-p">
                                        <input type="hidden" id="nice" value="${item.optionitem}" />
                                        <div class="dDctva">
                                        </p>
                                    </td>
                                    <td class="table4-padding">
                                        <p class="table4-option-p">에어컨, 세탁기, 신발장, 냉장고, 가스레인지,
                                            전자도어락</p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <!-- 테이블 4번째 -->
                        <!-- 테이블 5번째 -->
                        <table class="tableconfig">
                            <colgroup>
                                <col width="33.3%">
                                <col width="33.3%">
                                <col width="33.3%">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>기타</th>
                                    <th>기타</th>
                                    <th>기타</th>
                                </tr>
                                <tr>
                                    <td class="table5-padding">
                                        <p class="table5-option-p">개별난방</p>
                                        <p class="table5-option-p">빌트인 아님</p>
                                        <p class="table5-option-p">엘리베이터 있음</p>
                                        <p class="table5-option-p">반려동물 가능</p>
                                        <p class="table5-option-p">발코니/베란다 없음</p>
                                        <p class="table5-option-p">전세자금대출 가능</p>
                                        <p class="table5-option-p">날짜 협의</p>
                                        <p class="table5-option-p">공인중개사 중개거래</p>
                                    </td>
                                    <td class="table5-padding">
                                        <p class="table5-option-p">개별난방</p>
                                        <p class="table5-option-p">빌트인 아님</p>
                                        <p class="table5-option-p">엘리베이터 있음</p>
                                        <p class="table5-option-p">반려동물 가능</p>
                                        <p class="table5-option-p">발코니/베란다 없음</p>
                                        <p class="table5-option-p">전세자금대출 가능</p>
                                        <p class="table5-option-p">날짜 협의</p>
                                        <p class="table5-option-p">공인중개사 중개거래</p>
                                    </td>
                                    <td class="table5-padding">
                                        <p class="table5-option-p">개별난방</p>
                                        <p class="table5-option-p">빌트인 주방</p>
                                        <p class="table5-option-p">엘리베이터 있음</p>
                                        <p class="table5-option-p">반려동물 가능</p>
                                        <p class="table5-option-p">발코니/베란다 없음</p>
                                        <p class="table5-option-p">전세자금대출 가능</p>
                                        <p class="table5-option-p">즉시 입주</p>
                                        <p class="table5-option-p">공인중개사 중개거래</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="last-contact-td">
                                        <div class="last-contact-div">
                                            <div>
                                                <div>
                                                    <p>조수민</p>
                                                    <p>breath@naver.com</p>
                                                </div>
                                            </div>
                                            <button>문의하기</button>
                                        </div>
                                    </td>
                                    <td class="last-contact-td">
                                        <div class="last-contact-div">
                                            <div>
                                                <div>
                                                    <p>김상태</p>
                                                    <p>status@gmail.com</p>
                                                </div>
                                            </div>
                                            <button>문의하기</button>
                                        </div>
                                    </td>
                                    <td class="last-contact-td">
                                        <div class="last-contact-div">
                                            <div>
                                                <div>
                                                    <p>김수진</p>
                                                    <p>sujinzzang@daum.net</p>
                                                </div>
                                            </div>
                                            <button>문의하기</button>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </table>
    </div>
</div>

<!-- /.modal-content -->

<script>
    $(function() {
        $(".last-contact-div").click(function() {
            $(this).toggleClass("last-contact-div last-contact-div-open");
        });
    });
</script>
<script>
function binary() {

    /* 뿌려줄 String을 배열에 저장 */
    var option = [
        "<p>에어컨</p>",
        "<p>세탁기</p>",
        "<p>옷장</p>",
        "<p>TV</p>",
        "</div><p>신발장</p>",
        "</div><p>냉장고</p>",
        "<p>가스레인지</p>",
        "<p>인덕션</p>",
        "<p>전자레인지</p>",
        "<p>전자도어락</p>",
        "<p>비데</p>",
        "<p>침대</p>",
        "<p>책상</p>"
        ];


    /* 받아온 값을 관리비 항목에 넣는다 */
    var num = $("#nice").val();
    var num = ${info.optionitem};

    for (var i=13; i>=0 ; i--) {
        if(num >= Math.pow(2, i-1)){
            num = num - Math.pow(2, i-1);
            $(".dDctva").append(option[13-i]);
        } // if문
    } // for문
} // binary함수
binary(); //return

    function binary2() {

        /* 뿌려줄 String을 배열에 저장 */
        var option2 = [ "인터넷", "유선TV", "청소비", "수도세", "도시가스", "전기세", "기타" ];

        /* 받아온 값을 관리비 항목에 넣는다 */
        //var num2 = ${info.feeitem};
        var num2 = ('input[name=getfeeitem]').val();
        var sum = new Array;

        for (var i = 7; i >= 1; i--) {
            if (num2 >= Math.pow(2, i - 1)) {
                num2 = num2 - Math.pow(2, i - 1);
                sum += option2[7 - i];

                if (num2 == 0 || i == 1) {
                    break;
                }
                sum += ", ";
            } // if문
        } // for문
        sum = "(" + sum + ")";
        $("#apeend_feeitem").append(sum);
    } // binary함수
    binary2();
</script>