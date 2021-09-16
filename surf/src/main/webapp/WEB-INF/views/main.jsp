<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SURF</title>
</head>
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
<!-- XEicon 아이콘 -->
<link rel="stylesheet"
	href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<!-- Slick Slider -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<style>
div {
	border: 0px solid black;
	box-sizing: border-box;
}

#outer {
	width: 1200px;
	height: auto;
	margin: auto;
}

#body-wrap {
	width: 1080px;
	height: 1350px;
	margin: auto;
	color: rgb(40, 40, 40);
	font-family: 'Noto Sans KR', sans-serif;
}

#banner {
	width: 100%;
	height: auto;
	margin-top: 40px;
	margin-bottom: 20px;
}

/* 광고 배너 슬라이드 관련 */
.slide-wrap {
	position: relative;
	width: 1080px;
	height: 340px;
}

.slide-box {
	width: 100%;
	margin: auto;
	overflow-x: hidden;
}

.img-box>img {
	display: block;
	width: 100%;
}

/* 메인 부모 */
.slide-list1 {
	position: relative;
}

.slide-list1 .item {
	position: relative;
}

/* 버튼 요소 */
.slide-list1 button {
	position: absolute;
	z-index: 1;
	top: 50%;
	transform: translateY(-50%);
	width: 71px;
	height: 71px;
	/* 버튼 속 글씨 지우는 방법 */
	color: transparent;
	font-size: 0;
}
/* 버튼 속 아이콘 통일 화 */
.slide-list1 button::before {
	font-family: "xeicon";
	display: block;
	color: rgb(70, 70, 70);
	font-size: 50px;
}

/* 버튼 요소 - 좌 */
.slide-list1 button.slick-prev {
	left: 10px;
}
/* 버튼 요소 - 좌 아이콘 넣기위해서 */
.slide-list1 button.slick-prev::before {
	content: "\e93d";
}

/* 버튼 요소 - 우 */
.slide-list1 button.slick-next {
	right: 10px;
}
/* 버튼 요소 - 우 아이콘 넣기위해서 */
.slide-list1 button.slick-next::before {
	content: "\e940";
}
/* 페이지네이션 */
.slick-dots {
	bottom: 0px;
}

/* 카테고리 */
#main-category {
	width: 100%;
	height: 120px;
}

.sort-box {
	margin-top: 15px;
	margin-left: 86px;
	width: 80px;
	float: left;
}

.sort-box:hover {
	cursor: pointer;
}

.sort-img {
	background-color: lightgray;
	width: 80px;
	height: 80px;
	border-radius: 70%;
	overflow: hidden;
	border: 0px;
}

.sort-img>img {
	width: 80px;
	height: 80px;
	object-fit: cover;
}

.sort-name {
	width: 80px;
	text-align: center;
	font-size: 15px;
	margin-top: 4px;
	font-weight: 500;
}
.condition {
	font-size: 15px;
	color: gray;
}
.condition:hover {
	cursor: pointer;
}

/* 추천 클래스 */
#recommend {
	width: 100%;
	height: 360px;
	position: relative;
}

#recommend-title {
	font-size: 20px;
	font-weight: 700;
	margin-top: 13px;
	margin-left: 23px;
	width: 110px;
	position: absolute;
}

#class-sort {
	margin-top: 20px;
	margin-left: 815px;
	position: absolute;
	font-size: 14px;
}

#class-sort div {
	float: left;
}

.vertical-line {
	float: left;
	border-color: lightgray;
	border-style: solid;
	border-width: 0 0 0 1px;
	margin: 4px 5px;
	width: 0px;
	height: 15px;
	vertical-align: middle;
}

.class-box {
	float: left;
	width: 240px;
	height: 270px;
	margin-top: 60px;
	margin-left: 24px;
}

.class-box:hover {
	cursor: pointer;
}

.class-img {
	width: 240px;
	height: 150px;
}

.class-img>img {
	width: 240px;
	height: 150px;
	object-fit: cover;
}

.like {
	margin-top: 7px;
	margin-left: 207px;
	width: 24px;
	opacity: 0.5;
}

