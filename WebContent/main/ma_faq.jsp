<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../assets/inc/meta.jsp"%>
<link rel="stylesheet" type="text/css" href="../main/ma_assets/ma_rmdt.css" />
<link rel="stylesheet" type="text/css" href="../assets/header_white.css" />
<link rel="stylesheet" type="text/css" href="../assets/footer_black.css" />

<link rel="stylesheet" type="text/css" href="../main/ma_assets/ma_faq.css" />

</head>
<body>
	<!-- 상단 영역 -->
	<%@ include file="./ma_assets/ma_inc/top.jsp"%>
    
    <!-- 중앙 영역 -->
			<div id="content">
				<h1 class"h1">문의하기</h1>
				<div class="nav">
					<div id="now"><a href="ma_faq.html">자주 묻는 질문</a></div>
					<div><a href="ma_notice.html">공지사항</a></div>
				</div>

				<div class="title">
					<p>별방 사용자의 편의를 위해 <span>자주 묻는 질문과 답변</span>을 모아놓았습니다</p>
					<p>원하시는 질문을 찾아보세요</p>
				</div>

				<div id="collapse">
					<!-- 게시글 하나 단위 -->
    				<div class='collapse-item' id="itme">
          				<!-- 게시글 제목영역 -->
    					<h2 class=' collapse-title text'><a class="a" href="#content1"><img src="ma_assets/ma_img/Q.PNG"><p>별방은 어떤 서비스인가요?</p></a></h2>
            			<!-- 게시글 내용영역 -->
    					<div id="content1" class="content">제목1에 해당하는 내용입니다.</div>
	    			</div>
	    			<!-- 게시글 하나 단위 -->
    				<div class='collapse-item' id="itme">
          				<!-- 게시글 제목영역 -->
    					<h2 class=' collapse-title text'><a class="a" href="#content2"><img src="ma_assets/ma_img/Q.PNG"><p>별방은 어떤 서비스인가요?</p></a></h2>
            			<!-- 게시글 내용영역 -->
    					<div id="content2" class="content">제목1에 해당하는 내용입니다.</div>
	    			</div>
	    			<!-- 게시글 하나 단위 -->
    				<div class='collapse-item' id="itme">
          				<!-- 게시글 제목영역 -->
    					<h2 class=' collapse-title text'><a class="a" href="#content3"><img src="ma_assets/ma_img/Q.PNG"><p>별방은 어떤 서비스인가요?</p></a></h2>
            			<!-- 게시글 내용영역 -->
    					<div id="content3" class="content">제목1에 해당하는 내용입니다.</div>
	    			</div>
	    			<!-- 게시글 하나 단위 -->
    				<div class='collapse-item' id="itme">
          				<!-- 게시글 제목영역 -->
    					<h2 class=' collapse-title text'><a class="a" href="#content4"><img src="ma_assets/ma_img/Q.PNG"><p>별방은 어떤 서비스인가요?</p></a></h2>
            			<!-- 게시글 내용영역 -->
    					<div id="content4" class="content">제목1에 해당하는 내용입니다.</div>
	    			</div>
	    			<!-- 게시글 하나 단위 -->
    				<div class='collapse-item' id="itme">
          				<!-- 게시글 제목영역 -->
    					<h2 class=' collapse-title collapse-title3 text'><a class="a" href="#content5"><img src="ma_assets/ma_img/Q.PNG"><p>별방은 어떤 서비스인가요?</p></a></h2>
            			<!-- 게시글 내용영역 -->
    					<div id="content5" class="content">제목1에 해당하는 내용입니다.</div>
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

	               	// 클릭한 요소의 href 속성을 가져온다 --> 내용영역의 id

	               	 var con = document.getElementById("h2m");
				       con.style.display = 'block';
	    		});
	    	});	
		</script>
		
</body>








