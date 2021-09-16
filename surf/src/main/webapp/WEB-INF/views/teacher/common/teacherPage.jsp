<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>강사 페이지</title>

<!-- 1. BootStrap4 CDN -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!--2. alertify CDN -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css" />

<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Fjalla+One&display=swap" rel="stylesheet">
<!-- font-family: 'Nanum Gothic', sans-serif; -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<style>
	div {
	    box-sizing: border-box;
	}
	
	#outer {
	    margin: auto;
	    width: 1200px;
	    height: 940px;
	}
	
	#head-outer {
	    width: 100%;
	    height: 90px;
	    border-bottom: 1px solid lightgray;
	}
	
	#content-box {
	    width: 1200px;
	    height: 850px;
	}
	
	#content-box>div {
	    float: left;
	}
	
	#head {
	    margin: auto;
	    width: 1200px;
	    height: 100%;
	}
	
	#head>div>a {
	    font-family: 'Fjalla One', sans-serif;
	    color: white;
	    text-decoration: none;
	}
	
	#home,
	#ins-home{
	    float: left;
	    height: 40px;
	    text-align: center;
	    margin-top: 25px;
	    text-decoration: none;
	}
	#user-icon{
		font-family: 'Nanum Gothic', sans-serif;
		font-weight: 700;
		float: left;
	    height: 40px;
	    text-align: center;
	    margin-top: 30px;
	    text-decoration: none;
	}
	
	#home,
	#ins-home {
	    background: rgb(32, 155, 212);
	}
	
	#home {
	    width: 90px;
	    font-weight: lighter;
	    margin-left: 35px;
	    font-size: 22px;
	    line-height: 40px;
	}
	#home:hover, #ins-home:hover, #user-icon:hover{
		cursor: pointer;
		opacity: 0.9;
	}
	
	#ins-home {
	    width: 130px;
	    margin-left: 10px;
	    font-size: 20px;
	    font-weight: 600;
	    line-height: 40px;
	}
	
	#user-icon {
	    margin-left: 830px;
	}
	
	/* 수직 메뉴바 영역*/
	#menubar-area {
	    width: 220px;
	    height: 850px;
	    background: rgb(244, 244, 244);
	}
	
	#menubar {
		font-family: 'Nanum Gothic', sans-serif;
	    font-weight: 900;
	    margin-top: 30px;
	}
	
	#menubar>ul {
	    list-style-type: none;
	    font-size: 20px;
	}
	
	#menubar>ul>a {
	    text-decoration: none;
	    color: black;
	}
	
	#menubar>ul>li>a {
	    text-decoration: none;
	    color: rgb(102, 102, 102);
	    font-weight: lighter;
	    font-size: 14px;
	    padding-left: 25px;
	}
	
	#menubar>ul a:hover {
	    color: rgb(32, 155, 212);
	}
	
	/* 강사 수정 페이지 가는 영역*/
	#dropdown-ins {
	    width: 180px;
	    height: 130px;
	}
	
	.profile {
	    height: 70px;
	    margin-top: 10px;
	    border-bottom: 1px solid lightgray;
	}
	
	.profile div {
	    float: left;
	    height: 65px;
	}
	
	.profile-img {
	    width: 50px;
		margin-left: 10px;
	}
	.update-page{
		margin-left: 10px;
	}

	.update-page>span{
		font-size: 14px;
	}
	
	.update-page>a {
	    font-size: 12px;
	    color: orange;
	    text-decoration: none;
	}
	
	.update-page>a:hover {
	    color: orangered;
	}
	
	.logout-area>a {
	    padding-left: 10px;
	    text-decoration: none;
	    color: gray;
	}
	
	.logout-area {
		line-height: 30px;
	    margin-top: 10px;
	}
	
	.profile>div>a:hover {
	    opacity: 0.7;
	}
	
	.content {
	    width: 978px;
	    height: 100%;
	}
</style>
</head>

<body>
<c:if test="${ !empty alertMsg }">
	<script>
		alertify.alert("${alertMsg}");
	</script>
	<c:remove var="alertMsg" scope="session"/>
</c:if>
<script>
	// 강사 이미지, 닉네임 load
	loadTeacherImage();

	function loadTeacherImage(){
		$.ajax({
		type: "post",
		url : "ajaxLoadInfo.te"
		, success : function(teacher){
			$('.profile-img').children('img').attr('src', teacher.profileImage);
			$('.update-page').children('span').text(teacher.nickname);
		}, error : function(){

		}
	});
	}
