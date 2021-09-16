<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>회원가입</title>

  <style>
    .easyJoin {
      width: 45%;
    }
  </style>
</head>

<body>

  <jsp:include page="../common/header.jsp" />

  <div class="body-outer">
    <br><br>

    <div class="sm-title">
      회원가입
      <hr style="background-color: rgb(32, 155, 212); height: 2px;">
    </div>
    <div style="width: 450px; height: 800px; margin: auto;" id="joinForm">
      <div class="container">
        <form action="insert.me" method="POST">

          
          <c:choose>
          	<c:when test="${ !empty snsUser }">
	          <input id="enrollType" type="hidden" name="enrollType" value="${ snsUser.enrollType }">
          	</c:when>
          	<c:otherwise>
	          <input id="enrollType" type="hidden" name="enrollType" value="L">
          	</c:otherwise>
          </c:choose>
          
          <!-- 아이디 -->
          <div class="form-group" style="margin-bottom: 0;">
            <label for="userId">
            	이메일
            	<c:if test="${snsUser.email eq '' }">
	            	<b style="color: blue; font-size: 11px;">반드시 SNS에 등록된 이메일을 입력해주세요.</b>
            	</c:if>
            </label>
            <input type="email" class="form-control" id="userId" name="email" placeholder="example@surf.com" value="${ snsUser.email }" required>
          </div>
          <div id="checkResult" style="font-size:0.8em; height: 16px; padding-top:5px; visibility:hidden;"></div>
          
          <!-- 아이디 확인 -->
          <div class="form-group">
            <label class="mt-2" for="checkId">이메일 확인</label>
            <input type="email" class="form-control" id="checkId" placeholder="example@surf.com" value="${ snsUser.email }" required>
          </div>
          
          <!-- 성별 -->
          <label class="mt-2" style="margin-right: 117px;">성별</label>
          <div class="form-check-inline">
            <label class="form-check-label mr-5" for="male">
              <input type="radio" class="form-check-input " id="male" name="gender" value="M" required>남자
            </label>
          </div>
          <div class="form-check-inline">
            <label class="form-check-label" for="female">
              <input type="radio" class="form-check-input" id="female" name="gender" value="F">여자
            </label>
          </div>

          <!-- 연령대 -->
          <div class="form-group">
            <label class="mt-4" for="agelist" style="display: inline-block; margin-right: 100px;">연령대</label>
            <select class="form-control" id="agelist" name="ageRange" style="display: inline-block; width: 35%;" required>
              <option selected>0</option>
              <option>10</option>
              <option>20</option>
              <option>30</option>
              <option>40</option>
              <option>50</option>
              <option>60</option>
              <option>70</option>
              <option>80</option>
              <option>90</option>
              
            </select>
          </div>
          
		  	<c:if test="${!empty snsUser and snsUser.gender ne ''}">
			  <script>
			  	$(function(){
			  		$("input[value=${snsUser.gender}]").attr("checked", true);
			  	})
			  </script>
		  	</c:if>
		  	
		  	<c:if test="${!empty snsUser and snsUser.ageRange ne ''}">
			  <script>
			  	$(function(){
			  		$("option").each(function(){
			  			if($(this).val() == '${snsUser.ageRange}'){
			  				$(this).attr("selected", true);
			  			}
			  		})
			  	})
			  </script>
		  	</c:if>
			
		  <!-- SNS로 가입하는 경우 보여지지 않음 -->	
		  <c:if test="${ empty snsUser }">
	          <!-- 비밀번호 -->
	          <div class="form-group">
	            <label class="mt-2" for="userPwd">비밀번호</label>
	            <input type="password" class="form-control" id="userPwd" name="password" placeholder="password" required>
	          </div>
	
	          <!-- 비밀번호 확인 -->
	          <div class="form-group" style="margin-bottom:0px;">
	            <label class="mt-2" for="checkPwd">비밀번호 확인</label>
	            <input type="password" class="form-control" id="checkPwd" name="checkPwd" placeholder="password" required>
	          </div>
	          <div id="checkPwdResult" style="font-size:0.8em; height: 16px; padding-top:5px; visibility:hidden; margin-bottom:5px;"></div>
		  </c:if>		
          
          <!-- submit 버튼 -->
          <div class="text-center">
            <button id="submitBtn" type="submit" class="btn btn-primary mt-2" style="width: 100%;">가입하기</button>
          </div>
        </form>
      </div>
	
	  <!---------------------------------- 간편회원가입 ---------------------------------------->
      <div class="hr-sect">간편회원가입</div>
      <div align="center">
        <a id="kJoinBtn" class="btn easyJoin" style="padding:0;"><img src="resources/images/kakao_login_large_narrow.png"></a>
        <a id="nJoinBtn" class="btn easyJoin" style="padding:0;"><img src="resources/images/StartWithNaverBtn.png"></a>
      </div>
      
      <script>
      	$(function(){
            $.ajax({
            	url:"kauth.do",
            	data:{type:"enroll"},
            	success:function(kUrl){
            		$("#kJoinBtn").on("click", function(){
            			location.href=kUrl;
            		})
            	}, error:function(){
            		console.log("ajax실패");
            	}
            })
            
            $.ajax({
            	url:"nauth.do",
            	data:{type:"enroll"},
            	success:function(nUrl){
            		$("#nJoinBtn").on("click", function(){
            			location.href=nUrl;
            		})
            	}, error:function(){
            		console.log("ajax실패");
            	}
            })            
      	})
      </script>
      
      
    </div>
    <br><br><br><br><br>
  </div>

  <jsp:include page="../common/footer.jsp" />

