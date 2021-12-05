<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.*, java.util.*" %>
<%
	Calendar time = Calendar.getInstance();
	SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String now = sd.format(time.getTime());
	String uip = request.getRemoteAddr();
%>
    
<link rel="stylesheet" href="css/plugin/summernote-bs4.css" />
  <div class="container mb-5">
    <h1 class="text-center my-4">게시판 작성</h1>
    <form action="board/writeok.jsp" id="writeform" method="POST" enctype="multipart/form-data">
    	<input type="hidden" name="wdate" value="<%=now %>" />
    	<input type="hidden" name="udate" value="<%=now %>" />
    	<input type="hidden" name="uip" value="<%= uip %>" />
    	<input type="hidden" name="category" value="<%=cnum %>"/>
      <ul class="write-title">
      <% if(userid == null){ %>
        <li class="row">
          <label class="col-2 label" for="username">이름</label>
          <div class="col-4 py-3">
            <input type="text" class="form-control" name="username" id="username" placeholder="이름">
          </div>
        </li>
        <li class="row">
          <label class="col-2 label" for="userpass">비밀번호</label>
          <div class="col-4 py-3">
            <input type="password" class="form-control" name="userpass" id="userpass" placeholder="비밀번호">
          </div>
        </li>
        <% }else{ %>
        	<input type="hidden" name="userid" value="<%= userid %>" />
        	<input type="hidden" name="userpass" value="<%= userid %>" />
        <% } %>
        <li class="row">
          <label class="col-2 label" for="title">제목</label>
          <div class="col-10 py-3">
            <input type="text" class="form-control" name="subject" id="subject" placeholder="제목">
          </div>
        </li>
        <li class="content py-4">
          <textarea name="content" id="" class="form-control contents" placeholder="내용"></textarea>
        </li>
        <li class="row">
        	<label for="file1" class="col-2 label">파일첨부1</label>
        	<div class="col-10 py-3">
	        	<input type="file" class="form-control" name="file1" id="file1" />        	
        	</div>
        </li>
        <li class="row">
        	<label for="file2" class="col-2 label">파일첨부2</label>
        	<div class="col-10 py-3">
	        	<input type="file" class="form-control" name="file2" id="file2" />        	
        	</div>
        </li>
        <li class="py-1">
        	<label for=""><input type="checkbox" id="sec01" name="sec01" value="1"> 비밀글</label>
        	<input type="hidden" name="sec" id="sec" />
        </li>
      </ul>
      
      
      
      <div class="btn-area py-4 text-center">
        <a href="../index.jsp"><button type="reset" class="btn btn-danger">취소</button></a>
        <button type="submit" class="btn btn-dark">전송</button>
        <a href="index.jsp" class="btn btn-primary">목록</a>
      </div>
    </form>
  </div>