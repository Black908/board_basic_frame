<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script language = "javascript">
function writeCheck()
{
	var form = document.writeform;
	
	if(!form.title.value)
	{
		alert("제목을 적어주세요");
		form.title.focus();
		return;
	}
	if(!form.name.value)
	{
		alert("이름을 적어주세요");
		form.name.focus();
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
<html>
<head>
<meta charset="UTF-8">
<title>게시판 작성</title>
</head>
<body>
<table>
<form name="writeform" method="post" action="insert.jsp">
	<tr>
		<td>
			<table>
				<tr>
					<td align="center">제목</td>
					<td><input name="title" size="50" maxlength="100"></td>
				</tr>
				<tr>
					<td align="center">작성자</td>
					<td><input name="name" size="50" maxlength="50"></td>
				</tr>
				<tr>
					<td align="center">내용</td>
					<td><textarea name="memo" cols="50" rows="13"></textarea></td>
				</tr>
				<tr align="center">
				<td colspan="2"><input type=button value="등록" OnClick="javascript:writeCheck()">
					<a href= "list.jsp"><input type=button value="취소"></a>
				</tr>
			</table>
		</td>
	</tr>
</form>
</table>
</body>
</html>