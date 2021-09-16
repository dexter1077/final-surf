<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 관리</title>
</head>
<style>
	.innerOuter{width:80%; margin:auto;}
    table *{margin:5px;}
    table{width:100%;} 
</style>
<body>
	<jsp:include page="../admin/sidebar.jsp"/>
		 <!--여기서부터 우측 게시판-->
      <br>
      <div class="innerOuter" style="width:950px">
        <br><br><br>
        <div>
          <h5>고객센터 관리 > 공지사항 상세 조회</h5>
          <hr>
          <div align="right">
       
          <a class="btn btn-secondary" style="float:right" href="noticeList.ad">목록으로</a>
          <br><br>
          </div>
        </div>

        <table id="contentArea" class="table">
          <tr>
              <th width="100">제목</th>
              <td colspan="3">${ ab.boardTitle }</td>
          </tr>
          <tr>
              <th>작성자</th>
              <td>${ ab.nickname }</td>
              <td colspan="2"></td>
          </tr>
          <tr>
              <th>조회수</th>
              <td>${ ab.count }</td>
              <th width="100">작성일</th>
              <td>${ ab.createDate }</td>
          </tr>
          <tr>
              <td colspan="4"><pre style="height:500px">${ ab.boardContent }</pre></td>
          </tr>
      </table>
        <br>
      
      <c:if test="${ loginUser.userNo == 1 }">  
        <div align="center">
          <!-- 수정하기, 삭제하기 버튼은 이글이 본인글일 경우만 보여져야됨 -->
          <a class="btn btn-primary" onclick="postFormSubmit(1);">수정</a>&nbsp;&nbsp;&nbsp;
          <a class="btn btn-danger" onclick="postFormSubmit(2);">삭제</a>
      	</div><br><br>
      	
      	<form id="postForm" action="" method="post">
      		<input type="hidden" name="bno" value="${ ab.boardNo }">
      	</form>
      	
      	<script>
      		function postFormSubmit(num){
      			if(num == 1){ // 수정하기 클릭시
      				$("#postForm").attr("action", "updateFormNotice.ad").submit();
      			}else{ // 삭제하기 클릭시
      				$("#postForm").attr("action", "deleteNotice.ad").submit();
      			}
      		}
      	</script>
      	
	  </c:if>
	  
      </div>
      

</body>
</html>