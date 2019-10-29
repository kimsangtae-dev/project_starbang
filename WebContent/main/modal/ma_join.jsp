<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<link rel="stylesheet" type="text/css" href="ma_assets/modal/ma_join.css" />

</head>


<body>
	 <!-- 화면 영역 -->
<!-- 	<div class="container">
		<h1 class="page-header">Bootstrap Modal Open</h1>
		링크로 모달 열기
		<a href="#" class="btn btn-primary" data-toggle="modal" data-target="#myModal">open modal</a>
	</div> -->
	<!-- 화면 영역 끝 -->

	<!-- Modal -->
	<!-- <div class="modal fade" id="myModal" class="siz">
		<div class="modal-dialog siz modaltop"> -->
			<div class="modal-content wholething">
				<div class="modal-header hheader">
					<button type="button" class="close radius" data-dismiss="modal" aria-label="Close" 
					class="btn btn-primary">
					<span aria-hidden="true" class="radius"/>&times;</span></button>
					<h4 class="modal-title">회원가입</h4>
				</div>
				<div class="modal-body padding">
					<div class="information clearfix">
						<p class="subtitle">이름</p>
						<input class="input1" type="text" name="userId" class="full-wid input1" />
					</div>
					<div class="information information2 clearfix">
						<p class="subtitle">이메일</p>
						<input type="text" name="useremail" class="email input1" />
						<p class="wid">@</p>
						<select class="select-email select1">
							<option>선택해주세요</option>
							<option>naver.com</option>
							<option>gmail.com</option>
						</select>
						<button class="btn btn-color">인증번호 요청</button>
					</div>
					<div class="information information2 numberdiv clearfix">
						<p class="subtitle"></p>
						<input type="text" name="pingaree" class="number input1" />
						<button class="btn btn-color">인증번호 확인</button>
					</div>
					<div class="information information2 clearfix">
						<p class="subtitle">비밀번호</p>
						<input type="passwd" name="passwd" class="full-wid input1" placeholder="비밀번호" />
					</div>
					<div class="information information2 clearfix">
						<p class="subtitle">비밀번호확인</p>
						<input type="passwd" name="repasswd" class="full-wid input1" placeholder="비밀번호확인" />
					</div>
					<div class="information information2 clearfix">
						<p class="subtitle">휴대폰 번호</p>
						<select class="select-tel pin select1">
							<option>010</option>
							<option>011</option>
							<option>016</option>
							<option>017</option>
							<option>018</option>
							<option>019</option>
						</select>
						<p class="wid">-</p>
						<input type="number" name="pin2" class="pin input1"/><p class="wid">-</p>
						<input type="number" name="pin3" class="pin input1"/>
					</div class="info Information">
					<div class="Information3">
						<p class="p">*만 14세 이상 회원 가입 가능합니다. 해당 내용은 <a href="#">이용약관 및 정책</a>에서도 확인이 가능합니다</p>
					</div>
				</div>
				<div>
					<button class="joinbutton btn btn-colordown buttontlzl">이메일 회원가입</button>
				</div>
			</div>