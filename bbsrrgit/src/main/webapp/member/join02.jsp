<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ok = null;
	String geo = null;
	ok = request.getParameter("yak01");
	geo = request.getParameter("yak03");
	if(ok == null){
%>
	<script>
	alert("비정상적으로 접속하셨습니다.");
	window.location.href="join.jsp";
	</script>
<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h1 class="text-center py-5">회원가입</h1>
	<div class="container">
		<form action="member/joinok.jsp" id="joinform" class="join01" name="joinform" method="post">
			<input type="hidden" name="geo" value="<%=geo%>" />
			<input type="hidden" name="findid" class="findid"/>
			<input type="hidden" name="tel" />
			<input type="hidden" name="level" value="1" />
			<div class="form-group">
				<label>아이디</label>
				<div class="row">
					<div class="col-8">
						<input type="text" name="userid" id="userid" class="form-control" placeholder="아이디">					
					</div>
					<div class="col-4">
						<button type="button" class="btn btn-warning" id="findid">중복확인</button>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label>비밀번호</label>
				<input type="password" name="userpass" class="form-control" placeholder="비밀번호">
			</div>
			<div class="form-group">
				<label>비밀번호확인</label>
				<input type="password" name="reuserpass" class="form-control" placeholder="비밀번호확인">
			</div>
			<div class="form-group">
				<label>이름</label>
				<input type="text" name="username" class="form-control" placeholder="이름">
			</div>
			<div class="form-group">
				<label>이메일</label>
				<input type="text" name="useremail" class="form-control" placeholder="이메일">
			</div>
			<div class="form-group">
				<label>전화번호</label>
				<div class="row">
					<div class="col form-group">
						<input type="number" name="tel1" class="form-control">				
					</div>
					<div class="col form-group">
						<input type="number" name="tel2" class="form-control">				
					</div>
					<div class="col form-group">
						<input type="number" name="tel3" class="form-control">				
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="" class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="gender" value="female" checked>
					<span class="form-check-label">여자</span>
				</label>
				<label for="" class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="gender" value="male">
					<span class="form-check-label">남자</span>
				</label>
			</div>
			<div class="text-center py-4 border-top">
				<button class="btn btn-primary btn-block" type="submit">LOGIN</button>
			</div>
		</form>
	</div>
	
	<div class="viewfindid">
		<div class="form-group">
			<div class="row">
				<div class="form-group col-7"><input type="text" class="form-control" name="fuserid" id="fuserid"></div>
				<div class="form-group col-5"><button type="button" class="btn btn-find btn-outline-success">중복검색</button></div>		
			</div>
		</div>
		<span class="uable"></span>
	</div>
