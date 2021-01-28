<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.userDAO" %>
<%@ page import="dto.userDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 체크 페이지</title>
</head>
<body>
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");
userDAO udao = userDAO.getInstance();
int check = udao.userCheck(id, pw);
if(check == 1) {
	session.setAttribute("userId", id);
	response.sendRedirect("main.jsp");
}
else {
%>
<script type="text/javascript">
	alert('로그인에 실패하였습니다.');
	history.go(-1);
</script>
<%
}
%>

</body>
</html>