<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order success</title>

<style>
    .outer{
        width: 1200px;
        margin: auto;
        margin-top: 50px;
    }
    .container{margin:auto; width: 500px;}
    .title{font-size: 25px; font-weight: bold; }
    .order-info>strong{font-size: 17px; color: rgb(32, 155, 212);}
    .orderer-info>input{margin-top: 5px; width: 250px;}
    .order-btn-area>a{width: 150px; border: 1px solid;}
    .order-btn-area>a:hover{
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

            <div id="payment-success" >
                <input type="hidden" name="userNo" value="">
                <div class="title">
                    결제 완료
                </div>
                <br><br>
    
                <div class="order-info" style="border-bottom: 1px solid lightgray;">
                    <strong>결제 성공</strong> <br>
                    <span style="display: inline-block; width: 100px; margin-top: 10px;">주문번호</span> 
                    <span>20210141245</span> <br>
                    <span style="display: inline-block; width: 100px; margin-top: 10px;">결제 수단</span> 
                    <span>카드결제</span> <br><br>
                </div>
                <br>
                
                <div class="class-info" style="border-bottom: 1px solid lightgray;">
                    <strong>클래스 정보</strong> <br>
                    <span style="display: inline-block; width: 100px; margin-top: 10px;">클래스명</span> 
                    <span>아이패드로 그리능ㄴㄹㅁ니ㅏㅇㄹㅁㄴ</span> <br>
                    <span style="display: inline-block; width: 100px; margin-top: 10px;">기간</span> 
                    <span>30일</span> <br><br>
                </div>
                <br>

                <div class="orderer-info" style="border-bottom: 1px solid lightgray;">
                    <strong>주문자 정보</strong> <br>
                    <span style="display: inline-block; width: 100px; margin-top: 10px;">성명</span> 
                    <span>김철수</span> <br>
                    <span style="display: inline-block; width: 100px; margin-top: 10px;">번호</span> 
                    <span>010-5555-7777</span> <br><br>
                </div>
                <br>

                <div class="payment-info" style="border-bottom: 1px solid lightgray;">
                    <span style="display: inline-block; width: 370px; ">총 결제 금액</span>
                    <span style="text-align: right;"><strong>535,000원</strong></span> <br>
                    <br>
                </div>
                <br>

                <div class="order-btn-area" align="center">
                    <a href="" class="btn">홈으로</a> &nbsp;&nbsp;&nbsp;
                    <a href="" class="btn">주문취소</a>
                </div>
                <br><br><br>

            </div>

        </div>


        <!-- footer -->
		<jsp:include page="../common/footer.jsp" />
		
    </div>
    
</body>
</html>