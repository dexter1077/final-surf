<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 관리</title>
</head>
<style>
	.innerOuter{width:80%; margin:auto;}
	.table tbody :hover{background:lightgray; cursor:pointer;}
	#search_btn{background:deepskyblue;}
	#search_btn:hover{background:rgb(52, 152, 219);}
	
	#modalTable *:hover{
		background-color:white;
		cursor:auto;
	}
	
</style>
<style>
#pagingArea {
	width: fit-content;
	margin: auto;
}
</style>
<body>
	<jsp:include page="../admin/sidebar.jsp"/>
		 <!-------------------------------------------여기서부터 우측 게시판----------------------------------------------------->
      <br>
      <div class="innerOuter" style="width:950px">
        <br><br><br>
        <div>
          <h5>신고 관리 > 신고목록</h5>
          <form id="searchForm" action="reportSearch.ad" method="Get">
          <div class="select" align="right">
	            <select style="width: 120px;" name="condition">
	              <option value="category">신고 유형</option>
	              <option value="reason">신고 사유</option>
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
        <hr>
        <table id="adReportList" class="table" align="center">
          <thead>
            <tr style="background-color: rgb(224, 224, 224)">
              <td width="70" id="rtype" name="refType">번호</td>
              <td width="100">신고자</td>
              <td width="100">신고된 ID</td>
              <td width="100">신고 유형</td>
              <td width="220">신고 사유</td>
              <td width="130">신고날짜</td>
              <td width="100">처리여부</td>
            </tr>
          </thead>
          <tbody>
          	<c:forEach var="p" items="${ list }">
	            <tr>
	              <td class="rno">${ p.reportNo }</td>
	              <td class="reporter">${ p.reporterId }</td>
	              <td class="reported">${ p.reportedId }</td>
	              <td class="refType">${ p.refType }</td>
	              <td class="detailBtn" data-toggle="modal" data-target="#selectReport">
		              <span class="reportContent">${ p.reportContent }</span>
		              <c:choose>
			           	  <c:when test="${ p.refType == '댓글' }">
				              <div class="rsno" style="display:none;">${ p.replyContent }</div>
			              </c:when>
			              <c:otherwise>
				              <div class="rsno" style="display:none;">${ p.studyContent }</div>
			              </c:otherwise>
		              </c:choose>
	              </td>
	              <td>${ p.reportDate }</td>
	              <c:choose>
		           	  <c:when test="${ p.status == 'N' }">
		              	<td>처리 전</td>
		              </c:when>
		           	  <c:when test="${ p.status == 'B' }">
		              	<td style="color:red;">블라인드</td>
		              </c:when>
		              <c:otherwise>
		              	<td style="color:green;">기각</td>
		              </c:otherwise>
	            </c:choose>
	            </tr>
            </c:forEach>
          </tbody>
        </table>
        
        <script>
        	$(function(){
        		$("#adReportList").on("click", ".detailBtn", function(){
        			$("#modalrefType").text($(this).siblings(".refType").text());
        			$("#reportNo").val($(this).siblings(".rno").html());
        			$("#modalreportContent").text($(this).children(".reportContent").text());
        			$("#modalRsno").html($(this).children(".rsno").text());
        		})
        	})
        
        </script>
      
        
    <!----------------------------------------- 신고 내용조회 모달창 ----------------------------------------------------->
        <div class="modal" id="selectReport">
        	<div class="modal-dialog modal-lg">
        		<div class="modal-content">
	        			<div class="modal-header">
	        			<h4 class="modal-title">신고글 조회</h4>
	        			<button type="button" class="close" data-dismiss="modal">&times;</button>
	        			</div>
	        			<div class="modal-body" align="center">
	        				<table class="table" id="modalTable">
	        					<tr>
	        						<td width="130">신고 유형</td>
	        						<td id="modalrefType"></td>
	        					</tr>
	        					<tr>
	        						<td>신고 사유</td>
	        						<td id="modalreportContent"></td>
	        					</tr>
	        					<tr>
	        						<td>내용</td>
	        						<td id="modalRsno"></td>
	        					</tr>
	        				</table>
	        			</div>
        				<form id="updateReport" action="" method="post">
		        			<input id="reportNo" type="hidden" name="reportNo">
                        </form>	
	        			<div class="modal-footer">
	        				<button type="button" class="btn btn-secondary" id="updateBlind" onclick="updateReport(1);">블라인드</button>
	        				<button type="button" class="btn btn-danger"id="updateRejection" onclick="updateReport(2);">기각</button>
	        			</div>
                                           
						<script>
							function updateReport(num){
								if(num == 1){
									if(confirm("신고된 해당 글을 블라인드 처리 하시겠습니까?")){
										$("#updateReport").attr("action", "updateB.ad").submit();
									}
								} else {
									if(confirm("신고된 해당 글을 기각 처리 하시겠습니까?")){
										$("#updateReport").attr("action", "updateR.ad").submit();
									}
								}
							}
					    </script>
        		</div>
        	</div>
        </div>
        
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
									href="reportSearch.ad?currentPage=${ pi.currentPage-1 }&condition=${condition}&keyword=${keyword}">이전</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="reportList.ad?currentPage=${ pi.currentPage-1 }">이전</a></li>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>



				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:choose>
						<c:when test="${ !empty condition }">
							<li class="page-item"><a class="page-link"
								href="reportSearch.ad?currentPage=${ p }&condition=${condition}&keyword=${keyword}">${ p }</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="reportList.ad?currentPage=${ p }">${ p }</a></li>
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
									href="reportSearch.ad?currentPage=${ pi.currentPage+1 }&condition=${condition}&keyword=${keyword}">다음</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="reportList.ad?currentPage=${ pi.currentPage+1 }">다음</a></li>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
      

</body>
</html>