.class-name {
	width: 235px;
	height: 45px;
	overflow: hidden;
	text-overflow: ellipsis;
	font-weight: 500;
	margin: 4px 2px 4px 3px;
}

.class-teacher {
	float: left;
	width: 173px;
	margin: 0 2px;
}

.score {
	float: left;
	margin-left: 5px;
	height: 26px;
	margin-top: -24px;
}

.score>img {
	float: left;
	width: 20px;
	margin-top: 2px;
}

.score>p {
	float: left;
	margin-top: 1px;
}

.class-price {
	font-weight: 500;
	width: 173px;
	float: left;
	margin: 0 2px;
}

.scrapCount {
	float: left;
	margin-left: 5px;
	height: 27px;
}

.scrapCount>img {
	float: left;
	width: 16px;
	margin-top: 2px;
	margin-left: 2px;
}

.scrapCount>p {
	float: left;
	margin-top: -1px;
}

#recommend hr {
	position: relative;
	top: 345px;
}

/* 커뮤니티 */
#community {
	width: 50%;
	height: 420px;
	float: left;
	position: relative;
}

#community-title {
	font-size: 20px;
	font-weight: 700;
	top: 13px;
	left: 23px;
	position: absolute;
}

#more {
	position: absolute;
	width: 60px;
	top: 30px;
	left: 455px;
	font-size: 14px;
	font-weight: 500;
}

#more:hover {
	cursor: pointer;
}

#post-wrap {
	position: absolute;
	top: 60px;
	left: 35px;
}

.post-box {
	width: 480px;
	height: 80px;
	margin-bottom: 7px;
	position: relative;
	background-color: rgb(250, 250, 250);
}

.post-box:hover {
	cursor: pointer;
}

.post-title {
	position: absolute;
	width: 360px;
	height: 27px;
	float: left;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	top: 9px;
	left: 14px;
	font-weight: 700;
}

.post-box>img {
	position: absolute;
	top: 10px;
	left: 425px;
}

.post-writer {
	position: absolute;
	width: 88px;
	top: 34px;
	left: 380px;
	font-size: 13px;
	text-align: right;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.post-date {
	position: absolute;
	top: 52px;
	left: 410px;
	font-size: 13px;
	text-align: right;
}

.post-content {
	position: absolute;
	width: 360px;
	height: 40px;
	float: left;
	overflow: hidden;
	top: 34px;
	left: 14px;
	font-size: 13px;
}

/* 클래스 펀딩 */
#funding {
	width: 50%;
	height: 420px;
	float: left;
	position: relative;
}

#funding-title {
	font-size: 20px;
	font-weight: 700;
	top: 13px;
	left: 23px;
	position: absolute;
}

#funding-banner {
	position: absolute;
	width: 480px;
	height: 340px;
	top: 60px;
	left: 35px;
}

/* 펀딩 배너 슬라이드 관련 */
.slide_wrap2 {
	position: relative;
	width: 480px;
	height: 340px;
}

.slide_box2 {
	width: 100%;
	margin: auto;
	overflow-x: hidden;
}

/* 메인 부모 */
.slide-list2 {
	width: 480px;
	position: relative;
	font-family: 'Noto Sans KR', sans-serif;
}

.slide-list2 .item {
	position: relative;
}

.slide-list2 .item picture img {
	width: 480px;
	height: 340px;
	opacity: 0.8;
	object-fit: cover;
}

/* 버튼 요소 */
.slide-list2 button {
	position: absolute;
	z-index: 1;
	top: 50%;
	transform: translateY(-50%);
	width: 71px;
	height: 71px;
	/* 버튼 속 글씨 지우는 방법 */
	color: transparent;
	font-size: 0;
}
/* 버튼 속 아이콘 통일 화 */
.slide-list2 button::before {
	font-family: "xeicon";
	display: block;
	color: rgb(70, 70, 70);
	font-size: 50px;
}

