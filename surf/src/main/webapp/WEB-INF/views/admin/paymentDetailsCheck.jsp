<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#searchForm {
	width: 80%;
	margin-left: 600px;
}

#searchForm>* {
	float: left;
	margin: 5px;
}

.select {
	width: 13%;
}

.text {
	width: 25%;
	border: 0;
	outline: 0;
	background-color: #F8F9FA;
}

.searchBtn {
	Width: 5%;
}
#pagingArea {
	width: fit-content;
	margin: auto;
}
</style>
<body>
<jsp:include page="sidebar.jsp"/>
<br>
      <div class="ml-4" style="width:950px">
        <div>
          <h4>결제내역관리>고객 결제내역 조회</h4>
          <form id="searchForm" action="paySearch.ad" method="Get">
			<div class="select">
				<select class="custom-select" name="condition">
					<option value="id">아이디</option>
					<option value="name">이름</option>
				</select>
			</div>
			<div class="text">
				<input type="text" class="form-control" name="keyword"
					value="${ keyword }">
			</div>
			<button type="submit" class="searchBtn btn btn-secondary"
				style="background-color: #3AB6F7; border: 0; outline: 0; border-radius: 10px;">🔍</button>
		</form>
		<br>
		<br>
		<script>
            	$(function(){
            		if("${condition}" != ""){
            			$("option[value=${condition}]").attr("selected", true);
            		}
            	})
            </script>
        </div>
        <hr>
        <table class="table">
        <thead>
          <tr style="background-color: rgb(224, 224, 224)">
            <td width="100">회원번호</td>
            <td width="150">아이디</td>
            <td width="300">이름</td>
            <td width="140">결제일</td>
            <td width="150">결제금액</td>
          </tr>
          </thead>
		  <tbody>
          <c:forEach var="pm" items="${list}">
					<tr>
						<td>${ pm.userNo }</td>
						<td>${ pm.email }</td>
						<td>${ pm.nickname }</td>
						<td>${ pm.paymentDate }</td>
						<td>${ pm.price }</td>
					</tr>
				</c:forEach>
				</tbody>
        </table>
        <!--여기서부터 페이지이동-->
        <div id="pagingArea">
			<ul class="pagination">
				<c:choose>
					<c:when test="${ pi.currentPage eq 1 }">
						<li class="page-item disabled"><a class="page-link">◁</a></li>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${ !empty condition }">
								<li class="page-item"><a class="page-link"
									href="paySearch.ad?currentPage=${ pi.currentPage-1 }&condition=${condition}&keyword=${keyword}">◁</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="pmList.ad?currentPage=${ pi.currentPage-1 }">◁</a></li>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>



				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:choose>
						<c:when test="${ !empty condition }">
							<li class="page-item"><a class="page-link"
								href="paySearch.ad?currentPage=${ p }&condition=${condition}&keyword=${keyword}">${ p }</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="pmList.ad?currentPage=${ p }">${ p }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>


				<c:choose>
					<c:when test="${ pi.currentPage eq pi.maxPage }">
						<li class="page-item disabled"><a class="page-link">▷</a></li>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${ !empty condition }">
								<li class="page-item"><a class="page-link"
									href="paySearch.ad?currentPage=${ pi.currentPage+1 }&condition=${condition}&keyword=${keyword}">▷</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="pmList.ad?currentPage=${ pi.currentPage+1 }">▷</a></li>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
      </div>
      
      
</body>
</html>