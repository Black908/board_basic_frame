<%@page import="board2.DBConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<%
	DBConn dbconn = new DBConn();
	Connection conn = dbconn.getConnection();

	int idx = Integer.parseInt(request.getParameter("idx"));
	try {
		conn.setAutoCommit(true);
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT s_title, s_name, s_memo FROM board2 WHERE s_num=" + idx;
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()) {
			String title = rs.getString(1);
			String name = rs.getString(2);
			String memo = rs.getString(3);
%>

<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세화면</title>
</head>
<body>
<table>
	<tr>
		<td>
			<table>
				<tr>
					<td align="center">제목</td>
					<td width="319"><%=title %></td>
				</tr>
				<tr>
					<td align="center" width="76">작성자</td>
					<td width="319"><%=name%></td>
				</tr>
				<tr>
					<td align="center">내용</td>
					<td width="399" colspan="2" height="200"><%=memo %></td>
				</tr>
<%			
			rs.close();
			stmt.close();
			}
		}catch (SQLException e) {
			
		}finally {
			try{
				conn.close();
			}catch(Exception ee){
				
			}
		}
%>
				<tr align="center">
				<td colspan="2"><input type=button value="수정" OnClick="window.location='update.jsp?idx=<%=idx %>'">
					<input type=button value="목록 " Onclick="window.location='list.jsp'">
				<input type=button value="삭제" OnClick="window.location='delete.jsp?idx=<%=idx%>'">
				</tr>
			</table>
		</td>
	</tr>
</table>

</body>
</html>