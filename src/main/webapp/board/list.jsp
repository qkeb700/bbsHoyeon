<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bbs.Paging, bbs.DBClass, bbs.BbsDTO" %>
<%@ include file="/include/header.jsp" %>
<%@ page import="java.util.List, java.util.ArrayList" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:requestEncoding value="utf-8"/>
<jsp:useBean id="pg" class="bbs.Paging"/>

<%
   int cpage = (request.getParameter("cpage") == null) ? 1 : Integer.parseInt(request.getParameter("cpage"));
   int cnum2 = (request.getParameter("cnum") == null) ? 1 : Integer.parseInt(request.getParameter("cnum"));
   
   String colname = (request.getParameter("colname")!=null)?request.getParameter("colname"):"";
   String search = (request.getParameter("search")!=null)?request.getParameter("search"):"";
   
   int count = DBClass.selectAll(colname, search);
   pageContext.setAttribute("count", count);
   
   pg.setPage(cpage);
   pg.setTotalCount(count);
   
   List<BbsDTO> list = DBClass.selectPaging(pg.getStart(), pg.getDisplayRow(), colname, search);
   pageContext.setAttribute("list", list);
%>

<%--
PreparedStatement pstmt1 = null;
ResultSet rs1 = null;
PreparedStatement pstmt2 = null;
ResultSet rs2 = null;
String sql1 = null;
int sch = 0;

if (search == null) {
   sql1 = "select count(*) from bbs01 where category = ?";
} else {
   switch (colname) {
   case "username":
      sql1 = "select count(*) from bbs01 where category = ? and username like ?";
      sch = 1;
      break;
   case "subject":
      sql1 = "select count(*) from bbs01 where category = ? and subject like ?";
      sch = 1;
      break;
   case "content":
      sql1 = "select count(*) from bbs01 where category = ? and content like ?";
      sch = 1;
      break;
   case "all":
      sql1 = "select count(*) from bbs01 where category = ? and (subject like ? or content like ?)";
      sch = 2;
      break;
   }
}

pstmt1 = conn.prepareStatement(sql1);
pstmt1.setString(1, cnum);
if (sch == 1) {
   pstmt1.setString(2, "%" + search + "%");
} else if (sch == 2) {
   pstmt1.setString(2, "%" + search + "%");
   pstmt1.setString(3, "%" + search + "%");
}
rs1 = pstmt1.executeQuery();

int cot = 0;
while (rs1.next()) {
   cot = rs1.getInt(1);
}

pg.setPageSize(10);
pg.setPageNo(cpg);
pg.setTotalCount(cot);
int start = (cpg - 1) * pg.getPageSize();
int end = pg.getPageSize();
String sql2 = null;

if (search == null) {
   sql2 = "select * from bbs01 where category = ? order by num desc limit ? , ?";
} else {
   switch (colname) {
   case "username":
      sql2 = "select * from bbs01 where category = ? and username Like ? order by num desc limit ? , ?";
      break;
   case "subject":
      sql2 = "select * from bbs01 where category = ? and subject Like ? order by num desc limit ? , ?";
      break;
   case "content":
      sql2 = "select * from bbs01 where category = ? and content Like ? order by num desc limit ? , ?";
      break;
   case "all":
      sql2 = "select * from bbs01 where category = ? and (subject Like ? or content Like ?) order by num desc limit ? , ?";
      break;
   }
}
//out.println(sql2);
pstmt2 = conn.prepareStatement(sql2);

switch (sch) {
case 0:
   pstmt2.setString(1, cnum);
   pstmt2.setInt(2, start);
   pstmt2.setInt(3, end);
   break;
case 1:
   pstmt2.setString(1, cnum);
   pstmt2.setString(2, "%" + search + "%");
   pstmt2.setInt(3, start);
   pstmt2.setInt(4, end);
   break;
case 2:
   pstmt2.setString(1, cnum);
   pstmt2.setString(2, "%" + search + "%");
   pstmt2.setString(3, "%" + search + "%");
   pstmt2.setInt(4, start);
   pstmt2.setInt(5, end);
   break;
}
rs2 = pstmt2.executeQuery();
--%>

