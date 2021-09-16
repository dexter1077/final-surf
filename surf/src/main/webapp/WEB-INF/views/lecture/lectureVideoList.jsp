<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 재생</title>
<!-- 1. BootStrap4 CDN -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- font-family: 'Nanum Gothic', sans-serif; -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<style>
    /*Bookmark on, off*/
    .bookmark-on {background-image: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pg0KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDE5LjAuMCwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPg0KPHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJDYXBhXzEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4Ig0KCSB2aWV3Qm94PSIwIDAgNTEyIDUxMiIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgNTEyIDUxMjsiIHhtbDpzcGFjZT0icHJlc2VydmUiPg0KPGc+DQoJPGc+DQoJCTxwYXRoIGQ9Ik00MjYuNjY3LDBIMTA3LjY2OUM0OC4yMTMsMCwwLDQ4LjIxMywwLDEwNy42Njl2MzgyLjk5N2MwLDguMzg0LDQuODg1LDE1Ljk1NywxMi41MjMsMTkuNDEzDQoJCQljNy41NzMsMy40NTYsMTYuNTMzLDIuMTU1LDIyLjg0OC0zLjM0OUwxOTIsMzY5LjY4NWwxNTYuNjI5LDEzNy4wNDVjMy45NDcsMy40NTYsOC45ODEsNS4yNjksMTQuMDM3LDUuMjY5DQoJCQljMi45ODcsMCw1Ljk5NS0wLjYxOSw4LjgxMS0xLjkyYzcuNjM3LTMuNDU2LDEyLjUyMy0xMS4wMjksMTIuNTIzLTE5LjQxM1YyNTZoMTA2LjY2N2MxMS43NzYsMCwyMS4zMzMtOS41NTcsMjEuMzMzLTIxLjMzMw0KCQkJVjg1LjMzM0M1MTIsMzguMjA4LDQ3My43OTIsMCw0MjYuNjY3LDB6IE00NjkuMzMzLDIxMy4zMzNIMzg0di0xMjhjMC0yMy41MzEsMTkuMTM2LTQyLjY2Nyw0Mi42NjctNDIuNjY3DQoJCQlzNDIuNjY3LDE5LjEzNiw0Mi42NjcsNDIuNjY3VjIxMy4zMzN6Ii8+DQoJPC9nPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPC9zdmc+DQo=)}
    .bookmark-off {background-image: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pg0KPCEtLSBHZW5lcmF0b3I6IEFkb2JlIElsbHVzdHJhdG9yIDE5LjAuMCwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246IDYuMDAgQnVpbGQgMCkgIC0tPg0KPHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJDYXBhXzEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4Ig0KCSB2aWV3Qm94PSIwIDAgNTEyLjA0MiA1MTIuMDQyIiBzdHlsZT0iZW5hYmxlLWJhY2tncm91bmQ6bmV3IDAgMCA1MTIuMDQyIDUxMi4wNDI7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKDEgMSkiPg0KCTxnPg0KCQk8cGF0aCBkPSJNNDI3LjA0OC0wLjk2NkM0MjYuNjAyLTAuOTg4LDQyNi4xNDktMSw0MjUuNjg3LTFIODQuMzk3QzM3LjI0NC0xLTAuOTc5LDM3LjIyMy0wLjk3OSw4NC4zNzZ2NDA1LjI5MQ0KCQkJYzAsMTguMzI5LDIxLjU4OCwyOC4xMjUsMzUuMzgxLDE2LjA1NUwxOTEuMDIxLDM2OC42OGwxNTYuNjE5LDEzNy4wNDFjMTMuNzk0LDEyLjA3LDM1LjM4MSwyLjI3NCwzNS4zODEtMTYuMDU1VjI1NWgxMDYuNjY3DQoJCQljMTEuNzgyLDAsMjEuMzMzLTkuNTUxLDIxLjMzMy0yMS4zMzNWODQuMzMzQzUxMS4wMjEsMzcuNjU4LDQ3My41NDktMC4yMzYsNDI3LjA0OC0wLjk2NnogTTM0MC4zNTQsNDQyLjY1M0wyMDUuMDY5LDMyNC4yNzgNCgkJCWMtOC4wNDMtNy4wMzgtMjAuMDUzLTcuMDM4LTI4LjA5NiwwTDQxLjY4Nyw0NDIuNjUzVjg0LjM3NmMwLTIzLjU4OSwxOS4xMjEtNDIuNzA5LDQyLjcwOS00Mi43MDloMjY3LjM3Mg0KCQkJYy0wLjMwNywwLjUzMS0wLjYsMS4wNy0wLjg5NiwxLjYwOGMtMC4wOTgsMC4xNzgtMC4yLDAuMzUzLTAuMjk2LDAuNTMyYy0wLjU3MywxLjA2LTEuMTIxLDIuMTM1LTEuNjQ5LDMuMjIxDQoJCQljLTAuMTI1LDAuMjU3LTAuMjQ2LDAuNTE1LTAuMzY4LDAuNzczYy0wLjQ2MiwwLjk3NS0wLjkwOSwxLjk1OC0xLjMzNSwyLjk1M2MtMC4wNywwLjE2NC0wLjE0NSwwLjMyNS0wLjIxNCwwLjQ5DQoJCQljLTAuNDcyLDEuMTIxLTAuOTE2LDIuMjU2LTEuMzQxLDMuNGMtMC4xMDIsMC4yNzQtMC4yLDAuNTUtMC4yOTksMC44MjVjLTAuMzc2LDEuMDQ2LTAuNzM1LDIuMS0xLjA3MSwzLjE2NA0KCQkJYy0wLjA0NSwwLjE0Mi0wLjA5NCwwLjI4Mi0wLjEzOCwwLjQyNGMtMC4zNjQsMS4xNzUtMC42OTcsMi4zNjQtMS4wMTEsMy41NjFjLTAuMDc2LDAuMjkxLTAuMTQ5LDAuNTgzLTAuMjIyLDAuODc1DQoJCQljLTAuMjgxLDEuMTItMC41NDUsMi4yNDgtMC43ODEsMy4zODVjLTAuMDIzLDAuMTEtMC4wNSwwLjIxOC0wLjA3MiwwLjMyOGMtMC4yNSwxLjIyNC0wLjQ2NSwyLjQ2MS0wLjY2MSwzLjcwNA0KCQkJYy0wLjA0OCwwLjMwNS0wLjA5NCwwLjYxMS0wLjEzOSwwLjkxN2MtMC4xNzcsMS4yMDQtMC4zMzYsMi40MTMtMC40NjIsMy42MzJjLTAuMDA2LDAuMDYyLTAuMDE1LDAuMTIzLTAuMDIyLDAuMTg1DQoJCQljLTAuMTI4LDEuMjY5LTAuMjE5LDIuNTQ5LTAuMjkyLDMuODM0Yy0wLjAxOCwwLjMxNi0wLjAzMywwLjYzMi0wLjA0OCwwLjk0OWMtMC4wNTgsMS4yOTYtMC4wOTksMi41OTYtMC4wOTksMy45MDd2MTQ5LjMzMw0KCQkJVjQ0Mi42NTN6IE00NjguMzU0LDIxMi4zMzNoLTg1LjMzM3YtMTI4YzAtMjMuNTY3LDE5LjA5OS00Mi42NjcsNDIuNjY3LTQyLjY2N3M0Mi42NjcsMTkuMDk5LDQyLjY2Nyw0Mi42NjdWMjEyLjMzM3oiLz4NCgk8L2c+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8Zz4NCjwvZz4NCjxnPg0KPC9nPg0KPGc+DQo8L2c+DQo8L3N2Zz4NCg==)}

    .bookmark-on, .bookmark-off{
        width: 40px;
        height: 40px;
        background-repeat: none;
        margin-top: 150px;
        cursor: pointer;
    }

    div{
        box-sizing: border-box;
    }
    .outer{
        width: 1200px;
        height: 800px;
        margin: auto;
        font-family: 'Nanum Gothic', sans-serif;
    }
    
    .head{
        width: 100%;
        height: 80px;
        border-bottom: 1px solid rgba(211, 211, 211, 0.5);
    }
    .lecture-list-btn, .home-btn, .degree{
        float: left;
        height: 40px;
        border-radius: 3px;
        margin-left: 20px;
        margin-top: 20px;
    }
    .lecture-list-btn, .home-btn{
        line-height: 40px;
        font-weight: 700px;
        text-align: center;
        font-size: 18px;
        color: white;
    }

    .degree{
        font-size:12px;
        font-weight: 900;
        color: orange;
        margin-left: 30px;
        margin-right: 600px;
    }
    .progress{
        width:170px;
        height: 10px;
    }
    .progress-bar{
        background:orangered;
        height: 10px;
    }
    


    .home-btn{
        width: 80px;
        font-weight: 700;
        background: rgb(32, 155, 212);
    }
    .lecture-list-btn{
        width: 140px;
        background: gray;
    }

    .content-box{
        width: 100%;
        height: 720px;
    }
    .content-box>div{
        float:left;
        height: 100%;
    }
    .left-box{
        width: 820px;
    }
    .right-box{
        width: 380px;
    }

    .left-box>div:first-child{
        width: 100%;
        height: 180px;
    }
    .left-box>div:first-child>div{height:100%; float: left;}
    .left-box>div:first-child>div:first-child{width: 750px;}
    .left-box>div:first-child>div:last-child{width: 70px;}

    .left-box>div:first-child>div:first-child{
        padding-top: 40px;
        padding-left: 40px;
    }
    .className{
        font-size: 24px;
        font-weight: 700;
    }
    .chapName{
        font-size: 18px;
        margin-top: 50px;
        font-weight: 700;
    }
    .video-title{
        font-size: 14px;
        font-weight: 700;
    }

    .left-box>div:nth-child(2){
        width: 100%;
        height: 500px;
        padding-top: 40px;
    }
    .video-area{
        width: 750px;
        height: 400px;
        border: 1px solid rgb(32, 155, 212, 0.1);
        border-radius: 5px;
    }

    .left-box>div:last-child{
        width: 100%;
        height: 40px;
        background: rgba(39, 50, 56, 0.9);
        color: white;
        font-size: 13px;
        line-height: 40px;
        font-weight: 700;
    }
    .left-box>div:last-child>a{
        text-decoration: none;
        color:white;
    }
    .current-step{
        font-size: 16px;
        margin-left: 40px;
        margin-right: 40px;
    }

    /*오른쪽 드래그 바 포함 영역*/
    .right-box{
        border: 1px solid rgba(255, 235, 152, 0.8);
        background: rgba(255, 235, 152, 0.1);
        border-radius: 2px;
    }
    .right-box>div:first-child{
        /*background: rgba(255, 235, 152, 0.4);*/
        width: 100%;
        height: 125px;
        border-bottom: 1px solid rgb(255, 235, 152);
        padding: 10px 0px 0px 10px;
    }
    .right-box>div:first-child>div:first-child{
        margin-top: 5px;
        font-size: 20px;
        font-weight: 700;
    }
    .right-box>div:first-child>div:nth-child(2){
        margin-top: 5px;
        font-size: 16px;
        font-weight: 600;
    }
    
    .right-box>div:last-child{
        overflow: auto;
        width: 100%;
        height: 595px;
    }

    .teacherName{
        margin-top: 5px;
        font-size: 14px;
        font-weight: 600;
    }
    
    .chapter{
        width: 100%;
        height:50px;
        background: lightgray;
        font-size: 15px;
        font-weight: 700;
        border-bottom: 1px solid rgba(211, 211, 211, 0.5);
        line-height: 50px;
        padding-left:10px;
        overflow:hidden;
		white-space: nowrap;
    }

    .step{
        width: 100%;
        height:50px;
        font-size: 14px;
        line-height: 50px;
        border-bottom: 1px solid lightgray;
        padding-left:10px;
        overflow:hidden;
		white-space: nowrap;
    }
    .step:hover{
        cursor: pointer;
        font-weight: 700;
        background: rgba(211, 211, 211, 0.1);
    }

    .home-btn:hover, .lecture-list-btn:hover{
        cursor: pointer;
        opacity: 0.9;
    }

    /*시청완료 태그*/
    .watchTag{
        font-size: 12px;
        background-color: orange;
        color:white;
        height: 20px;
        padding: 3px 5px 3px 5px;
        border-radius: 6px;
    }

