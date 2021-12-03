<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	public class Inner {
		private String data;
		public void setData(String data){this.data= data;}
		public String getData(){return this.data;}
	}
%>    
<%
    request.setCharacterEncoding("UTF-8");     
	Inner inner = new Inner();
	inner.setData("홍길동");
	request.setAttribute("inner", inner);
	request.setAttribute("ct1", "100");
	request.setAttribute("ct2", "30");
	
	request.setAttribute("bool", "false");
	request.setAttribute("data", "");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<dl>
		<dt>inner.data : </dt>
		<dd>${requestScope.inner.data } </dd>
	
		<dt>ct1 * (ct2 + 3) : </dt>
		<dd>${requestScope.ct1 * (requestScope.ct2 + 3) }</dd>
		
		<dt>not bool</dt>
		<dd>${not requestScope.bool }</dd>
	</dl>
</body>
</html>