<div class="container mb-5">
   <h1 class="text-center my-4">
      Hoyeon's 게시판
   </h1>
   <p>
      전체 게시글 :
      ${count }</p>
   <table class="table table-hover">
      <colgroup class="mobile-hidden">
         <col width="55">
         <col>
         <col width="120">
         <col width="120">
         <col width="80">
      </colgroup>
      <thead>
         <tr>
            <th class="mobile-hidden">번호</th>
            <th class="mobile-hidden">제목</th>
            <th class="mobile-hidden">글쓴이</th>
            <th class="mobile-hidden">날짜</th>
            <th class="mobile-hidden">조회수</th>
         </tr>
      </thead>
      <tbody>
         <!-- loop -->
         <c:forEach var="list" items="${list }">
         <tr>
            <td class="mobile-hidden">${list.getNum() }</td>
            <td>
               <a href="view.jsp?num=${list.getNum() }&cnum=<%=cnum2%>" class="icon pc-hidden"><i class="fas fa-user-tie"></i></a> 
               <a href="view.jsp?num=${list.getNum() }&cnum=1" class="utxt pc-hidden">${list.getUsername() } [${list.getWdate() }]</a>
               <a href="view.jsp?num=${list.getNum() }&cnum=1">${list.getSubject() }</a>
            </td>
            <td class="mobile-hidden">
               <a href="view.jsp?num=${list.getNum() }&cnum=<%=cnum2%>">${list.getUsername() }</a>
            </td>
            <td class="mobile-hidden">${list.getWdate() }</td>
            <td class="mobile-hidden">${list.getCt() }</td>
         </tr>
         </c:forEach>
      </tbody>
   </table>
   <div class="row">
      <div class="col-12 col-md-4 my-3">
         <form name="searchform" action="board/list.jsp?num=<%=cpage %>&cnum=<%=cnum2%>" method="post">
            <div class="input-group">
               <div class="input-group-prepend">
                  <button id="searchbtn" type="button"
                     class="btn btn-outline-secondary dropdown-toggle"
                     data-toggle="dropdown">제목+내용</button>
                  <div class="dropdown-menu colname">
                     <a class="dropdown-item" data-name="username">이름</a> 
                     <a class="dropdown-item" data-name="subject">제목</a> 
                     <a class="dropdown-item" data-name="content">내용</a> 
                     <a class="dropdown-item" data-name="all">제목+내용</a>
                  </div>
               </div>
               <input type="hidden" name="cpage" value="<%=cpage%>"> 
               <input type="hidden" name="cnum" value="<%=cnum2%>"> 
               <input type="hidden" name="colname" id="colname" value="all">
               <input type="text" name="search" id="search" class="form-control user-form"
                  placeholder="검색">
               <div class="input-group-append">
                  <button class="btn btn-dark" type="submit">검색</button>
               </div>
            </div>
         </form>
      </div>
      <div class="col-12 col-md-8 my-3 text-right">
         <a href="write.jsp?cnum=<%=cnum2%>" style="color:white" type="button"
            class="btn btn-dark btn-write px-4"> 쓰기 </a>
      </div>
   </div>
   <ul class="pagination my-3 justify-content-center">
   <c:if test="${pg.isPrev() }">
      <li class="page-item"><a href="index.jsp?cpage=${pg.getBeginPage() - 1 }" class="page-link">&lt;&lt;</a></li>
   </c:if>

   <c:forEach begin="${pg.getBeginPage() }" end="${pg.getEndPage() }" step="1" var="i">
      <c:choose>
         <c:when test="${param.pg == i }">
            <li class="page-item active disabled"><a href="index.jsp?cpage=${i }" class="page-link">${i }</a></li>         
         </c:when>
         <c:otherwise>
            <li class="page-item"><a href="index.jsp?cpage=${i }" class="page-link">${i }</a></li>
         </c:otherwise>
      </c:choose>
   </c:forEach>   

   <c:if test="${pg.isNext() }">
      <li class="page-item"><a href="index.jsp?cpage=${pg.getEndPage() + 1 }" class="page-link">&gt;&gt;</a></li>   
   </c:if>
   </ul>
</div>
<!-- /.container -->
