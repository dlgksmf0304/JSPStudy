<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
 <link href="../css/styles.css" rel="stylesheet" />
<title>회원 정보</title>
</head>
<body>

<div class="container py-4">
   <jsp:include page="/menu.jsp" />

 <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
      <%
			String msg = request.getParameter("msg");
      		if ("1".equals(msg)) {
      %>  
         <h1 class="display-5 fw-bold">회원 가입</h1>
         <p class="col-md-8 fs-4">Membership Joining</p>    
      <%
      		} else if ("3".equals(msg)) {
      %>
         <h1 class="display-5 fw-bold">회원 탈퇴</h1>
         <p class="col-md-8 fs-4">Membership Withdrawal</p>    
      <%
      		} else {
      %>
        <h1 class="display-5 fw-bold">회원 정보</h1>
        <p class="col-md-8 fs-4">Membership Info</p>    
      <%
			}
      %>
      </div>
    </div>
	
	<div class="row align-items-md-stretch text-center">
		<%
			if (msg != null) {
				if (msg.equals("0")) {
					out.println("<h2 class='alert alert-success'>회원정보가 수정되었습니다.</h2>");
				} else if (msg.equals("1")) {
					out.println("<h2 class='alert alert-success'>회원가입을 축하드립니다.</h2>");
				} else if (msg.equals("2")) {
					String loginId = (String) session.getAttribute("sessionId");
					out.println("<h2 class='alert alert-success'>" + loginId + "님 환영합니다.</h2>");
				} else if (msg.equals("3")) {
					out.println("<h2 class='alert alert-danger'>회원이 탈퇴되었습니다.</h2>");
				}
			} else {
				out.println("<h2 class='alert alert-danger'>처리 결과가 없습니다.</h2>");
			}
		%>
	</div>	
</div>	
</body>
</html>
