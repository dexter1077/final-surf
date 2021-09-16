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
    <title>Order History</title>
<style>
    .outer{
        width: 1200px;
        margin: auto;
    }
    .container{display: flex; flex-wrap: wrap;}
    .sub-nav{
        width: 20%;
        height: 800px;
    }
    .content{width: 80%; font-weight: bold;}
    .menu-title{
        font-size: 25px; 
        font-weight: bold; 
        height: 100px;
        line-height: 70px;
        margin-left: 15px;
    }
    #orderList{
        text-align: center; 
        font-size: 15px;
        margin-left: 15px;
    }
    #orderList>thead{background: rgba(32, 155, 212, 0.1)}
    #orderList>tbody>tr:hover{cursor:pointer;}
    /* #orderList>tbody>td{font-weight:100;} */
    #pagingArea{width:fit-content;margin:auto;}
</style>
</head>
<body>

    <div class="outer">
        
        <!-- header-->
		<jsp:include page="../common/header.jsp" />
		
		<br><br>
        <div class="container">

            <!-- 왼쪽 세부메뉴 -->
            <div class="sub-nav">
            <br>
                <jsp:include page="memberMenubar.jsp" />
            </div>

            <div class="content">
                <!-- 타이틀 -->
                <div class="menu-title">
                    <p>주문내역</p>
                </div>

                <!-- 주문내역 -->
                <div class="order-area">
                    <table id="orderList" class="table table-hover" align="center">
                        <thead>
                            <tr>
                                <th>주문번호</th>
                                <th>주문일</th>
                                <th>상태</th>
                                <th>강의명</th>
                                <th>금액</th>
                            </tr>
                        </thead>
                        <c:set var="ran"><%= java.lang.Math.round(java.lang.Math.random() * 1234) %></c:set>
                        <c:forEach var="p" items="${ pList }">
	                        <tbody style="font-weight:400;">
	                            <tr>
	                                <td>${ p.orderNo }${ran }</td>
	                                <td><fmt:formatDate value="${ p.paymentDate }" pattern="yyyy-MM-dd"/></td>
	                                <c:choose>
	                                	<c:when test="${ p.status eq 'Y' }">
		                                	<td>결제 완료</td>
	                                	</c:when>
	                                	<c:otherwise>
	                                		<td>결제 대기</td>
	                                	</c:otherwise>
	                                </c:choose>
	                                <td>${ p.classTitle }</td>
	                                <td><fmt:formatNumber value="${p.price}" pattern="#,###"/> </td>
	                            </tr>
	                        </tbody>
                        </c:forEach>
                    </table>
                </div>

                <!-- 페이징 -->
                <br><br>
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


            </div>

        </div>


        <!-- footer -->
        <jsp:include page="../common/footer.jsp" />

    </div>
    
</body>
</html>