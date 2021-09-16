<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#pagingArea {
	width: fit-content;
	margin: auto;
}
</style>
</head>
<body>

	<jsp:include page="sidebar.jsp"/>
	<br>
      <div class="ml-4" style="width:950px">
        <div>
          <h4>결제내역관리>정산 내역</h4>
        </div>
        <hr>
        <table class="table">
          <tr style="background-color: rgb(224, 224, 224)">
            <td width="150">아이디</td>
            <td width="100">닉네임</td>
            <td width="200">클래스명</td>
            <td width="120">결제일</td>
            <td width="120">정산예정일</td>
          </tr>
          <c:forEach var="s" items="${ list }">
          <tr>
            <td>${s.email }</td>
            <td>${s.nickname}</td>
            <td>${s.classTitle}</td>
            <td>${s.paymentDate}</td>
            <td>${s.mon}</td>
          </tr>
          </c:forEach>
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
									href="search.ad?currentPage=${ pi.currentPage-1 }&condition=${condition}&keyword=${keyword}">◁</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="settleList.ad?currentPage=${ pi.currentPage-1 }">◁</a></li>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>



				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:choose>
						<c:when test="${ !empty condition }">
							<li class="page-item"><a class="page-link"
								href="search.ad?currentPage=${ p }&condition=${condition}&keyword=${keyword}">${ p }</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="settleList.ad?currentPage=${ p }">${ p }</a></li>
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
									href="search.ad?currentPage=${ pi.currentPage+1 }&condition=${condition}&keyword=${keyword}">▷</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="settleList.ad?currentPage=${ pi.currentPage+1 }">▷</a></li>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
      
      </div>
      
      </div>
      
</body>
</html>