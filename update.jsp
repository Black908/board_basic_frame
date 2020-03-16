<%@page import="board2.DBConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<script language = "javascript">
function updateCheck()
{
	var form = document.updateform;
	
	if(!form.title.value)
	{
		alert("제목을 적어주세요");
		form.title.focus();
		return;
	}
	if(!form.memo.value)
	{
		alert("내용을 적어주세요");
		form.memo.focus();
		return;
	}
			form.submit();
}
</script>
<%
	request.setCharacterEncoding("UTF-8");
	DBConn dbconn = new DBConn();
	Connection conn = dbconn.getConnection();
	
	String title="";
	String name="";
	String memo="";
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	try{
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT s_title, s_name, s_memo FROM board2 WHERE s_num=" +idx;
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			title = rs.getString(1);
			name = rs.getString(2);
			memo = rs.getString(3);
		}
		
		rs.close();
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
<title>게시글 수정</title>
</head>
<body>
<table>
<form name=updateform method=post action="update_ok.jsp?idx=<%=idx%>">
	<tr>
		<td>
			<table>
				<tr>
					<td align="center">제목</td>
					<td><input type="text" name="title" size="50" maxlength="100" value="<%=title %>"></td>
				</tr>
				<tr>
					<td align="center" width="76">작성자</td>
					<td width="319"><%=name %><input type=hidden name="name" size="50" maxlength="50"></td>
				</tr>
				<tr>
					<td align="center">내용</td>
					<td width="399" colspan="2" height="200">
					<textarea name="memo" cols="50" rows="13"><%=memo %></textarea></td>
				</tr>
				<tr align="center">
      				<td colspan="2"><input type="button" value="수정" OnClick="javascript:updateCheck();">
      				<input type=button value="취소" OnClick="javascript:history.back(-1)">
     			</tr> 
			</table>
		</td>
	</tr>
</form>
</table>
</body>
</html>