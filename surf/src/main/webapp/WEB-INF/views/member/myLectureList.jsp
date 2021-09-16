<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Lecture</title>
<style>
    .outer{
        width: 1200px;
        margin: auto;
    }
    .container{display: flex;}
    .sub-nav{width: 20%; height: 800px;}
    .menu-title{
        font-size: 25px; 
        font-weight: bold; 
        height: 100px;
        line-height: 70px;
        margin-left: 37px;
    }
    .class-area{
        /*width: 80%; */
        background: white;
        margin-left: 30px;
    }
    .class-list{height: 800px;}
    .thumbnail {
        margin: auto;
        border: 1px solid white;
        width: 240px;
        display: inline-block;
        margin: 10px;
        text-align: left;
    }
    .thumbnail:hover {
        cursor: pointer;
        opacity: 0.7;
    }
    /*.thumbnail span{margin-bottom: 5px;}*/
    .thumbnail>p{height: 65px;   }
    .class-thumb{position: relative;}
    .scrap-icon img{position:absolute;top: 20px;}
    #pagingArea{width:fit-content;margin:auto;}
    #modal-open{
    	background-color: rgb(32, 155, 212);
    	width: 240px;
    	color: white;
    }

    /*진행바*/
    progress {
        -webkit-appearance: none;
        margin-top: 10px;
        width: 240px;
        height: 10px;
    }

    ::-webkit-progress-bar {
        background-color: lightgray; 
        border-radius: 10px;
    }

    ::-webkit-progress-value {
        background-color: rgb(32, 155, 212);
        border-radius: 10px;
    }
    /*별점*/
    /*
    em {
        display: block;
        margin: .5em auto 2em;
        color: #bbb;
    }
    p,
    p a {
        color: #aaa;
        text-decoration: none;
    }
    p a:hover,
    p a:focus {
        text-decoration: underline;
    }
    p+p {
        color: #bbb;
        margin-top: 2em;
    }
    */
    .detail {
        position: absolute;
        text-align: right;
        right: 5px;
        bottom: 5px;
        width: 50%;
    }
    button[href*="intent"] {
        display: inline-block;
        margin-top: 0.4em;
    }
     /* 별점 스타일 
    .rating {
        width: 90px;
        margin: 0 auto 1em;
        font-size: 20px;
        overflow: hidden;
        margin-bottom:10px;
    }
    .rating input {
        float: right;
        opacity: 0;
        position: absolute;
    }
    .rating button,
    .rating label {
        float: right;
        color: #aaa;
        text-decoration: none;
        -webkit-transition: color .4s;
        -moz-transition: color .4s;
        -o-transition: color .4s;
        transition: color .4s;
        padding: 0px;
    }
    .rating label:hover~label,
    .rating input:focus~label,
    .rating label:hover,
    .rating button:hover,
    .rating button:hover~button,
    .rating button:focus,
    .rating button:focus~button {
        color: orange;
        cursor: pointer;
    }
    .rating2 {direction: rtl;}
    .rating2 button {float: none}*/
    /*모달*/
    .popup-wrap {
        background-color: rgba(0, 0, 0, .3);
        justify-content: center;
        align-items: center;
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        display: none;
        padding: 15px;
    }
    .popup {
        width: 100%;
        max-width: 500px;
        border-radius: 10px;
        overflow: hidden;
        background-color: rgb(32, 155, 212);
        box-shadow: 5px 10px 10px 1px rgba(0, 0, 0, .3);
    }
    .popup-head {
        width: 100%;
        height: 30px;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .popup-body {width: 100%; background-color: #ffffff;}
    .body-content {width: 100%; padding: 30px;}
    .body-titlebox {
        text-align: center;
        width: 100%;
        height: 30px;
        margin-bottom: 10px;
    }
    .body-titlebox>h3{font-weight: bold;}
    .body-contentbox {
        word-break: break-word;
        overflow-y: auto;
        min-height: 100px;
        max-height: 450px;
    }
    .body-contentbox>strong{font-size: 15px;}
    .body-contentbox>p {font-size: 13px; color: gray;}
    .popup-foot {width: 100%; height: 50px;}
    .pop-btn {
        display: inline-flex;
        width: 50%;
        height: 100%;
        justify-content: center;
        align-items: center;
        float: left;
        color: #ffffff;
        cursor: pointer;
        background-color: rgb(32, 155, 212);
    }
    .pop-btn.confirm {
    	border-right: 1px solid lightgray;
    	background-color: rgb(32, 155, 212);
    	color: white;
    }
    #review-input{
    	height: 30px;
        border-top: none;
        border-left: none;
        border-right: none;
        border-bottom: 1px solid gray;}
        
    .rating {
	  display:flex;
	  flex-direction: row-reverse;
	  font-size:1.5em;
	  justify-content:space-around;
	  padding:0 .2em;
	  text-align:center;
	  width:5em;
	}
	
	.rating input {
	  display:none;
	}
	
	.rating label {
	  color:#ccc;
	  cursor:pointer;
	}
	
	.rating :checked ~ label {
	  color:#f90;
	}
	
	.rating label:hover,
	.rating label:hover ~ label {
	  color:#fc0;
	}
	#classTitle{
	    width:240px;
	    text-overflow:ellipsis;
	    white-space:nowrap;
	    overflow:hidden;
	    display:inline-block;
    }
