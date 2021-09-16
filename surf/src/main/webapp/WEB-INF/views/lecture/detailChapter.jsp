<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chapter</title>
<style>
    .outer{
        width: 1200px;
        margin: auto;
    }
    .container{
        /*display: flex; */
        width: 1200px; 
        /*background: gray;*/
        /*height: 1000px;*/
        padding: 0px 0px 0px 0px;
    }
    .class-element{width: 100%; height: 300px; display: flex;}
    .class-element img{
        width: 680px;
        height: 100%;
        margin: auto;
    }
    .class-main-info{margin-left: 20px;}
    .class-main-info>div{width: 400px; margin-bottom: 15px;}
    #info-title{font-size: 23px; font-weight: bolder;}
    #info-price span{color: darkgray;}
    #info-star{font-size: 15px;}
    #info-btn *{border: 1px solid lightgray; width: 150px;}
    #info-btn button{margin: 0px 10px 0px 40px;}
    #info-btn a{
        background: rgb(32, 155, 212);
        color: white;
    }
    #info-btn *:hover{cursor: pointer; font-weight: bold;}
    .class-tab{
        width: 100%;
        height: 50px;
        border-bottom: 1px solid lightgray;
    }
    .class-tab>div{
        display: inline-block;
        width: 120px;
        height: 50px;
        font-size: 16px;
        margin-top: 5px;
    }
    .tab1{margin: 0px 10px 0px 30px;}
    .class-tab button:hover{font-weight: bold; color: rgb(32, 155, 212);}
    /*.class-full-info{width: 100%;}*/
    .class-chapter *{margin-bottom: 30px; }
    #class-representative{width: 60%; height: 100%; margin-left: 10px;}

    /*커리큘럼*/
    .chap-title, .chap-content,
    .chap-count
    {margin-left: 50px; }
    .chap-title{
        padding: 50px 0 0 0;
        margin-bottom: 5px;
        width: 600px;
        font-size: 25px;
    }
    .chap-count{color: gray;}
    .chap-content{
        width: 1000px;
        font-size: 17px;
        padding-bottom: 10px;
    }
    .chap-notice{width: 100%; padding-left: 50px;}
    .chap-content *{margin-bottom: 10px;}
    .chap-name{
        font-size: 18px;
        font-weight: bolder;
    }
    .sub-name{
        padding-left: 30px;
    }
</style>
</head>
<body>

	<!-- 커리큘럼 -->
	<div class="class-chapter">
		<div class="chap-title">
			<b>
				${ title }
			</b> 
		</div>
		
		<c:set var="chapLength" value="${fn:length(tList)}"/>
		<div class="chap-count">총 <c:out value="${fn:length(tList)}"/>개의 챕터</div>
			
		<c:forEach var="t" items="${ tList }" begin="0" end="${fn:length(tList)}" varStatus="status" >
		
			<div class="chap-content">
				<div class="chap-name">${ t.chapName }</div>
				
				<c:forEach var="c" items="${ t.classVideoList }">
					<c:if test="${ t.chapOrder eq c.chapOrder }">
						<div class="sub-name">${ c.subTitle }</div>
					</c:if>
				</c:forEach>
				
			</div>
		</c:forEach>
		
	</div>
	
	

</body>
</html>