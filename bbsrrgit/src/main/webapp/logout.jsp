<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Enumeration" %>    

<%
	String userid = (String)session.getAttribute("userid");
	Enumeration enu = session.getAttributeNames();
	// 세션에 저장된 key값들을 하나씩 enumeration 변수 enu에 담음
	
	while(enu.hasMoreElements()){
		// 키값을 하나씩 검증하면서 세션에 저장되어 있는 값과 같은 값이 있는지 조사
		
		String userName = enu.nextElement().toString();
		String userValue = (String) session.getAttribute(userName);
		
		// 같은 값을 찾으면 세션에서 삭제
		if(userValue.equals(userid)) session.removeAttribute(userName);
	}
%>	
<script>
alert("로그아웃 하셨습니다.");
location.href="index.jsp";
</script>