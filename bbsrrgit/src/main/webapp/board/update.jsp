<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.*, java.util.*" %>
<%

	String sql1 = "select * from bbs01 where num =?";
	
	PreparedStatement pstmt1 = null;
	ResultSet rs1 = null;
	String file1 = null;
	String file2 = null;
	pstmt1 = conn.prepareStatement(sql1);
	pstmt1.setString(1, request.getParameter("num"));
	rs1 = pstmt1.executeQuery();

	Calendar time = Calendar.getInstance();
	SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String now = sd.format(time.getTime());
	String uip = request.getRemoteAddr();
	
	while(rs1.next()){
%>
    
<link rel="stylesheet" href="css/plugin/summernote-bs4.css" />
  <div class="container mb-5">
    <h1 class="text-center my-4">연습용 게시판</h1>
    <form action="board/updateok.jsp" id="writeform" method="POST" enctype="multipart/form-data">
    	<input type="hidden" name="wdate" value="<%=rs1.getString("wdate") %>" />
    	<input type="hidden" name="udate" value="<%=rs1.getString("udate") %>" />
    	<input type="hidden" name="uip" value="<%= uip %>" />
    	<input type="hidden" name="category" value="<%=cnum %>"/>
    	<input type="hidden" name="num" value="<%=rs1.getString("num")%>"/>
      <ul class="write-title">
      <% if(userid == null){ %>
        <li class="row">
          <label class="col-2 label" for="username">이름</label>
          <div class="col-4 py-3">
            <input type="text" class="form-control" name="username" id="username" placeholder="이름" value="<%=rs1.getString("username")%>">
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
            <input type="text" class="form-control" name="subject" id="subject" placeholder="제목" value="<%=rs1.getString("subject") %>">
          </div>
        </li>
        <li class="content py-4">
          <textarea name="content" id="" class="form-control contents" placeholder="내용"><%=rs1.getString("content") %></textarea>
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
        
<%
	String checked = (rs1.getInt("sec")==1)?"checked":"";
%>        
        
        <li class="py-1">
        	<label for=""><input type="checkbox" id="sec01" name="sec01" value="1" <%=checked %>> 비밀글</label>
        	<input type="hidden" name="sec" id="sec" />
        </li>
      </ul>
      
      
      
      <div class="btn-area py-4 text-center">
        <button type="reset" class="btn btn-danger">취소</button>
        <button type="submit" class="btn btn-dark">전송</button>
      </div>
    </form>
  </div>
  
  <div class="loading">
       <div class="spinner-border text-primary"></div>
    </div>
  <%
  }
  %>