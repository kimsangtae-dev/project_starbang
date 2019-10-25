<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!-- 헤더 -->
<style>
/* ------------------------------------------
|   헤더
------------------------------------------- */

/* 헤더 */
.header-nav {
    width: 100%;
    min-width: 1440px;
    height: 74px;
    /* background-color: rgb(81, 136, 244); */
    position: absolute;
    top: 0px;
    left: 0px;
    z-index: 2;
}

/* 헤더-relative */
.header-div1 {
    width: 1440px;
    height: 100%;
    padding-right: 20px;
    position: relative;
    margin: 0px auto;
}

/* 헤더 - 왼쪽 홈 링크 */
.header-div1-a {
    width: 52.44px;
    height: 45px;
    position: absolute;
    top: 5px;
    left: 40px;
    background: url(/static/media/bi.44a34c4c.svg) center center / cover no-repeat;
}

.header-div1-a > img {
    width: 70px;

}

/* 헤더 - 오른쪽 탭 전체박스 */
.header-div2 {
    float: right;
}

/* 헤더 - 왼쪽 세개 버튼 */
.header-div2-ul {
    float: left;
    line-height: 74px;
}

.header-div2-ul > li {
    position: relative;
    float: left;
    list-style:none;
}

/* 헤더 - 탭 내부 - p */
.header-div2-p {
    display: inline;
    color: rgb(255, 255, 255);
    font-size: 15px;
    font-weight: 700;
    cursor: pointer;
    user-select: none;
    padding: 0px 20px;
}

/* 헤더 - 드롭박스 (ul) */
.header-dropbox {
    float: left;
    width: 100px;
    margin: 17px 30px 0 9px;
    user-select: none;
}
.header-dropbox li svg {
    position: absolute;
    top: 50%;
    right: 10px;
    transform: translateY(-50%);
}

.header-dropbox li {
    display: none;
}

.header-dropbox li:first-child {
    display: block;
}

.header-dropbox li {
    height: 40px;
    opacity: 0.8;
    color: rgb(255, 255, 255);
    font-size: 14px;
    position: relative;
    padding: 13px 15px 13px 16px;
}

/* 헤더 - 드롭박스 (li2) */
.header-dropbox-li2 {
    height: 50px !important;
    border-top: 1px solid rgb(231, 231, 231);
    border-bottom: 1px solid rgb(231, 231, 231);
    padding: 18px 16px !important;
}

/* 헤더 - 드롭박스 (li3) 버튼 */
.header-dropbox-li3 {
    font-size: 14px;
    line-height: 14px;
    background-color: rgb(255, 255, 255);
    color: rgb(102, 102, 102);
    border-width: 0px;
    padding: 0;
}

/* 열렸을 때 */
.header-dropbox-open {
    float: left;
    width: 100px;
    margin: 17px 30px 0 9px;
    user-select: none;
    background-color: white;
    box-shadow: rgba(0, 0, 0, 0.12) 0 1px 3px 0;
    border: 1px solid rgba(0, 0, 0, 0.12);
    border-image: initial;
    border-radius: 3px;
}

.header-dropbox-open li {
    height: 40px;
    opacity: 0.8;
    color: white;
    font-size: 14px;
    position: relative;
    padding: 13px 15px 13px 16px;
    color: #666666;
}
</style>
<nav class="header-nav">
	<div class="header-div1">
		<a href="../main/ma_main.html" class="header-div1-a"><img
			src="../assets/ico/logo_white.png"></a>
		<div class="header-div2">
			<!-- <a href="../main/ma_main.html" class="header-div1-a"><img src="../assets/ico/logo_white.png"></a>
                        <div class="header-div2"><a href="../main/ma_main.html">회원사이트</a></div> -->
			<ul class="header-div2-ul">
				<li>
					<p class="header-div2-p">방주인 소개</p>
				</li>
				<li>
					<p class="header-div2-p">공실 등록하기</p>
				</li>
				<li>
					<p class="header-div2-p">공실관리</p>
				</li>
			</ul>
			<!-- 드롭박스 -->
			<ul class="header-dropbox">
				<li>김기홍 님<svg width="8" height="5" viewBox="0 0 8 5">
                                <path fill="#fff" fill-rule="evenodd"
							d="M7.927.087A.22.22 0 0 0 7.58.081L7.58.08 4 4.09.42.08V.08a.22.22 0 0 0-.347.006.345.345 0 0 0 0 .424L.08.517V.52L3.83 4.72V4.72a.22.22 0 0 0 .34 0v.001L7.92.52V.517l.007-.006a.345.345 0 0 0 0-.424"></path>
                            </svg>
				</li>
				<li class="header-dropbox-li2">
					<p>회원정보</p>
				</li>
				<li>
					<button class="header-dropbox-li3">로그아웃</button>
				</li>
			</ul>
		</div>
	</div>
</nav>
<!-- header 끝 -->