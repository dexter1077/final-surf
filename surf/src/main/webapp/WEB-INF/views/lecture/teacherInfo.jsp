<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Info</title>
<style>
    .outer{
        width: 1200px;
        margin: auto;
        margin-top: 50px;
    }
    .container{display: block; width: 850px;}
    .teacher-info-area{
        width: 100%; 
        height: 200px;  
        display: flex;
        margin-left: 150px;
    }
    .info-area{margin-left: 20px;}
    #teacher-img{height: 200px; width: 200px;}
    #teacher-name, #teacher-info, #teacher-class{
        height: 66px;
        display: block;
    }
    #teacher-name{margin-top: 20px;}
    .teacher-info-area img{width: 200px;}
    .content{width: 100%; margin-top: 50px;}
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
    .thumbnail>p{height: 120px;   }
    .class-thumb{position: relative;}
    .scrap-icon img{position:absolute;top: 20px;}
    .fa-star{color:rgb(231, 217, 17);}
    .fa-heart{color:red;}
    #pagingArea{width:fit-content;margin:auto;}
</style>
</head>
<body>

    <div class="outer">
        
        <!-- header -->
		<jsp:include page="../common/header.jsp" />
		
		<br><br>	
        <div class="container">

            <div class="teacher-info-area">
                <div id="teacher-img">
                    <img src="../resource/img/heart.png" alt="">
                </div>
                
                <div class="info-area" style="width: 550px;">
                    <div id="teacher-name" style="font-size: 25px;">
                        <strong>그림쟁이</strong> 
                    </div>
                    <div id="teacher-info">
                        안녕하세요 그림쟁이입니다.
                        홍익대학교 동양화과를 전공했고, 지금은 개인 전시회를 여는 예술가입니다.
                        잘 부탁드립니다.
                    </div>
                    <div id="teacher-class">
                        강의 5개 &nbsp; | &nbsp; 평점 4.5
                    </div>
                </div>
                
            </div>

            <div class="content">

                
                <div class="class-area">

                    <!-- 클래스 -->
                    <div class="class-list">

                        <div class="thumbnail" align="center">
                            <input type="hidden" value="">
                            <div id="class-thumb">
                                <img src="" width="240" height="150" id="">
                            </div>
        
                            <p style="margin-top: 5px;">
                                <b>아이패드로 여행 드로잉 한번에 끝내기 ㅇㅇㅇㅇㅇㅇㅇ</b><br>
                                <span style="font-size:14px">그림쟁이</span> <br>
                            <span style="font-size:14px"><b>월 30,000원</b></span> <br>
                            <span style="font-size:14px">
                                <i class="fas fa-star"></i>&nbsp;(5.0) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </span> 
                            <span style="font-size:14px">
                                <i class="fas fa-heart"></i>&nbsp; 1,120
                            </span> 
                            </p>
                        </div>
                        <div class="thumbnail" align="center">
                            <input type="hidden" value="">
                            <div id="class-thumb">
                                <img src="" width="240" height="150" id="">
                            </div>
        
                            <p style="margin-top: 5px;">
                                <b>아이패드로 여행 드로잉 한번에 끝내기 ㅇㅇㅇㅇㅇㅇㅇ</b><br>
                                <span style="font-size:14px">그림쟁이</span> <br>
                            <span style="font-size:14px"><b>월 30,000원</b></span> <br>
                            <span style="font-size:14px">
                                <img width="25px" src="../resource/img/star.png" alt="">(5.0) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </span> 
                            <span style="font-size:14px">
                                <img width="25px" src="../resource/img/heart.png" alt=""> 1,120
                            </span> 
                            </p>
                        </div>
                        <div class="thumbnail" align="center">
                            <input type="hidden" value="">
                            <div id="class-thumb">
                                <img src="" width="240" height="150" id="">
                            </div>
        
                            <p style="margin-top: 5px;">
                                <b>아이패드로 여행 드로잉 한번에 끝내기 ㅇㅇㅇㅇㅇㅇㅇ</b><br>
                                <span style="font-size:14px">그림쟁이</span> <br>
                            <span style="font-size:14px"><b>월 30,000원</b></span> <br>
                            <span style="font-size:14px">
                                <img width="25px" src="../resource/img/star.png" alt="">(5.0) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </span> 
                            <span style="font-size:14px">
                                <img width="25px" src="../resource/img/heart.png" alt=""> 1,120
                            </span> 
                            </p>
                        </div>
                        <div class="thumbnail" align="center">
                            <input type="hidden" value="">
                            <div id="class-thumb">
                                <img src="" width="240" height="150" id="">
                            </div>
        
                            <p style="margin-top: 5px;">
                                <b>아이패드로 여행 드로잉 한번에 끝내기 ㅇㅇㅇㅇㅇㅇㅇ</b><br>
                                <span style="font-size:14px">그림쟁이</span> <br>
                            <span style="font-size:14px"><b>월 30,000원</b></span> <br>
                            <span style="font-size:14px">
                                <img width="25px" src="../resource/img/star.png" alt="">(5.0) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </span> 
                            <span style="font-size:14px">
                                <img width="25px" src="../resource/img/heart.png" alt=""> 1,120
                            </span> 
                            </p>
                        </div>
                        
                        
                        
                        

                        <!-- 페이징 -->
                        <br><br><br>
                        <div id="pagingArea">
                            <ul class="pagination">
                                <li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#">4</a></li>
                                <li class="page-item"><a class="page-link" href="#">5</a></li>
                                <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
                            </ul>
                        </div>
                        <br><br>

                    </div>

                </div>

            </div>

        </div>


        <!-- footer -->
        <jsp:include page="../common/footer.jsp" />

    </div>
    
</body>
</html>