</body>


<script>
	$(function(){
		
		$userId = $("#userId");
		$checkId = $("#checkId");
		$checkResult = "";
		
		
		$("#userId").keyup(function(){
			
			if($userId.val().length > 5){
				$.ajax({
					url:"idCheck.me",
					data:{email:$userId.val(),
						  enrollType:$("#enrollType").val()
					}, success:function(result){
						if(result == "NN"){
							// 아이디 사용불가
							$("#checkResult").css("visibility", "visible");
							$("#checkResult").css("color", "red").text("중복된 아이디가 존재합니다.");
							$("#submitBtn").attr("disabled", true);
							$checkResult = "NN";
							
						} else {
							// 아이디 사용가능
							$("#checkResult").css("visibility", "visible");
							$("#checkResult").css("color", "green").text("멋진 아이디군요!");
							$checkResult = "YY";
							
						}
						
					}, error:function() {
						console.log("아이디 중복 체크 ajax통신 실패");	
					}
				})
			} else {
				$("#checkResult").css("visibility", "hidden");
				$("#submitBtn").attr("disabled", true);
			}
			
			// disabled : userId checkId 일치하는 상태(false)였다가 userId지우면 true가 되는데(위의 else블럭때문), 다시 일치상태로 만들면 false로 바꿔주기 위한 if문
			// (keyup이 발생한건 userId쪽이어서 아래의 checkId keyup에 if문은 실행하지 않으므로 false로 안됨..)
			if($("#userId").val() == $("#checkId").val() && $checkId.val() !=""){
				$("#submitBtn").removeAttr("disabled");
			} else {
				$("#submitBtn").attr("disabled", true);
			}
		})

		// 아이디(이메일) 재확인
		$("#checkId").keyup(function(){
			
			console.log($checkResult);
		
			if($checkResult == "YY" && $checkId.val() !="" && $userId.val() == $checkId.val()){
				// userPwd checkPwd 모두 비었을 경우 가입버튼 비활성화
				if($userPwd.val() == "" && $checkPwd.val() == "" && $userPwd.val() == $checkPwd.val()){
					$("submitBtn").attr("disabled", true);
				} else {
					$("#submitBtn").removeAttr("disabled");
				}
			} else {
				$("#submitBtn").attr("disabled", true);
			}
		})
		
		// userId checkId 모두 비었을 경우 가입버튼 비활성화
		if($userId == "" && $checkId == ""){
			$("submitBtn").attr("disabled", true);
		}
		
		/************ 비밀번호 재확인 ***********/
		$userPwd = $("#userPwd");
		$checkPwd = $("#checkPwd");

		$("#userPwd").keyup(function(){
			if($userPwd.val() == $checkPwd.val()){
				$("#checkPwdResult").css("visibility", "hidden");				
				if($checkResult == "YY" && $userId.val() == $checkId.val() && $userPwd.val() != ""){
					$("#submitBtn").removeAttr("disabled");
				}
			} else {
				$("#submitBtn").attr("disabled", true);
			}
		})
		
		$("#checkPwd").keyup(function(){
			if($userPwd.val() == $checkPwd.val()){
				$("#checkPwdResult").css("visibility", "hidden");				
				if($checkResult == "YY" && $userId.val() == $checkId.val() && $userPwd.val() != ""){
					$("#submitBtn").removeAttr("disabled");
				}
					
			} else {
				$("#checkPwdResult").css("visibility", "visible");
				$("#checkPwdResult").css("color", "red").text("비밀번호가 일치하지 않습니다.");
				$("#submitBtn").attr("disabled", true);
			}
		})
			
		if($userPwd.val() == "" && $checkPwd.val() == ""){
			$("#submitBtn").attr("disabled", true);
		}
	})	
</script>


</html>