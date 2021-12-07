<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>    
<%@ page import="bbs.DBClass, java.sql.*" %>
<link rel="stylesheet" href="../css/style.css" />
<%

String userid2 = (String)session.getAttribute("userid");
String sql1 = "select * from bbs01 where num =?";

PreparedStatement pstmt1 = null;
Connection conn2 = DBClass.getMYSQLConnection();
ResultSet rs1 = null;
String file1 = null;
String file2 = null;
int e = 0;
pstmt1 = conn2.prepareStatement(sql1);
pstmt1.setString(1, request.getParameter("num"));
rs1 = pstmt1.executeQuery();



%>    
  <div class="container mb-5">
    <h1 class="text-center my-4">게시판 상세보기</h1>
    
    
<% while(rs1.next()){ 
   int ct = rs1.getInt("ct");
   int count = ct+1;
   String kv = "ct = "+count;
   String where = " and num =" + request.getParameter("num");
   
   if(rs1.getString("nfilename1")!=null){
      file1 = "<a href='./board/download.jsp?filename=" + rs1.getString("nfilename1")+"&ofilename="+ "'>" + rs1.getString("ofilename1")+"</a>";
   }else{
      file1 = "";
   }
   
   if(rs1.getString("nfilename2")!=null){
      file2 = "| <a href='./board/download.jsp?filename=" + rs1.getString("nfilename2")+"&ofilename="+rs1.getString("ofilename2")+ "'>"+"</a>";      
   }else{
      file2="";
   }
   
   DBClass.setUpdate("bbs01", kv, where, conn);
      
   if(userid2 != null){
      if(userid2.equals(rs1.getString("userid"))){
         e = 1;
      }
   }
%>  
  
    <ul class="view-title bg-white">
      <li>
        <label class="bg-white">제목</label> <%=rs1.getString("subject") %>
      </li>
      <li>
        <label class="bg-white" for="">작성일</label> <%=rs1.getString("udate") %>
      </li>
      <li>
        <label class="bg-white" for="">조회수</label> <%=rs1.getInt("ct") %>
      </li>
      <li class="content bg-white">
         <div class="text-right"><%=file1 %> <%=file2 %></div>
        <%=rs1.getString("content") %>
      </li>
      <li>
        <label class="bg-white" for="">작성자</label> <%=rs1.getString("username") %>
      </li>
    </ul>
<%
}
%>    

    <div class="mt-4 text-right pb-4">
      <a href="write.html?cnum=<%=request.getParameter("cnum") %>" class="btn btn-secondary btn-write px-4 text-white">답글쓰기</a>
      <a href="update.jsp?num=<%=request.getParameter("num") %>&cnum=<%=request.getParameter("num") %>" class="btn btn-secondary btn-write px-4 text-white">수정</a>
      <a href="javascript:void(0)" data-num=<%=request.getParameter("num") %>" class="btn btn-secondary btn-write px-4 text-white" onclick="viewDel(<%= e %>, <%=request.getParameter("num")%>)">삭제</a>
      <a href="/bbs/index.jsp?cnum=<%=request.getParameter("cnum") %>" class="btn btn-dark btn-write px-4 text-white">목록</a>
    </div>
    <%@ include file="memo_view.jsp" %>
     <%@ include file="memo_write.jsp" %>

  </div>
  <style>
   .delpass{
      display:none;
      position:fixed;
      z-index:999;
      top:calc(50% - 100px);
      left: calc(50% - 200px);
      padding:20px;
   }
   .formContent{
       border-radius:10px;
       background:#fff;
       padding:30px;
       width:400px;
       height:250px;
       box-shadow:0 30px 40px 0 rgba(0,0,0,0.3);
       text-align:center;
   }
   button.fourth{
      background:#56baed;
      border:none;
      color:#fff;
      padding:7px 40px;
      display:inline-block;
      box-shadow:0 10px 20px 0 rgba(95, 186, 233, 0.4);
      border-radius:5px;
      margin:8px;
   }
   button.fourth#reset{
      background:#60a3bc;
   }
   input[type=password].fourth{
      background:#f6f6f6;
      color:#0d0d0d;
      padding:5px 20px;
      display:inline-block;
      margin-top:30px;
      margin-bottom:10px;
      border-radius:5px;
      border:1px solid #ddd;
   }
</style>

  
  <div class="delpass">
     <div class="formContent">
        <h3 class="text-center">비밀번호 입력</h3>
        <form name="delform" method="post" action="board/delok.jsp">
           <input type="hidden" name="num" value="<%=request.getParameter("num") %>" />
           <input type="password" name="password" class="fourth" placeholder="비밀번호를 입력하세요." />
           <button type="button" class="fourth" id="reset">취소</button>
           <button type="submit" class="fourth" id="reset">삭제</button>           
        </form>     
     </div>
  </div>

 
