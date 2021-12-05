<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 style="text-align:center">
	IPADRESS : ${initParam.ipAddress}
</h1>
	<p>
		이름 : ${param.username }
	</p>
	<p>
		전화번호 : ${param.usertel }
	</p>
	<p>
		쿠키이름 : ${cookie.aa.name }
	</p>
	<p>
		쿠키값 : ${cookie.aa.value }
	</p>
</body>
</html>