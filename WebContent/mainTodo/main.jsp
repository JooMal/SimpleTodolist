<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.userDAO" %>
<%@ page import="dto.userDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>

<style>
.nav {
	padding-bottom: 20px;
	padding-top: 20px;
}
</style>
<body>

<section class="nav">
<%
	String id = (String)session.getAttribute("userId");
	userDAO udao = userDAO.getInstance();
	userDTO udto = new userDTO();
	udto = udao.getUser(id);
	String name= "";
	if(udto != null)
	{
		name = udto.getName();
%>
	<h2> <%= name %>님, 환영합니다! </h2> <p>
	<input type="button" value="로그아웃" onClick="location.href='logout.jsp'">
<%
	}
	else {
%>
	<input type="button" value="로그인" onClick="location.href='login.jsp'">
	<input type="button" value="회원가입" onClick="location.href='join.jsp'">
<%
	}
%>
</section>

<table border="2" width="600">
	<tr>
		<td colspan="2">투두리스트</td>
	</tr>
	<tr>
		<td width="100"> 체크표시 </td>
		<td> 투두 1 </td>
	</tr>
	<tr>
		<td> 체크표시 </td>
		<td> 투두 2 </td>
	</tr>
	<tr>
		<td> 체크표시 </td>
		<td> 투두 1 </td>
	</tr>
</table>

</body>
</html>