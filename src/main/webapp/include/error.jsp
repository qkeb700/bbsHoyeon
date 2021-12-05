<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage = "true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러발생</title>
</head>
<body>
<p>요청을 처리하는 과정에서 에라가 발생했습니다. <br>
이른 시간내에 문제를 해결하도록 하겠습니다.</p>

<p>에러타입 : <%= exception.getClass().getName() %></p>
<p>에러 메시지 : <%= exception.getMessage() %></p>
</body>
</html>