</style>
</head>
<body>
	<div class="outer">
        <div class="head">
            <div class="home-btn">SURF</div>
            <div class="lecture-list-btn">내 강의 목록</div>
            <div class="degree">
                <span>0% 시청완료</span>
                <div class="progress">
                    <div class="progress-bar" style="width:0%"></div>
                </div>
            </div>
        </div>
        <div class="content-box">
            <div class="left-box">
                <div>
                    <div>
                        <label class="className">${ t.classTitle }</label>
                        <br>
                        <label class="chapName">챕터 1. 프롤로그 - JAVA가 뭐에요?</label>
                        <br>
                        <label class="video-title"></label>
                    </div>
                    <div>
                    </div>
                </div>
                <div align="center">
                    <div class="video-area">
                        <video id="video" width="750" height="400" controls controlsList="nodownload"></video>
                        <input type="hidden" name="videoNo">
                    </div>
                </div>
                <div align="center">
                    <a onclick="moveVideo(-1);">&lt; 이전강의</a>
                    <label class="current-step">java가 뭐에요?</label>
                    <a onclick="moveVideo(1);">다음강의 &gt;</a>
                </div>
            </div>
            <div class="right-box">
                <div>
                    <div> - 목차</div>
                    <div>${ t.classTitle }</div>
                    <div class="teacherName"><span>강사 : </span>${ t.nickname }</div>
                </div>
                <div>
                	<c:forEach var="chapter" items="${ list }">
                		<div class="chapter${chapter.chapOrder}">
		                    <div class="chapter">챕터 ${chapter.chapOrder} : ${ chapter.chapName }</div>
                		</div>
                	</c:forEach>
                </div>
            </div>
        </div>
    </div>

    <script>
    
        $(function(){
            var lastVideoNo = 0;

            // 비디오 목록 가져오기 | 진척도 조회 | 마지막으로 본 비디오 조회
            loadVideoList();
            loadDegree();
            lastViewVideoLoad();
            
            // 홈 버튼 링크 이동
            $('.home-btn').click(function(){
                location.href="<%=request.getContextPath()%>";
            })
            $('.lecture-list-btn').click(function(){ // 내 강의 목록 이동

                location.href="myLecture.lec?uno=${loginUser.userNo}";

            })
            
            // video duration관련 (시청여부)
            var videocontrol = document.getElementById("video");
            var duration;
            
            videocontrol.addEventListener("play", function(){

                duration = this.duration;
                
                setTimeout(function(){
                    watchingVideo($('.video-area').children('input[name=videoNo]').val(), lastVideoNo);
                }, duration * 1000);                                                              
                
            });
            
        })

        function lastViewVideoLoad(){ // 마지막으로 본 비디오 조회
            $.ajax({
                url : "JqAjaxlastViewVideoLoad.le",
                type : "post",
                data : {
                    classNo : ${ classNo }
                }, success : function(videoNo){
                    
                    $('.video' + videoNo).trigger('click');

                }, error : function(){
                    console.log('마지막 시청 조회 실패');
                }
            })

        }

        function loadVideoList(){ // 비디오 목록 조회

            $.ajax({
                url : "ajaxVideoList.le",
                type: "post",
                data : {
                    classNo : ${ classNo }
                }, success : function(videoList){

                    lastVideoNo = videoList[videoList.length-1].videoNo;
                    
                    var watchedVideoCount = 0;

                    for(var i in videoList){

                        if(videoList[i].watched == 'Y'){

                            $('.chapter' + videoList[i].chapOrder)
                            .append('<div class="step video' + videoList[i].videoNo + '"' + 
                                    'onclick="loadVideo(&quot;' + videoList[i].videoNo + '&quot;,&quot;' + 
                                                            videoList[i].chapOrder + '&quot;,&quot;' + 
                                                            videoList[i].changeName + '&quot;);"' + '>' + '<span class="watchTag">시청완료</span> '+ 
                                                            '<b>' + videoList[i].subTitle +'</b></div>');

                            ++watchedVideoCount;
                        }else{

                            $('.chapter' + videoList[i].chapOrder)
                                .append('<div class="step video' + videoList[i].videoNo + '"' + 
                                        'onclick="loadVideo(&quot;' + videoList[i].videoNo + '&quot;,&quot;' + 
                                                                videoList[i].chapOrder + '&quot;,&quot;' + 
                                                                videoList[i].changeName + '&quot;);">' + 
                                                                '<b>' + videoList[i].subTitle +'</b></div>');

                        }
                    }

                    // 처음 비디오 챕터 1_ 소제목 1
                    $('.left-box').find('#video').attr("src", videoList[0].changeName);
                    
                    lastViewVideoLoad();
                    
                }, error : function(){

                }
            });

        }
        
        function loadDegree(){ // 강의 시청 진척도 표시

        $.ajax({
            url : "JqAjaxLoadDegree.le",
            type : "post",
            data : {
                classNo : ${ classNo }
            }, success : function(degree){

                $('.degree').find('span').text(degree + '%시청완료');
                $('.progress-bar').css('width', degree + '%');

            }, error : function(){
                console.log('진척도 조회 실패');
            }
        })

        }
        
        // 시청완료시 ajax 실행
        function watchingVideo(videoNo, lastVideoNo){
            
            $.ajax({
                url:"JqAjaxfinishedWatching.le",
                type: 'post',
                data:{ 
                    'videoNo': videoNo
                },
                success:function(result){
                    
                    if(result > 0){
                        loadDegree();
                        $('.video' + videoNo).prepend('<span class="watchTag">시청완료</span> ');
                        alert("시청완료");                                        
                    }
                    

                },error:function(){
                    
                }
            })

        }
        
        // 소제목 클릭 시 비디오 로딩, 시청여부 송신
        function loadVideo(videoNo, chapOrder, changeName){
            
            // 1. 비디오 넣기
            $('.left-box').find('#video').attr("src", changeName);
            
            // 2. 챕터 이름 바꾸기
            $('.chapName').text($('.chapter' + chapOrder).children('.chapter').text());

            $('.video-title').text(' - ' + $('.video' + videoNo).children('b').text());

            // 3. 최근 시청 video 저장
            $.ajax({
                url : "JqAjaxLatestVideoWatching.le",
                type: "post",
                data : {
                    classNo : ${ list[0].classNo },
                    'videoNo' : parseInt(videoNo)
                }, success : function(){

                    $.ajax({

                    })

                }, error : function(){
                    console.log("마지막 시청 기록 실패");
                }
            });

            // 4. 비디오 번호 저장하기
            $('#video').siblings('input').val(parseInt(videoNo));
            
        }

        // 이전 | 다음강의 버튼
        function moveVideo(no){

            // 현재 로딩된 영상 번호 'videoNo'
            var currentVideoNo = $('input[name=videoNo]').val();

            $('.video' + (parseInt(currentVideoNo) + no)).trigger('click');
        }
    </script>
</body>
</html>