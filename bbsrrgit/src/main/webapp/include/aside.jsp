<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, bbs.DBClass, bbs.Paging" %>  
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/core" %>   
<%! 
    Paging pg = new Paging(); 
%>
 <nav>
                  
             <ul class="aside-nav">
<%
int cpg = (request.getParameter("cpage") != null)?Integer.parseInt(request.getParameter("cpage")):1;

String cnum = request.getParameter("cnum");
if(cnum==null){
   cnum = "1";
}
PreparedStatement pstmt = null;
ResultSet rs = null;
Connection conn = null;

String sql = "select * from category01 order by num asc";
String query = "select * from category01 where num = ?";

try{
     conn = DBClass.getMYSQLConnection();
     pstmt = conn.prepareStatement(sql);
     rs = pstmt.executeQuery();
   
     //cnum 를 받아서 각 게시판의 제목 출력 
      PreparedStatement pt = conn.prepareStatement(query);
      pt.setString(1, cnum);
      ResultSet result = pt.executeQuery();
      
      String title = null;
      while(result.next()){
         title = result.getString("category");
      }
      
 
      while(rs.next()){   
       out.println("<li><a href='index.jsp?cnum="+rs.getInt("num")+"'>"+ rs.getString("category") +"</a></li>");
      }
      result.close();
      pt.close();
      rs.close();
      pstmt.close();
}catch(Exception e){
	e.printStackTrace();
}
%>    
                 </ul>
                 
      
                 
              </nav>