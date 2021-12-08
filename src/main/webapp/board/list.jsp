<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bbs.Paging, bbs.DBClass, bbs.BbsDTO" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>
<jsp:useBean id="pg" class="bbs.Paging"/>

<%
   int cpage = (request.getParameter("cpage") == null) ? 1 : Integer.parseInt(request.getParameter("cpage"));
   
   String colname = (request.getParameter("colname")!=null)?request.getParameter("colname"):"";
   String search = (request.getParameter("search")!=null)?request.getParameter("search"):"";
   
   int count = DBClass.selectAll(colname, search);
   pageContext.setAttribute("count", count);
   
   pg.setPage(cpage);
   pg.setTotalCount(count);
   
   
%>


<div class="container mb-5">
   <h1 class="text-center my-4">
      <%=title%>
   </h1>
   <p>
      전체 게시글 :
      <%=cot%></p>
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
         <%
         while (rs2.next()) {
            String date = rs2.getString("udate").substring(0, 10);
         %>
         <tr>
            <td class="mobile-hidden"><%=rs2.getInt("num")%></td>
            <td><a
               href="view.jsp?num=<%=rs2.getInt("num")%>&cnum=<%=cnum%>"
               class="icon pc-hidden"><i class="fas fa-user-tie"></i></a> <a
               href="view.jsp?num=<%=rs2.getInt("num")%>&cnum=<%=cnum%>"
               class="utxt pc-hidden"><%=rs2.getString("username")%> [<%=date%>]</a>
               <a href="view.jsp?num=<%=rs2.getInt("num")%>&cnum=<%=cnum%>"><%=rs2.getString("subject")%></a>
            </td>
            <td class="mobile-hidden"><a
               href="view.jsp?num=<%=rs2.getInt("num")%>&cnum=<%=cnum%>"><%=rs2.getString("username")%></a></td>
            <td class="mobile-hidden"><%=date%></td>
            <td class="mobile-hidden"><%=rs2.getInt("ct")%></td>
         </tr>

         <%
         cot--;
         }
         %>

      </tbody>
   </table>
   <div class="row">
      <div class="col-12 col-md-4 my-3">
         <form name="searchform" action="board/list.jsp" method="post">
            <input type="hidden" name="cpage" value="<%=cpage%>"> <input
               type="hidden" name="cnum" value="<%=cnum%>"> <input
               type="hidden" name="colname" id="colname" value="subject">
            <div class="input-group">
               <div class="input-group-prepend">
                  <button id="searchbtn" type="button"
                     class="btn btn-outline-secondary dropdown-toggle"
                     data-toggle="dropdown">제목+내용</button>
                  <div class="dropdown-menu">
                     <a class="dropdown-item" data-name="username">이름</a> <a
                        class="dropdown-item" data-name="subject">제목</a> <a
                        class="dropdown-item" data-name="content">내용</a> <a
                        class="dropdown-item" data-name="all">제목+내용</a>
                  </div>
               </div>
               <input type="text" name="search" id="search" class="form-control user-form"
                  placeholder="검색">
               <div class="input-group-append">
                  <button class="btn btn-dark" type="submit">검색</button>
               </div>
            </div>
         </form>
      </div>
      <div class="col-12 col-md-8 my-3 text-right">
         <a href="write.jsp?cnum=<%=cnum%>" style="color:white" type="button"
            class="btn btn-dark btn-write px-4"> 쓰기 </a>
      </div>
   </div>
   <ul class="pagination my-3 justify-content-center">
      <%
      String disabled = "";
      if (pg.getStartPageNo() == 1)
         disabled = "disabled";
      %>
      <li class="page-item <%=disabled%>"><a
         href="index.jsp?cpage=<%=pg.getStartPageNo() - 1%>" class="page-link">&lt;&lt;</a></li>

      <%
      for (int i = pg.getStartPageNo(); i <= pg.getEndPageNo(); i++) {
         String active = "";
         if (cpg == i) {
            active = "active";
         }
      %>

      <li class="page-item <%=active%>"><a
         href="index.jsp?cpage=<%=i%>" class="page-link"><%=i%></a></li>

      <%
      }
      %>

      <li class="page-item"><a
         href="index.jsp?cpage=<%=pg.getEndPageNo() + 1%>" class="page-link">&gt;&gt;</a></li>
   </ul>
</div>
<!-- /.container -->