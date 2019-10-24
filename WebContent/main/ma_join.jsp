<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../assets/inc/meta.jsp"%>
<link rel="stylesheet" type="text/css" href="../main/ma_assets/ma_rmdt.css" />
<link rel="stylesheet" type="text/css" href="../assets/header_white.css" />
<link rel="stylesheet" type="text/css" href="../assets/footer_black.css" />

<link rel="stylesheet" type="text/css" href="../main/ma_assets/ma_join.css" />

</head>
<body>
	 <!-- 화면 영역 -->
		<div class="container">
    		<h1 class="page-header">Bootstrap Modal Open</h1>
    		<!-- 링크로 모달 열기 -->
    		<a href="#" class="btn btn-primary" data-toggle="modal" data-target="#myModal">open modal</a>
		</div>
        <!-- 화면 영역 끝 -->

		<!-- Modal -->
		<div class="modal fade" id="myModal" class="siz">
    		<div class="modal-dialog modal-sm siz modaltop">
    		    <div class="modal-content">
        		    <div class="modal-header hheader">
            		    <button type="button" class="close radius" data-dismiss="modal" aria-label="Close" 
            		    class="btn btn-primary">
	                    <span aria-hidden="true" class="radius"/>&times;</span></button>
		                <h4 class="modal-title">회원가입</h4>
    		        </div>
            		<div class="modal-body">
            			<div class="Information2">
            				<p>이름</p>
		        	        <input type="text" name="userId"/>
		        	    </div>
		        	    <div class="Information">
            				<p>이메일</p>
		        	        <input type="text" name="useremail" class="email" /> @ 
		        	   		<select>
		        	        		<option>naver.com</option>
		        	        		<option>gmail.com</option>
		        	  		</select>
		        	    </div>
		        	    <div class="Information">
            				<p>비밀번호</p>
		       		         <input type="passwd" name="passwd"/>
		        	    </div>
		        	    <div class="Information">
            				<p>비밀번호확인</p>
		        	   	     <input type="passwd" name="repasswd"/>
		        	    </div>
		        	    <div class="Information">
            				<p>휴대폰 번호</p>
		           		     <input type="number" name="pin1" class="pin"/> -
		            	    <input type="number" name="pin2" class="pin"/> -
		            	    <input type="number" name="pin3" class="pin"/>
		            	    <button class="btn btn-primary btn-color">인증번호 요청</button>
		            	</div class="Information">
		            	<div class="numberdiv">
		            		<input type="number" name="pingaree" class="number" />
		            		<button class="btn btn-primary btn-color">인증번호 확인</button>
		            	</div>
		            </div>
		            <div class="Information3">
		            	<p class="p">*만 14세 이상 회원 가입 가능합니다. 해당 내용은 <a href="#">이용약관 및 정책</a>에서도 확인이 가능합니다</p>
		            </div>
		        </div>
		        <div>
		        	<button class="joinbutton btn btn-colordown buttontlzl">이메일 회원가입</button>
		        </div>
            </div>
        </div>
    
    <!-- Javascript -->
	<script src="../assets/js/jquery-1.10.2.min.js"></script>
	<script src="../assets/js/bootstrap.min.js"></script>
	<script type="text/javascript">

		</script>
		
</body>








