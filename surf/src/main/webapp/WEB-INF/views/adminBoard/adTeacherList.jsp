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
  	.table tbody :hover{background:lightgray; cursor:pointer;}
	#search_btn{background:deepskyblue;}
	#search_btn:hover{background:rgb(52, 152, 219);}
	
	
</style>
<style>
#pagingArea {
	width: fit-content;
	margin: auto;
}
</style>
<body>
	<jsp:include page="../admin/sidebar.jsp"/>
		 <!--여기서부터 우측 게시판-->
      <br>
      <div class="innerOuter" style="width:950px">
        <div>
          <h5>강사 관리 > 강사 신청 목록</h5>
          <form id="searchForm" action="teacherSearch.ad" method="Get">
          <div class="select" align="right">
	            <select style="width: 120px;" name="condition">
	              <option value="big">대분류</option>
	              <option value="smail">소분류</option>
	              <option value="nick">닉네임</option>
	              <option selected>선택</option>
	            </select>
            <input type="text" name="keyword"
					value="${ keyword }">
            <button type="submit" class="btn btn-default" id="search_btn">검색</button>
          </div>
          </form>
      		<script>
            	$(function(){
            		if("${condition}" != ""){
            			$("option[value=${condition}]").attr("selected", true);
            		}
            	})
            </script>
        </div>
        <script>
        	$(function(){
            	if("${condition}" != ""){
            		$("option[value=${condition}]").attr("selected", true);
            	}
            })
        </script>
        <hr>
        <table id="adTeacherList" class="table" align="center">
          <thead>
            <tr style="background-color: rgb(224, 224, 224)">
              <td width="70">강사번호</td>
              <td width="100">닉네임</td>
              <td width="100">대분류</td>
              <td width="100">소분류</td>
              <td width="130">연락처</td>
              <td width="100">상태</td>
            </tr>
          </thead>
          <tbody>
          	<c:forEach var="t" items="${ list }"> 
	            <tr>
	              <td class="tno">${ t.teacherNo }</td>
	              <td>${ t.nickname }</td>
	              <td>${ t.mainCatName }</td>
	              <td>${ t.subCatName }</td>
	              <td>${ t.phone }</td>
	            <c:choose>
	           	  <c:when test="${ t.status == 'Y' }">
	              	<td style="color:green">승인</td>
	              </c:when>
	           	  <c:when test="${ t.status == 'N' }">
	              	<td style="color:red">반려</td>
	              </c:when>
	              <c:otherwise>
	              	<td>대기</td>
	              </c:otherwise>
	            </c:choose>
	            </tr>
            </c:forEach>
          </tbody>
        </table>
        
        <script>
        	$(function(){
        		$("#adTeacherList>tbody>tr").click(function(){
        			location.href="detailTeacher.ad?tno=" + $(this).children(".tno").text();
        		})
        	})
        </script>
        
        <br>
        <!--여기서부터 페이지이동-->
        <div id="pagingArea">
			<ul class="pagination">
				<c:choose>
					<c:when test="${ pi.currentPage eq 1 }">
						<li class="page-item disabled"><a class="page-link">이전</a></li>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${ !empty condition }">
								<li class="page-item"><a class="page-link"
									href="teacherSearch.ad?currentPage=${ pi.currentPage-1 }&condition=${condition}&keyword=${keyword}">이전</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="teacherList.ad?currentPage=${ pi.currentPage-1 }">이전</a></li>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>



				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:choose>
						<c:when test="${ !empty condition }">
							<li class="page-item"><a class="page-link"
								href="teacherSearch.ad?currentPage=${ p }&condition=${condition}&keyword=${keyword}">${ p }</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="teacherList.ad?currentPage=${ p }">${ p }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>


				<c:choose>
					<c:when test="${ pi.currentPage eq pi.maxPage }">
						<li class="page-item disabled"><a class="page-link">다음</a></li>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${ !empty condition }">
								<li class="page-item"><a class="page-link"
									href="teacherSearch.ad?currentPage=${ pi.currentPage+1 }&condition=${condition}&keyword=${keyword}">다음</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="teacherList.ad?currentPage=${ pi.currentPage+1 }">다음</a></li>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</body>
</html>