<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>스터디 게시판</title>

<style>
/* 모집여부 구분버튼 스타일*/
#selectBy>a {
	text-decoration: none;
	color: black;
	font-weight: bold;
}

#selectBy>a:hover {
	color: rgb(0, 179, 136);
	cursor:pointer;
}

/*모집여부 사이사이에 |넣기*/
#selectBy>a::after {
	content: "|";
	color: #ccc;
	padding-left: 9px;
}

/*모집여부 사이사이에 |넣기(마지막거는 안넣음)*/
#selectBy>a:last-child::after {
	content: "";
}

/*스터디글 제목*/
.studyTitle {
	font-size: 15px;
	font-weight: bolder;
	margin-bottom: 5px;
    overflow: hidden;           /*제목 길어지면 뒷부분 잘림*/
    text-overflow: ellipsis;    /*잘린 부분에 ...붙여지도록*/
    white-space: nowrap;
    width: 600px;	
}

/*스터디글 내용*/
.studyContent {
	font-size: 13px;
    /*3줄만 보여지도록. 나머지는 생략됨. */
    overflow: hidden;
    text-overflow: ellipsis;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    word-wrap: break-word;
    line-height: 1.2em;
    height: 3.6em;
    width: 600px;
}
.studyContent *{
	font-size: 13px !important;
}

/*항목관련*/
#studyList tr {
	height: 100px;
	border-bottom: rgb(211, 211, 211) solid 2px;
}

/*위로가기버튼*/
#goTopBtn {
	position: fixed;
	z-index: 998;
	margin-left: 120px;
	font-size: 12px;
	border-radius: 10px;
	padding: 8px 12px 8px 12px;
	border: 1px solid lightgrey;
	color: rgb(94, 94, 94);
	background-color: rgba(0, 0, 0, 0);
	display:none;
}

#goBackBtn:hover {
	opacity: 0.7;
}
</style>


</head>

