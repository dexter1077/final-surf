<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sorry...</title>
</head>
<body>

<jsp:include page="header.jsp"/>

    <div class="body-outer">
        <br><br><br><br>

        <div align="center" class="w3-padding-small w3-card-4 w3-light-grey" style="width: 600px; height: 600px; margin: auto;">
            
            <div style="font-size: 60px; color: rgb(0, 155, 179); font-weight: bolder; margin-top: 30px;">
                ${ errorMsg }
            </div>
            <div style="width: 350px; height: 350px; margin: 10px;">
                <img src="resources/images/errorIsland.jpg" style="width: 100%;">
            </div>
            <div style="text-align: center; font-size: 20px; font-weight: bold; ">
                요청사항을 정상적으로 처리하지 못했습니다. <br>
                자세한 내용은 우측 하단의 '문의하기'를 이용해주세요.
            </div>
        </div>       
        <br><br><br><br><br>
    </div>


<jsp:include page="footer.jsp"/>

</body>
</html>