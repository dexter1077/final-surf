<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 조회 및 답변</title>
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

#class-list {
	width: 900px;
	margin-top: 80px;
	table-layout: fixed;
}

#class-list tr {
	line-height: 18px;
}

#class-list td {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

#class-list>tbody>tr:hover {
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
		<div id="page-title">클래스 관리 > 문의 조회 및 답변</div>
		<div id="select-wrap">
			<label for="select-class">조회 클래스 선택</label>
			<select class="form-control" id="select-class" name="selectClass">
				<option value="all">전체 클래스</option>
				<c:forEach var="c" items="${ clist }">
					<option value="${ c.classNo }">${ c.classTitle }</option>
				</c:forEach>
			</select>
		</div>

		<script>
			$(function(){
	    		$("#select-class").change(function(){
	    			if("${ condition }" != "") {
		    			location.href="classInquiry.te?cno=" + $(this).val() + "&condition=" + "<c:out value='${ condition }'/>";
	    			}else{
	    				location.href="classInquiry.te?cno=" + $(this).val();
	    			}
	    			
	    		})
	    		$("#select-class option[value=${cno}]").attr("selected", true);
	    	})
		</script>

		<div id="check-wrap">
			<div class="form-check">
				<label class="form-check-label">
					<input type="checkbox" class="form-check-input inquiry-check" name="condition" value="noAnswer">
					대기 중인 문의만 조회
				</label>
			</div>
		</div>


		<script>
			$(function(){
	    		$(".inquiry-check").change(function(){
	    			if($(".inquiry-check").is(":checked") == true) {
		    			location.href="classInquiry.te?cno=" + "<c:out value='${ cno }'/>" + "&condition=" + $(this).val();
	    			}else{
	    				location.href="classInquiry.te?cno=" + "<c:out value='${ cno }'/>" + "&condition=all";
	    			}
	    		})
	    		
	    		if("${ condition }" == "noAnswer") {
	    			console.log("hi");
		    		$(".inquiry-check").prop("checked", true);
	    		}
	    	})
		</script>
 
		<table class="table table-hover" id="class-list" align="center">
			<thead class="thead-light">
				<tr>
					<th style="width: 70px;" class="text-center">번호</th>
					<th style="width: 480px;" class="text-center">내용</th>
					<th style="width: 150px;" class="text-center">작성자</th>
					<th style="width: 130px;" class="text-center">작성일</th>
					<th style="width: 70px;" class="text-center">상태</th>
				</tr>
			</thead>
			<tbody>

				<c:choose>
					<c:when test="${ empty ilist }">
						<tr>
							<td colspan="5" class="text-center">조회할 문의가 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>

						<c:forEach var="i" items="${ ilist }">

							<tr class="inquiry-line">
								<td class="text-center ino">${ i.inquiryNo }</td>
								<td>${ i.inqContent }</td>
								<td class="text-center">${ i.userNo }</td>
								<td class="text-center">${ i.inqDate }</td>
								<td class="text-center">
									<c:choose>
										<c:when test="${ empty i.ansContent }">대기</c:when>
										<c:otherwise>완료</c:otherwise>
									</c:choose>
								</td>
							</tr>

						</c:forEach>
					</c:otherwise>
				</c:choose>

				<script>
		            	$(function(){
		            		$(".inquiry-line").click(function(){
		            			location.href="inquiryDetail.te?ino=" + $(this).children(".ino").text();
		            		})
		            	})
		        </script>

			</tbody>
		</table>

		<div id="paging-wrap">
			<div id="pagination">
				<c:if test="${ !empty ilist }">
					<ul class="pagination">
						<c:choose>
							<c:when test="${ pi.currentPage eq 1 }">
								<li class="page-item disabled"><a class="page-link">&lt;</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="classInquiry.te?currentPage=${ pi.currentPage-1 }">&lt;</a></li>
							</c:otherwise>
						</c:choose>

						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">

							<c:choose>
								<c:when test="${ p eq pi.currentPage }">
									<li class="page-item"><a class="page-link"><b>${ p }</b></a></li>
								</c:when>
								<c:otherwise>
								
									<c:choose>
										<c:when test="${ condition ne 'all' }">
											<li class="page-item"><a class="page-link"
											href="classInquiry.te?currentPage=${ p }&cno=${ cno }&condition=${ condition }">${ p }</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
											href="classInquiry.te?currentPage=${ p }&cno=${ cno }">${ p }</a></li>
										</c:otherwise>
									</c:choose>
									
								</c:otherwise>
							</c:choose>

						</c:forEach>

						<c:choose>
							<c:when test="${ pi.currentPage eq pi.maxPage }">
								<li class="page-item disabled"><a class="page-link">&gt;</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="classInquiry.te?currentPage=${ pi.currentPage+1 }">&gt;</a></li>
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