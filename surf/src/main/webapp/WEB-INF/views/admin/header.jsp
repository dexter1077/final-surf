<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <!-- 아이콘, w3schools 템플릿 관련 -->
    <!-- awesome icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/69851f8880.js" crossorigin="anonymous"></script>
    <!-- w3 schools style sheet -->
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    
    <!-- 공통 스타일 CSS -->
    <link rel="stylesheet" href="resources/css/commonStyle.css">
    
    <style>
        #header-outer {
            width: 1200px;
            /*border: 1px solid red;*/
            height: 120px;
            margin: auto;
        }
    
    
        .nav1 {
            width: 100%;
            box-sizing: border-box;
            /*border: green solid 1px;*/
        }
    
        #nav-part1 {
            height: 35%;
            padding-right: 20px;
            padding-top: 5px;
            font-size: 12px;
        }
    
        #nav-part1>a {
            text-decoration: none;
            color: black;
            font-weight: bold;
        }
    
        #nav-part1>a:hover {
            color: rgb(32, 155, 212);
            cursor : pointer;
        }
        
        #nav-part1>a::after{
            content: "|";
            color: #ccc;
            padding-left: 10px;
            padding-right: 10px;
        }

        #nav-part1>a:last-child::after{
            content : none;
        }
    
        #nav-part2>div,
        .icons>div {
            float: left;
            /*border: purple solid 1px;*/
            box-sizing: border-box;
            height: 100%;
        }
    
    
        .icons {
            text-align: center;
            padding-top: 20px;
        }
    
        #cat-detail {
            position: absolute;
            z-index: 999;
            margin: auto;
            left: 0;
            right: 0;
            display: none;
            background-color: whitesmoke;
            opacity: 0.9;
            width: 1000px;
            height: 200px;
    
        }
    
    	/*카테고리*/
		#cat-detail ul {
            float: left;
            height: 100%;
            width: calc(100%/7);
            padding: 0;
            text-align: center;
     }

        #cat-detail ul li {
            width: 100%;
            height: 45px;
            line-height: 45px;
            list-style-type: none;
        }
   
    	
    	#cat-detail a {
    		width:100%;
            text-align: center;
            text-decoration: none;
            font-size: 15px;
            color: rgb(94, 94, 94);    	
    	}
    	

        #cat-detail a:hover {
            color: rgb(32, 155, 212);
            font-weight: bold;
            cursor:pointer;
        }
    
    
        .loginButtons {
            margin: 3px;
            font-size: 14px;
        }
    
        .loginInputs {
            font-size: 14px;
        }
        
        .easyLogin{
            height: 35px; 
            width: 45%; 
            font-size: 13px; 
            padding: 0 8px 0 0; 
            line-height: 33px; 
            margin-bottom: 3px;
        }
    </style>
    </head>
    
    <body>
    
    	<c:if test="${ !empty alertMsg }">
    		<script>
    			alert("${alertMsg}");
    		</script>
    		<c:remove var="alertMsg" scope="session"/>
    	</c:if>
    
        <!-- 메뉴바 상단 -->
        <div id="header-outer">
            <div class="nav1" id="nav-part1" align="right">
            	<c:choose>
            		<c:when test="${ empty loginUser }">
		                <a data-toggle="modal" data-target="#loginModal">로그인</a>
            		</c:when>
            		<c:otherwise>
	                    <a href="logout.me">로그아웃</a>
            		</c:otherwise>
            	</c:choose>
            	
            	<c:choose>
            		<c:when test="${ empty loginUser }">
		                <a href="enrollForm.me">회원가입</a>
            		</c:when>
            		<c:otherwise>
            			<c:choose>
            				<c:when test="${ loginUser.userCode eq 'M' }">
			                    <a href="">강사신청</a>
            				</c:when>
            				<c:when test="${ loginUser.userCode eq 'T' }">
		            		    <a href="updateForm.te">강사페이지</a>
            				</c:when>
            				<c:otherwise>
			                    <a href="login.ad">관리자 페이지</a>
            				</c:otherwise>
            			</c:choose>
            		</c:otherwise>
            	</c:choose>
                <a href="">고객센터</a>
            </div>
    
    
            <!-- 로그인 modal -->
            <!-- The Modal -->
            <div class="modal fade" id="loginModal" align="center">
                <div class="modal-dialog modal-dialog-centered modal-sm">
                    <div class="modal-content">
    
                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h6 class="modal-title">로그인</h6>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
    
                        <!-- Modal body -->
                        <div class="modal-body">
                        
                        <!-- 로그인 form -->
                            <form action="login.me" method="post">
                                <div class="input-group mb-3 mp-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="fa fa-user"></i>
                                        </span>
                                    </div>
                                    <input type="text" class="form-control loginInputs" placeholder="아이디" id="usr" name="email">
                                </div>
    
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="fa fa-lock"></i>
                                        </span>
                                    </div>
                                    <input type="password" class="form-control loginInputs" placeholder="비밀번호" id="pwd" name="password">
                                </div>
                                
                                <div>
                                    <div class="hr-sect" style="font-size: 13px; color: rgb(94, 94, 94);">간편로그인</div>
                                </div>
    
	                            <button type="button" class="btn btn-warning loginButtons easyLogin" style="background-color: #FFCD00;">
	                                <img style="width: 42px; height: 30px;" src="https://img.shields.io/badge/-FFCD00?style=flat-square&logo=KakaoTalk&logoColor=black" />
	                                                                      카카오
	                            </button>
	                            <button type="button" class="btn btn-success loginButtons easyLogin" style="background-color: #03C75A;">
	                                <img style="width: 42px; height: 30px;" src="https://img.shields.io/badge/-03C75A?style=flat-square&logo=Naver&logoColor=white" />
	                                                                      네이버
	                            </button>
    
                                <button type="submit" class="btn btn-primary loginButtons" style="width: 93%;">로그인</button>
                                <button type="button" onclick="location.href='findIdPwd.me';" class="btn btn-secondary loginButtons" style="width: 93%;">아이디/비밀번호  찾기</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 로그인 modal 끝 -->
    
            <!-- 메뉴바 하부 -->
            <div class="nav1" id="nav-part2" style="height: 65%;">
                <!-- 로고 -->
                <div style="width: 20%;">
                    <div style="width: 60%; float: left;">
                        <span style="font-size: 50px; font-weight:bold; color: rgb(32, 155, 212);">SURF</span>
                    </div>
                    <div  style="width: 40%; height:100%; float:left;">
                    <a href="list.bo">
                        <img src="resources/images/redhair.png" style="height: 100%; ">
                    </a>
                    </div>
                </div>
                
                
            </div>
        </div>
    
    
    
    </body>
    
    </html>