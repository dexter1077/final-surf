<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order cancel</title>
<style>
    .outer{
        width: 1200px;
        margin: auto;
        margin-top: 50px;
    }
    .container{margin: auto; width: 500px;}
    .title{font-size: 25px; font-weight: bold;}
    .orderer-info>input{margin-top: 5px; width: 250px;}
    .cancel-btn-area>button{width: 150px; border: 1px solid;}
    .cancel-btn-area>button:hover{
        cursor: pointer;
        font-weight: bold;
        color: rgb(32, 155, 212);
    }

    /*모달*/
    .popup-wrap{
        background-color:rgba(0,0,0,.3); 
        justify-content:center; 
        align-items:center;
        position:fixed;
        top:0;
        left:0;
        right:0;
        bottom:0; 
        display:none; 
        padding:15px; 
    }
    .popup{
        width:100%;
        max-width:400px;
        border-radius:10px;      
        overflow:hidden;          
        background-color:rgb(32, 155, 212); 
        box-shadow: 5px 10px 10px 1px rgba(0,0,0,.3); 
    }
    .popup-head{
        width:100%;
        height:50px;
        display:flex;
        align-items:center;
        justify-content:center;
    }
    .popup-body{
        width:100%;
        background-color:#ffffff;
    }
    .body-content{
        width:100%;
        padding:30px;
    }
    .body-titlebox{
        text-align:center;
        width:100%;
        height:40px;
        margin-bottom:10px;
    }
    .body-contentbox{
        word-break:break-word;
        overflow-y:auto;
        min-height:100px;
        max-height:200px;
    }
    .body-contentbox>p{font-size: 13px; color: gray;}
    .popup-foot{width:100%; height:50px;}
    .pop-btn{
        display:inline-flex;
        width:50%;
        height:100%;
        justify-content:center;
        align-items:center;
        float:left;
        color:#ffffff;
        cursor:pointer;
    }
    .pop-btn.confirm{border-right:1px solid lightgray; }
</style>
</head>
<body>

    <div class="outer">
        
        <!-- header -->
        <jsp:include page="../common/header.jsp" />
		
		<br><br>

        <div class="container" style="width:500px">

            <div id="payment-cancle-area">
                <input type="hidden" name="userNo" value="">
                <div class="title">
                    주문 취소
                </div>
                <br><br>
    
                <div class="order-info" style="border-bottom: 1px solid lightgray;">
                    <span style="display: inline-block; width: 100px; margin-top: 10px;">주문번호</span> 
                    <span>20210141245</span> <br>
                    <span style="display: inline-block; width: 100px; margin-top: 10px;">결제 수단</span> 
                    <span>카드결제</span> <br><br>
                </div>
                <br>

                <div class="order-info" style="border-bottom: 1px solid lightgray;">
                    <strong>취소할 클래스</strong> <br>
                    <span style="display: inline-block; width: 100px; margin-top: 10px;">클래스명</span> 
                    <span>아이패드로 그리능ㄴㄹㅁ니ㅏㅇㄹㅁㄴ</span> <br>
                    <span style="display: inline-block; width: 100px; margin-top: 10px;">강사명</span> 
                    <span>그림쟁이</span> <br><br>
                </div>
                <br>

                <div class="payment-info" style="border-bottom: 1px solid lightgray;">
                    <span style="display: inline-block; width: 370px; ">총 결제 금액</span>
                    <span style="text-align: right;"><strong>535,000원</strong></span> <br>
                    <br>
                </div>
                <br>

                <div class="cancel-btn-area" align="center">
                    <button type="button" class="btn" onclick="">홈으로</button> &nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn" id="modal-open">주문취소</button>
                </div>
                <br><br><br>

            </div>

        </div>

        <!-- modal area -->
        <form action="" method="POST">

            <div id="cancelOrder">
                <div class="popup-wrap" id="popup"> <!--모달을 감싸는 박스-->
                  <div class="popup">	<!--모달팝업-->
                    <div class="popup-head">
                        <span class="head-title"></span>
                    </div>
                    <div class="popup-body">	<!--컨텐츠 영역-->
                      <div class="body-content">
                        <div class="body-titlebox">
                          <h3>환불 사유를 선택해주세요</h3>
                        </div>
                        <div class="body-contentbox">
                          <p align="center">더 좋은 클래스를 만들기 위해 고객님의 의견이 필요해요.</p><br>
                          <input type="radio" id="payment" name="refundReason" value="">
                          <label for="payment">&nbsp; 결제 수단 변경</label><br>
                          <input type="radio" id="" name="refundReason" value="">
                          <label for="">&nbsp; 실수로 구매</label><br>
                          <input type="radio" id="changeHeart" name="refundReason" value="">
                          <label for="changeHeart">단순 변심</label><br>
                        </div>
                      </div>
                    </div>
                    <div class="popup-foot">
                      <span class="pop-btn confirm" id="confirm">환불 요청</span>
                      <span class="pop-btn modalClose" id="close">취소</span>
                    </div>
                  </div>
                 </div>
              </div>

        </form>

        <script>
            $(function(){
                $("#confirm").click(function(){
                    modalClose(); 
                    //컨펌 이벤트 처리 어케해

                });
                $("#modal-open").click(function(){        
                    $("#popup").css('display','flex').hide().fadeIn();
                });
                $("#close").click(function(){
                    modalClose(); 
                });
                function modalClose(){
                    $("#popup").fadeOut(); 
                }
            });
        </script>
        
        <br><br>

        <!-- footer -->
        <jsp:include page="../common/footer.jsp" />

    </div>
    
</body>
</html>