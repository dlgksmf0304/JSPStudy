<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>param01.jsp</title>
</head>
<body>

	<h3>param액션 태그</h3>
	<jsp:forward page = "param01_date.jsp">
		<jsp:param value="admin" name="id"/>
		<jsp:param name="name" value='<%=java.net.URLEncoder.encode("관리자") %>'/>
		</jsp:forward>
	<p> Jakarta Server Page
</body>
</html>