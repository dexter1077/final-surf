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
    table th{width:100px;}
</style>
<body>
	<jsp:include page="../admin/sidebar.jsp"/>
		 <!--여기서부터 우측 게시판-->
      <br>
      <div class="innerOuter" style="width:950px">
        <br><br><br>
        <div>
          <h5>고객센터 관리 > 공지사항</h5>
          <hr>
          <h4>공지사항 글등록</h4>
          <br>
        </div>

        <form id="enrollForm" method="post" action="insertNotice.ad" enctype="">
        <input type="hidden" name="userNo" value=${ loginUser.userNo }>
          <table align="center">
            <tr>
              <th><label for="title">제목</label></th>
              <td><input type="text" id="title" class="form-control" name="boardTitle" required></td>
            </tr>
            <tr>
              <th><label for="writer">작성자</label></th>
              <td><input type="text" id="writer" class="form-control" value="${ loginUser.nickname }" name="nickname" readonly></td>
            </tr>
              <tr>
                <th colspan="2"><label for="content">내용</label></th>
            </tr>
            <tr>
              <th colspan="2"><textarea class="form-control" required name="boardContent" id="content" rows="20" style="resize:none;"></textarea></th>
          </tr>
          </table>
          <br>

          <div align="center">
            <button type="submit" class="btn btn-info">등록</button>&nbsp;&nbsp;&nbsp;
            <button type="reset" class="btn btn-secondary">취소</button>
          </div>
        </form>
      </div>
      <br><br>
  
</body>
</html>