<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page_info.jsp</title>
</head>
<body>
	<%@ page info = "Date클래스를 이용한 날짜 출력하기" %>
	Today is <%= new java.util.Date() %>
</body>
</html>