/* 버튼 요소 - 좌 */
.slide-list2 button.slick-prev {
	left: 10px;
}
/* 버튼 요소 - 좌 아이콘 넣기위해서 */
.slide-list2 button.slick-prev::before {
	content: "\e93d";
}

/* 버튼 요소 - 우 */
.slide-list2 button.slick-next {
	right: 10px;
}
/* 버튼 요소 - 우 아이콘 넣기위해서 */
.slide-list2 button.slick-next::before {
	content: "\e940";
}
/* 페이지네이션 */
.slick-dots {
	bottom: 7px;
}

    /* 슬라이더 시작 */
    /* 슬라이더 시작 - 슬라이더 속 텍스트 이동 및 통일화 */
    .slide-list2 .text-box {
        position:absolute;
        top:50%;
        left:50%;
        width:100%;
        transform:translateX(-50%) translateY(-50%);
        z-index:2;
        background-color: rgba(255,255,255,0.5);
    }
    .slide-list2 .text-box p {
        text-align:center;
        color:rgb(20, 20, 20);
    }
    .slide-list2 .text-box p img {
        width: 30px;
        float: left;
    }

    /* 애니메이션 v2 키프레임으로 애니메이션 적용 */
    /* 트렌지션으로 주면 약간의 딜레이가 생겨서 */

    .slide-list2 .text1 {
        opacity:0;
        font-size: 26px;
        font-weight: 700;
        margin: 1rem 55px 0px 55px;
    }

    .slide-list2 .slick-active .text1 {
        animation:ani 1 .3s .3s both;
    }

    .slide-list2 .text2 {
        opacity:0;
        font-size: 20px;
        font-weight: 500;
    }

    .slide-list2 .slick-active .text2 {
        animation-name:ani;
        animation-delay: .5s;
        animation-duration: .3s;
        /* 몇번 실행할 것인지 */
        animation-iteration-count:1;
        /* 실행하고 마지막 100%를 유지하기 */
        animation-fill-mode: both;
    }

    .slide-list2 .text3 {
        opacity:0;
        font-size:18px;
        font-weight: 700;
    }
    
    /* full 버전 */
    .slide-list2 > .slick-list > .slick-track > .slick-active > div .text3 {
        animation-name: ani;
        animation-delay: .7s;
        animation-duration: .3s;
        /* 몇번 실행할 것인지 */
        animation-iteration-count:1;
        /* 실행하고 마지막 100%를 유지하기 */
        animation-fill-mode: both;
    }
    .bar{
        border-top: 0.1pc solid rgb(250, 250, 250);
        width: 70%;
        margin: auto;
    }

    @keyframes ani {
        0% {
            opacity:0;
        }
        100% {
            opacity:1;
        }
    }
