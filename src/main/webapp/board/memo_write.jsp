<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.*, java.util.*" %>
<%
	String today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	String uip = request.getRemoteAddr();
%>    
<div class="comment-write">
    <form action="board/memo_action.jsp" name="commentform" method="POST">
    	<input type="hidden" name="bbsnum" value="<%=request.getParameter("num") %>" />
		<input type="hidden" name="wdate" value="<%=today%>" />
		<input type="hidden" name="uip" value="<%=uip%>" />
		<input type="hidden" name="mode" value="" />
    	<div class="row">
			<div class="col-10">
		      <div class="form-group">
		        <textarea name="memo" rows="4" class="comment form-control"></textarea>
		      </div>
		      
		      <% if(userid == null) { %>
		      <div class="form-group">
		        <div class="row">
		          <div class="col-3">
		            <input type="text" class="form-control" placeholder="이름" required>
		          </div>
		          <div class="col-3">
		            <input type="password" class="form-control" placeholder="비밀번호" required>
		          </div>
		          <div class="col-6">
	
	          	  </div>
	        	</div>
	      	</div>	
	      	<%}else{ %>
	      		<input type="hidden" name="userid" value="<%=userid %>">
	      		<input type="hidden" name="userpass" value="<%=userid%>">
	      	<%} %>		
		  </div>
	      <div class="col-2">
	      	<button type="submit" class="comment-button">전 송</button>
	      </div>
      </div>
    </form>
 </div>