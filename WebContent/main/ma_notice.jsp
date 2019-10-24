<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../assets/inc/meta.jsp"%>
<link rel="stylesheet" type="text/css" href="../main/ma_assets/ma_rmdt.css" />
<link rel="stylesheet" type="text/css" href="../assets/header_white.css" />
<link rel="stylesheet" type="text/css" href="../assets/footer_black.css" />

<link rel="stylesheet" type="text/css" href="../main/ma_assets/ma_notice.css" />

</head>
<body>
	<!-- 상단 영역 -->
	<%@ include file="./ma_assets/ma_inc/top.jsp"%>

	 <!-- 중앙 영역 -->
			<div id="content">
				<h1>문의하기</h1>
				<div class="nav">
					<div><a href="ma_faq.html">자주 묻는 질문</a></div>
					<div  id="now"><a href="ma_notice.html">공지사항</a></div>
				</div>

				<div>
					<p class="pddw"></p>
				</div>

				<div id="collapse">
					<!-- 게시글 하나 단위 -->
    				<div class='collapse-item'>
          				<!-- 게시글 제목영역 -->
          				<p class="hwdd"></p>
    					<h2 class='collapse-title text a'><p class="inup">제목</p><p class="outup">날짜</p></h2>
	    			</div>
	    			<!-- 게시글 하나 단위 -->
    				<div class='collapse-item' id="itme">
          				<!-- 게시글 제목영역 -->
    					<h2 class='collapse-title collapse-title2 text'><a href="#content2" class="a"><p class="in">[공지사항] 개인정보 처리방침 주요 개정사항 안내</p><p class="out">2019.10.20</p></a></h2>
            			<!-- 게시글 내용영역 -->
    					<div id="content2" class="content">제목1에 해당하는 내용입니다.</div>
	    			</div>
	    			<!-- 게시글 하나 단위 -->
    				<div class='collapse-item'>
          				<!-- 게시글 제목영역 -->
    					<h2 class='collapse-title collapse-title2 text'><a href="#content3" class="a"><p class="in">[공지사항] 개인정보 처리방침 주요 개정사항 안내</p><p class="out">2019.10.20</p></a></h2>
            			<!-- 게시글 내용영역 -->
    					<div id="content3" class="content">제목1에 해당하는 내용입니다.</div>
	    			</div>
				</div>
			</div>
			
			<!-- 하단 영역 -->
	<%@ include file="./ma_assets/ma_inc/bottom.jsp"%>
    
    <!-- Javascript -->
	<script src="../assets/js/jquery-1.10.2.min.js"></script>
	<script src="../assets/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	$(function() {
	    /** 게시글의 제목을 클릭한 경우 호출되는 이벤트 정의 */
		$(".collapse-title a").click(function(e) {
	        // 링크의 기본 동작(페이지 이동) 방지
			e.preventDefault();

           	// 클릭한 요소의 href 속성을 가져온다 --> 내용영역의 id
			var target = $(this).attr('href');
            // 가져온 내용영역의 id를 화면에 표시한다.
			$(target).slideToggle(100);
            // 내용영역(.content)중에서	
            // 클릭한 요소가 지정한 항목만 제외(not($(target)))
            // 하고 화면에서 숨긴다.
			$(".content").not($(target)).slideUp(100);
		});

		$(".collapse-title3").click(function(e) {
	        // 링크의 기본 동작(페이지 이동) 방지
			e.preventDefault();

           	// 클릭한 요소의 href 속성을 가져온다 -->

           	 var con = document.getElementById("h2m");
		       con.style.display = 'block';
		});
	});
		</script>
		
</body>








