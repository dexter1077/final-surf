<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 클래스 목록</title>
<style>
	/*컨텐츠 시작 영역*/
    #content{
        padding: 40px 0px 0px 40px;
        font-family: 'Nanum Gothic', sans-serif;
    }
    a:hover{opacity:0.7;}
    /* 클래스 리스트 박스 크기*/
    .list-area{
        width:600px;
        /*height:770px;*/
        border-radius:5px;
        border: 1px solid lightgray;
        box-shadow: 3px 3px 3px rgba(184, 184, 184, 0.3);
    }
    .list-area>div{
        width:100%;
    }

    .list-header{
        height:50px;
        line-height:50px;
        font-weight:600;
    }
    .form-title{
        display: inline-block;
        width: 480px;
        font-size:22px;
        padding-left:30px;
    }
    .list-header>span{
        text-decoration:none;
        color: rgb(32, 155, 212);
    }
    .list-header>span:hover{
        cursor: pointer;
        opacity: 0.8;
    }

    /* 내 클래스 목록 컨텐츠들 css*/
    .box{
        border-top: 1px solid lightgray;
        height:160px;
    }

    .box>div{height:100%; float: left;}
    .img-area{width:195px;}
    .class-info{width:340px;}
    .class-update-btn{width:53px;margin-left: 5px;}

    .img{
        width: 150px;
        height: 120px;
        border: 1px solid lightgray;
        margin: 20px 21.5px;
    }
    .class-info>div{
        margin-top:20px;
    }
    .update-btn{
        margin-top:20px;
    }
    .class-title{
        font-size:18px;
        font-weight:600;
    }
    #pagination-form{border:none}

    /*상태 태그*/
    .tag{
        width:70px;
        height:25px;
        border-radius:3px;
        font-size:14px;
        font-weight:900;
        text-align:center;
        line-height:25px;
    }

    .waiting{ /* 작성중 W | 검토중 I | 재검토중 A */
        color: rgb(100, 100, 100);
        background: lightgray;
    }

    .Qfund{ /* 펀딩문의 Q */
        color:orange;
        background:rgb(32, 155, 212);
    }

    .fund{ /* 오픈 F */
        color:white;
        background:rgb(32, 155, 212);
    }

    .open{ /* 오픈 O */
        background:orange;
        color:orangered;
    }

    .update-menu{
        width:70px;
        font-size:13px;
        text-align: center;
        border:1px solid lightgray;
        background-color: white;
        border-radius: 4px;
        z-index: 1;
        text-align: center;
        padding-top:10px;
    }
    .update-menu>span{
        color: gray;
        display:block;
        margin: auto;
        padding-bottom:10px;
    }
    .update-menu>span:hover{
        cursor: pointer;
        color: rgb(32, 155, 212);
    }

    .openClass:hover{
        cursor: pointer;
        opacity: 0.9;
    }
