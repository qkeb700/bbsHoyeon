<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, bbs.DBClass" %>    
<%
	String userid = null, num= null, password = null, query = null;
	PreparedStatement pstmt = null, pstmt2 = null;
	ResultSet rs = null;
	Connection conn = null;
	
	userid = (String)session.getAttribute("userid");
	num = request.getParameter("num");
	password = request.getParameter("password");
	String alert="<script>alert('비정상 적으로 접근하셨습니다.'); location.href='../index.jsp';</script>";

	if(num == null){
		out.println("<script>alert('비정상 적으로 접근하셨습니다.'); location.href='../index.jsp';</script>");
	}else{
		query = "select username, userpass from bbs01 where num = ?";
		conn = DBClass.getMYSQLConnection();
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, num);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			if(userid == null){
				if(password.equals(rs.getString("userpass"))){
					String sql = "delete from bbs01 where num = ?";
					pstmt2 = conn.prepareStatement(sql);
					pstmt2.setString(1, num);
					pstmt2.executeUpdate();
				} else{
					out.println("<script>alert('비밀번호가 틀렸습니다.'); history.go(-1); </script>");
					break;
				}
			} else{
				if(userid.equals(rs.getString("userid"))){
					String sql = "delete from bbs01 where num = ?";
					pstmt2 = conn.prepareStatement(sql);
					pstmt2.setString(1, num);
					pstmt2.executeUpdate();
			
				}else{
					out.println("<script>alert('비정상 적으로 접근하셨습니다.'); location.href='../index.jsp';</script>");
					break;
				}
			}
		}
		
	}
%>
<script>
alert("저장되었습니다.");
location.href="../index.jsp";
</script>
