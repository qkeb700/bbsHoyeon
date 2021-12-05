<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String userid = null;
	userid = (String) session.getAttribute("userid");
%>

    <nav class="nav d-flex justify-content-between">
					<form action="">
						<input type="search" name="t-search" class="t-search" />
						<a href="#"><i class="fas fa-search"></i></a>
					</form>
					
					<div class="member">
<%
	if(userid == null){
		out.println("<a href='login.jsp'>로그인</a> | <a href='join.jsp'>회원가입</a>");
	}else{
		out.println("환영합니다. " + userid + "님 | <a href='logout.jsp'>로그아웃</a>");
	}
%>					
					</div>
	</nav>