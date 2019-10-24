<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<%@ include file="../assets/inc/meta.jsp"%>

<!-- css 적용 -->
<link rel="stylesheet" type="text/css" href="ma_assets/ma_main.css">

</head>
<body>

<!----------------------------------------
-	header 								     -
----------------------------------------->
<%@ include file="./ma_assets/ma_inc/top.jsp"%>


<!----------------------------------------
-	content 								     -
----------------------------------------->
<!-- 중앙 영역 시작 -->
    <div id="content">
      <!-- 검색창 시작 -->
      <div id="search">
        <div class="text-center">
          <p class="text-center"><span class="text-center">어떤 동네, 어떤 방</span>에서</p>
          <p>살고 싶으신가요?</p>
        </div>
        <form>
          <div>
            <input type="text" name="">
            <i class="glyphicon glyphicon-search"></i>
            <button href="#" class="btn btn-primary">방 찾기</button>
          </div>
        </form>
      </div>
      <!-- 검색창 끝 -->

      <!-- 쉬운방찾기시작 -->
      <div id="easyfind">
        <div class="text-center easy-box1">
          <span >쉬운 방찾기</span>
          <p>방 찾기 초보를 위한 초간단 솔루션!</p>
        </div>
        <div class="slide-div1">
          <div class="slide-div2" id="slide-container">
            <div class="slide-div3" id="slides" style="right: 0px;">
              <a class="slide-a" href="ma_rmdt.html">
                <div class="slide-a-div1">
                  <div class="slide-a-div1-up1"></div>
                  <div class="slide-a-div1-down">
                    <p>월세 + 관리비</p>
                    <p>월 50 이하 원룸</p>
                  </div>
                </div>
              </a>
              <a class="slide-a" href="ma_rmdt.html">
                <div class="slide-a-div1">
                  <div class="slide-a-div1-up2"></div>
                  <div class="slide-a-div1-down">
                    <p>보증금</p>
                    <p>500 이하 원룸</p>
                  </div>
                </div>
              </a>
              <a class="slide-a" href="ma_rmdt.html">
                <div class="slide-a-div1">
                  <div class="slide-a-div1-up3"></div>
                  <div class="slide-a-div1-down">
                    <p>반려동물</p>
                    <p>가능한 원룸</p>
                  </div>
                </div>
              </a>
              <a class="slide-a" href="ma_rmdt.html">
                <div class="slide-a-div1">
                  <div class="slide-a-div1-up4"></div>
                  <div class="slide-a-div1-down">
                    <p>낭만적인</p>
                    <p>옥탑방 원룸</p>
                  </div>
                </div>
              </a>
              <a class="slide-a" href="ma_rmdt.html">
                <div class="slide-a-div1">
                  <div class="slide-a-div1-up5"></div>
                  <div class="slide-a-div1-down">
                    <p>2억 이하</p>
                    <p>전세 투쓰리룸</p>
                  </div>
                </div>
              </a>
              <a class="slide-a" href="ma_rmdt.html">
                <div class="slide-a-div1">
                  <div class="slide-a-div1-up6"></div>
                  <div class="slide-a-div1-down">
                    <p>전세자금대출
                    </p>
                    <p>
                    가능한 투쓰리룸</p>
                  </div>
                </div>
              </a>
              <a class="slide-a" href="ma_rmdt.html">
                <div class="slide-a-div1">
                  <div class="slide-a-div1-up7"></div>
                  <div class="slide-a-div1-down">
                    <p>보증금
                    </p>
                    <p>1천 이하 오피스텔</p>
                  </div>
                </div>
              </a>
              <a class="slide-a" href="ma_rmdt.html">
                <div class="slide-a-div1">
                  <div class="slide-a-div1-up8"></div>
                  <div class="slide-a-div1-down">
                    <p>단기임대</p>
                    <p>가능한 오피스텔</p>
                  </div>
                </div>
              </a>
              <a class="slide-a" href="ma_rmdt.html">
                <div class="slide-a-div1">
                  <div class="slide-a-div1-up9"></div>
                  <div class="slide-a-div1-down">
                    <p>3억 이하</p>
                    <p>전세 아파트</p>
                  </div>
                </div>
              </a>
            </div>
          </div>
          
          <div class="slides-navigation">
          <button class="slide-button next">
            <svg width="10" height="16" viewBox="0 0 10 16">
              <path fill="none" fill-rule="evenodd" stroke="#666" d="M2 14l6-6-6-6"></path>
            </svg>
          </button>
          </div>
        
        </div>
        <div class="slidepage-div">
          <p class="slidepage-p1">01</p>
          <p class="slidepage-p2">02</p>
        </div>
      </div>
    <!-- 쉬운방찾기 끝 -->

    <!-- 최근본방/찜한 방 -->
    <div id="recent" class="recent">
      <div class="recent-div0">
        <div class="recent-div1">김기홍님의 최근 본 방</div>
        <div class="recent-div2" id="slides">찜한 방</div>
        <div class="recent-div3"><span>최근에 본 방과 찜한방을 볼 수 있어요</span></div>
        <!-- 갤러리 전체 박스 -->
        <div class="recent-div4"> 
          <!-- 각각 갤러리 시작 -->
          <!-- 1번째 갤러리 -->
          <div class="recent-div5">
            <div class="recent-div6">
              <!-- 좋아요 버튼 -->
              <div class="recent-div7">
                <div class="recent-div8"></div>
              </div>
              <!-- 좋아요 끝 -->
              <!-- 전체 링크화 -->
              <a target="_blank" rel="" class="recent-a" href="ma_rmdt.html">
                <!-- 이미지 -->
                <div class="recent-a-div"></div>
                <!-- 확인매물 div -->
                <div class="recent-a-confirm">
                  <div class="recent-a-confirm-div" type="">
                    <span class="bold">확인매물</span>
                    <span>19.09.25</span>
                  </div>
                </div>
                <!-- 확인매물 끝 -->
                <p class="recent-a-p1">투룸</p>
                <p class="recent-a-p2">
                  <span>전세 1억4000</span>
                </p>
                <p class="recent-a-p34">5층, 33.05m², 관리비 3만</p>
                <p class="recent-a-p34">▶▶화곡동 최저가 2룸 전세◀◀</p>
              </a>
            </div>
          </div>
          <!-- 첫번째 갤러리 끝 -->

          <!-- 2번째 갤러리 -->
          <div class="recent-div5 margin">
            <div class="recent-div6">
              <!-- 좋아요 버튼 -->
              <div class="recent-div7">
                <div class="recent-div8"></div>
              </div>
              <!-- 좋아요 끝 -->
              <!-- 전체 링크화 -->
              <a target="_blank" rel="" class="recent-a" href="ma_rmdt.html">
                <!-- 이미지 -->
                <div class="recent-a-div recent-a-div2"></div>
                <!-- 확인매물 div -->
                <div class="recent-a-confirm">
                  <div class="recent-a-confirm-div" type="">
                    <span class="bold">확인매물</span>
                    <span>19.09.22</span>
                  </div>
                </div>
                <!-- 확인매물 끝 -->
                <p class="recent-a-p1">원룸</p>
                <p class="recent-a-p2">
                  <span>월세 1000/45</span>
                </p>
                <p class="recent-a-p34">4층, 33.05m², 관리비 5만</p>
                <p class="recent-a-p34">신대방역 역세권 넓고 깔끔한 원룸</p>
              </a>
            </div>
          </div>
          <!-- 두번째 갤러리 끝 -->

          <!-- 3번째 갤러리 시작 -->
          <div class="recent-div5-vacant margin">
            <p class="recent-div5-vacant-p">아직 못 본 더 많은 방이 있어요.</p>
          </div>
          <!-- 4번째 갤러리 끝 -->

          <!-- 4번째 갤러리 시작 -->
          <div class="recent-div5-vacant margin">
            <p class="recent-div5-vacant-p">아직 못 본 더 많은 방이 있어요.</p>
          </div>
          <!-- 4번째 갤러리 끝 -->
          
        </div>
        <!--  갤러리 전체박스 끝 -->
        
      </div>
      <!-- div0 끝 -->
        
    </div>
    <!-- 최근본방 / 찜한방 끝  -->
  </div>
<!-- content 끝 -->

<!----------------------------------------
-	footer 							     -
----------------------------------------->
<%@ include file="./ma_assets/ma_inc/bottom.jsp"%>

</body>
</html>