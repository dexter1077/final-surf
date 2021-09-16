<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detail</title>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
    .outer{
        width: 1200px;
        margin: auto;
    }
    .container{
        /*display: flex; */
        width: 1200px; 
        /*background: gray;*/
        padding: 0px 0px 0px 0px;
    }
    .class-element{width: 100%; height: 300px; display: flex;}
    .class-element img{
        width: 680px;
        height: 100%;
        margin: auto;
    }
    .class-main-info{margin-left: 40px; }
    .class-main-info>div{width: 400px; margin-bottom: 15px;}
    #info-title{
	    height:80px; 
	    font-size: 23px; 
	    font-weight: bolder;
	    line-
    }
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
    .class-full-info *{margin-bottom: 30px}
    #class-representative{width: 60%; height: 100%; margin-left: 10px;}
    .fa-star{color: rgb(231, 217, 17)}

    /*강의소개*/
    .class-title, .class-content{margin-left: 50px;}
    .class-title{
        padding: 50px 0 20px 0;
        width: 600px;
        font-size: 25px;
    }
    .class-content{
        width: 1000px;
        font-size: 17px;
        padding-bottom: 10px;
    }
    .class-notice{width: 100%; padding-left: 50px;}
    .notice-title{
        font-size: 18px; font-weight: bold;
        margin-bottom: 15px;
    }
    .notice-content{font-size: 15px; margin-bottom: 5px;}
    .notice-content>span{
        display: inline-block; 
        width: 150px;
        margin-bottom: 10px;
    }
    .class-slider{
    	position: relative;
    }

    /*이미지 슬라이드*/
    /*
    .slider-area{
        width: 1140px; 
        text-align: center;
        margin: 0;
    }
    #slider {
        position: relative;
        overflow: hidden;
        margin: 20px auto 20px 160px;
        border-radius: 4px;
    }
    #slider ul {
        position: relative;
        margin: 0;
        padding: 0;
        height: 200px;
        list-style: none;
    }
    #slider ul li {
        position: relative;
        display: block;
        float: left;
        margin: 0;
        padding: 0;
        width: 800px;
        height: 600px;
        background: #ccc;
        text-align: center;
        line-height: 300px;
    }
    #slider img{width: 100%; height: 100%; }
    button.control_prev, button.control_next{
        position: absolute;
        top: 40%;
        z-index: 999;
        display: block;
        padding: 4% 3%;
        width: auto;
        height: auto;
        color: white;
        text-decoration: none;
        font-weight: 600;
        font-size: 18px;
        opacity: 0.8;
        cursor: pointer;
    }
    button.control_prev:hover, button.control_next:hover {
        opacity: 1;
    }
    button.control_prev {
        border-radius: 0 2px 2px 0;
    }
    button.control_next {
        right: 0px;
        border-radius: 2px 0 0 2px;
    }
    .slider_option {
        position: relative;
        margin: 10px auto;
        width: 160px;
        font-size: 18px;
    }
    .intro-content{
   		color:black;
    }*/
    
	.intro-area {
        width: 700px;
        height: 550px;
        position: relative;
        margin: auto;
    }
    .intro-image {
        width: 600px;
        height: 600px;
        background-size: cover;
        border-radius: 10px;
        animation: fade 2s;
        margin: auto;
    }
    .images {
        width: 600px;
        height: 400px;
    }
    .prev,.next {
        cursor: pointer;
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        font-size: 1.5rem;
        transition: 0.6s ease;
        border-radius: 5px;
        border: 0px;
        background-color: white;
    }
    .next {
        right: 0;
    }
    .prev:hover,
    .next:hover {
        background-color: rgba(190, 190, 190, 0.5);
        border:0px;
    }