</style>
</head>
<body>
	<jsp:include page="common/teacherPage.jsp"/>
	<div id="content">
        <div class="list-area">
            <div class="list-box">
                <div class="list-header">
                    <label class="form-title">내 클래스 목록(${ listCount })</label>
                    <span onclick="classInputPage();">+ 등록하기</span>
                </div>
				<c:forEach var="c" items="${ list }">
                    <div class="box">
                        <div class="img-area">
                        <c:choose>
                            <c:when test="${ c.status eq 'O' }">
                                <div class="img openClass" onclick="moveClassDetail(${c.classNo});">
                                    <input type="hidden" name="classNo" value="${ c.classNo }">
                                    <img src="${ c.thumbnail }" width="100%" height="100%" onclick="moveDetailView(${ c.classNo });">
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="img">
                                    <input type="hidden" name="classNo" value="${ c.classNo }">
                                    <img src="${ c.thumbnail }" onerror="this.src='resources/uploadFiles/lec_upfiles/writing.png'" width="100%" height="100%">
                                </div>
                            </c:otherwise>
                        </c:choose>
	                    </div>
	                    <div class="class-info">
	                        <div>
	                            <label class="class-title">
                                    <c:choose>
	                                    <c:when test="${ c.classTitle eq null}">
	                                    	클래스명을 작성 해 주세요.
    	                                </c:when>
        	                            <c:otherwise>
	        	                            ${ c.classTitle }
                	                    </c:otherwise>
                    	                </c:choose>
                                </label><br><br>
	                            <c:choose>
					            	<c:when test="${ c.status eq 'W' }">
					            		<div class="tag waiting">작성중</div>
					            	</c:when>
					            	<c:when test="${ c.status eq 'I' }">
					            		<div class="tag waiting">검토중</div>
					            	</c:when>
                                    <c:when test="${ c.status eq 'R' }">
					            		<div class="tag waiting">반려</div>
					            	</c:when>
					            	<c:when test="${ c.status eq 'A' }">
					            		<div class="tag waiting">재검토중</div>
					            	</c:when>
					            	<c:when test="${ c.status eq 'Q' }">
					            		<div class="tag Qfund">펀딩문의</div>
					            	</c:when>
					            	<c:when test="${ c.status eq 'F' }">
					            		<div class="tag fund">펀딩중</div>
					            	</c:when>
					            	<c:when test="${ c.status eq 'O' }">
					            		<div class="tag open">오픈중</div>
					            	</c:when>
					            </c:choose>
	                        </div>
	                    </div>
	                    <div class="class-update-btn">
	                        <div class="update-btn">
                                <c:if test="${ c.status eq 'W' or c.status eq 'R' }">
                                    <img class="menu-btn" style="width:20px; height:20px;" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbG5zOnN2Z2pzPSJodHRwOi8vc3ZnanMuY29tL3N2Z2pzIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiIgeD0iMCIgeT0iMCIgdmlld0JveD0iMCAwIDQyNi42NjcgNDI2LjY2NyIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgNTEyIDUxMiIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSIgY2xhc3M9IiI+PGc+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+Cgk8Zz4KCQk8Y2lyY2xlIGN4PSI0Mi42NjciIGN5PSIyMTMuMzMzIiByPSI0Mi42NjciIGZpbGw9IiM4MzgzODMiIGRhdGEtb3JpZ2luYWw9IiMwMDAwMDAiIHN0eWxlPSIiIGNsYXNzPSIiPjwvY2lyY2xlPgoJPC9nPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+Cgk8Zz4KCQk8Y2lyY2xlIGN4PSIyMTMuMzMzIiBjeT0iMjEzLjMzMyIgcj0iNDIuNjY3IiBmaWxsPSIjODM4MzgzIiBkYXRhLW9yaWdpbmFsPSIjMDAwMDAwIiBzdHlsZT0iIiBjbGFzcz0iIj48L2NpcmNsZT4KCTwvZz4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgoJPGc+CgkJPGNpcmNsZSBjeD0iMzg0IiBjeT0iMjEzLjMzMyIgcj0iNDIuNjY3IiBmaWxsPSIjODM4MzgzIiBkYXRhLW9yaWdpbmFsPSIjMDAwMDAwIiBzdHlsZT0iIiBjbGFzcz0iIj48L2NpcmNsZT4KCTwvZz4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8L2c+PC9zdmc+" />
                                    <div class="update-menu">
                                        <span onclick="classInputPage(${c.classNo})">수정하기</span>
                                        <span data-toggle="modal" data-target="#delete-modal" onclick="modalChange('${c.classNo}', '${c.classTitle}', 'D');">삭제하기</span>									
                                    </div>
	                            </c:if>
								<c:if test="${ c.status eq 'Q' }">
                                    <img class="menu-btn" style="width:20px; height:20px;" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbG5zOnN2Z2pzPSJodHRwOi8vc3ZnanMuY29tL3N2Z2pzIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiIgeD0iMCIgeT0iMCIgdmlld0JveD0iMCAwIDQyNi42NjcgNDI2LjY2NyIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgNTEyIDUxMiIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSIgY2xhc3M9IiI+PGc+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+Cgk8Zz4KCQk8Y2lyY2xlIGN4PSI0Mi42NjciIGN5PSIyMTMuMzMzIiByPSI0Mi42NjciIGZpbGw9IiM4MzgzODMiIGRhdGEtb3JpZ2luYWw9IiMwMDAwMDAiIHN0eWxlPSIiIGNsYXNzPSIiPjwvY2lyY2xlPgoJPC9nPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+Cgk8Zz4KCQk8Y2lyY2xlIGN4PSIyMTMuMzMzIiBjeT0iMjEzLjMzMyIgcj0iNDIuNjY3IiBmaWxsPSIjODM4MzgzIiBkYXRhLW9yaWdpbmFsPSIjMDAwMDAwIiBzdHlsZT0iIiBjbGFzcz0iIj48L2NpcmNsZT4KCTwvZz4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgoJPGc+CgkJPGNpcmNsZSBjeD0iMzg0IiBjeT0iMjEzLjMzMyIgcj0iNDIuNjY3IiBmaWxsPSIjODM4MzgzIiBkYXRhLW9yaWdpbmFsPSIjMDAwMDAwIiBzdHlsZT0iIiBjbGFzcz0iIj48L2NpcmNsZT4KCTwvZz4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8L2c+CjxnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjwvZz4KPGcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPC9nPgo8L2c+PC9zdmc+" />
                                    <div class="update-menu">
                                        <span data-toggle="modal" data-target="#funding-modal" onclick="modalChange('${c.classNo}', '${c.classTitle}', 'F');">펀딩수락</span>
                                    </div>
								</c:if>
	                        </div>
	                    </div>
	                </div>
				</c:forEach>
            </div>
           
                
	        <div class="page-area">
	         	<ul id="pagination-form" class="pagination pagination-sm" style="margin-left:200px">
	         		<c:choose>
	         			<c:when test="${ pi.currentPage eq 1 }">
							<li class="page-item disabled"><a class="page-link">Previous</a></li>	         				
	         			</c:when>
	         			<c:otherwise>
	         				<li class="page-item"><a class="page-link" href="lectureList.te?currentPage=${ pi.currentPage - 1 }">Previous</a></li>
	         			</c:otherwise>
	         		</c:choose>
					
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                        <li class="page-item"><a class="page-link" href="lectureList.te?currentPage=${ p }" onclick="loadPage(${ p });">${ p }</a></li>
                    </c:forEach>
					
					<c:choose>
	         			<c:when test="${ pi.currentPage eq pi.maxPage }">
							<li class="page-item disabled"><a class="page-link">Next</a></li>	         				
	         			</c:when>
	         			<c:otherwise>
	         				<li class="page-item"><a class="page-link" href="lectureList.te?currentPage=${ pi.currentPage + 1 }">Next</a></li>
	         			</c:otherwise>
	         		</c:choose>
				</ul>
	        </div>
        </div>
        <!-- The Modal -->
        <div class="modal fade" id="funding-modal">
            <div class="modal-dialog" style="margin-top: 200px;">
            <div class="modal-content" style="width: 370px; height: 300px;">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <span class="modal-title" 
                    style="margin-left:20px; font-size: 18px; font-weight: 700;">클래스 펀딩 승인</span>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body" style="padding: 36px;">
                    <span style="font-weight: 700;">클래스명</span>
                    <br>
                    <span style="display:inline-block; margin-top: 20px; font-size:12px; color:gray;">
                        펀딩 버튼을 누르면 해당 날짜 기준으로 1주일 동안 펀딩을 받아 기준치를 달성하면 강의를 오픈할 수 있습니다.
                    </span>
                </div>

                <!-- Modal footer -->
                <form action="startFunding.te" method="POST">
                    <input type="hidden" name="classNo">
                    <input type="hidden" name="currentPage" value="${ pi.currentPage }">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" style="margin-right: 120px; padding: 8px 20px 8px 20px; font-size:16px;" data-dismiss="modal">취소</button>
                        <button type="submit" class="btn btn-info" style="margin-right: 36px; padding: 8px 20px 8px 20px; font-size:16px;">펀딩</button>
                    </div>
                </form>
        
            </div>
            </div>
        </div>
        <div class="modal fade" id="delete-modal">
            <div class="modal-dialog" style="margin-top: 200px;">
            <div class="modal-content" style="width: 370px; height: 320px;">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <span class="modal-title" 
                    style="margin-left:20px; font-size: 18px; font-weight: 700;">클래스 삭제</span>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body" style="padding: 36px;">
                    <span style="font-weight:700; display: block;">클래스명</span>
                    <span>해당 클래스를 삭제 하시겠습니까?</span>
                    <br><br>
                    <span style="font-size: 12px; color: gray; display: block; height: 12px;">해당 클래스를 <label style="color: red;">삭제</label> 할 경우 되돌릴수 없습니다.</span>
                    <span style="font-size: 12px; color: gray;">유의하여 진행하시기 바랍니다.</span>
                </div>
                
                <!-- Modal footer -->
                <form action="deleteLecture.te" method="POST">
                    <input type="hidden" name="classNo">
                    <input type="hidden" name="currentPage" value="${ pi.currentPage }">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" style="margin-right: 120px; padding: 8px 20px 8px 20px; font-size:16px;">취소</button>
                        <button type="submit" class="btn btn-danger" style="margin-right: 36px; padding: 8px 20px 8px 20px; font-size:16px;">삭제</button>
                    </div>
                </form>
        
            </div>
            </div>
        </div>
        <form action="lectureInput.te" method="post" id="lectureInput">
            <input type="hidden" name="classNo" value="0">
        </form>
    </div>
    </div>
    </div>
