<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page_buffer.jsp</title>
</head>
<body>
	<%@ page buffer="16kb" %>
	Today is : <%= new Date() %>

</body>
</html>