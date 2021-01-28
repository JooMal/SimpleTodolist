<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.userDAO" %>
<%@ page import="dto.userDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	
	userDAO udao = userDAO.getInstance();
	userDTO udto = new userDTO();
	udto.setId(id);
	udto.setPw(pw);
	udto.setName(name);
	int check = udao.joinUser(udto);
	System.out.println("check num : " + check);
%>

<script type="text/javascript">
	alert('회원가입이 완료되었습니다. 로그인해주세요.');
	location.href="login.jsp";
</script>
</body>
</html>