</script>

    <div id="outer">
        <div id="head-outer">
            <div id="head">
                <div id="home">
                    <a href="<%=request.getContextPath()%>">SURF</a>
                </div>
                <div id="ins-home">
                    <a href="updateForm.te">강사페이지</a>
                </div>
                <div id="user-icon">
                    <a data-toggle="dropdown"><img style="width:30px; height:30px; border-radius: 15px; border:1px solid lightgray"
                            src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbG5zOnN2Z2pzPSJodHRwOi8vc3ZnanMuY29tL3N2Z2pzIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiIgeD0iMCIgeT0iMCIgdmlld0JveD0iMCAwIDUxMiA1MTIiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDUxMiA1MTIiIHhtbDpzcGFjZT0icHJlc2VydmUiIGNsYXNzPSIiPjxnPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgoJPGc+CgkJPHBhdGggZD0iTTI5OS4yOSwyNTUuNWgtODYuNThjLTg1LjE0LDAtMTU0LjQyLDY5LjI3LTE1NC40MiwxNTQuNDJWNTEyaDM5NS40MlY0MDkuOTJDNDUzLjcxLDMyNC43NywzODQuNDMsMjU1LjUsMjk5LjI5LDI1NS41eiAgICAgTTg4LjI5LDQ4MnYtNzIuMDhjMC02OC42MSw1NS44Mi0xMjQuNDIsMTI0LjQyLTEyNC40Mmg4Ni41OGM2OC42LDAsMTI0LjQyLDU1LjgxLDEyNC40MiwxMjQuNDJWNDgySDg4LjI5eiIgZmlsbD0iIzg1ODU4NSIgZGF0YS1vcmlnaW5hbD0iIzAwMDAwMCIgc3R5bGU9IiIgY2xhc3M9IiI+PC9wYXRoPgoJPC9nPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+Cgk8Zz4KCQk8cGF0aCBkPSJNMjU2LDBjLTY1Ljg0LDAtMTE5LjQxLDUzLjU3LTExOS40MSwxMTkuNDFTMTkwLjE2LDIzOC44MiwyNTYsMjM4LjgyczExOS40MS01My41NywxMTkuNDEtMTE5LjQxUzMyMS44NCwwLDI1NiwweiAgICAgTTI1NiwyMDguODJjLTQ5LjMsMC04OS40MS00MC4xMS04OS40MS04OS40MUMxNjYuNTksNzAuMTEsMjA2LjcsMzAsMjU2LDMwczg5LjQxLDQwLjExLDg5LjQxLDg5LjQxICAgIEMzNDUuNDEsMTY4LjcxLDMwNS4zLDIwOC44MiwyNTYsMjA4LjgyeiIgZmlsbD0iIzg1ODU4NSIgZGF0YS1vcmlnaW5hbD0iIzAwMDAwMCIgc3R5bGU9IiIgY2xhc3M9IiI+PC9wYXRoPgoJPC9nPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjwvZz48L3N2Zz4=" /></a>
                    <div class="dropdown-menu" id="dropdown-ins">
                        <div class="profile">
                            <div class="profile-img">
                                <img width="50px" height="50px" style="border-radius: 25px;">
                            </div>
                            <div class="update-page">
                                <span>닉네임</span><br>
                                <a href="updateForm.te">강사 수정 페이지></a>
                            </div>
                            <div class="logout-area">
                                <a href="logout.me">로그아웃</a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div id="content-box">
            <div id="menubar-area">
                <div id="menubar">
                    <ul><a href="lectureList.te">내 클래스</a>
                    </ul>
                    <ul>
                        클래스 관리
                        <li><a href="classInquiry.te">문의 조회 및 답변</a></li>
                        <li><a href="classReview.te">수강 후기 조회</a></li>
                    </ul>
                    <ul>
                        클래스 통계
                        <li><a href="studyStats.te">수강 통계</a></li>
                        <li><a href="surveyStats.te">설문 조사 통계</a></li>
                    </ul>
                    <ul>
                        정산 내역 관리
                        <li><a href="monthlyStatsView.te">월별 집계</a></li>
                    </ul>
                </div>
            </div>



</body>

</html>