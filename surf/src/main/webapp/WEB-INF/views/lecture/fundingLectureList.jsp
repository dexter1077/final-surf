<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>funding</title>
<style>
    .outer{
        width: 1200px;
        margin: auto;
    }
    .container{display: flex; width: 1200px;}
    .class-area{
        width: 100%; 
        background: white;
    }
    #menu-title{
        font-size: 25px; 
        font-weight: bold; 
        height: 100px;
        line-height: 70px;
    }
    .select-list{
        margin-top: 15px; 
        margin-left: 15px;
        height: 50px; 
    }
    .class-list{
        height: 1000px;
        margin-top: 30px;
    }
    .thumbnail {
        margin: auto;
        border: 1px solid white;
        width: 240px;
        display: inline-block;
        margin: 14px;
        text-align: left;
    }
    .thumbnail:hover {
        cursor: pointer;
        /*border: 1px solid rgb(0, 120, 51);*/
        /*background: rgba(0, 120, 52, 0.1);*/
    }
    /*.thumbnail span{margin-bottom: 5px;}*/
    .thumbnail>p{height: 55px;}
    .class-thumb{position: relative;}
    .scrap-icon img{position:absolute;top: 20px;}
    #pagingArea{width:fit-content;margin:auto;}
    .support-btn{
        margin-top: 10px;
        width: 240px;
        background-color: rgb(32, 155, 212);
        color: white;
        font-weight: bold;
    }

    /*모달css*/
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
        max-width:700px;
        border-radius:10px;      
        overflow:hidden;          
        background-color:rgb(32, 155, 212); 
        box-shadow: 5px 10px 10px 1px rgba(0,0,0,.3); 
    }
    .popup-head{
        width:100%;
        height:30px;
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
        /*height:70px;*/
        margin-bottom:10px;
    }
    .body-contentbox{
        word-break:break-word;
        overflow-y:auto;
        min-height:100px;
        max-height:600px;
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
    .pop-btn.confirm{
    	border-right:1px solid lightgray;
    	color: white;
    	font-weight:bold; 
    }
    .modal-img{
        width: 100%;
        height: 400px;
        text-align: center;
        position:relative;
    }
    #funding-img{width: 640px; height: 300px;}
    .modal-img .text{
        position:absolute;
        top:370px;
        left:510px;
        color: white;
        -webkit-text-stroke-width: 1px;
		-webkit-text-stroke-color: black;
    }
    .category{color: darkgray; font-size: 13px; margin-top: 10px;}
    .intro-content{margin-top: 10px; max-width: 600px;}
    .fa-heart{color: red; margin-right: 2px;}
    p>b{margin-bottom: 5px; font-size:15px;}
</style>
</head>
<body>

    <div class="outer">
        
        <!-- header-->
        <jsp:include page="../common/header.jsp" />
		
		<br><br>

        <div class="container">

            <!-- 클래스 목록 -->
            <div class="class-area">

                <!-- select option-->
                <div class="select-list">
                    <div id="menu-title">펀딩중인 클래스</div>
                </div>

                <!-- 클래스 -->
                <div class="class-list">

				<c:forEach var="f" items="${ fList }">
                    <div class="thumbnail" align="center">
                    	<div class="user-no">
                        	<input type="hidden" name="classNo" value="${ f.classNo }">
                        </div>
                        <div class="class-thumb">
                             <img src="${ f.thumbnail }" width="240" height="150" id="">
                        </div>
    
                        <p style="margin-top: 10px;">
                            <b>${ f.classTitle }</b><br>
                            <span style="font-size:14px">${ f.teacherName }</span> <br>
                            <span style="font-size:14px">
                                 <i class="fas fa-heart"></i> ${ f.fundingCount }
                            </span> <br>
                        </p>
                        <button type="button" class="btn support-btn" id="modal-open"
                      	style="background-color: rgb(32, 155, 212); color:white; font-weight:bold;">
                        	응원하기
                        </button>
                    </div>
				</c:forEach>
                    
                    

                    <!-- 페이징 
                    <br><br><br>
                    <div id="pagingArea">
                        <ul class="pagination">
		                	<c:choose>
		                		<c:when test="${ pi.currentPage eq 1 }">
		                    		<li class="page-item disabled"><a class="page-link">&lt;</a></li>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<li class="page-item"><a class="page-link" href="list.bo?currentPage=${ pi.currentPage - 1 }">Previous</a></li>
		                    	</c:otherwise>
		                    </c:choose>
		                    
		                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		                    	<li class="page-item"><a class="page-link" href="list.bo?currentPage=${ p }">${ p }</a></li>
		                    </c:forEach>
		                    
		                    <c:choose>
		                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
			                    	<li class="page-item disabled"><a class="page-link">&gt;</a></li>
			                    </c:when>
			                    <c:otherwise>
			                    	<li class="page-item"><a class="page-link" href="list.bo?currentPage=${ pi.currentPage + 1 }">Next</a></li>
			                    </c:otherwise>
			                </c:choose>
		                </ul>
                    </div>-->
                    <br><br>


                </div>

            </div>

        </div>

        <!-- 응원하기 클릭시 모달창 -->
        <!-- modal area -->
        <form action="" method="POST">

            <div id="fundingClass">
                <div class="popup-wrap" id="popup"> <!--모달을 감싸는 박스-->
                    <div class="popup">	<!--모달팝업-->
                        <div class="popup-head">
                            <span class="head-title"></span>
                            </div>
                            <div class="popup-body">	<!--컨텐츠 영역-->
	                            <div class="body-content">
	                                <div class="body-titlebox">
	                                    <h3></h3>
	                                </div>
	                                <div class="body-contentbox">
	                                    
	                                    <div class="modal-img">
	                                        <img src="" class="funding-img" 
	                                        style="width: 640px; height: 400px; ">
	                                        <!--클래스 대표 이미지 넣기-->
	                                        <div class="text">
	                                            현재 응원수 <strong></strong>개
	                                        </div>
	                                    </div>
	                                    <div class="category">
	                                        
	                                    </div>
	                                    <div class="intro-content">
	                                        
	                                    </div>
	                                </div>
	                            </div>
                            </div>
                            <div class="popup-foot">
                            <button type="submit" class="pop-btn btn confirm" id="confirm" onclick="supportLecture()">응원하기</button>
                            <span class="pop-btn modalClose" id="close" >취소</span>
                        </div>
                    </div>
                </div>
            </div>
            
        </form>

        <script>
        
	     	// 모달
	        $(function(){
	            $("#confirm").click(function(){
	                modalClose(); 
	            });
	            $(document).on("click","#modal-open", function(){        
	                $("#popup").css('display','flex').hide().fadeIn();
	            });
	            $("#close").click(function(){
	                modalClose(); 
	            });
	            function modalClose(){
	                $("#popup").fadeOut(); 
	            }
	        });
        
        	var cno = $(".user-no").children().val();
        	var uno = '${loginUser.userNo}';
        	
        	// 모달 상세 조회
        	$(document).on("click", "#modal-open", function(){
        	//function selectLecture(){
        	
        		$.ajax({
        			url : '/surf/fundingDetail.lec?cno=' + $(".user-no").children().val(),
        			//data : { classNo : cno },
        			success: function(data){
        				
        				var value = "";
        				
        				value += "<div class='body-titlebox'>" 
                        	   + 	"<h3>" + data.classTitle + "</h3>"
                        	   + "</div>"
                        	   + "<div class='body-contentbox'>"
                               + 	"<div class='modal-img'>"
                               		if( data.introFile != null){
                               			value += "<img src='" + data.introFile + "' class='funding-img' style='width: 620px; height: 400px;'>";
                               		} else{
                               			value += "<img src='' class='funding-img' style='width: 640px; height: 400px;'>";
                               		}
                               + 		"<div class='text'>"
                               +     		"현재 응원수 <strong>" + data.fundingCount + "</strong>개"
                               + 		"</div>"
                               +    "</div>";
                               if(data.mainCat == null && data.subCat == null){
                            	value += 	"<div class='category'>"
 	                               	  + 	"</div>";
                               }else{
                            	value += 	"<div class='category'>"
	                            	  + 		"" + data.mainCat + "-" + data.subCat 
	                               	  + 	"</div>";
                               }
                               if(data.introContent != null){
	                               value +=	"<div class='intro-content'>"
	                               		 + 		"" + data.introContent
	                               		 + 	"</div>";
                               }else{
                            	   value +=	"<div class='intro-content'>"
	                               		 + 		"소개 내용이 없습니다."
	                               		 + 	"</div>";
                               }
                        value += "</div>";
        				
        				$(".body-content").children().remove();
        				$(".body-content").html(value);
                        	   
        				//$("#popup").css('display','flex').hide().fadeIn();
        			}, error : function(){
        				console.log("실패");
        			}
        		
        		}) // End of ajax
        	
        	}); // End of modal-open Click
        
        	// 응원하기 에이작스
            function supportLecture(){
                
        		if(${empty loginUser}){
        			alert("로그인 후 이용가능합니다.")
        		}else{
        		
	            	$.ajax({
	        			url : '/surf/support.lec?cno=' + cno,
	        			type : "get", 
	        			data : { userNo : uno },
	        			success: function(result){
	        				
	        				if(result == 1 ){
	        					
		        				alert("클래스를 응원했습니다!");
		        				
	        				} else {
	        					alert("응원 실패!");
	        				}
	        				
	        			}, error : function(){
	        				console.log("응원하기 ajax 실패");
	        			}
	        		
	        		}) // End of ajax
	        		
        		}
        		
            } // End of supportLecture
    
        </script>

        <!-- footer -->
        <jsp:include page="../common/footer.jsp" />

    </div>
    
</body>
</html>