<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>

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
<%@ include file="board/update.jsp" %>

			</div>
		</div>
	</div>
			

<%@ include file="include/footer.jsp" %>