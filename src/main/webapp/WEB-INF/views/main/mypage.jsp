<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 


<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../assets/inc/meta.jsp"%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/etc/reset.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/ma_css/ma_mypager.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/plugin/sweetalert/sweetalert2.css">

<!-- Javascript -->
   <script src="${pageContext.request.contextPath}/assets/js/jquery-1.10.2.min.js"></script>
   <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
   <script src="${pageContext.request.contextPath}/assets/plugin/sweetalert/sweetalert2.all.min.js"></script>
   <!-- 모달창 -->
   <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

<script type="text/javascript">
$(function () {
			$("#ex_file").change(function(e) {
				$("#inputsubmit").click();
			});
		});
</script>

</head>
<body>
   <!-- 상단 영역 -->
   <%@ include file="../assets/inc/ma_top.jsp"%>

    <!-- 중앙 영역 -->
         <div id="content" class="container box">
            <div class="h">
               <h1 class="h1">MY별방</h1>
            </div>
            <div class="div2">
            <!-- 아직 프로필 수정은 새로고침과 window에서 설정을 해주어야 실행된다 -->
              <div class="imgs_wrap imgupload" id="imgupload" >
        		<c:choose>
					<c:when test="${output.profile_img == null}">
						<img src="${pageContext.request.contextPath}/assets/img/ma_img/mypa.png" id="proflie">
					</c:when>
					<c:when test="${output.profile_img != null}">
						<img src="${pageContext.request.contextPath}/assets/img/upload/${output.profile_img}" id="proflie" />
						<!-- "${pageContext.request.contextPath}/${fn:substring(output.profile_img ,63, fn:length(output.profile_img))}" -->
					</c:when>
				</c:choose>
       		</div>
       		
       		<form method="post" action="${pageContext.request.contextPath}/main/Profileupload_ok.do" enctype="multipart/form-data">
	       		<div class="div2">
	    			<div class="filebox">
					    <!-- <input type="button" onClick="ajaxFileUpload();" value="업로드"/>
		    			<input type="file" id="ajaxFile" onChange="ajaxFileChange();" style="display:none;"/>
		    			<input type="submit" id="inputsubmit" style="display:none;" > -->
	                	<label for="ex_file">프로필 사진 변경
	               		<input type="file" id="ex_file" name="profile_img" >  <!-- onchange="handleFiles(this.files)" -->
	               		<input type="submit" value="보내기" id="inputsubmit" style="display:none;" ></label>
	            	</div>
	            </div>
            </form> 
            </div>
            <br/>
            <div id="textcontent">
               <h3 class="h31">본인 성명</h3>
	               <input type="hidden" value="${output.userno}" id="userno" >
	               <input type="hidden" id="nowmyname" value="${output.name}">
	               <input type="text" id="myname" name="myname" value="${output.name}" class="input" >
               <h3 class="h32">이메일주소</h3>
					<input type="hidden" id="nowemail" value="${output.email}">
					<input type="text" name="email" id="email" disabled value="${output.email}" class="emailmypage">
					<button type="button" class="btn btn-default focse ponbutton" id="reemail">변경</button>
               <button type="button" class="btn btn-default focse ponbutton reemailaut" id="reemailaut">인증</button>
               <div id="emailinumberdiv">
                  <input type="number" name="emailinumber" id="emailinumber" class="emailinumber emailmypage">
                  <button type="button" class="btn btn-default focse reemailinumber" id="reemailinumber">인증번호확인</button>
               </div>
               <h3 class="h33">휴대폰 번호</h3>
               <input type="hidden" id="nowallpon" value="${output.tel}"> 
                <select class="pon input" name="pont1" id="pon1" value="${fn:substring(output.tel,0,3)}" >
					<option value="010" >010</option>
					<option value="011" >011</option>
					<option value="016" >016</option>
					<option value="017" >017</option>
					<option value="018" >018</option>
					<option value="019" >019</option>
				</select> - 
               <input type="number" name="pont2" id="pon2" value="${fn:substring(output.tel,4,8)}" disabled class="pon input"> - 
               <input type="number" name="pont3" id="pon3" value="${fn:substring(output.tel,9,13)}" disabled class="pon input">
               <button type="button" class="btn btn-default focse ponbutton" id="repon">변경</button>
               <h3 class="h34">휴대폰 번호</h3>
               <input type="hidden" value="${output.passwd}" id="pwd" >
               <input type="passwd" name="pwd1" id="pwd1" class="pwd input" placeholder="현재비밀번호를 입력하세요">
               <br/>
               <input type="passwd" name="pwd2" id="pwd2" class="pwd input" placeholder="변경될 비밀번호를 입력하세요" >
               <br/>  
               <input type="passwd" name="pwd3" id="pwd3" class="pwd2 input" placeholder="변경될 비밀번호를 한 번 더 입력하세요" >
               <br/>
            </div>
            <hr class="hr" />
            <button type="reset" id="resert" class="btn btn-default focse" onclick="location='${pageContext.request.contextPath}/'">취소</button>
            <button type="submit" id="submitedit" class="btn btn-default">확인</button>
            <p class="rhdrks"></p>
            <button id="out" class="btn btn-link bot outall" data-toggle="modal" data-target="#outall">회원탈퇴</button>
            <p class="rhdrks2"></p>
         </div>
         
         <!-- 하단 영역 -->
   <%@ include file="../assets/inc/ma_bottom.jsp"%>
    
    <!-- Javascript -->
   <script src="${pageContext.request.contextPath}/assets/js/jquery-1.10.2.min.js"></script>
   <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
   <script src="${pageContext.request.contextPath}/assets/plugin/sweetalert/sweetalert2.all.min.js"></script>
   <!-- 모달창 -->
   <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
   <script type="text/javascript">
   $(function() {
       /** 변경 버튼 */
      $('#reemail').one("click", function() {
         var reemail = document.getElementById('reemail'); 
         var email = document.getElementById('email'); 
         var reemailinumber = document.getElementById("reemailinumber");
         var emailinumber = document.getElementById("emailinumber");
         var emailinumberdiv = document.getElementById("emailinumberdiv");
         var reemailaut = document.getElementById("reemailaut");
         /**email.readonly = true; */
               
         $reemail = $('#email').attr('disabled', false);
         reemailinumber.style.display = 'block';
         emailinumber.style.display = 'block';
         emailinumberdiv.style.height = '60px';
          $("#reemail").html("인증");
         $reemail = $('#reemail').attr('display', none);
         $reemailaut = $('#reemailaut').attr('display', inline-block); 
      });
       
       $('#reemail').on("click", function() {
         $("#reemail").html("인증");
          swal("새로운 이메일에 인증번호를 발송했습니다");
      });
      
       /** 휴대폰 번호 바꿈 */
      $("#repon").click(function(e) {
         var repon = document.getElementById('repon'); 
         var pon1 = document.getElementById('pon1');
         var pon2 = document.getElementById('pon2');
         var pon3 = document.getElementById('pon3');
   
         $repon = $('#pon1').attr('disabled', true);
         $repon = $('#pon1').attr('disabled', false);
         
         $repon = $('#pon2').attr('disabled', true);
         $repon = $('#pon2').attr('disabled', false);
         
         $repon = $('#pon3').attr('disabled', true);
         $repon = $('#pon3').attr('disabled', false);
         
      });
      
      /** 이메일인증확인창 */
      $("#reemailinumber").click(function() {
         swal("인증되었습니다");
      });


      $('#modal').modal("hide"); //닫기 
      
      var myname = document.getElementById('myname'); 
      var mynamevalue = $('#myname').val();
      
      /** 확인버튼 */
      $("#submit").click(function() {
         
         if(!mynamevalue.equals($('#myname').val())) {
            swal("이름이 변경되었습니다")
         }
         
         
      });
   });