</style>
</head>
<body>

    <div class="outer">
        
        <!-- header -->
		<jsp:include page="../common/header.jsp" />
		
		<br><br>
        <div class="container" style="padding: 0px 0px 0px 0px;">
		
	            <div class="class-element">
	                
	                <div id="class-representative">
	                	<c:choose>
	                		<c:when test="${ count gt 0 }">
	                    		<img src="${ l.introFile }" onclick="location.href='lectureVideoList.le?classNo=${l.classNo}'"> 
	                    	</c:when>
	                    	<c:otherwise>
	                    		<img src="${ l.introFile }" alt="">
	                    	</c:otherwise>
	                    </c:choose>
	                </div>
	
	                <div class="class-main-info">
	                    <div id="info-title">${ l.classTitle }</div>
	                    <div id="info-price">
	                        <strong><fmt:formatNumber value="${ l.price }"/>원</strong><br>
	                        <span>(${ l.period })</span>
	                    </div>
	                    <div id="info-star">
	                        <i class="fas fa-star"></i> (${ l.star })
	                        &nbsp;&nbsp;&nbsp;
	                        ${ l.surveyCount }개의 수강후기 | 수강생 ${ l.students }명
	                    </div>
	                    <div id="info-teacher">
	                        <img src="${ l.teacherProfile }" style="width: 45px; height:45px; border-radius: 50px;"> &nbsp;
	                        <strong>${ l.teacherName }</strong> 
	                    </div>
	                    <div id="info-btn">
	                        <button type="button" class="btn" onclick="scrapCheck()">찜하기</button>
	                        <input type="hidden" name="classNo" value="${ l.classNo }">
	                        <a class="btn payIamport">결제하기</a>
	                    </div>
	                </div>
	                
	            </div>
	            
	            <div class="class-tab">
	                <div class="tab1"><button class="btn" onclick="history.go(0);">클래스 소개</button></div>
	                <div class="tab2"><button class="btn" onclick="acyncMovePage('chapter.lec?cno=${ l.classNo }&&cti=${ l.classTitle }');">커리큘럼</button></div>
	                <div class="tab3"><button class="btn" onclick="acyncMovePage('review.lec?cno=${ l.classNo }');">수강 후기</button></div>
	                <div class="tab4"><button class="btn" onclick="acyncMovePage('inquiry.lec?cno=${ l.classNo }');">수강 문의</button></div>
	            </div>
	            
	            <div class="class-full-info">
	                <div class="class-title">
	                    <b>
	                    ${ l.introTitle }
	                    </b> 
	                </div>
	
	                <div class="class-content">
	                    <p>
	                        ${ l.introContent }
	                    </p>
	                </div>
	
					<div class="intro-area">
		                <c:forEach var="c" items="${ cList }">
							<div class="intro-image">
				                <img src="${ c.introImage }" class="images">
				                <div class="intro-content">
				                	${ c.introContent }
				                </div>
			                </div>
		                </c:forEach>
		                
		                <button class="prev" onclick="slide_click(-1)">﹤</button>
		                <button class="next" onclick="slide_click(1)">﹥</button>
                	</div>
	                <br>
	
	                <div class="class-notice">
	                    <div class="notice-title">
	                        강의 정보
	                    </div>
	                    <div class="notice-content">
	                        <span><strong>수강 가능 기간</strong></span>
	                        ${ l.posTerm }개월 <br>
	                        <span><strong>준비물</strong></span> 
	                        ${ l.need } <br>
	                        <span><strong>유의사항</strong></span>
	                        ${ l.note }
	                    </div>
	                </div>
	                <br>
            	</div>
            	
			<script>

		        // 슬라이드
		        let currSlide = 1;
	            showSlide(currSlide);
	            
	            function slide_click(num){
	                showSlide((currSlide += num));
	            }
	            function showSlide(num){
	                const slides = document.querySelectorAll(".intro-image");
	                if(num>slides.length){
	                	currSlide =1;
	                }if(num<1){
	                	currSlide = slides.length;
	                }
	                for(let i=0; i<slides.length; i++){
	                	slides[i].style.display="none";
	                }slides[currSlide -1].style.display="block";
	            }
				
				var cno = $('input[name=classNo]').val();
		        var userNo = '${loginUser.userNo}';
			
				// 결제 관련
				var c_price = ${ l.price };
				var c_name = '${ l.classTitle }';
				var payNo = Math.floor(Math.random() * 100) + new Date().getTime();
				var now = new Date();
				var payMethod = 1;
				
				$('.payIamport').click(function (){
					
				if(${ empty loginUser }){
					alert("로그인 후 이용할 수 있습니다.");
				}else{
					
					IMP.init('imp08801453');
					IMP.request_pay({
					    pg : 'kakaopay',
					    pay_method : payMethod,
					    merchant_uid : 'merchant_' + new Date().getTime(),
					    name : c_name,
					    amount : c_price,
					    buyer_email : 'iamport@siot.do',
					    buyer_name : '구매자이름',
					    buyer_tel : '010-1234-5678',
					    buyer_addr : '서울특별시 강남구 삼성동',
					}, function(rsp) {
					    if ( rsp.success ) {
					    	console.log(rsp)
					    	
							var msg = '결제가 완료되었습니다.';
					    		alert(msg);
					    		
					    		var r_imp_uid = parseInt(rsp.imp_uid.replace(/[^0-9]/g,''));
					    		
					    		var payment = {
					    				//orderNo : r_imp_uid,
					    				classNo : cno,
					    				//userNo : uno,
					    				price : rsp.paid_amount,
					    				//paymentDate : new Date(),
					    				payMethod : payMethod,
					    				status : 'Y'
					    		}
					    	
					    	// 디비 주문내역
					    	jQuery.ajax({
					    		url: "payments.do?userNo=" + userNo, 
					    		type: 'POST',
					    		dataType: 'json',
					    		data: payment,
					    		success : function(result){
					    			console.log(result);
					    			if(result > 0){
					    				console.log("주문내역 DB 넣기 성공");
					    			} else{
					    				console.log("주문내역 DB 넣기 실패");
					    			}
					    			
					    		}
						    		
					    	})
					    } else {
					        var msg = '결제에 실패하였습니다.';
					        msg += '에러내용 : ' + rsp.error_msg;
					        console.log(rsp)
					        alert(msg);
					    }
					});
			
					}
				
				}) // End of payment
				
            	
		        // 찜하기 중복확인
		        function scrapCheck(){

					if(${ empty loginUser }){
						alert("로그인 후 이용할 수 있습니다.");
					}else{
						
			        	$.ajax({
			        		url: "scrapCheck.lec",
			        		data : {
			        			classNo : $('input[name=classNo]').val(),
			        			userNo : '${loginUser.userNo}'
			        		}, success: function(result){

			        			if(result > 0){
			        				alert("이미 찜한 클래스입니다.");
			        			}else {
			        				scrapLecture();
			        			}
			        			
			        		}, error:function(){
			        			console.log("찜하기 중복 ajax 실패");
			        		}
			        	}) // End of ajax
					}
					
		        }
		        
		        // 찜하기 
		        function scrapLecture(){
			     	
		            $.ajax({
		            	url: "scrap.lec",
		            	type: "GET",
		            	data: {
		            		classNo : cno,
		            		userNo : userNo
		            	},
		            	success:function(result){
		            		
		            		if(result == 1){
		            			
			            		alert("클래스를 찜했습니다!");
			            		
		            		}else{
		            			alert("찜하기에 실패하였습니다.");
		            		}
		            		
		            	}, error:function(){
		            		console.log("찜하기 ajax 실패");
		            	}
		            })
		            
		        }
		        

                </script>

        </div>

        <script>
        
            function acyncMovePage(url){

                // 탭메뉴 클릭
                var ajaxOption = {
                	url : url,
                    async : true,
                    type : "POST",
                    dataType : "html",
                    cache : false,
                    success: console.log("탭메뉴성공")
                };
                
                $.ajax(ajaxOption).done(function(data){
                    $('.class-full-info').children().remove();
                    $('.class-full-info').html(data);
                });
            }
         
        </script>


        <!-- footer -->
        <jsp:include page="../common/footer.jsp" />

    </div>
    
</body>
</html>