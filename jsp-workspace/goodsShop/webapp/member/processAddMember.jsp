<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
	request.setCharacterEncoding("UTF-8");

	String m_id = request.getParameter("m_id");
	String m_password = request.getParameter("m_password");
	String m_name = request.getParameter("m_name");
	String m_gender = request.getParameter("m_gender");
	String m_birth = request.getParameter("m_birth");
	String m_mail1 = request.getParameter("m_mail1");
	String m_mail2 = request.getParameter("m_mail2");
	String m_mail = m_mail1 + "@" + m_mail2;
	String m_phone = request.getParameter("m_phone");
	String m_address = request.getParameter("m_address");

	Date currentDatetime = new Date(System.currentTimeMillis());
	java.sql.Date sqlDate = new java.sql.Date(currentDatetime.getTime());
	java.sql.Timestamp m_timestamp = new java.sql.Timestamp(currentDatetime.getTime());
%>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://192.168.111.101:3306/goodsdb"
	driver="com.mysql.jdbc.Driver" user="goods" password="goods1234" />

<sql:update dataSource="${dataSource}" var="resultSet">
   INSERT INTO member VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
   <sql:param value="<%=m_id%>" />
	<sql:param value="<%=m_password%>" />
	<sql:param value="<%=m_name%>" />
	<sql:param value="<%=m_gender%>" />
	<sql:param value="<%=m_birth%>" />
	<sql:param value="<%=m_mail%>" />
	<sql:param value="<%=m_phone%>" />
	<sql:param value="<%=m_address%>" />
	<sql:param value="<%=m_timestamp%>" />
	
</sql:update>

<c:if test="${resultSet>=1}">
	<c:redirect url="resultMember.jsp?msg=1" />
</c:if>