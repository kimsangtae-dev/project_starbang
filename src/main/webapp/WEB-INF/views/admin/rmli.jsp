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
	href="${pageContext.request.contextPath}/assets/css/ad_css/rmli.css" />

</head>

<body>
	<!-- 브라우저에 보여질 부분 -->
	<!-- 페이지의 전체 폭을 결정하기 위한 영역 -->
	<div>
		<%@ include file="../assets/inc/ad_header.jsp"%>
		<!-- 중앙 영역 -->
		<div id="content">
			<div>
				<div class="adm-header">
					<h1>방관리</h1>
					<div class="adm">
						<div class="input-group">
							<span class="input-group-addon"> <span
								class="glyphicon glyphicon-search"></span>
							</span> <input type="text" class="form-control" /> <span
								class="input-group-btn">
								<button class="btn btn-default" type="submit">검색</button>
							</span>
						</div>
						<br>
						<div class="box">
							<div class="adm-radio">
								<label><input type='radio' name='check' value="html"
									id=checked-item>확인매물</label> <label><input type='radio'
									name='check' value="html" id=checked-fake>허위매물</label>
							</div>
							<div class="adm-btn">
								<input type="button" name="" class="btn btn-default"
									id=confirm-button value="확인매물"> <input type="button"
									name="" class="btn btn-default" id=hidden-room value="방 숨기기">
								<input type="button" name="" class="btn btn-default"
									id=delete-room value="방 삭제">
								<!-- 								<input type="button" name="" class="btn btn-primary"
									value="회원탈퇴"> -->
							</div>
						</div>
					</div>
				</div>
				<!-- 조회 결과 목록 -->
				<table class="table table-striped">
					<thead>
						<tr>
							<th class="text-center"><input type="checkbox"
								id="all_check"></th>
							<th class="text-center">방 번호</th>
							<th class="text-center">방 종류</th>
							<th class="text-center">매물 종류</th>
							<th class="text-center">가격대</th>
							<th class="text-center">방 주인</th>
							<th class="text-center">확인매물</th>
							<th class="text-center">허위매물신고건수</th>
							<th class="text-center">숨김여부</th>
						</tr>
					</thead>
					<c:choose>
						<%-- 조회결과가 없는 경우 --%>
						<c:when test="${output == null || fn:length(output) == 0}">
							<tr>
								<td colspan="3" align="center">조회결과가 없습니다.</td>
							</tr>
						</c:when>
						<%-- 조회 결과가 있는 경우 --%>
						<c:otherwise>
							<%-- 조회 결과에 따른 반복 처리 --%>
							<c:forEach var="item" items="${output}" varStatus="status">
								<%-- 출력을 위해 준비한 유저이름과 위치 --%>
								<c:set var="roomno" value="${item.roomno}" />
								<c:set var="roomtype" value="${item.roomtype}" />
								<c:set var="dealingtype" value="${item.dealingtype}" />
								<c:set var="price" value="${item.price}" />
								<c:set var="userno" value="${item.name}" />
								<c:set var="confirmdate" value="${item.confirmdate}" />
								<%-- 								<c:set var="fakecount" value="${item.cnt}" /> --%>
								<c:set var="status" value="${item.status}" />

								<tr id="bbbb">
									<td class="text-center"><input type="checkbox" id="aaaa"
										value="${item.roomno}" class="roomlist"></td>
									<td align="center">${item.roomno}</td>
									<td align="center">${item.roomtype}</td>
									<td align="center">${dealingtype}</a></td>
									<td align="center">${price}만원</td>
									<td align="center"><a href="${viewUrl}">${userno}님</td>
									<td align="center" id="confirmdate">${confirmdate}</td>
									<td align="center">${fakecount}</td>
									<td align="center" id="hidden">${item.status}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
			</div>
		</div>
		<!-- 하단 영역 -->
		<div id="footer">
			<%-- gallery-index --%>
			<div class="gallery-footer">
				<div class="gallery-index">
					<!-- 페이지 번호 구현 -->
					<%-- 이전 그룹에 대한 링크 --%>
					<c:choose>
						<%-- 이전 그룹으로 이동 가능하다면? --%>
						<c:when test="${pageData.prevPage > 0}">
							<%-- 이동할 URL 생성 --%>
							<c:url value="/admin/rmli.do" var="prevPageUrl">
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
							<c:url value="/admin/rmli.do" var="pageUrl">
								<c:param name="keyword" value="${keyword}" />
								<c:param name="page" value="${i}" />
							</c:url>

							<%-- 페이지 번호 출력 --%>
							<c:choose>
								<%-- 현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
								<c:when test="${pageData.nowPage == i}">
									<li><a class="index-indiv indexs-active">${i}</a></li>
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
							<c:url value="/admin/rmli.do" var="nextPageUrl">
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
			<%-- gallery-index --%>
		</div>
	</div>
	<!-- Javascript -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery-1.10.2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function() {
			/* 체크박스 전체선택 */
			$("#all_check").change(function() {
				$(".roomlist").prop('checked', $(this).prop('checked'));
			});
		});

		$(function() {
			$('#confirm-button')
					.on(
							'click',
							function() {
								$('#aaaa:checked')
										.each(
												function() {
													var list = $(this).val();

													$
															.ajax({
																//결과 url
																url : "${pageContext.request.contextPath}/admin/confirm_ok.do",
																data : {
																	user_id : list
																},
																type : "POST",
																success : function(
																		data) {
																	location
																			.reload();
																	$(
																			"#confirmdate")
																			.html(
																					data);
																},
																error : function(
																		error,
																		status,
																		request) {
																	alert("Error!"
																			+ error
																			+ "request: "
																			+ request
																			+ " status: "
																			+ status);
																},
															});
												});//checked
							})
		}); //end $.ajax;

		
		$(function() {
			$('#hidden-room')
					.on(
							'click',
							function() {
								$('#aaaa:checked')
										.each(
												function() {
													var hidden = $(this).val();

													$
															.ajax({
																//결과 url
																url : "${pageContext.request.contextPath}/admin/hidden_ok.do",
																data : {
																	hidden_id : hidden
																},
																type : "POST",
																datatype : 'text',
																success : function(
																		data) {
																	$("#hidden")
																			.html(
																					data)
																},
																error : function(
																		error,
																		status,
																		request) {
																	alert("Error!"
																			+ error
																			+ "request: "
																			+ request
																			+ " status: "
																			+ status);
																},
															});
												});//checked
							})
		}); //end $.ajax;

		$(function() {
			$('#delete-room')
					.on(
							'click',
							function() {
								$('#aaaa:checked')
										.each(
												function() {
													var delete1 = $(this).val();

													$
															.ajax({
																//결과 url
																url : "${pageContext.request.contextPath}/admin/delete_ok.do",
																data : {
																	delete_id : delete1
																},
																type : "POST",
																datatype : 'text',
																success : function(
																		data) {
																	location
																			.reload();
																	alert("삭제되었습니다.")
																},
																error : function(
																		error,
																		status,
																		request) {
																	alert("Error!"
																			+ error
																			+ "request: "
																			+ request
																			+ " status: "
																			+ status);
																},
															});
												});//checked
							})
		}); //end $.ajax;


		$(function() {
			$('#checked-fake')
					.change(
							function() {
								alert("체크 확인");

								$
										.ajax({
											//결과 url
											url : "${pageContext.request.contextPath}/admin/rmli2.do",
											type : "POST",
											async : false,
											data : {
												check_id : 2
											},
											datatype : 'text',
											success : function(data) {
												location.reload();
												alert("확인되었습니다.")
											},
											error : function(error, status,
													request) {
												alert("Error!" + error
														+ "request: " + request
														+ " status: " + status);
											},
										});
							})
		}); //end $.ajax;
	</script>
	
			<!-- Handlebar 템플릿 코드 -->
		<script id="prof-list-tmpl3" type="text/x-handlebars-template">
{{#each item}}
								<%-- 출력을 위해 준비한 유저이름과 위치 --%>
								<c:set var="roomno" value="{{roomno}}]" />
								<c:set var="roomtype" value="{{roomtype}}" />
								<c:set var="dealingtype" value="{{dealingtype}}" />
								<c:set var="price" value="{{price}}" />
								<c:set var="userno" value="{{name}}" />
								<c:set var="confirmdate" value="{{confirmdate}}" />
								<%-- 								<c:set var="fakecount" value="${item.cnt}" /> --%>
								<c:set var="status" value="{{status}}" />
								<tr>
									<td class="text-center"><input type="checkbox" id="aaaa"
										value="{{roomno}}" class="roomlist"></td>
									<td align="center">{{roomno}}</td>
									<td align="center">{{roomtype}}</td>
									<td align="center">{{dealingtype}}</a></td>
									<td align="center">{{price}}만원</td>
									<td align="center"><a href="${viewUrl}">{{userno}}님</td>
									<td align="center" id="confirmdate">{{confirmdate}}</td>
									<td align="center">{{fakecount}}</td>
									<td align="center" id="hidden">{{status}}</td>
								</tr>
{{/each}}
	</script>
		<!-- user code -->
		<script
			src="${pageContext.request.contextPath}/assets/js/jquery-1.10.2.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/assets/plugin/handlebars-v4.0.11.js"></script>
		<script>
/* 	$(function(){
	$("#checked-item").click(function(){
		alert("안녕");
		
		
		$.get("${pageContext.request.contextPath}/professor3",
				{"userno":2}
		,function(json){	
			var source = $("#prof-list-tmpl3").html()//템플릿코드
			var template = Handlebars.compile(source);// 템플릿 컴파일
			var result = template(json);
			
			$("#bbbb").empty(); 
			$("#bbbb").append(result); 
		});
		});
	}); */
	$(function() {
		$("#checked-item").click(function(){
			alert("안녕");
				$.ajax({
					//결과 url
					url : "${pageContext.request.contextPath}/admin/rmli2.do",
					type : "GET",
					success : function(data) {
					alert("값이 변경되었나?")
					alert(data),
					$(document).load(data)},
					error : function(error, status,request) {
					alert("Error!" + error+ "request: " + request+ " status: " + status);},
									});
						})
	}); //end $.ajax;
	</script>
</body>
</html>