<!-- .content로 시작하고 div 2번 닫을것  -->
    <script>
        $(function(){
   
            $(".update-menu").hide();

            $(".menu-btn")
                .on("mouseover", function(){
                    $(this).siblings(".update-menu").show();
                });
            $(".update-btn")
                .on("mouseover", function(){
                    $(this).children('.update-menu').show();
                })
                .on("mouseout",function(){
                    $(this).children('.update-menu').hide();
                });
        });

        // 수정, 등록하기 기능
        function classInputPage(num){
            if(num == null){
                $('#lectureInput').submit();
            }else{
                $('#lectureInput').children('input[name=classNo]').val(num);
                $('#lectureInput').submit();
            }
        }
        // 삭제, 펀딩승인 모달창 수정
        function modalChange(classNo, classTitle, commend){
                
            if(commend == 'F'){
                $('#funding-modal').find('input[name=classNo]').val(classNo);
                $('#funding-modal').find('.modal-body').children('span').eq(0).text(classTitle);
            }else{
                $('#delete-modal').find('input[name=classNo]').val(classNo);
                $('#delete-modal').find('.modal-body').children('span').eq(0).text(classTitle);
            }
            
        }

        // 강의 디테일 뷰로 이동
        function moveDetailView(classNo){
            location.href='detail.lec?cno=' + classNo;
        }

    </script>
	<jsp:include page="../common/footer.jsp"/>
    
</body>
</html>