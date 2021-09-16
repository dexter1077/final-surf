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
          <h4>공지사항 글수정</h4>
          <br>
        </div>

        <form id="updateForm" method="post" action="updateNotice.ad" enctype="">
          <input type="hidden" name="boardNo" value="${ ab.boardNo }">
          <table align="center">
            <tr>
              <th><label for="title">제목</label></th>
              <td><input type="text" id="title" class="form-control" name="boardTitle" value="${ ab.boardTitle }" required></td>
            </tr>
            <tr>
              <th><label for="writer">작성자</label></th>
              <td><input type="text" id="writer" class="form-control" value="${ ab.nickname }" readonly></td>
            </tr>
              <tr>
                <th colspan="2"><label for="content">내용</label></th>
            </tr>
            <tr>
              <th colspan="2">
                <textarea class="form-control" required name="boardContent" id="content" rows="20" style="resize:none;">${ ab.boardContent }</textarea>
              </th>
          </tr>
          </table>
          <br>

          <div align="center">
            <button type="submit" class="btn btn-primary">수정</button>&nbsp;&nbsp;&nbsp;
            <button type="button" class="btn btn-secondary" onclick="javascript:history.go(-1);">이전</button>
        </div>
    </form>
  </div>
  
 
</body>
</html>