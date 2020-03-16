<%@page import="board2.DBConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<%
	DBConn dbconn = new DBConn();
	Connection conn = dbconn.getConnection();

	try{
		request.setCharacterEncoding("UTF-8");
		int idx = Integer.parseInt(request.getParameter("idx"));
		String title= request.getParameter("title");
		String memo= request.getParameter("memo");
		Statement stmt = conn.createStatement();
		
		String sql = "UPDATE board2 SET s_title='" + title + "' ,s_memo='" + memo + "' WHERE s_num=" + idx;
		stmt.executeUpdate(sql);
%>

	<script language=javascript>
		self.window.alert("글이 수정되었습니다.");
		location.href="view.jsp?idx=<%=idx%>";
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
<title>update</title>
</head>
<body>

</body>
</html>