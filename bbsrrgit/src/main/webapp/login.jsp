<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<link rel="stylesheet" href="css/login.css" />
<title>Hoyeon's BBS</title>
</head>
<body>
	<div class="container-fluid">
		
		<div class="row">
			<div class="left">
				<div class="aside">
					<a href="#" class="brand">Hoyeon's BBS</a>				
				</div>
				<%@ include file="include/aside.jsp" %>
			</div>
			<div class="main">
				
<%@ include file="topnav.jsp" %>
<% if(userid != null){ %>
<script>
alert("이미 로그인 하셨습니다.");
history.back();
</script>
<% } %>
<div class="wrapper" id="login">
	<div id="formContent">
		<div class="first">
			<img src="images/user.png" class="loginimg">
		</div>
		
		<!-- 로그인 영역 -->
		<form action="loginok.jsp" name="login" method="post">
			<input type="text" id="userid" class="second" name="userid" placeholder="아이디"/>
			<input type="password" id="userpass" class="third" name="userpass" placeholder="비밀번호"/>
			<button type="submit" class="fourth">로 그 인</button>
		</form>
		
		<div id="formfooter">
			<a href="findid.jsp" class="underlineHover">아이디/비밀번호 찾기</a>
		</div>
	</div>
</div>

			</div>
		</div>
	</div>
			

<%@ include file="include/footer.jsp" %>