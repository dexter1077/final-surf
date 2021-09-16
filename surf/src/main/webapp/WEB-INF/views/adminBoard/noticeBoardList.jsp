<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
.noticeTitle {
	font-size: 17px;
	font-weight: bolder;
	margin-bottom: 5px;
	margin-left: 5px;
}

.writerInfo {
	font-size: 12px;
	margin-left: 5px;
	margin-top: 10px;
	color: rgb(94, 94, 94);
}

#noticeList tr {
	height: 100px;
	border-bottom: rgb(211, 211, 211) solid 2px;
}

.noticeCount {
	font-size: 20px;
	font-weight: 500;
	background-color: rgb(255, 214, 221);
	color: rgb(94, 94, 94);
	height: 60px;
	width: 60px;
	border-radius: 50%;
	line-height: 60px;
}

#adminBoardMenu>a {
	font-size: 18px;
	font-weight: 600;
	margin-right: 30px;
	text-decoration: none;
	color: black;
	height: 35px;
	display: inline-block;
}
	
 #adminBoardMenu>a:hover {
   color: rgb(94, 94, 94);
   border-bottom: rgb(32, 155, 212) 4px solid;
   transition: all .2s ease;
}


</style>

</head>
<body>
	<jsp:include page="../common/header.jsp"/>

	<div class="body-outer">
		<br><br>

		<!--고객센터 세부메뉴-->
		<div id="adminBoardMenu" style="width: 800px; margin: auto;">
			<a href="list.no">공지사항</a> 
			<a href="list.faq">FAQ</a>
			<hr
				style="background-color: rgb(191, 191, 191); height: 2px; width: 60%; margin-top: 0;">
		</div>

		<div class="long-title">
			공지사항 <i class="fas fa-bullhorn"></i>
			<div style="font-size: 15px; font-weight: normal;">
				<br> 업데이트, 점검 등 공지사항을 확인해보세요<br> 수강료 할인 등 이벤트 관련 정보도 얻을 수
				있답니다!
			</div>
			<hr
				style="background-color: rgb(32, 155, 212); height: 2px; margin-bottom: 0;">
		</div>

		<div style="width: 750px; margin: auto;">

			<br>
			<!-- 게시글 목록 -->
			<div>
				<table id="noticeList">
				
					<c:forEach var="n" items="${ list }">
						<tr>
							<input class="boardNo" type="hidden" value="${ n.boardNo }">
							<td width="650">
								<div class="noticeTitle">${ n.boardTitle }</div>
								<div class="writerInfo">작성자 : ${ n.nickname } &nbsp; 작성일 : ${ n.createDate }
									&nbsp;</div>
							</td>
							<td width="150" align="center" style="font-size: 13px;">
								<div class="noticeCount">${ n.count }</div>
								<div style="font-size: 12px;">조회수</div>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<script>
				$(function(){

				})
			</script>			
			<br><br>
			<!--더보기 버튼-->
			<div class="text-center">
				<button id="moreNotice" class="btn btn-secondary" style="width: 200px; border-radius: 10px;">더보기</button>
			</div>
		</div>
		<br><br><br><br><br>
	</div>

	<script>
        $(function () {
        	// 공지사항 hover효과
            $("#noticeList").on("mouseover", "tr", function () {
                $(this).addClass("w3-padding-large w3-card-4");
                $(this).css("cursor", "pointer");
                $(this).find(".noticeCount").css("backgroundColor", "rgb(184, 227, 220)");
            })
            $("#noticeList").on("mouseout", "tr", function () {
                $(this).removeClass("w3-padding-large w3-card-4");
                $(this).find(".noticeCount").css("backgroundColor", "rgb(255, 214, 221)");
            })
            
            // 공지사항 더보기 버튼
            var page = 2;
            $("#moreNotice").on("click", function(){
            	$.ajax({
            		url:"more.no",
            		data:{currentPage:page},
            		success:function(nlist){
            			var result = "";
            			
            			if(nlist == ''){
            				$("#moreNotice").attr("disabled", true);
            				alert("마지막 공지사항입니다.");
            			} else {
	            			for(var i in nlist){
	            				result += '<tr>'
		            						+ '<input class="boardNo" type="hidden" value="' + nlist[i].boardNo + '">'
		            						+ '<td width="650">'
												+ '<div class="noticeTitle">' + nlist[i].boardTitle + '</div>'
												+ '<div class="writerInfo">작성자 : ' + nlist[i].nickname + '&nbsp; 작성일 : ' + nlist[i].createDate	+ '&nbsp;</div>'
											+ '</td>'
											+ '<td width="150" align="center" style="font-size: 13px;">'
												+ '<div class="noticeCount">' + nlist[i].count + '</div>'
												+ '<div style="font-size: 12px;">조회수</div>'
											+ '</td>'
										+ '</tr>'
	            			}
            			}
            			$("#noticeList").append(result);
            			
            		}, error:function(){
            			console.log("ajax 통신 실패");	
            		}
            	})
            	page++;
            })
            
			$("#noticeList").on("click", "tr", function(){
				location.href='detail.no?nno=' + $(this).children(".boardNo").val();
			})            
        })
    </script>
    
    <jsp:include page="../common/footer.jsp"/>


</body>
</html>