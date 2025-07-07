<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<html>
<head>
 <link href="../css/styles.css" rel="stylesheet" />
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<sql:setDataSource var="dataSource"
	url="jdbc:mysql://192.168.111.101:3306/goodsdb"
	driver="com.mysql.jdbc.Driver" user="goods" password="goods1234" />

<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM MEMBER WHERE m_id=?
   <sql:param value="<%=sessionId%>" />
</sql:query>	
<title>회원 수정</title>
</head>
<body onload="init()">

<div class="container py-4">
   <jsp:include page="/menu.jsp" />

 <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">회원 수정</h1>
        <p class="col-md-8 fs-4">Membership Updating</p>      
      </div>
    </div>
    
	<c:forEach var="row" items="${resultSet.rows}">
	<c:set var="mail" value="${row.m_mail}" />
	<c:set var="mail1" value="${mail.split('@')[0]}" />
	<c:set var="mail2" value="${mail.split('@')[1]}" />

	<div class="container">
		<form name="newMember" action="processUpdateMember.jsp" method="post" onsubmit="return checkForm()">
			<div class="mb-3 row">
				<label class="col-sm-2 ">아이디</label>
				<div class="col-sm-3">
					<input name="m_id" type="text" class="form-control" placeholder="id" value="<c:out value='${row.m_id }'/>" readonly>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input name="m_password" type="text" class="form-control" placeholder="password" value="<c:out value='${row.m_password }'/>">
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">비밀번호확인</label>
				<div class="col-sm-3">
					<input name="m_password_confirm" type="text" class="form-control" placeholder="password_confirm">
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input name="m_name" type="text" class="form-control" placeholder="name" value="<c:out value='${row.m_name }'/>">
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">성별</label>
				<div class="col-sm-10">
					<c:set var="gender" value="${row.m_gender }" />
					<input name="m_gender" type="radio" value="남" <c:if test="${gender.equals('남')}">checked</c:if>> 남 
					<input name="m_gender" type="radio" value="여" <c:if test="${gender.equals('여')}">checked</c:if>> 여
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">생일</label>
				<div class="col-sm-3">
					<input type="text" name="m_birth" maxlength="6" class="form-control" placeholder="예: 990101" value="${row.m_birth}" />
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-10">
				  <div class="row">
					  <div class="col-sm-4">
						<input type="text" name="m_mail1" maxlength="50" value="${mail1}" class="form-control">
					  </div>@ 
					  <div class="col-sm-3">
						<select name="m_mail2" id="mail2" class="form-select">
							<option>naver.com</option>
							<option>daum.net</option>
							<option>gmail.com</option>
							<option>nate.com</option>
						</select>
					  </div>
				  </div>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input name="m_phone" type="text" class="form-control" placeholder="phone" value="<c:out value='${row.m_phone}'/>">
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-5">
					<input name="m_address" type="text" class="form-control" placeholder="address" value="<c:out value='${row.m_address}'/>">
				</div>
			</div>
			<div class="mb-3 row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="회원수정">
					<a href="deleteMember.jsp" class="btn btn-primary">회원탈퇴</a>
				</div>
			</div>
		</form>	
	</div>
	</c:forEach>

   <jsp:include page="/footer.jsp" />  
</div>	
</body>
</html>

<script type="text/javascript">
	function init() {
		setComboMailValue("${mail2}");
	}

	function setComboMailValue(val) {
		var selectMail = document.getElementById('mail2');
		for (var i = 0; i < selectMail.length; i++) {
			if (selectMail.options[i].value == val) {
				selectMail.options[i].selected = true; 
				break;
			}
		}
	}

	function checkForm() {
		if (!document.newMember.m_id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}
		if (!document.newMember.m_password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if (document.newMember.m_password.value != document.newMember.m_password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
		return true;
	}
</script>
