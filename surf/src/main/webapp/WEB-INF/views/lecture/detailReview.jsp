<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Review</title>
<style>
    .outer{
        width: 1200px;
        margin: auto;
    }
    .container{
        /*display: flex; */
        width: 1200px; 
        /*background: gray;*/
        height: 1000px;
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

    /*수강 후기*/
    .class-review{
        margin-left: 50px;
        margin-top: 40px;
        margin: 40px 40px 20px;
        width: 600px;
    }
    .box{
        font-weight: bolder;
        margin-bottom: 15px;
    }
    .box img{
        width: 40px; 
        height: 40px;
        border-radius: 70%;
        overflow: hidden;
        background: pink;
        margin-right: 10px;
        margin-bottom: 0px;
    }
    .review-star{
        margin-bottom: 5px;
        font-size: 13px;
        height:25px;
    }
    .review-content{
        margin-bottom: 40px;
        font-size: 13px;
    }
    .fa-star{color: rgb(231, 217, 17)}
</style>
</head>
<body>


	<!-- 수강 후기 -->
	<div class="class-review">
		<c:forEach var="s" items="${ sList }">
			<div class="review-area">
				<div class="box">
					<img src="resources/images/user_icon3.png">
					<span style="font-size: 14px;">${ s.userNo }</span>
				</div>
				<div class="review-star"> 
					<i class="fas fa-star"></i> ${ s.score }
				</div>
				<div class="review-content">
					${ s.review }
				</div>
			</div>
		</c:forEach>
	</div>

    
</body>
</html>