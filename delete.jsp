<%@page import="board2.DBConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	DBConn dbconn = new DBConn();
	Connection conn = dbconn.getConnection();

	int idx = Integer.parseInt(request.getParameter("idx"));
	
	try {
		conn.setAutoCommit(true);
		Statement stmt = conn.createStatement();
		
		String sql = "DELETE FROM board2 WHERE s_num=" + idx;
		stmt.executeUpdate(sql);
%>

	<script language=javascript>
		self.window.alert("해당 글을 삭제하였습니다.");
		location.href="list.jsp";
	</script>
<%
		stmt.close();
		}catch (SQLException e) {

		}finally {
			try{
				conn.close();
				}catch(Exception ee){
	
				}
		}
%>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제</title>
</head>
<body>

</body>
</html>