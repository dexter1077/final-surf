<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강 후기 조회</title>
<style>
#content {
	font-family: 'Nanum Gothic', sans-serif;
	width: 980px;
	height: 850px;
	float: left;
}

#page-title {
	font-size: 20px;
	font-weight: 600;
	width: 300px;
	margin-top: 40px;
	margin-left: 40px;
}

#select-wrap {
	float: left;
	margin-top: 30px;
	margin-left: 45px;
	width: 650px;
	height: 40px;
}

#select-wrap>label {
	float: left;
	margin-top: 6px;
}

#select-wrap>select {
	float: left;
	width: 500px;
	margin-left: 15px;
}

#check-wrap {
	float: left;
	width: 185px;
	margin-top: 40px;
	margin-left: 60px;
}

#review-list {
	width: 900px;
	margin-top: 80px;
	table-layout: fixed;
}

#review-list tr {
	line-height: 18px;
}

#review-list td {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

#review-list>tbody>tr:hover {
	cursor: pointer;
}

#paging-wrap {
	width: 300px;
	height: 50px;
	top: 840px;
	margin-left: 340px;
	display: flex;
	position: absolute;
}

#pagination {
	margin: auto;
}
</style>
</head>
<body>

	<jsp:include page="common/teacherPage.jsp" />

	<div id="content">
		<div id="page-title">클래스 관리 > 수강 후기 조회</div>
		<div id="select-wrap">
			<label for="select-class">조회 클래스 선택</label> <select
				class="form-control" id="select-class" name="selectClass">
				<option value="all">전체 클래스</option>
				<c:forEach var="c" items="${ clist }">
					<option value="${ c.classNo }">${ c.classTitle }</option>
				</c:forEach>
			</select>
		</div>

		<script>
			$(function(){
	    		$("#select-class").change(function(){
	    			location.href="classReview.te?cno=" + $(this).val();
	    		})
	    		$("#select-class option[value=${cno}]").attr("selected", true);
	    	})
		</script>

		<table class="table table-hover" id="review-list" align="center">
			<thead class="thead-light">
				<tr>
					<th style="width: 70px;" class="text-center">번호</th>
					<th style="width: 480px;" class="text-center">내용</th>
					<th style="width: 70px;" class="text-center">별점</th>
					<th style="width: 150px;" class="text-center">작성자</th>
					<th style="width: 130px;" class="text-center">작성일</th>
				</tr>
			</thead>
			<tbody>

				<c:choose>
					<c:when test="${ empty rlist }">
						<tr>
							<td colspan="5" class="text-center">조회할 수강 후기가 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>

						<c:forEach var="r" items="${ rlist }">

							<tr class="review-line">
								<td class="text-center sno">${ r.surveyNo }</td>
								<td>${ r.review }</td>
								<td class="text-center">${ r.score }</td>
								<td class="text-center">${ r.userNo }</td>
								<td class="text-center">${ r.createDate }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>

				<script>
		            	$(function(){
		            		$(".review-line").click(function(){
		            			location.href="reviewDetail.te?sno=" + $(this).children(".sno").text();
		            		})
		            	})
		        </script>

			</tbody>
		</table>

		<div id="paging-wrap">
			<div id="pagination">
				<c:if test="${ !empty rlist }">
					<ul class="pagination">
						<c:choose>
							<c:when test="${ pi.currentPage eq 1 }">
								<li class="page-item disabled"><a class="page-link">&lt;</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="classReview.te?currentPage=${ pi.currentPage-1 }">&lt;</a></li>
							</c:otherwise>
						</c:choose>

						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">

							<c:choose>
								<c:when test="${ p eq pi.currentPage }">
									<li class="page-item"><a class="page-link"><b>${ p }</b></a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="classReview.te?currentPage=${ p }&cno=${ cno }">${ p }</a></li>
								</c:otherwise>
							</c:choose>

						</c:forEach>

						<c:choose>
							<c:when test="${ pi.currentPage eq pi.maxPage }">
								<li class="page-item disabled"><a class="page-link">&gt;</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="classReview.te?currentPage=${ pi.currentPage+1 }">&gt;</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</c:if>
			</div>
		</div>
	</div>
	</div>
	</div>

	<jsp:include page="../common/footer.jsp" />

</body>
</html>