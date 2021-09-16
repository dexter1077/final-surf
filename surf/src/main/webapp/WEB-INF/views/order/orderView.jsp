<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order</title>
    <!-- 결제 API -->
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
    .outer{
        width: 1200px;
        margin: auto;
        margin-top: 50px;
    }
    .container{margin-left: 200px; width: 500px;}
    .title{font-size: 25px; font-weight: bold;}
    .orderer-info>input{margin-top: 5px; width: 250px;}
    .payment-method>button{
        width: 150px;
        border: 1px solid ;
    }
    .payment-method>button:hover{
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

            <div id="payment-form" action="" method="POST">
                <input type="hidden" name="userNo" value="">
                <div class="title">
                    결제하기
                </div>
                <br><br>
    
                <div class="order-info" style="border-bottom: 1px solid lightgray;">
                    <strong>주문정보</strong> <br>
                    <img src="" width="200px" height="150px" style="margin: 10px 0px 10px 0px;"> <br>
                    <strong>아이패드로 어쩌구 </strong> <br>
                    <span style="display: inline-block; width: 100px; margin-top: 10px;">강사명</span> 
                    <span>그림쟁이</span> <br>
                    <span style="display: inline-block; width: 100px; margin-top: 10px;">기간</span> 
                    <span>30일</span> <br><br>
                </div>
                <br>

                <div class="orderer-info" style="border-bottom: 1px solid lightgray;">
                    <strong>주문자 정보</strong> <br>
                    <span style="display: inline-block; width: 100px; margin-top: 10px;">성명</span> <br>
                    <input type="text" placeholder="김철수"><br>
                    <span style="display: inline-block; width: 100px; margin-top: 10px;">휴대폰 번호</span> <br>
                    <input type="text" placeholder="010-5555-4444"><br><br>
                </div>
                <br>

                <div class="payment-info" style="border-bottom: 1px solid lightgray;">
                    <strong>결제 정보</strong> <br>
                    <span style="display: inline-block; width: 370px; margin-top: 10px;">총 결제 금액</span>
                    <span style="text-align: right;"><strong>535,000원</strong></span> <br>
                    <br>
                </div>
                <br><br>

                <div class="payment-method" align="center">
                    <button type="submit" class="btn" onclick="iamport();">카드 결제</button> &nbsp;&nbsp;&nbsp;
                    <button type="submit" class="btn">무통장 입금</button>
                </div>
                <br><br><br>

            </div>
            
            <script>
            /*
	            function iamport(){
	        		//가맹점 식별코드
	        		IMP.init('imp91671029');
	        		IMP.request_pay({
	        		    pg : 'kcp',
	        		    pay_method : 'card',
	        		    merchant_uid : 'merchant_' + new Date().getTime(),
	        		    name : '상품1' , //결제창에서 보여질 이름
	        		    amount : 100, //실제 결제되는 가격
	        		    buyer_email : 'iamport@siot.do',
	        		    buyer_name : '구매자이름',
	        		    buyer_tel : '010-1234-5678',
	        		    buyer_addr : '서울 강남구 도곡동',
	        		    buyer_postcode : '123-456'
	        		}, function(rsp) {
	        			console.log(rsp);
	        		    if ( rsp.success ) {
	        		    	var msg = '결제가 완료되었습니다.';
	        		        msg += '고유ID : ' + rsp.imp_uid;
	        		        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        		        msg += '결제 금액 : ' + rsp.paid_amount;
	        		        msg += '카드 승인번호 : ' + rsp.apply_num;
	        		    } else {
	        		    	 var msg = '결제에 실패하였습니다.';
	        		         msg += '에러내용 : ' + rsp.error_msg;
	        		    }
	        		    alert(msg);
	        		});
	        	}
            */
            </script>

        </div>


        <!-- footer -->
		<jsp:include page="../common/footer.jsp" />

    </div>
    
</body>
</html>