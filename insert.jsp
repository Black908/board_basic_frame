<%@page import="board2.DBConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	DBConn dbconn = new DBConn();
	Connection conn = dbconn.getConnection();
	
	String title = request.getParameter("title");
	String name = request.getParameter("name");
	String memo = request.getParameter("memo");
	
	try {	
		conn.setAutoCommit(true);
		String sql = "INSERT INTO board2"+
			"(s_num, s_title, s_name, s_date, s_memo)"+
			"VALUES((select coalesce(MAX(s_num)+1) from board2),'"+title+"','"+name+"',SYSDATE,'"+memo+"')";
		Statement pstmt =  conn.createStatement();
		
		pstmt.executeUpdate(sql);
		pstmt.close();
		
		
	}catch (SQLException e) {
		
	}finally {
		try{
			conn.close();
		}catch(Exception ee){
			
		}
	}
%>
<script language=javascript>
	self.window.alert("입력한 글을 저장하였습니다.");
	location.href="list.jsp";
</script>

<html>
<head>
<meta charset="UTF-8">
<title>insert</title>
</head>
<body>

</body>
</html>