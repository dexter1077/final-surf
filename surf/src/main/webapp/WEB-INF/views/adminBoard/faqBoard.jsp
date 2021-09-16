<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문(FAQ)</title>

<style>
    .faqTitle,
    .introLine {
        height: 55px;
        font-size: 17px;
        font-weight: 700;
        border-bottom: dotted lightgray 2px;
        font-family: 'Nanum Gothic', sans-serif;

    }

    .faqTitle div,
    .introLine div {
        float: left;
    }

    .faqTitle:hover{
        cursor: pointer;
    }

    .introLine {
        font-size: 20px;
    }

    .faqContent {
        width: 100%;
        height: 200px;
        overflow: auto;
        background-color: lavender;
        border-bottom: dotted lightgray 2px;
        vertical-align: top;
        font-family: 'Nanum Gothic', sans-serif;
        display: none;
    }
    .faqContent>td{
        padding: 13px;
        font-size: 13px;
        line-height: 30px;
        font-weight: 500;
    }
    
    #adminBoardMenu>a {
		font-size: 18px;
		font-weight: 600;
		margin-right: 30px;
		text-decoration: none;
		color: black;
		height: 35px;
		display: inline-block;
	}
		
	#adminBoardMenu>a:hover {
	   color: rgb(94, 94, 94);
	   border-bottom: rgb(32, 155, 212) 4px solid;
	   transition: all .2s ease;
	}
</style>


</head>
<body>
	
	<jsp:include page="../common/header.jsp"/>
	
    <div class="body-outer">
        <br><br>

        <!--고객센터 세부메뉴-->
        <div id="adminBoardMenu" style="width: 800px; margin: auto;">
            <a href="list.no">공지사항</a>
            <a href="list.faq">FAQ</a>
            <hr style="background-color: grey; height: 2px; width: 60%; margin-top: 0;">

        </div>

        <div class="long-title">
            자주 묻는 질문(FAQ)
            <i class="far fa-question-circle"></i>
            <div style="font-size: 15px; font-weight: normal;">
                <br>
                궁금한게 있으신가요?<br>
                아래의 자주 묻는 질문 목록을 먼저 확인해주세요!
            </div>
            <hr style="background-color: rgb(32, 155, 212); height: 2px; margin-bottom: 0;">
        </div>


        <div style="width: 750px; margin: auto;">

            <br>
            <!-- 게시글 목록 -->
            <div id="faqList">

                <table bordr="" style="width: 100%;">
                    <!--첫번째 줄-->
                    <tr class="introLine">
                        <td>
                            <div style="width: 77%; padding-left: 70px;">
                                <i class="fa fa-question" style="color:rgb(32, 107, 212);"></i>
                                Question
                                <i class="fa fa-question" style="color: rgb(32, 107, 212);"></i>
                            </div>
                            <div style="width: 23%; text-align: center;">
                                <i class="fas fa-tags" style="color:rgb(32, 107, 212);"></i>
                                	카테고리
                            </div>
                        </td>
                    </tr>
                    
                    <c:forEach var="faq" items="${ list }">
                    <!--faq 목록-->
                    <tr class="faqTitle">
                        <td>
                            <div style="width: 77%;">
                                &nbsp;<i class="fa fa-caret-square-o-down"></i>
                                ${ faq.boardTitle }
                            </div>
                            <div style="width: 23%; text-align: center;">
                                ${ faq.faqCategory }
                            </div>
                        </td>
                    </tr>
                    <tr class="faqContent">
                        <td>
                        	${ faq.boardContent }
                        </td>
                    </tr>
                    </c:forEach>
                         
                </table>
            </div>
            <br style="clear: both;"><br>

        </div>
        <br><br><br><br><br>
    </div>

    <script>
        $(function () {
            $(".faqTitle").on("click", function () {

                var $answer = $(this).next();

                if ($answer.css("display") == "none") {
                    $answer.siblings(".faqContent").slideUp();
                    $answer.slideDown();
                } else {
                    $answer.slideUp();
                }
            })
        })
    </script>
    
    <jsp:include page="../common/footer.jsp"/>
	
</body>
</html>