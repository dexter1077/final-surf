<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <!--부트스트랩-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


    <style>
        div {
            /*border: solid red 1px;*/
            box-sizing: border-box;
        }

        .wrap {
            width: 600px;
            height: 400px;
            margin: auto;
            margin-top: 250px;
        }

        .wrap>div {
            width: 100%;
        }

        #copy {
            height: 20%;
            font-size: 40px;
            font-weight: bolder;
        }

        #etc {
            height: 80%;
        }

        #symbol>img:hover {cursor:pointer;}


        #symbol>img {
            box-sizing: border-box;
            width: 85%;
            height: 85%;
        }

        #etc>div,
        #etc>form {
            float: left;
            width: 50%;
            height: 100%;
        }

        #login {
            height: 65%;
        }

        #login>div {
            box-sizing: border-box;
            height: 50%;
        }


        #login>input {
            box-sizing: border-box;
            width: 100%;
            height: 35%;
            margin: auto;
            margin-top: 10px;
        }

        #login-etc {
            height: 35%;
        }

        #login-etc>button {
            box-sizing: border-box;
            float: left;
            width: 45%;
            height: 45%;

            font-weight: bold;
            font-size: 16px;
            margin-top: 15px;
            margin-left: 7px;
            margin-right: 7px;
            cursor:pointer;
        }

        #login-etc>button:hover {
            background-color: rgb(235, 157, 33);
        }
    </style>


</head>
<body>

    <div class="wrap">
        <div id="copy" align="center"><label>SURF 관리자</label></div>
        <div id="etc">
            <div id="symbol"><img src="resources\img\SURF.png" alt=""></div>
            <form action="" method="POST" id="login-area">
                <div id="login">
                    <div>
                        <label for="adminId">아이디:</label>
                        <br>
                        <input type="text" class="form-control" id="adminId" placeholder="Enter ID" name="email">
                    </div>
                    <div>
                        <label for="adminPwd">비밀번호:</label>
                        <br>
                        <input type="password" class="form-control" id="adminPwd" placeholder="Enter Password" name="password">
                    </div>
                </div>
                <div id="login-etc">
                    <button type="submit" class="btn btn-primary">로그인</button>
                    <button type="button" class="btn btn-info">ID/PWD 찾기</button>
                </div>
            </form>
        </div>
    </div>


</body>
</html>