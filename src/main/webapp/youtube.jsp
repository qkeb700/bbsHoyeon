<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<%
	String mode = null;
	mode = request.getParameter("mode"); 
%>
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
<%@ include file="youtube/index.jsp" %>

			</div>
		</div>
	</div>
			

<%@ include file="include/footer.jsp" %>