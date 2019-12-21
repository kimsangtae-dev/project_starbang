<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/ho_css/rmli.css" />
<head>

<%@ include file="../assets/inc/meta.jsp"%>

<title>공실관리</title>
 
<!-- header, footer, ho_rmli css 참조 -->
<link rel="stylesheet" type="text/css" href="" />

<style>
</style>
</head>

<body>
<div id="root">
    <div class="box">
        <!-- 헤더 -->
        <%@ include file="../assets/inc/ho_header2.jsp"%>

        <!-- content -->
        <!-- 공실관리 -->
        <div class="content-box">
            <div class="title-box">
                <h1 class="title-h1">공실관리</h1>
            </div>
            <form id="form" action="${pageContext.request.contextPath}/host/rmli.do">
            <!--  -->
            <div class="isroom-div">
                <p class="isroom-p1">
                    <span>${fn:length(output)}</span>건의 공실이 있습니다.
                </p>
                <p class="isroom-p2">공실상태</p>
                <ul width="135" id="dropdown" class="dropdown-closed dropdn">
                    <li name="status" value="0" class="dropdown-li"><span>전체</span>
                        <svg width="10px" height="5px" viewBox="0 0 10 5" version="1.1">
                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                <g transform="translate(-1235.000000, -281.000000)" fill="#444444">
                                    <g transform="translate(180.000000, 263.000000)">
                                        <g transform="translate(945.000000, 0.000000)">
                                            <path d="M119.297,18 L114.9935,21.755 L114.5345,21.3545455 L114.537,21.3568182 L110.7135,18.0204545 L110,18.6427273 C111.0565,19.565 114.007,22.1395455 114.9935,23 C115.7265,22.3609091 115.012,22.9840909 120,18.6318182 L119.297,18 Z" id="arrow_down-[#339]"></path></g></g></g></g></svg>
                    </li>
                    <li name="status" value="1" class="dropdown-li2">공개</li>
                    <li name="status" value="2" class="dropdown-li2">비공개</li>
                </ul>
            </div>
		</form>
        <div class="contain">
            <div class="table-responsive">
                <table class="table table-hover margin-bottom">
                    <colgroup>
                        <col width="10%">
                        <col width="50%">
                        <col width="15%">
                        <col width="15%">
                        <col width="15%">
                    </colgroup>
                    <thead>
                        <tr>
                            <th class="text-center">공실번호</th>
                            <th class="text-center">공실정보</th>
                            <th class="text-center">공실현황</th>
                            <th class="text-center">게시글관리</th>
                            <th class="text-center">공실관리</th>
                        </tr>
                    </thead>
                    <tbody>
                    
                        <c:forEach var="k" items="${output}" varStatus="status">
	                        <tr>
	                       		<td class="text-center">${k.roomno}</td>
	                           	<td>
	                                <div class="table-div">
	                                    <span class="table-span1">${k.roomtype}</span>
	                                    <b class="table-span1-1">${k.dealingtype} ${k.deposit}/${k.price}</b><br>
	                                    <span class="table-span2">${k.address}</span><br>
	                                    <span>${fn:substringBefore(k.confirmdate," ")}</span>
	                                </div>
	                            </td>
	                            <td class="text-center">
	                            
		                            <c:choose>
										<c:when test="${k.confirmdate != null}">
											<span class="label label-primary">&nbsp;공개&nbsp;</span>
										</c:when>
										
										<c:otherwise>
											<span class="label label-info">소유자 확인중</span>
										</c:otherwise>
									</c:choose>
	                                
	                            </td>
	                            <td class="text-center">
	                                <button class="btn btn-default">수정</button>
	                                <button class="btn btn-default">삭제</button>
	                            </td>
	                            <td class="text-center">
	                                <a href="#chmodeModal" data-toggle="modal" class="changemode">
	                                    <button class="btn btn-default">공실상태전환</button>
	                                </a>
	                            </td>
	                        </tr>
						</c:forEach>
						
                    </tbody>
                </table>

            </div>
            <!--/ .table-responsive -->
        </div>
        <!-- / .table contain -->
    </div>
    <!-- / content -->
    
    <!-- footer -->
    <%@ include file="../assets/inc/ho_footer.jsp"%>
    
    </div>
    <!--/ .box -->
</div>
<!--/ #root -->


<!-- 로그인용 모달 로더 -->
<div class="modal fade" id="chmodeModal">
    <div class="modal-dialog">
        <div class="modal-content modal-whole-chmode">
            <p class="chmode-title">공실 상태를 변경합니다.</p>
            <div class="chmode-div clearfix">
                <a>
                    <span>공개</span>
                    <p>게시글을 공개상태로 전환합니다.</p>
                </a>
            </div>
            <div class="chmode-div clearfix">
                <a>
                    <span>비공개</span>
                    <p>게시글을 비공개 상태로 전환합니다.</p>
                </a>
            </div>
            <div class="chmode-div clearfix">
                <a>
                    <span>거래완료</span>
                    <p>거래를 완료했습니다.</p>
                </a>
            </div>
        </div>
    </div>
</div>

<!-- Javascript -->
<script src="${pageContext.request.contextPath}/assets/js/jquery-1.10.2.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script type="text/javascript">

	$("#dropdown").click(function() {
		
		if ( $("#dropdown").hasClass("dropdown-closed") ) {
			
			$(this).addClass('dropdown-opened');
	        $(this).removeClass('dropdown-closed');
	        $(".dropdown-li > span").html("전체");
		
		} else {
			
			$(this).addClass('dropdown-closed');
	        $(this).removeClass('dropdown-opened');

		/* 바꾸기 */
		$(".dropdn > li").click(function(){
			var copy = $(this).html();
			$(".dropdown-li > span").html(copy);
			$("#form").submit();
		});
			
	        
		}
	});

</script>
</body>
</html>