</style>
</head>
<body>

    <div class="outer">
        
        <!-- header-->
        <jsp:include page="../common/header.jsp" />
		
		<br><br>

        <div class="container">

            <!-- 마이페이지 사이드바 -->
            <div class="sub-nav">
            <br>
                <jsp:include page="memberMenubar.jsp" />
            </div>

            <div class="content">

                <!-- 타이틀 -->
                <div class="menu-title">
                    <p>수강중인 클래스</p>
                </div>

                <!-- 클래스 목록 -->
                <div class="class-area">

                    <!-- 클래스 -->
                    <div class="class-list">

                        <c:forEach var="m" items="${ mList }">
	                        <div class="thumbnail" align="center" onclick="location.href='detail.lec?cno=${m.classNo}'">
	                            <input type="hidden" name="classNo" value="${ m.classNo }">
	                            <input type="hidden" name="teacherNo" value="${ m.teacherNo }">
	                            <div id="class-thumb">
	                                <img src="${ m.thumbnail }" width="240" height="150" id="">
	                            </div>
	        
	                            <p style="margin-top: 5px;">
	                                <b id="classTitle">${ m.classTitle }</b><br>
	                                <progress id="pro_value" value="20" max="100"></progress>
	                                <span id="progress" style="font-size:14px">진행률 65%</span> 
	                            </p>
	                            <button type="button" class="btn" id="modal-open">설문조사</button>
	                        </div>
                        </c:forEach>
                        

                        <!-- 페이징 
                        <br><br><br><br>
                        <div id="pagingArea ">
                            <ul class="pagination">
                                <li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#">4</a></li>
                                <li class="page-item"><a class="page-link" href="#">5</a></li>
                                <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
                            </ul>
                        </div>-->
                        <br><br>

                    </div>

                </div>
            </div>

        </div>
        
        <!-- 설문조사 클릭시 모달창 -->
        <!-- modal area -->
        <!-- <form action="survey.lec" method="POST"> -->

            <div id="survey">
                <div class="popup-wrap" id="popup"> <!--모달을 감싸는 박스-->
                    <div class="popup">	<!--모달팝업-->
                        <div class="popup-head">
                            <span class="head-title"></span>
                            </div>
                            <div class="popup-body">	<!--컨텐츠 영역-->
                            <div class="body-content">
                                <div class="body-titlebox">
                                    <h3>설문조사</h3>
                                </div>
                                <div class="body-contentbox">
                                    <p align="center">수강하신 클래스에 대한 후기를 남겨주세요!</p><br>

                                    <strong>퀄리티</strong>
                                    <div class="class-quality rating rating2">
	                                      <input type="radio" id="q-5-stars" name="q-rating" value="5" />
										  <label for="q-5-stars" class="star">&#9733;</label>
										  <input type="radio" id="q-4-stars" name="q-rating" value="4" />
										  <label for="q-4-stars" class="star">&#9733;</label>
										  <input type="radio" id="q-3-stars" name="q-rating" value="3" />
										  <label for="q-3-stars" class="star">&#9733;</label>
										  <input type="radio" id="q-2-stars" name="q-rating" value="2" />
										  <label for="q-2-stars" class="star">&#9733;</label>
										  <input type="radio" id="q-1-star" name="q-rating" value="1" />
										  <label for="q-1-star" class="star">&#9733;</label> 
                                    </div>

                                    <strong>만족도</strong>
                                    <div class="class-sati rating rating2">
	                                      <input type="radio" id="s-5-stars" name="s-rating" value="5" />
										  <label for="s-5-stars" class="star">&#9733;</label>
										  <input type="radio" id="s-4-stars" name="s-rating" value="4" />
										  <label for="s-4-stars" class="star">&#9733;</label>
										  <input type="radio" id="s-3-stars" name="s-rating" value="3" />
										  <label for="s-3-stars" class="star">&#9733;</label>
										  <input type="radio" id="s-2-stars" name="s-rating" value="2" />
										  <label for="s-2-stars" class="star">&#9733;</label>
										  <input type="radio" id="s-1-star" name="s-rating" value="1" />
										  <label for="s-1-star" class="star">&#9733;</label>
                                    </div>
                                    
                                    <strong>난이도</strong>
                                    <div class="class-diffi rating rating2">
	                                      <input type="radio" id="d-5-stars" name="d-rating" value="5" />
										  <label for="d-5-stars" class="star">&#9733;</label>
										  <input type="radio" id="d-4-stars" name="d-rating" value="4" />
										  <label for="d-4-stars" class="star">&#9733;</label>
										  <input type="radio" id="d-3-stars" name="d-rating" value="3" />
										  <label for="d-3-stars" class="star">&#9733;</label>
										  <input type="radio" id="d-2-stars" name="d-rating" value="2" />
										  <label for="d-2-stars" class="star">&#9733;</label>
										  <input type="radio" id="d-1-star" name="d-rating" value="1" />
										  <label for="d-1-star" class="star">&#9733;</label>
                                    </div>

                                    <strong>가격</strong>
                                    <div class="class-price rating rating2">
                                          <input type="radio" id="p-5-stars" name="p-rating" value="5" />
										  <label for="p-5-stars" class="star">&#9733;</label>
										  <input type="radio" id="p-4-stars" name="p-rating" value="4" />
										  <label for="p-4-stars" class="star">&#9733;</label>
										  <input type="radio" id="p-3-stars" name="p-rating" value="3" />
										  <label for="p-3-stars" class="star">&#9733;</label>
										  <input type="radio" id="p-2-stars" name="p-rating" value="2" />
										  <label for="p-2-stars" class="star">&#9733;</label>
										  <input type="radio" id="p-1-star" name="p-rating" value="1" />
										  <label for="p-1-star" class="star">&#9733;</label>
                                    </div>

                                    <strong>평점</strong>
                                    <div class="class-star rating rating2" >
                                          <input type="radio" id="t-5-stars" name="t-rating" value="5" />
										  <label for="t-5-stars" class="star">&#9733;</label>
										  <input type="radio" id="t-4-stars" name="t-rating" value="4" />
										  <label for="t-4-stars" class="star">&#9733;</label>
										  <input type="radio" id="t-3-stars" name="t-rating" value="3" />
										  <label for="t-3-stars" class="star">&#9733;</label>
										  <input type="radio" id="t-2-stars" name="t-rating" value="2" />
										  <label for="t-2-stars" class="star">&#9733;</label>
										  <input type="radio" id="t-1-star" name="t-rating" value="1" />
										  <label for="t-1-star" class="star">&#9733;</label>
                                    </div>

                                    <strong>후기</strong> 
                                    <input type="text" name="review" id="review-input" style="width: 300px;" value="">
                                </div>
                            </div>
                            <div class="popup-foot">
                            <button type="submit" class="pop-btn btn confirm" id="confirm">제출하기</button>
                            <span class="pop-btn modalClose" id="close">취소</span>
                        	</div>
                    	</div>
                    </div>
                </div>
            </div>
            
        <!-- </form> -->

        <script>
        
        	var uno = ${loginUser.userNo};
        	var cno = $('input[name=classNo]').val();
        	var tno = $('input[name=teacherNo]').val();
        	
        	var qual = 0;
        	var sati = 0;
        	var diffi = 0;
        	var pri = 0;
        	var sco = 0;
        	var re= "";
        	$('input[name=q-rating]').on('click', function() {
        		qual = $(this).val();
        		$(this).attr("checked", true);
            });
        	$('input[name=s-rating]').click(function(){
        		 sati = $(this).val();
        		 $(this).attr("checked", true);
        	});
        	$('input[name=d-rating]').click(function(){
        		 diffi = $(this).val();
        		 $(this).attr("checked", true);
        	});
        	$('input[name=p-rating]').click(function(){
        		 pri = $(this).val();
        		 $(this).attr("checked", true);
        	});
        	$('input[name=t-rating]').click(function(){
        		 sco = $(this).val();
        		 $(this).attr("checked", true);
        	});
        	
        	// 진행률 
        	$(document).ready(function(){
        		console.log(cno);
        		console.log(uno);
        		
        		$.ajax({
        			url: "progress.lec",
        			data: {
        				classNo : cno,
        				userNo : uno
        			}, success:function(result){
        				
        				$("#pro_value").val(result);
        				$("#progress").html("진행률 " + result + "%");
        				
        			}, error:function(){
        				console.log("진행률 실패");
        			}
        		})
        		
        	}) // End of ready
        	
        	// 설문조사
        	$(".confirm").on("click", function(){
				
        		
        		
        		console.log(qual);
        		console.log(sati);
        		console.log(diffi);
        		console.log(pri);
        		console.log(sco);
        		console.log($("input[name=review]").val());
        		console.log(tno);
            	
        		$.ajax({
        			url: "survey.lec",
        			data: {
        				userNo : uno,
        				quality : qual,
        				satisfaction : sati,
        				difficulty: diffi,
        				price : pri,
        				score : sco,
        				review : $("input[name=review]").val(),
        				classNo : cno,
        				teacherNo : tno
        			}, success:function(result){
        				
        				if(result > 0){
	        				alert("설문 조사가 성공적으로 제출되었습니다!");
        				}else{
        					console.log("설문조사 디비 실패");
        				}
        				
        			}, error:function(){
        				console.log("설문조사 통신 실패");
        			}
        		});
        		
        	})
        	
            // 모달
            $(function(){
                $("#confirm").click(function(){
                    modalClose(); 
                });
                $("#modal-open").click(function(e){        
                    $("#popup").css('display','flex').hide().fadeIn();
                    e.stopImmediatePropagation();
                });
                $("#close").click(function(){
                    modalClose(); 
                });
                function modalClose(){
                    $("#popup").fadeOut(); 
                }
            });
            
        </script>


        <!-- footer -->
        <jsp:include page="../common/footer.jsp" />

    </div>
    
</body>
</html>