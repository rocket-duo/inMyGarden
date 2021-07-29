<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc_header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/default.css" />
<link rel="stylesheet" type="text/css" href="../css/fnd_id.css" />
<title>나의작은텃밭</title>
</head>
<body>
	<div class="fnd_box">
		<p>입력하신 이름과 이메일이</p>
		<p>일치하는 아이디가 없습니다.</p>
		<div id="sub_menu">
			<input type="button" name="fnd_id" value="아이디 다시 찾기" />
			<input type="button" name="fnd_pwd" value="비밀번호 찾기" />	
			<input type="button" name="login" value="로그인" />
			<input type="button" name="join" value="회원가입" />
		</div>
	</div>
</body>
<%@ include file="../../inc_footer.jsp" %>
</html>