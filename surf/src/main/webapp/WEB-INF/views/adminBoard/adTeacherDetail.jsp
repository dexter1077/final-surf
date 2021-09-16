<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사 관리</title>
</head>
<style>
  .innerOuter{width:80%; margin:auto;}  
  form, #btn2{
    width:700px;
    background:rgb(52, 152, 219); 
    padding:10px 150px;
  }
  form input, textarea{width:350px;}
  #btn2{padding-left:270px;}
  #img1{width:200px; height:200px; border-radius:100px; background-size:contain;}
</style>
<body>
	<jsp:include page="../admin/sidebar.jsp"/>
		 <!--여기서부터 우측 게시판-->
      <br>
	<div class="innerOuter" style="width: 950px">
		<br>
		<br>
		<br>
		<div>
			<h5>강사 관리 > 강사 상세조회</h5>
		</div>

		<hr>

		<form id="teacherForm" class="adTeacherForm" action="detailTeacher.ad" method="post" enctype="multipart/form-data">
			<div class="adTeacher">
			<input type="hidden" name="teacherNo" value="${t.teacherNo}">
			<h4>강사 신청 정보</h4>
			<br>

			<div id="img1" class="img1">
				<img src="${t.profileImage}" style="width:350px;">
			</div>
			<input type="file" name="file" style="display:none;" onchange="loadProfileImage(this);">			
			<br> 이메일<br> 
				<input type="email" class="form-control" name="emial" value="${ t.email }"><br>
			<br> 강사명<br> 
				<input type="text" class="form-control" name="nickname" value="${ t.nickname }"><br>
			<br> 핸드폰 번호<br> 
				<input type="text" class="form-control" name="phone" value="${ t.phone }"><br>
			<br> 강사님을 소개해주세요<br>
				<textarea class="form-control" name="introContent" rows="10">${ t.introContent }</textarea>
			<br>
			<br> 어떤 강의를 열고 싶으신가요?<br>
			<select name="mainCatName">
				<option value="대분류">${ t.mainCatName }</option>
			</select> 
			<select name="subCatName">
				<option value="소분류">${ t.subCatName }</option>
			</select> <br>
			<br>
			</div>
		</form>
      	<form id="udForm" action="" method="post">
      		<input type="hidden" name="tno" value="${ t.teacherNo }">
      	</form>		
		<div id="btn2">
				<a class="btn btn-info" href="javascript:updateForm(1);">승인</a>&nbsp;&nbsp;&nbsp; 
				<a class="btn btn-danger" href="javascript:updateForm(2);">반려</a>
		</div>
		
		
		<script>
			function updateForm(num){
				console.log(num);
				if(num == 1){ // 승인
					$("#udForm").attr("action", "updateYes.ad").submit();
				} else { // 반려
					$("#udForm").attr("action", "updateNo.ad").submit();
				}
			}
		</script>	
		
	</div>
	
	<script>
		function loadProfileImage(inputFile) {

			if (inputFile.files.length == 1) {    
				var reader = new FileReader();
				reader.readAsDataURL(inputFile.files[0]);
				reader.onload = function (e) { $(inputFile).parents('.adTeacher').find('img').attr("src", e.target.result); }
			} else {
				$(inputFile).parents('.adTeacher').find('img').attr("src", "resources/uploadFiles/profile_image/commonSample.png");
			}
		}
	</script>

</body>
</html>