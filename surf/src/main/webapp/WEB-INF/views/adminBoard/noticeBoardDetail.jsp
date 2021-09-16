<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>공지사항</title>

<style>
#studyDetailTop>div {
	/*border: 1px solid red;*/
	box-sizing: border-box;
	height: 30px;
	margin-right: 0;
}

#writerArea {
	font-size: 12px;
	color: rgb(94, 94, 94);
	text-align: right;
}

#writerArea>label::after {
	content: "";
	padding-right: 10px;
}

#writerArea>label:last-child:after {
	content: "";
	padding-right: 0;
}

/*뒤로가기버튼*/
#goBackBtn {
	position: fixed;
	z-index: 998;
	margin-left: 120px;
	font-size: 12px;
	border-radius: 10px;
	padding: 8px 12px 8px 12px;
	border: 1px solid lightgrey;
	color: rgb(94, 94, 94);
	background-color: rgba(0, 0, 0, 0);
}

#goBackBtn:hover {
	opacity: 0.7;
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
		<br>
		<br>

		<!--고객센터 세부메뉴-->
		<div id="adminBoardMenu" style="width: 800px; margin: auto;">
			<a href="list.no">공지사항</a> 
			<a href="list.faq">FAQ</a>
			<hr	style="background-color: grey; height: 2px; width: 60%; margin-top: 0;">
		</div>

		<div class="long-title">
			공지사항 <i class="fas fa-bullhorn"></i>
			<div style="font-size: 15px; font-weight: normal;">
				<br> 업데이트, 점검 등 공지사항을 확인해보세요
				<br> 수강료 할인 등 이벤트 관련 정보도 얻을 수 	있답니다!
			</div>
			<hr style="background-color: rgb(32, 155, 212); height: 2px; margin-bottom: 0;">
		</div>

		<!--뒤로가기 버튼-->
		<button id="goBackBtn" onclick="location.href='list.no';">
			<i class="fa fa-mail-reply"></i>
		</button>


		<div style="width: 750px; margin: auto; margin-top: 30px;">

			<div id="studyDetailTop">
				<div style="width: 100%; font-size: 17px; font-weight: 600;">
					${ notice.boardTitle }</div>
				<div id="writerArea" style="width: 100%; text-align: right;">
					<label>작성자 : ${ notice.nickname }</label> 
					<label>작성일 : ${ notice.createDate }</label> 
					<label>조회수	: ${ notice.count }</label>
				</div>
			</div>
			<div style="height: 700px; overflow: auto; clear: both; font-size: 13px;" class="px-3">
				${ notice.boardContent }
			</div>
			<br><br><br><br><br>
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>