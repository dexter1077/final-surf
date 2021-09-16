<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order cancel success</title>

<style>
    .outer{
        width: 1200px;
        margin: auto;
        margin-top: 50px;
    }
    .container{margin:auto; width: 500px;}
    .title>p{font-size: 23px; font-weight: bold; margin-bottom: 0;}
    .title>span{font-size:15px; color: gray}
    .btn-area>button{width: 250px; border: 1px solid;}
    .btn-area>button:hover{
        cursor: pointer;
        font-weight: bold;
        color: rgb(32, 155, 212);
    }
</style>
</head>
<body>

    <div class="outer">
        
        <!-- header -->
        <jsp:include page="../common/header.jsp" />
		
		<br><br>

        <div class="container" style="width:500px;">

            <div id="cancel-success" >
                <div class="title">
                    <p id="">주문 취소가 완료되었습니다.</p>
                    <span>처리까지 3~7일 소요됩니다.</span>
                </div>
                <br><br>
    
                <div class="order-info" style="border-bottom: 1px solid lightgray;">
                    <span style="display: inline-block; width: 100px; margin-top: 10px;">주문번호</span> 
                    <span>20210141245</span> <br>
                    <span style="display: inline-block; width: 100px; margin-top: 10px;">클래스명</span> 
                    <span>우리는 왜 글을 쓰는가</span> <br>
                    <span style="display: inline-block; width: 100px; margin-top: 10px;">
                        <strong>환불 금액</strong>
                    </span> 
                    <span style="text-align: right;">200,000원</span> <br>
                    <br>
                </div>
                <br>
                <div class="btn-area" align="center">
                    <button type="button" class="btn" onclick="">홈으로</button>
                </div>
                <br><br><br>

            </div>

        </div>

		<br><br>
		
        <!-- footer -->
        <jsp:include page="../common/footer.jsp" />
		
		
    </div>
    
</body>
</html>