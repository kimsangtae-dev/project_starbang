<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<style>
	#edit_form h1 {
		font-size: 30px;
	}

	#edit_form {
	    width: 350px;
	    height: 100%;
	    padding-left: 20px;
	    border: 2px solid #BDBDBD;
	    background-color: #eee;
	}
	
	#edit_form label {
		width: 80px;
    	text-align: right;
    	display: inline-block;
	}
	
	#edit_form div input {
		width: 190px;
	    height: 30px;
	    padding-left: 10px;
	    margin-left: 10px;
	}
	
	#edit_form div {
		padding-bottom: 5px;
	}
	
	.btn {
		text-align: center;
    	margin-top: 20px;
    	margin-bottom: 20px;
	}
	
	button {
	    width: 120px;
	    height: 40px;
	    font-size: 18px;
	}
	
	
</style>
</head>
<body>
	<div id="edit_form">
	<h1>회원정보 수정</h1>
	<form method="post" action="${pageContext.request.contextPath}/admin/userlist/edit_ok.do" id="user_fm">
	<%-- action 페이지에서 사용할 WHERE 조건값을 hidden필드로 숨겨서 전송한다. --%>
 		<input type="hidden" name="userno" value="${output.userno}" /> 
		
		<div>
			<label for="name">회원이름 : </label>
			<input type="text" name="name" id="name" value="${output.name}" />
		</div>
		<div>
			<label for="email"> 이메일 : </label>
			<input type="text" name="email" id="email" value="${output.email}" />
		</div>
		<div>
			<label for="passwd">비밀번호 : </label>
			<input type="text" name="passwd" id="passwd" value="${output.passwd}" />
		</div>
		<div>
			<label for="tel">전화번호 : </label>
			<input type="text" name="tel" id="tel" value="${output.tel}" />
		</div>
		<div>
			<label for="regdate">등록날짜 : </label>
			<input type="text" name="regdate" id="regdate" value="${output.regdate}" />
		</div>
		<div>
			<label for="editdate">수정날짜 : </label>
			<input type="text" name="editdate" id="editdate" value="${output.editdate}" />
		</div>
		<div>
			<label for="profile_img"> 이미지 : </label>
			<input type="text" name="profile_img" id="profile_img" value="${output.profile_img}" />
		</div>
		<div class="btn">
		<button type="submit">수정하기</button>
		<button type="reset">다시작성</button>
		</div>
	</form>
	</div>
</body>
</html>