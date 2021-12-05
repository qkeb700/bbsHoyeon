<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.sql.*, bbs.DBClass" %>
<%
	String ymode = null;
	ymode = request.getParameter("ymode");
	if(ymode != null){
	if(ymode.equals("write")) {
%>
<style>
	.ycontainer{
		width: 800px;
		padding: 50px;
		border: 1px solid #999;
		background: #fff;
		border-radius: 8px;
		margin: 50px auto;
	}
</style>
	<div class="ycontainer">
		<form name="yform" id="iform" action="index.jsp" method="post">
			<div class="for-group">
				<label for="title">제목</label>
				<input type="text" class="form-control" placeholder="제목" id="title" name="title" />
			</div>
			<div class="for-group mb-5">
				<label for="youtubeid">유튜브아이디</label>
				<input type="text" class="form-control" placeholder="제목" id="youtubeid" name="youtubeid"/>
			</div>
			<input type="hidden" name="ymode" value="writeok" />
			<button type="submit" class="btn btn-primary"> 등 록 </button>
		</form>
	</div>
<%
	}else if(ymode.equals("writeok")){
		
		String title = request.getParameter("title");
		String youtubeid = request.getParameter("youtubeid");
		
		String[] key = {"title", "youtubeid"};
		String[] val = {title, youtubeid};
		Connection conn = DBClass.getMYSQLConnection();
		DBClass.setInsert("youtube", key, val, conn);
		response.sendRedirect("../youtube.jsp");

	}else if(ymode.equals("delete")){
%>

<%
	}
}else{
	String sql = "select * from youtube order by num desc";
	try{
		Connection conn = DBClass.getMYSQLConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		int i = 0;
%>
		<style>
			a{
				color: #333;
				text-decoration: none;
			}
			.ycontainer{
				width: 1200px;
				padding: 50px;
				border: 1px solid #999;
				background: #fff;
				border-radius: 8px;
				margin: 50px auto;
				display: flex;
			}
			.ylist{
				width: 250px;
				margin-left:30px;
			}
			.ylist li{
				padding-top:8px;
				padding-bottom: 8px;
				border-bottom: 1px dashed #999;
			}
			.youtubeplay{
				width:calc(100% -280px);
			}
		</style>
		<div class="ycontainer">
			<div class="ylist">
				<ul class="youtubelist">
<% 		
		String ntitle = null;
		String nyid = null;

		while(rs.next()){
			if(i == 0){
				ntitle = rs.getString("title");
				nyid = rs.getString("youtubeid");
			}
		
%>
				<li><a href="javascript:void(0)" data-title="<%=rs.getString("title") %>"
						data-yid="<%=rs.getString("youtubeid") %>"> 
						<%=rs.getString("title") %>
					</a>
					<button type="button" class="btn btn-del" onclick="del(<%=rs.getString("num") %>)">삭제</button>
				</li>
<%
			i++;
		}
%>
			</ul>
		</div>
		<div class="youtubeplay">
			<iframe width="800" height="450" 
					src="https://www.youtube.com/embed/<%=nyid %>" 
					title="<%=ntitle %>" frameborder="0" 
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; 
					gyroscope; picture-in-picture" allowfullscreen>
			</iframe>
		</div>
	</div>
	<script>
	function del(n){
		location.href="?ymode=delete&num=" + n;
	}
	</script>
<%	
	}catch(Exception e){}
}
%>		