<body>
	<jsp:include page="../common/header.jsp" />


	<div class="body-outer">
		<br>
		<br>

		<div class="long-title">
			함께 공부해요!
			<div style="font-size: 15px; font-weight: normal;">
				<br> 같은 클래스를 듣거나, 관심사를 지닌 사람들과 스터디를 만들어보세요.
				<br> 함께 공부하면 실력도 두배 재미도 두배랍니다!
			</div>
			<hr style="background-color: rgb(32, 155, 212); height: 2px;">
		</div>
		
		<!--맨위로 이동 => 수정좀 해야됨..
		-->
		<button id="goTopBtn">
			<i class="fas fa-angle-double-up"></i>		
		</button>
		<script>
			$(function(){
			    $(window).scroll(function(){
			        if ($(this).scrollTop() > 100) {
			            $('#goTopBtn').fadeIn();
			        } else {
			            $('#goTopBtn').fadeOut();
			        }
			    });

			    $('#goTopBtn').click(function(){
			        $('html, body').animate({scrollTop : 0},800);
			        return false;
			    });
			})
		</script>

		<div style="width: 750px; margin: auto; margin-top: 60px;">


			<div id="topArea" style="overflow: auto;">
				<!-- 검색창 -->
				<div class="input-group mb-3" style="width: 60%; float: left;">
					<input id="keyword" type="text" class="form-control"	placeholder="어떤 스터디를 찾고있나요?">
					<div class="input-group-append">
						<button id="searchBtn" class="btn btn-success" type="button"><i class="fa fa-search"></i></button>
					</div>
				</div>

				<!-- 글쓰기 버튼 -->
				<c:if test="${ !empty loginUser }">
					<div style="width: 39%; float: left;" align="right">
						<button class="btn btn-info" onclick="location.href='enrollForm.sb';">
							글쓰기 <i class="fas fa-file-alt" style="font-size: 15px;"></i>
						</button>
					</div>
				</c:if>
			</div>
			<!-- 정렬 기준 -->
			<div id="selectBy">
				<a class="selBy" id="">전체</a> 
				<a class="selBy" id="YY">모집중</a> 
				<a class="selBy" id="NN">모집완료</a>
			</div>
			<input id="btnSelBy" type="hidden" value="">
			
			<br>
			<!-- 게시글 목록 -->
			<div>
				<table id="studyList">
					<c:forEach var="s" items="${ list }">
						<tr>
							<input class="studyNo" type="hidden" value="${ s.studyNo }">
							<td width="600">
								<div class="studyTitle">${ s.studyTitle }</div>
								<div class="studyContent" style="font-weight:normal; font-size: 12px; color:rgb(94, 94, 94);">
									${ s.studyContent }
								</div>
							</td>
							<td width="200">
								<div align="center">
									<c:choose>
										<c:when test="${ s.recruit eq 'Y' }">
											<img style="width: 40px;" src="https://img.shields.io/badge/모집중-00B388?style=flat-square&&logoColor=white" />
										</c:when>
										<c:otherwise>
			                                <img style="width: 50px;" src="https://img.shields.io/badge/모집완료-6E6E6E?style=flat-square&&logoColor=white" />
										</c:otherwise>
									</c:choose>
								</div>
								<div class="writerInfo">
									작성자 : ${ s.writer }<br> 작성일 : ${ s.createDate }<br> 조회수 : ${ s.count }
								</div>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<br>
			<br>
			<!--더보기 버튼-->
			<div class="text-center">
				<button id="moreStudy" class="btn btn-secondary"
					style="width: 200px; border-radius: 10px;">더보기</button>
			</div>

		</div>
		<br><br><br><br><br>
	</div>

	<script>
	
		// 스터디 글목록 가져오기 함수
		function makeList(slist){
			var result = "";
			
			for(var i in slist){
			
			result += '<tr>'
						+ '<input class="studyNo" type="hidden" value="' + slist[i].studyNo + '">'
						+ '<td width="600">'
							+ '<div class="studyTitle">' + slist[i].studyTitle + '</div>'
							+ '<div class="studyContent" style="font-weight:normal; font-size: 12px; color:rgb(94, 94, 94);">'
							+ slist[i].studyContent
							+ '</div>'
						+ '</td>'
						+ '<td width="200">'
							+ '<div align="center">'
							if(slist[i].recruit == 'Y'){
								result += '<img style="width: 40px;" src="https://img.shields.io/badge/모집중-00B388?style=flat-square&&logoColor=white" />'
							} else {
								result += '<img style="width: 50px;" src="https://img.shields.io/badge/모집완료-6E6E6E?style=flat-square&&logoColor=white" />'
							}
					result += '</div>'
							+ '<div class="writerInfo">'
								+ '작성자 : ' + slist[i].writer + '<br> 작성일 : ' + slist[i].createDate + '<br> 조회수 : ' + slist[i].count
							+ '</div>'
						+ '</td>'
					+ '</tr>'
			}
			
			return result;
		}
	
		$(function() {
			// 게시글 항목에 hover했을 때 효과
			$("#studyList").on("mouseover", "tr", function(){
				$(this).addClass("w3-padding-large w3-card-4");
				$(this).css("cursor", "pointer");
			})
			$("#studyList").on("mouseout", "tr", function(){
				$(this).removeClass("w3-padding-large w3-card-4");
			})
			
			$("#studyList").on("click", "tr", function(){
				location.href='detail.sb?sno=' + $(this).children(".studyNo").val();
			})
			
			var page = 2;
			$("#moreStudy").on("click", function(){
				$.ajax({
					url:"more.sb",
					type:"POST",
					data:{currentPage:page,
						  recruit:$("#btnSelBy").val(),
						  keyword:$("#keyword").val()
						  },
					success:function(slist){
						
						var result = "";
						if(slist == ''){
							$("#moreStudy").attr("disabled", true);
							alert("마지막 게시물 입니다.");
							page = 2;
						}
						
						result = makeList(slist);

						$("#studyList").append(result);
						page++;
					}, error:function(){
						
					}
				})
			})
			
			// 전체 | 모집중 | 모집완료 버튼
			$(".selBy").on("click", function(){
				page = 2;
				$("#moreStudy").attr("disabled", false);
				$("#btnSelBy").val($(this).attr("id"));
				$("#keyword").val("");
				$.ajax({
					url:"more.sb",
					data:{
						currentPage:1,
						recruit:$(this).attr("id")
						},
					success:function(slist){
						var result = "";
						
						if(slist == ''){
							result += '<tr>'
										+ '<td width="800" align="center">'
										+ '게시물이 존재하지 않습니다.'
										+ '</td>'
									+ '</tr>'
							$("#moreStudy").attr("disabled", true);

						} else {
							result = makeList(slist);
							
						}
						
						$("#studyList").html(result);
						
					}, error:function(){
						console.log("ajax통신 실패!!");	
					}
				})
			})
			
			// 검색버튼
			$("#searchBtn").on("click", function(){
				$("#moreStudy").attr("disabled", false);
				$("#btnSelBy").val("");
				page = 2;
				$.ajax({
					url:"more.sb",
					data:{
						currentPage:1,
						keyword:$("#keyword").val()
						},
					success:function(slist){
						
						
						var result = "";
						
						if(slist == ''){
							result += '<tr>'
										+ '<td width="800" align="center">'
										+ '게시물이 존재하지 않습니다.'
										+ '</td>'
									+ '</tr>'
							$("#moreStudy").attr("disabled", true);
						} else {
							
							result = makeList(slist);
						}
						$("#studyList").html(result);								
						
					}, error:function(){
						console.log("ajax통신 실패!!");	
					}
				})
			})
		})
	</script>


	<jsp:include page="../common/footer.jsp" />

</body>

</html>