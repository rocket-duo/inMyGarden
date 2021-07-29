<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%
MemberInfo loginMember = (MemberInfo)session.getAttribute("loginMember");
// session에 들어있는 속성(attribute)은 기본적으로 Object이므로 받아오려면 해당 클래스형으로 형변환을 해야 함
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/inMyGarden/css/default.css?ver0.1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
a { padding-left:10px; }
</style>
</head>
<body style="background:url('bg_mint.png') repeat; ">
<div style="margin:20% 0 20% 0;">
<hr />
<h1 style="text-align:center; "><a href="inmygarden.jsp">시연페이지</a></h1>
<hr />
</div>
</body>
</html>