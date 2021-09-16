<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div {
	box-sizing: border-box;
}

.footer {
	margin: auto;
	width: 1200px;
	height: 180px;
	border-top: 5px solid rgb(32, 155, 212);
}

.footer>div {
	width: 100%;
}

.footer-menu {
	height: 35px;
	border-bottom: 1px solid lightgray;
	line-height: 35px;
	font-size: 12px;
	color: lightgray;
}

.footer-menu>a {
	text-decoration: none;
	font-weight: 600;
	color: rgb(94, 94, 94);
}

.footer-menu>a:hover {
	opacity: 0.7;
}

.footer-content {
	height: 140px;
}

.footer-content>div {
	float: left;
	height: 100%;
}

.logo {
	width: 135px;
	padding-top: 25px;
	margin-left: 330px;
	font-size: 30px;
	font-weight: 700;
	color: rgb(32, 155, 212);
	height: 100%;
}

.info, .contect {
	width: 270px;
	padding-top: 20px;
	font-size: 12px;
	color: rgb(94, 94, 94);
	font-weight: 500;
}

.bold {
	font-weight: 700;
}
</style>
</head>
<body>
	<!-- Channel Plugin Scripts -->
	<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "9ea5f245-df23-463e-8aba-554265cccfaa"
  });
</script>
	<!-- End Channel Plugin -->
	<div class="footer">
		<div class="footer-menu" align="center">
			<a href="">회사소개</a> | <a href="">광고문의</a> | <a href="">개인정보처리방침</a> |
			<a href="">이용약관</a>
		</div>
		<div class="footer-content">
			<div class="logo">
				<label>SURF</label>
			</div>
			<div class="info">
				<lable class="bold">(주) SURF</lable>
				<br>
				<br> 대표이사 : 고길동 <br> 서울특별시 마포구 동교료 102길 38<br> 사업자
				등록번호 : 117-48-32921
			</div>
			<div class="contect">
				<lable class="bold">고객센터</lable>
				<br>
				<br> 대표번호 02-3239-3278<br> 메일 support3@naver.com<br>
				제휴문의 biz@naver.com
			</div>
		</div>
	</div>
</body>
</html>