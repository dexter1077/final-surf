<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고베너관리</title>
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<script type="text/javascript">
		$(function(){
			var chkObj = document.getElementsByName("RowCheck");
			var rowCnt = chkObj.length;
			
			$("input[name='allCheck']").click(function(){
				var chk_listArr = $("input[name='RowCheck']");
				for (var i=0; i<chk_listArr.length; i++){
					chk_listArr[i].checked = this.checked;
				}
			});
			$("input[name='RowCheck']").click(function(){
				if($("input[name='RowCheck']:checked").length == rowCnt){
					$("input[name='allCheck']")[0].checked = true;
				}
				else{
					$("input[name='allCheck']")[0].checked = false;
				}
			});
		});
		function motionValue(num){
			
			var url = "";
				
			if( num == 1){
				url = "delete";    // Controller로 보내고자 하는 URL
			}else {
				url = "update";    // Controller로 보내고자 하는 URL
			}
			var valueArr = new Array();
		    var list = $("input[name='RowCheck']");
		    for(var i = 0; i < list.length; i++){
		        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
		            valueArr.push(list[i].value);
		        }
		    }
		    if (valueArr.length == 0){
		    	alert("선택된 글이 없습니다.");
		    }else{
				var chk = confirm("실행하시겠습니까?");				 
				$.ajax({
				    url : url,                    // 전송 URL
				    type : 'POST',                // GET or POST 방식
				    traditional : true,
				    data : {
				    	valueArr : valueArr        // 보내고자 하는 data 변수 설정
				    },
	                success: function(jdata){
	                    if(jdata = 1) {
	                        alert("성공");
	                        location.replace("list.bo")
	                    }
	                    else{
	                        alert("실패");
	                    }
	                }
				});
			}
		}
	</script>
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
	width: 10%;
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
</style>
</head>
<style>
#pagingArea {
	width: fit-content;
	margin: auto;
}
</style>
<body>
	<jsp:include page="sidebar.jsp" />
	<!--여기서부터 우측 게시판-->
	<br>
	<div class="ml-4" style="width: 950px">

		<h4>광고베너관리</h4>
		<form id="searchForm" action="search.ad" method="Get">
			<div class="select">
				<select class="custom-select" name="condition">
					<option value="title">제목</option>
					<option value="content">내용</option>
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
		<hr>
		<table id="boardList" class="table table-hover">
			<thead>
				<tr style="background-color: rgb(224, 224, 224)">
					<td width="70"><input id="allCheck" type="checkbox"
						name="allCheck" /></td>
					<td width="70">번호</td>
					<td width="540">제목</td>
					<td width="140">작성일</td>
					<td width="100">표시상태</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="b" items="${list}">
					<tr>
						<th><input name="RowCheck" type="checkbox"
							value="${ b.adNo }" /></th>
						<td class="bno">${ b.adNo }</td>
						<td>${ b.adTitle }</td>
						<td>${ b.uploadDate }</td>
						<td>${ b.adStatus }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<script>
    	$(function(){
            $("#boardList>tbody>tr>td").click(function(){
                location.href="detail.ad?bno=" + $(this).parent().children(".bno").text(); // $(this)가 원래 tr이었는데 td가 추가돼서 바꼈기때문에 다시 tr로 바꾸기 위해 parent 추가
            })
        })
        </script>
		<br>
		<div style="text-align: right;">
			<a type="button" class="btn btn-primary" href="adEnroll.ad">등록</a> <input
				type="button" value="선택삭제" class="btn btn-danger"
				onclick="motionValue(1);"> <input type="button" value="선택표시"
				class="btn btn-warning" onclick="motionValue(2);">
		</div>
		<br>

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
									href="list.bo?currentPage=${ pi.currentPage-1 }">◁</a></li>
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
								href="list.bo?currentPage=${ p }">${ p }</a></li>
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
									href="list.bo?currentPage=${ pi.currentPage+1 }">▷</a></li>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>

</body>
</html>