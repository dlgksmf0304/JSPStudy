<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <link href="../css/styles.css" rel="stylesheet" />
    <title>회원 가입</title>
    <script type="text/javascript">
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
        }
    </script>
</head>
<body>
<div class="container py-4">
    <jsp:include page="/menu.jsp" />

    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">회원 가입</h1>
            <p class="col-md-8 fs-4">Membership Joining</p>
        </div>
    </div>

    <div class="row align-items-md-stretch text-center">
        <form name="newMember" action="processAddMember.jsp" method="post" onsubmit="return checkForm()">

            <div class="mb-3 row align-items-center">
                <label class="col-sm-2 col-form-label">아이디</label>
                <div class="col-sm-3">
                    <input id="m_id" name="m_id" type="text" class="form-control" placeholder="id">
                </div>
            </div>

            <div class="mb-3 row">
                <label class="col-sm-2 col-form-label">비밀번호</label>
                <div class="col-sm-3">
                    <input name="m_password" type="text" class="form-control" placeholder="password">
                </div>
            </div>

            <div class="mb-3 row">
                <label class="col-sm-2 col-form-label">비밀번호확인</label>
                <div class="col-sm-3">
                    <input name="m_password_confirm" type="text" class="form-control" placeholder="password confirm">
                </div>
            </div>

            <div class="mb-3 row">
                <label class="col-sm-2 col-form-label">성명</label>
                <div class="col-sm-3">
                    <input name="m_name" type="text" class="form-control" placeholder="name">
                </div>
            </div>

            <div class="mb-3 row">
                <label class="col-sm-2 col-form-label">성별</label>
                <div class="col-sm-2">
                    <input name="m_gender" type="radio" value="남" /> 남 
                    <input name="m_gender" type="radio" value="여" /> 여
                </div>
            </div>

            <div class="mb-3 row">
                <label class="col-sm-2 col-form-label">생년월일</label>
                <div class="col-sm-3">
                    <input type="text" name="m_birth" maxlength="6" class="form-control" placeholder="예: 950624">
                </div>
            </div>

            <div class="mb-3 row">
                <label class="col-sm-2 col-form-label">이메일</label>
                <div class="col-sm-10">
                    <div class="row">
                        <div class="col-sm-4">
                            <input type="text" name="m_mail1" maxlength="50" class="form-control" placeholder="email">
                        </div> @
                        <div class="col-sm-3">
                            <select name="mail2" class="form-select">
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
                <label class="col-sm-2 col-form-label">전화번호</label>
                <div class="col-sm-3">
                    <input name="m_phone" type="text" class="form-control" placeholder="phone">
                </div>
            </div>

            <div class="mb-3 row">
                <label class="col-sm-2 col-form-label">주소</label>
                <div class="col-sm-5">
                    <input name="m_address" type="text" class="form-control" placeholder="address">
                </div>
            </div>

            <div class="mb-3 row">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="submit" class="btn btn-primary" value="등록"> 
                    <input type="reset" class="btn btn-secondary" value="취소">
                </div>
            </div>

        </form>
    </div>

    <jsp:include page="/footer.jsp" />
</div>
</body>
</html>