</script>
      
<!--    <script type="text/javascript">
      // 회원탈퇴에 모달창에 들어 있는 버튼
      function byId(e){return document.getElementById(e);}
   
      window.addEventListener('load', mInit, false);

      function mInit()
      {
          var tgt = byId('modelcheck');
          tgt.secondSource = 'ma_assets/ma_img/eede.png';
      }

      function byId(e){return document.getElementById(e);}

      function action() 
      {
          var tgt = byId('modelcheck');   
          var tmp = tgt.src;
          tgt.src = tgt.secondSource;
          tgt.secondSource = tmp;
      };
   </script>  -->  
      
   <script type="text/javascript">
      $("#modalsubmit").click(function() {
         swal("탈퇴되었습니다");
      })
   </script>
      
</body>



      <!-- 탈퇴 -->
      <div class="modal fade modalwit" id="outall">
         <div class="modal-content modal-contentwit">
            <div class="modal-header">
                   <h4>회원탈퇴</h4>
                </div>
            <div class="modal-body modalbody modalcont" id="modaloutcheck">               
               <h4 class="modal-title">회원탈퇴를 신청하기전에 아래 안내 사항을 한번 더 확인해주세요.</h4>
               <br/>
               <pre class="mypageoutpre">
1. 회원 탈퇴 시, 현재 로그인된 아이디는 즉시 탈퇴 처리됩니다. 
2. 회원 탈퇴 시, 회원 전용 웹 서비스 이용이 불가합니다. 
3. 탈퇴 시 회원 정보 및 찜 서비스, 등록한 게시물 이용 기록이 모두 삭제됩니다. 
4. 회원 정보 및 서비스 이용 기록은 모두 삭제되며, 삭제된 데이터는복구되지 않습니다. 
5. 광고를 위한 매물이 등록되어 있을 경우, 탈퇴 시 모든 정보는 삭제 처리됩니다.
               </pre>
               <textarea rows="10" cols="64" placeholder="탈퇴사유를 써주세요" class="outtextarea"></textarea>
               <!-- <button onClick="action();" class="actionbutton"><img src="ma_assets/ma_img/eede.png" width="16px" id="modelcheck" class="buttonimg"></button> -->
               <label> <input type="checkbox" name="room-type" value="oneroom" checked /> 
               <span class="checkBox"></span> <span class="checkText checkTextspan">안내사항을 모두 확인하였으며, 이에 동의합니다.</span>
                           </label>
               <!-- <p class="modelpp" >안내사항을 모두 확인하였으며, 이에 동의합니다.</p> -->
            </div>
            <div class="modal-footer modal-footerhw ">
               <button type="submit" id="modalsubmit" class="btn btn-default btnmodaloutsubmit" data-dismiss="modal" >확인</button>
            </div>
         </div>
      </div>












