<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 1. BootStrap4 CDN -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- alertify CDN 연결 -->
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>

<!-- font  -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">

<style>
    div{
        box-sizing: border-box;
    }
    .ajs-modal{
        z-index: 10000;
    }
    .outer{
        width: 1200px;
        height: 950px;
        margin:auto;
    }
    .head-box{
        width:1200px;
        height:90px;
        border-bottom: 1px solid rgb(211, 211, 211, 0.5);
        background: white;
        padding-left: 25px;
        padding-top: 25px;
        font-family: 'Nanum Gothic', sans-serif;
        position: fixed;
        z-index: 1;
    }
    .head-box>div{
        float: left;
    }

    a:hover{opacity:0.7;}

    .menubar{
        width:215px;
        height:859px;
        padding-top: 30px;
        font-family: 'Nanum Gothic', sans-serif;
        font-weight:900;
    }
    .home-btn{
        width:90px;
        height:35px;
        background: rgb(32, 155, 212);
        text-align: center;
    }
    .home-btn>a{
        color: white;
        text-decoration:none;
        font-weight:900;
        font-size: 22px;
        line-height: 35px;
    }

    .head-title{
        display: block;
        font-size: 18px;
        font-weight: 900;
        margin-left: 30px;
        line-height:35px;
    }

    /*진행 바*/
    .degree{
        font-size:12px;
        font-weight: 900;
        color: orange;
        margin-left: 30px;
        margin-right: 600px;
    }
    .progress{
        width:170px;
        height: 10px;
    }
    .progress-bar{
        background:orangered;
        height: 10px;
    }
    
    /* 메뉴바 */
    .menubar-box{
        margin-top: 100px;
        width: 215px;
        height: 300px;
        background: rgba(222, 222, 222, 0.1);
        position: fixed;
        border: 1px solid rgba(32, 155, 212, 0.1);;
        border-radius: 3px;
    }
    .num-box{
        width:30px; 
        height:30px;
        background: white;
        border: 1px solid lightgray;
        border-radius: 3px;
        color: black;
        display: inline-block;
        text-align: center;
        margin-right:8px;
        line-height: 30px;
    }
    .menubar-box>div{
        padding: 15px 25px;
    }
    .menubar-box>div a{
        font-size:16px;
        color:black;
        text-decoration: none;
    }
    .menubar-box>div:hover{
        background: rgba(222, 222, 222, 0.3);
    }   
    
    .outer>div{
        float: left;
    }
    .content{
        margin: 130px 0px 0px 60px;
        font-family: 'Nanum Gothic', sans-serif;

    }

    /*컨텐츠 공통 영역*/
    .qus-title{
        font-size: 14px;
        font-weight: 700;
        padding-top: 10px;
        margin-bottom: 10px;
        display: block;
    }
    .qus-answer{
        font-size: 12px;
        margin-bottom: 8px;
    }
    .note{
        font-size: 12px;
        color: gray;
        display: block;
    }
    .guide{
		font-size: 24px;
		font-weight: 700;
		margin-bottom: 4px;
	}
	.subGuide{
		font-size:18px;
        font-weight: 700;
	}
    .note-area{
        background: rgb(241, 241, 241);
        padding-left: 10px;
    }

    .menubar-box>div>a:hover{
        cursor: pointer;
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

<div class="outer">
    <div class="header">
        <div class="head-box">
            <div class="home-btn">
                <a href="<%=request.getContextPath()%>">SURF</a>
            </div>
            <div class="head-title">
                강의 <span></span>하기
            </div>
            <div class="degree">
                <label id="degreeStr">0% 완료</label>
                <div class="progress">
                    <div class="progress-bar" style="width:0%"></div>
                </div>
            </div>
            <a href="lectureList.te" class="btn btn-secondary btn-sm">나가기</a>
        </div>
    </div>
    <div class="menubar">
        <div class="menubar-box">
            <div><div class="num-box menu0">0</div><a onclick="loadInputPage(0);">기본정보</a></div>
            <div><div class="num-box menu1">1</div><a onclick="loadInputPage(1);">제목 및 커버</a></div>
            <div><div class="num-box menu2">2</div><a onclick="loadInputPage(2);">소개</a></div>
            <div><div class="num-box menu3">3</div><a onclick="loadInputPage(3);">커리큘럼</a></div>
            <div><div class="num-box munu4">4</div><a onclick="loadInputPage(4);">오픈 전 확인사항</a></div>
        </div>
    </div>
    <form id="loadPage" action="lectureInput.te" method="post">
        <input type="hidden" name="currentPage">
        <input type="hidden" name="classNo" value="${l.classNo}">
    </form>        
<!--</div>-->
<script>
    $(function(){
        $('.menubar-box').children('div').eq(${ currentPage }).css('backgroundColor', 'rgba(222, 222, 222, 0.8)');
        
        // 등록하기 수정하기 판별
        if('${ l.status}' == 'W'){
            $('.head-title>span').text('등록');
        }else{
            $('.head-title>span').text('수정');
        }
    })

    function loadInputPage(currentPage){
    	if(${currentPage} != currentPage){ // 같은 페이지 클릭 x
	        $('input[name=currentPage]').val(currentPage);
	        $('#loadPage').submit();    		
    	}
    }
    
    // 해당 src 비었는지 3가지 검사 해주는 메소드 (비었으면 false, 채워져있으면 true)
    function isEmpty(str){
        if(typeof(str) == "undefined" || typeof(str) == null || typeof(str) == "")
            return true;
        else
            return false;
        
    }
    
</script>
</body>
</html>