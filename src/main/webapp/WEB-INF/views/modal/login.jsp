<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<head>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/modal_css/login.css">
</head>
<div class="modal-content love">
    <!-- 닫기버튼 -->
    <button class="btnclose" data-dismiss="modal">
        <svg width="30" height="30" viewbox="0 0 32 32">
            <g fill="none" fill-rule="evenodd" transform="translate(1 1)">
                <circle class="Circle" cx="15" cy="15" r="15"></circle>
                <g class="Close" stroke-linecap="round" stroke-width="2">
                    <path d="M19.243 19.243l-8.486-8.486M19.243 10.757l-8.486 8.486"></path>
                </g>
            </g>
        </svg>
    </button>
    <!-- 상단 전체박스 시작 -->
    <div class="topbox-div">
        <!-- 제목 -->
        <h3 class="login-h3">
            <b>로그인</b>
        </h3>
        <!-- 로그인윗부분 -->
        <div class="login" id="">
            <form
                method="post" action="${pageContext.request.contextPath}/modal/login_ok.do">
                <!-- 아이디 / 패스워드 -->
                <input autocomplete="off" class="idpass" type="text" placeholder="아이디" name="email" id="loginid" value=""/>
                <input autocomplete="off" class="idpass" type="password" placeholder="비밀번호" name="passwd" value=""/>
                <div
                    class="checkbox-d">
                    <!-- 아이디저장 - 체크박스 -->
                    <label class="checkbox-l clearfix" size="22">
                        <input type="checkbox" class="checkbox-i" name="isSaved" id="isSaved" value="">
                        <span class="checkbox-s"></span>
                        <p class="checkbox-p">아이디 저장</p>
                    </label>
                    <!-- 비밀번호 찾기 -->
                    <a href="<%=request.getContextPath()%>/modal/pwd.do" data-dismiss="modal" data-toggle="modal" data-target="#passwdModal" class="findpw-a">비밀번호 찾기</a>
                </div>
                <button class="login-button" type="submit" id="loginbtn">
                    <span class="login-span">로그인</span>
                </button>
            </form>
            <div class="joinus-div">
                <p>아직 회원이 아니세요?
                    <a href="<%=request.getContextPath()%>/modal/agree.do" id="join" data-dismiss="modal" data-toggle="modal" data-target="#agreeModal">이메일로 회원가입</a>
                </p>
            </div>
        </div>
    </div>

<!-- ID저장하기 쿠키 -->
<script type="text/javascript">
    $(document).ready(function () {
        var userInputId = getCookie("userInputId");
        var setCookieYN = getCookie("setCookieYN");
        if (setCookieYN == 'Y') {
            $("#isSaved").prop("checked", true);
        } else {
            $("#isSaved").prop("checked", false);
        }
        $("#loginid").val(userInputId);
        // 로그인 버튼 클릭
        $('#loginbtn').click(function () {
            if ($("#isSaved").is(":checked")) {
                var userInputId = $("#loginid").val();
                setCookie("userInputId", userInputId, 60);
                setCookie("setCookieYN", "Y", 60);
            } else {
                deleteCookie("userInputId");
                deleteCookie("setCookieYN");
            }
            document.submit();
        });
    });
    // 쿠키값 Set
    function setCookie(cookieName, value, exdays) {
        var exdate = new Date();
        exdate.setDate(exdate.getDate() + exdays);
        var cookieValue = escape(value) + (
            (exdays == null)
                ? ""
                : "; expires=" + exdate.toGMTString()
        );
        document.cookie = cookieName + "=" + cookieValue;
    }
    // 쿠키값 Delete
    function deleteCookie(cookieName) {
        var expireDate = new Date();
        expireDate.setDate(expireDate.getDate() - 1);
        document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
    }
    // 쿠키값 가져오기
    function getCookie(cookie_name) {
        var x,
            y;
        var val = document.cookie.split(';');
        for (var i = 0; i < val.length; i++) {
            x = val[i].substr(0, val[i].indexOf('='));
            y = val[i].substr(val[i].indexOf('=') + 1);
            x = x.replace(/^\s+|\s+$/g, ''); // 앞과 뒤의 공백 제거하기
            if (x == cookie_name) {
                return unescape(y); // unescape로 디코딩 후 값 리턴
            }
        }
    }
</script>