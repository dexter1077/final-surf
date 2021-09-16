<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 관리</title>
</head>
<style>
	.innerOuter{width:80%; margin:auto;}
	.table tbody :hover{background:lightgray; cursor:pointer;}
	#search_btn{background:deepskyblue;}
	#search_btn:hover{background:rgb(52, 152, 219);}
	#ing{background:dodgerblue; color:white; font-weight:bold;}
	#end{background:darkgray; color:white; font-weight:bold;}	
</style>
<body>
	<jsp:include page="../admin/sidebar.jsp"/>
		 <!--여기서부터 우측 게시판-->
      <br>
      <div class="innerOuter" style="width:950px">
        <br><br><br>
        <div>
          <h5>커뮤니티 관리 > 스터디 모집 게시판 목록</h5>
          <div align="right">
            <input type="text" placeholder="키워드를 입력하세요">
            <button type="button" class="btn btn-default" id="search_btn">검색</button>
          </div>
        </div>
        <hr>
        <table class="table">
          <thead>
            <tr style="background-color: rgb(224, 224, 224)">
              <td width="110">모집여부</td>
              <td width="400">제목</td>
              <td width="100">작성자</td>
              <td width="130">작성일</td>
              <td width="100">조회수</td>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><div id="ing">모집중</div></td>
              <td>드로잉 클래스 수강생 스터디 모집합니다</td>
              <td>user01</td>
              <td>2021-07-10</td>
              <td>100</td>
            </tr>
            <tr>
              <td><div id="end">모집완료</div></td>
              <td>파이썬 초보 스터디 모집합니다!</td>
              <td>user01</td>
              <td>2021-07-10</td>
              <td>100</td>
            </tr>
            <tr>
              <td><div id="ing">모집중</div></td>
              <td>Spring 및 웹 프로젝트 스터디원 모집합니다.</td>
              <td>user01</td>
              <td>2021-07-10</td>
              <td>100</td>
            </tr>
            <tr>
              <td><div id="ing">모집중</div></td>
              <td>서초구 도레미 밴드 모집하고 있어요</td>
              <td>user01</td>
              <td>2021-07-10</td>
              <td>100</td>
            </tr>
            <tr>
              <td><div id="end">모집완료</div></td>
              <td>남양주 축구 팀원 모집합니다!</td>
              <td>user01</td>
              <td>2021-07-10</td>
              <td>100</td>
            </tr>
            <tr>
              <td><div id="ing">모집중</div></td>
              <td>토익 고득점 스터디원 모집중입니다.</td>
              <td>user01</td>
              <td>2021-07-10</td>
              <td>100</td>
            </tr>
            <tr>
              <td><div id="end">모집완료</div></td>
              <td>영어회화 기초반 스터디 모집중입니다~</td>
              <td>user01</td>
              <td>2021-07-10</td>
              <td>100</td>
            </tr>
          </tbody>
        </table>
        <br>

        <!--여기서부터 페이지이동-->
        <ul class="pagination justify-content-center">
          <li class="page-item"><a class="page-link" href="#">이전</a></li>
          <li class="page-item"><a class="page-link" href="#">1</a></li>
          <li class="page-item"><a class="page-link" href="#">2</a></li>
          <li class="page-item"><a class="page-link" href="#">3</a></li>
          <li class="page-item"><a class="page-link" href="#">4</a></li>
          <li class="page-item"><a class="page-link" href="#">5</a></li>
          <li class="page-item"><a class="page-link" href="#">다음</a></li>
        </ul>
      </div>

</body>
</html>