<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    .tableA {
    border-collapse: separate;
	border-spacing: 80px 3px;
    text-align: left;
    
    }
    .classImage{
    width: 300px; height: 200px;

    }
    .classTitle{
        width: 300px; height: 30px;
    }
    .su1{
        width: 100px;
    }
    
    table{margin:auto; }
    th{text-align: left;}
    td{border:1px solid #D1D1D1; border-radius: 5px; padding: 5px;}

</style>
<body>
	<jsp:include page="sidebar.jsp"/>
	<br>
    <div class="ml-4" style="width:950px">
        <div>
          <h4>클래스 관리>클래스 상세 조회</h4>
          
        </div>
        <hr>
    <div>
        <table class="tableA">
            <tr>
                <th class="classTitle">강의 소개 타이틀</th>
                <td rowspan="4"><img src="${ l.thumbnail }" width="300" height="300"></td>
            </tr>
            <tr>
                <td style="width: 300px; height: 80px;">${ l.classTitle }</td>
            </tr>
            <tr>
                <th class="classTitle">강의 소개 설명</th>
            </tr>
            <tr>
                <td style="width: 300px; height: 120px;">${ l.introContent }
                </td>
            </tr>
        </table>
        <br>
        <table class="tableA">
            <tr>
                <th>클래스 설명 이미지</th>
                <th>설명</th>
            </tr>
            <c:forEach var="i" items="${ introList }">
            <tr>
                <td class="classImage"><img src="${ i.introImage }" width="280" height="200"></td>
                <td class="classImage">${ i.introContent }</td>
            </tr>
            </c:forEach>
        </table>
        <br>
        <table style="width: 680px; height: 300px; border-radius : 10px;">
        	<c:forEach var="t" items="${ tList }" begin="0" end="${fn:length(tList)}" varStatus="status" >
                <tr>
                    <td>챕터${t.chapOrder }</td>
                    <td>${ t.chapName }</td>
                </tr>
                	<c:forEach var="c" items="${ t.classVideoList }">
                		<c:if test="${ t.chapOrder eq c.chapOrder }">
                			<tr>
                				<td>${c.subTitle }</td>
                				<td><a href="${c.changeName }">${c.originName }</a></td>
                			</tr>
                		</c:if>
                </c:forEach>
            </c:forEach>
        </table>
        <br>
        <table align= "left" style="width: 400px; height: 100px; margin:0px 0px 0px 140px;">
            <tr>
                <th class="su1">수강기간</th>
                <td>${ l.period }</td>
            </tr>
            <tr>
                <th class="su1">수강금액</th>
                <td>${ l.price } </td>
            </tr>
        </table>
        <br><br><br><br><br>
    </div>
    </div>
</body>
</html>