</style>
<body>
	<div id="outer">

		<jsp:include page="common/header.jsp" />

		<div id="body-wrap">
			<div id="banner">
				<div class="slide-wrap">
					<div class="slide-box">
						<section class="slide-list1">

							<div class="item item-1 banner-1">
								<picture class="img-box"> <img
									src="resources/images/main/ad_none.jpg"> </picture>
							</div>
							<div class="item item-2 banner-2">
								<picture class="img-box"> <img
									src="resources/images/main/ad_none.jpg"> </picture>
							</div>
							<div class="item item-3 banner-3">
								<picture class="img-box"> <img
									src="resources/images/main/ad_none.jpg"> </picture>
							</div>
							<div class="item item-4 banner-4">
								<picture class="img-box"> <img
									src="resources/images/main/ad_none.jpg"> </picture>
							</div>
							<div class="item item-5 banner-5">
								<picture class="img-box"> <img
									src="resources/images/main/ad_none.jpg"> </picture>
							</div>

						</section>
					</div>
				</div>
			</div>

			<!-- Slick Slider -->
			<script
				src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
			<script type="text/javascript">
	        
	        	// 광고 배너 ajax 조회
	        	$(function(){		                    	
		             ajaxAdList();
		        })
	                    
	            function ajaxAdList() {
	                    		
		            $.ajax({
		    				url:"ajaxAdList.do",
		    				success:function(alist){
			    					
			    				for(var a in alist) {
				    				$(".slide-list1").find(".slick-track").children().not(".slick-cloned").eq(a).find("img").attr("src", alist[a].changeName);
		                            $(".slide-list1").find(".slick-track").children().not(".slick-cloned").eq(a).find("img").attr("onclick", "location.href='" + alist[a].adLink + "';");
		                        }
			    				
		                        $(".slide-list1").find(".slick-track").children(".slick-cloned").eq(0).find("img").attr("src", alist[4].changeName);
		                        $(".slide-list1").find(".slick-track").children(".slick-cloned").eq(1).find("img").attr("src", alist[0].changeName);
		                        
		    				},error:function(){
		    					console.log("광고 배너 조회 ajax 통신 실패");
		    				}
					})
	            }
	            
	            console.clear();
	            $('.slide-list1').slick({
	                autoplay: true,
	                autoplaySpeed: 4000,
	                dots:true
	            });
	        
	        </script>

			<div id="main-category">
				<div class="sort-box" onclick="location.href='list.lec?sno=33'">
					<div class="sort-img">
						<img src="resources/images/main/develop.jpg">
					</div>
					<div class="sort-name">개발</div>
				</div>
				<div class="sort-box" onclick="location.href='list.lec?sno=12'">
					<div class="sort-img">
						<img src="resources/images/main/crafts.jpg">
					</div>
					<div class="sort-name">공예</div>
				</div>
				<div class="sort-box" onclick="location.href='list.lec?sno=41'">
					<div class="sort-img">
						<img src="resources/images/main/writing.jpg">
					</div>
					<div class="sort-name">글쓰기</div>
				</div>
				<div class="sort-box" onclick="location.href='list.lec?sno=23'">
					<div class="sort-img">
						<img src="resources/images/main/drawing.jpg">
					</div>
					<div class="sort-name">드로잉</div>
				</div>
				<div class="sort-box" onclick="location.href='list.lec?sno=51'">
					<div class="sort-img">
						<img src="resources/images/main/workout.jpg">
					</div>
					<div class="sort-name">운동</div>
				</div>
				<div class="sort-box" onclick="location.href='list.lec?sno=62'">
					<div class="sort-img">
						<img src="resources/images/main/baking.jpg" alt="">
					</div>
					<div class="sort-name">쿠킹</div>
				</div>
			</div>
			<script>
	            $(function(){
	                $(".sort-box").hover(function(){
	                    $(this).children(".sort-img").css("opacity", "0.8");
	                }, function(){
	                    $(this).children(".sort-img").css("opacity", "1");
	                })
	            });
	        </script>

			<hr>
			<div id="recommend">
				<div id="recommend-title">추천 클래스</div>
				<div id="class-sort">
					<input type="hidden" name="condition" value="1">
					<div class="condition">
						찜개수 기준 <input type="hidden" value="1">
					</div>
					<div class="vertical-line"></div>
					<div class="condition">
						별점 기준 <input type="hidden" value="2">
					</div>
					<div class="vertical-line"></div>
					<div class="condition">
						수강생수 기준 <input type="hidden" value="3">
					</div>
				</div>
				<script>
					$(function(){
						if($("input[name=condition]").val() == "1") {
							$(".condition input[value=1]").parent().css("color", "black");
						}else if($("input[name=condition]").val() == "2") {
							$(".condition input[value=2]").parent().css("color", "black");
						}else {
							$(".condition input[value=3]").parent().css("color", "black");
						}
					})
				
	            	$(".condition").click(function(){
	            		$("input[name=condition]").val($(this).children("input").val());
	            		$(".condition").css("color", "gray");
	            		$(this).css("color", "black");
	            		ajaxRecomClassList();
	            	});
	            </script>

				<div id="class-wrap"></div>
				<hr>
				<script>
		            $(document).on("mouseenter", ".class-box", function() {
		            	$(this).children(".class-img").css("opacity", "0.8");
		            });
		            $(document).on("mouseleave", ".class-box", function() {
		            	$(this).children(".class-img").css("opacity", "1");
		            });
		            $(document).on("click", ".class-box", function() {
		            	location.href="detail.lec?cno=" + $(this).children("input").val();
		            });

	                /*
	                $(".like").hover(function(){
	                    $(this).attr("src", $(this).attr("src").replace("heart-empty.png", "heart-fill.png"));
	                }, function(){
	                    $(this).attr("src", $(this).attr("src").replace("heart-fill.png", "heart-empty.png"));
	                });
	                */
	                    
	                $(function(){
	                    ajaxRecomClassList();
	                });
	                
	                function ajaxRecomClassList() {
	                	$.ajax({
	                		url:"ajaxRecomClassList.do",
	                		data:{"condition":$("input[name=condition]").val()},
							success:function(clist){
								
								var value="";
								
			    				for(var c in clist){
			    					
				    				value += "<div class=\"class-box\">"
				    						 + "<input type=\"hidden\" value=\"" + clist[c].classNo + "\"/>"
				    						 + "<div class=\"class-img\">"
				    					     + "<img src=\"" + clist[c].thumbnail + "\"></div>"
				    					     + "<div class=\"class-name\">" + clist[c].classTitle + "</div>"
				    					     + "<div class=\"class-teacher\">" + clist[c].teacherName + "</div>"
				   						     + "<div class=\"class-price\">" + clist[c].classPrice + "</div>"
				   						     + "<div class=\"score\">"
				   		                     + "<img src=\"https://img.icons8.com/color/48/000000/filled-star--v1.png\"/>"
				   		                     + "<p>&nbsp;(" + clist[c].score + ")</p>"
				   		                	 + "</div>"
				   		                	 + "<div class=\"scrapCount\">"
				   		                     + "<img src=\"resources/images/main/heart-fill.png\"/>"
				   		                     + "<p>&ensp;&ensp;&nbsp;" + clist[c].scrapCount + "</p>"
				   		                	 + "</div>"
				   						     + "</div>";
				    			}
			    				
			    				$("#class-wrap").html(value);
			    				
							},error:function(){
								console.log("추천 클래스 조회 ajax 통신 실패");
							}
	                	})
	                }
	            </script>
			</div>

			<div id="community">
				<div id="community-title">커뮤니티</div>
				<div id="more">더보기 ></div>
				<div id="post-wrap"></div>
				<script>
		            $(document).on("click", "#more", function() {
		            	location.href="list.sb";
		            });
	            
		            $(document).on("mouseenter", ".post-box", function() {
		            	$(this).css("background-color", "rgb(245, 245, 245)");
		            });
		            $(document).on("mouseleave", ".post-box", function() {
		            	$(this).css("background-color", "rgb(250, 250, 250)");
		            });
		            $(document).on("click", ".post-box", function() {
		            	location.href="detail.sb?sno=" + $(this).children("input").val();
		            });
	            
		            $(function(){
		            	ajaxPostList();
	                });
	                
	                function ajaxPostList() {
	                	$.ajax({
	                		url:"ajaxPostList.do",
							success:function(plist){
								
								var value="";
								
			    				for(var p in plist){
			    					
			    					var originalContent = plist[p].studyContent;
			    					var convertContent = originalContent.replace(/(<([^>]+)>)/ig,"");

			    					value += "<div class=\"post-box\">"
				    						 + "<input type=\"hidden\" value=\"" + plist[p].studyNo + "\"/>"
				    						 + "<div class=\"post-title\">" + plist[p].studyTitle + "</div>"
				    					     + "<img src=\"https://img.shields.io/badge/%EB%AA%A8%EC%A7%91%EC%A4%91-00B388?style=flat-square&&logoColor=white\">"
				    					     + "<div class=\"post-writer\">" + plist[p].writer + "</div>"
				    					     + "<div class=\"post-date\">" + plist[p].createDate + "</div>"
				   						     + "<div class=\"post-content\">" + convertContent + "</div>"
				   						     + "</div>";
				    			}
			    				
			    				$("#post-wrap").html(value);
								
							},error:function(){
								console.log("추천 클래스 조회 ajax 통신 실패");
							}
	                	})
	                }
	            </script>
			</div>

			<div id="funding">
				<div id="funding-title">펀딩 중인 클래스</div>
				<div id="funding-banner">
					<div class="slide_wrap2">
						<div class="slide_box2">
							<section class="slide-list2">
								<div class="item item-1">
									<picture class="img-box"> <img
										src="resources/images/main/funding_none.jpg"> </picture>
									<div class="text-box">
										<p class="text text1"></p>
										<p class="text text2">
											클래스 펀딩이 준비 중입니다.<br>새로운 클래스를 기대해주세요!
										</p>
										<p class="text text3"></p>
									</div>
								</div>
								<div class="item item-2">
									<picture class="img-box"> <img
										src="resources/images/main/funding_none.jpg"> </picture>
									<div class="text-box">
										<p class="text text1"></p>
										<p class="text text2">
											클래스 펀딩이 준비 중입니다.<br>새로운 클래스를 기대해주세요!
										</p>
										<p class="text text3"></p>
									</div>
								</div>
								<div class="item item-3">
									<picture class="img-box"> <img
										src="resources/images/main/funding_none.jpg"> </picture>
									<div class="text-box">
										<p class="text text1"></p>
										<p class="text text2">
											클래스 펀딩이 준비 중입니다.<br>새로운 클래스를 기대해주세요!
										</p>
										<p class="text text3"></p>
									</div>
								</div>
								<div class="item item-4">
									<picture class="img-box"> <img
										src="resources/images/main/funding_none.jpg"> </picture>
									<div class="text-box">
										<p class="text text1"></p>
										<p class="text text2">
											클래스 펀딩이 준비 중입니다.<br>새로운 클래스를 기대해주세요!
										</p>
										<p class="text text3"></p>
									</div>
								</div>
								<div class="item item-5">
									<picture class="img-box"> <img
										src="resources/images/main/funding_none.jpg"> </picture>
									<div class="text-box">
										<p class="text text1"></p>
										<p class="text text2">
											클래스 펀딩이 준비 중입니다.<br>새로운 클래스를 기대해주세요!
										</p>
										<p class="text text3"></p>
									</div>
								</div>
							</section>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
	        
	        	// 펀딩 배너 ajax 조회
	        	$(function(){		                    	
		             ajaxFundingList();
		        })
	                    
	            function ajaxFundingList() {
	                    		
		            $.ajax({
		    				url:"ajaxFundingList.do",
		    				success:function(flist){
			    				
				    			for(var f in flist){
		                            $(".slide-list2").find(".slick-track").children().not(".slick-cloned").eq(f).find(".item").attr("onclick", "location.href='funding.lec'");
				    				$(".slide-list2").find(".slick-track").children().not(".slick-cloned").eq(f).find("img").attr("src", flist[f].thumbnail);
		                            $(".slide-list2").find(".slick-track").children().not(".slick-cloned").eq(f).find("p").eq(0).html(flist[f].classTitle);
		                            $(".slide-list2").find(".slick-track").children().not(".slick-cloned").eq(f).find("p").eq(1).html("응원 현황 : " + flist[f].count + " / " + flist[f].standard);
		                            $(".slide-list2").find(".slick-track").children().not(".slick-cloned").eq(f).find("p").eq(2).text("응원하러 가기!");
			    				}

		                        $(".slide-list2").find(".slick-track").children(".slick-cloned").eq(0).find("img").attr("src", flist[4].thumbnail);
		                        $(".slide-list2").find(".slick-track").children(".slick-cloned").eq(1).find("img").attr("src", flist[0].thumbnail);
			    				
		    				},error:function(){
		    					console.log("펀딩 배너 조회 ajax 통신 실패");
		    				}
					})
	            }
	            
	            console.clear();
	           $('.slide-list2').slick({
	                autoplay: true,
	                autoplaySpeed: 4000,
	                dots:true
	            });
	        
	        </script>

		<jsp:include page="common/footer.jsp" />

	</div>
</body>
</html>