<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고 상세 조회</title>
</head>
<body>
<br>
	<jsp:include page="sidebar.jsp"/>
	
      <div class="ml-4" style="width:950px">
        <br><br><br>
        <div>
          <h4>광고베너관리>광고상세조회</h4>
        </div>
        <hr>
        <div align="center">
                <table class="table table-bordered" style="width: 1000px;">
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td>${ Ad.adTitle }</td>
                    </tr>
                    <tr>
                        <th><label for="upfile">첨부파일</label></th>
                        <td>${ Ad.originName }</td>
                    </tr>
                    <tr>
                        <th ><label for="content">링크</label></th>
                        <td >${ Ad.adLink }</td>
                    </tr>
                  </table>
              <br>
  			<div>
              <div class="bottom" id="buttons" align="right">
                  <a class="btn btn-secondary btn-sm" onclick="postFormSubmit(1)">수정</a> &nbsp;
                  <a class="btn btn-dark btn-sm" onclick="postFormSubmit(2)">삭제</a> &nbsp;
                  <a type="button" class="btn btn-primary btn-sm" href="list.bo">목록으로</a>
              </div> 
              <form id="postForm" action="" method="post">
	            	<input type="hidden" name="bno" value="${ Ad.adNo }">
	            	<input type="hidden" name="filePath" value="${ Ad.changeName }">
	            </form>
	            
	            <script>
	            	function postFormSubmit(num){
	            		if(num == 1){ // 수정하기 클릭시
	            			$("#postForm").attr("action", "updateForm.ad").submit();
	            		}else{ // 삭제하기 클릭시
	            			$("#postForm").attr("action", "delete.ad").submit();
	            		}
	            	}
	            </script>
	            </div>
      </div>
      </div>
      
      
</body>
</html>