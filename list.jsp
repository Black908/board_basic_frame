<%@page import="board2.DBConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Vector"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<%
	DBConn dbconn = new DBConn();
	Connection conn =dbconn.getConnection();
	int bbs_total = 0;

	try {
		conn.setAutoCommit(true);
		ResultSet rs;
		String sqlCount = "SELECT * FROM board2 WHERE s_num>0;";
		Statement stmt = conn.createStatement();
		rs = stmt.executeQuery(sqlCount);

		if (rs.next()) {
			bbs_total = rs.getInt(1);
		}
%>

<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
</head>
<body>
	<table>
		<tr>
			<td>
				<table width=100% cellpadding="0" sellspacing="0" border="0">
					<tr style="text-align: center;">
						<td width="5"></td>
						<td>게시판</td>
						<td width="5"></td>
					</tr>
				</table>
				<table>
					<tr>
						<td>번호</td>
						<td align="center">제목</td>
						<td>작성자</td>
						<td>작성일자</td>
					</tr>

					<%
						if (bbs_total == 0) {
					%>
					<tr>
						<td>등록된 글이 없습니다.</td>
					</tr>
					<%
						} else {
								while (rs.next()) {
									int idx = rs.getInt(1);
									String title = rs.getString(2);
									String name = rs.getString(3);
									String memo = rs.getString(4);
					%>
					<tr>
						<td><%=idx%></td>
						<td><a href="view.jsp?idx=<%=idx%>"><%=title%></a></td>
						<td><%=name%></td>
						<td><%=memo%></td>
					</tr>
					<%
						}
							}
							rs.close();
							stmt.close();
							conn.close();
						} catch (SQLException e) {
							out.println(e.toString());
						}
					%>

				</table>

				<table width="100%" cellpading="0" cellspacing="0" border="0">
					<tr>
						<td colspan="4" height="5"></td>
					</tr>
					<tr align="center">
						<td><a href="write.jsp"><input type=button value="글쓰기"></a></td>
					</tr>
				</table>
	</table>
</body>
</html>