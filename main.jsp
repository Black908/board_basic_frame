<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script type="text/javascript" src ="//code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" language="javascript">

	$(document).ready(function(){
		$.ajax(
		{
			type : "GET",
			url : "list.jsp?type=2",
			dataType : "text",
			error : function () {
				alert("실패입니다");
			},
			success : function(Parse_data) {
				$("#main").html(Parse_data);
				alert("통신 데이터 값 :" + Parse_data);
			} 
		});
	});

</script>

<html>
<head>
<meta charset="UTF-8">
<title>main</title>
</head>
<body>
	<div id="main"></div>
</body>
</html>