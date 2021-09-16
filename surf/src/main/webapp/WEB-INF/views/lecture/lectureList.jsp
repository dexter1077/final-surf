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
    <title>Document</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
    .outer{
        width: 1200px;
        margin: auto;
    }
    .container{display: flex;}
    .category{width: 20%; height: 900px;}
    .class-area{
        width: 75%; 
        background: white;
        margin-left: 30px;
        height:1200px;
    }
    .cate-item button{
        text-align: left;
        font-size: 20px;
        padding-top: 10px;
        padding-left: 10px;
        font-weight: bold;
    }
    #sub-cate{
        margin-top: 3px;
        width: 130px;
        border-radius: 5px;
        text-align: left;
        padding: 0px 0px 3px 20px;
        display: none;
    }
    #sub-cate a{
        font-size: 13px;
        color: black;
        text-decoration: none;
        display: inline-block;
    }
    #sub-cate a:hover{font-weight: bold;}
    .select-list{
        margin-top: 15px; 
        margin-left: 15px;
        height: 50px; 
    }
    .class-list{height: 800px;}
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
        opacity: 0.7;
        /*border: 1px solid rgb(0, 120, 51);*/
        /*background: rgba(0, 120, 52, 0.1);*/
    }
    /*.thumbnail span{margin-bottom: 5px;}*/
    .thumbnail>p{height: 120px;}
    .class-thumb{position: relative; width: 100%; height: 100%;}
    .class-thumb img{display: block;}
    .class-thumb .text{
        position:absolute;
        top: 5px;
        left: 210px;
    }
    .fa-heart{color: red; margin-right: 2px;}
    #scrap-comple{display: none;}
    .fa-star{color: rgb(231, 217, 17); margin-right: 2px;}
    #scrap-icon:hover{color: darkred;}
    #scrap-icon:active{
        box-shadow: 1px 1px 0 rgb(0,0,0,0.5); position: relative; top:2px;
    }
    #pagingArea{width:fit-content;margin:auto;}
   
   /*클래스 타이틀 글씨 넘침 수정 
   @author 최서경*/ 
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

            <!-- 카테고리 -->
            <div class="category">
                   <div class="cate-item">
                       <button type="button" data-toggle="collapse1" data-target="#side-sub" class="btn main-cate">
                           
                       </button>
                       <div id="sub-cate" class="collapse1">
                           
                       </div>
                   </div>
            </div>
      
      <script>
      $(function(){
         loadCateItem();
      })
      
      function loadCateItem() {
           $.ajax({
            url:"cat.do",
            success:function(resultArr){
               //console.log(resultArr);
               
               var maxLength = 0;
                 for(var i in resultArr){
                    
                    if(resultArr[i].length > maxLength){
                       maxLength = resultArr[i].length;
                    }
                 }
                 
                 var value = "";
                 for(var j in resultArr){ // 번호 - 이름
                       
                    value += "<div class='cate-item'>";
                    
                    for(var k=0; k<maxLength; k++){
                       if(k == 0){
                            value += "<button type='button' data-toggle='collapse1' data-target='#side-sub' class='btn main-cate'>" 
                                        + resultArr[j][k] 
                                   + "</button>"
                       } else {
                            var subcatArr = resultArr[j][k].split("-");
                          value += "<div id='sub-cate' class='collapse1'>"
                                           + '<a href="list.lec?currentPage=1&sno=' + subcatArr[0] + '">' + subcatArr[1] + '</a>'
                                   + '</div>';
                       }
                    }
                    value += "</div>";
                    
                 }
                 
                 $(".category").html(value);
               
            }, error:function(){
               console.log("통신실패");
            }
         });   //End of ajax (cate-item)
        } // loadCateItem
      

        // 카테고리 효과
        $(document).on('click', '.main-cate', function(){
    
            var $side = $(this).next("div");

            if($side.css("display") == "none"){
                $(this).siblings("div").show(200);
                $(this).css("color", "rgb(32, 155, 212)");
            }else{
                $side.hide(200);
                $(this).css("color", "black");
            }
            
        })
        
            
      </script>
      
      
            <!-- 클래스 목록 -->
            <div class="class-area">

                <!-- select option-->
                <div class="select-list">
                   <form action="list.lec">
                      <input type="hidden" name="currentPage" value="1">
                       <select name="" class="selectpicker" onchange="if(this.value) location.href=(this.value);">
                           <option value="list.lec?currentPage=1&&sno=1">인기순</option>
                           <option value="list.lec?currentPage=1&&sno=2">별점순</option>
                           <option value="list.lec?currentPage=1&&sno=3">수강생순</option>
                       </select>
                    </form>
                </div>

                <!-- 클래스 -->
                <div class="class-list">
            
               <c:forEach var="l" items="${ list }">
                       <div class="thumbnail" align="center" onclick="location.href='/surf/detail.lec?cno=${l.classNo}'">
                           <div class="class-thumb">
                               <img src="${ l.thumbnail }" width="240" height="150" id="">
                               <div class="text" onclick="scrapCheck(this)">
                                   <input type="hidden" name="classNo" value="${ l.classNo }">
                                   <i class="far fa-heart" id="scrap-icon"></i>
	                               <i class="fas fa-heart " id="scrap-comple" style="display:none;"></i>
                               </div>
                           </div>
       
                           <p style="margin-top: 5px;">
                               <b id="classTitle" style="height:40px;">${ l.classTitle }</b><br>
                               <span style="font-size:14px">${ l.teacherName }</span> <br>
                               <span style="font-size:14px">
                                  <b><fmt:formatNumber value="${ l.price }"/>원</b>
                               </span> <br>
                               <span style="font-size:14px">
                                   <i class="fas fa-star"></i> (${ l.star }) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               </span> 
                               <span style="font-size:14px">
                                   <i class="fas fa-heart"></i> ${ l.scrapCount }
                               </span> 
                           </p>
                       </div>
                    </c:forEach>
                    

                    <!-- 페이징 -->
                    <br><br><br>
                    <div id="pagingArea">
                        <ul class="pagination">
                         <c:choose>
                            <c:when test="${ pi.currentPage eq 1 }">
                                <li class="page-item disabled"><a class="page-link">&lt;</a></li>
                             </c:when>
                             <c:otherwise>
                                <li class="page-item"><a class="page-link" href="list.bo?currentPage=${ pi.currentPage - 1 }">&lt;</a></li>
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
                                <li class="page-item"><a class="page-link" href="list.bo?currentPage=${ pi.currentPage + 1 }">&gt;</a></li>
                             </c:otherwise>
                         </c:choose>
                      </ul>
                    </div>
                    <br><br>

                </div>

            </div>

        </div>

        <script>
        
        var cno = $('input[name=classNo]').val();
        var userNo = ${loginUser.userNo};
        
        
        function detail(_cno) {
        	if(!_cno) return false;
        	location.href = '/surf/detail.lec?cno=' + _cno;
        }
        
        function scrapCheck(elem){
        	
        	if (event.stopPropagation) event.stopPropagation();
			else event.cancelBubble = true;
        	/*
            if (event.preventDefault) {
            	event.preventDefault();
            } else {
            	event.returnValue = false;
            	return false;
            }
        	*/

        	$.ajax({
        		url: "scrapCheck.lec",
        		data : {
        			classNo : cno,
        			userNo : userNo
        		}, success: function(result){
        			console.log(result);
        			if(result > 0){
        				alert("이미 찜한 클래스입니다.");
        			}else {
        				scrapLecture(elem);
        			}
        			
        		}, error:function(){
        			console.log("찜하기 중복 ajax 실패");
        		}
        	})
        	
        	return false;
        	
        }
        
        function scrapLecture(elem){

        	$.ajax({
            	url: "scrap.lec?cno=" + cno,
            	type: "GET",
            	data: {
            		classNo : cno,
            		userNo : userNo
            	},
            	success:function(result){
	            		console.log("?성공");
	            		
            		if(result == 1){
            			
	            		alert("클래스를 찜했습니다!");
	            		
	            		// 스크랩 아이콘 클릭
	                    if($(elem).find("#scrap-comple").css("display") == "none") {
	                        $("#scrap-icon").css("display", "none");
	                        $("#scrap-comple").show();
	                    }
	            		
            		}else{
            			alert("찜하기에 실패하였습니다.");
            		}
            		
            	}, error:function(){
            		console.log("실패");
            	}
            })
            
        }
            
        </script>

        <!-- footer -->
        <jsp:include page="../common/footer.jsp" />

    </div>
    
</body>
</html>