<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ include file="../../inc_header.jsp" %>
<%
if(loginMember != null){
	out.println("<script>");
	out.println("alert('잘못된 경로로 들어왔습니다');");
	out.println("history.back();");
	out.println("</script>");
	out.close();
}

request.setCharacterEncoding("utf-8");
String url = request.getParameter("url");	// 로그인 후 이동할 페이지의 주소(없는 경우도 있다.)
if (url == null) url="";		// url이 없으면 빈 문자열로 변환하여 사용

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/login_form.css" />
<link rel="stylesheet" type="text/css" href="/inMyGarden/css/default.css?ver0.1" />
<script type="text/javascript" src="../jsjq/login_form.js"></script>
<title>나의작은텃밭</title>
</head>
<body>
<div class="login_box">
	<h2>회원 로그인</h2>
	<form name="frm" action="logon" method="post" onsubmit="return chkVal(this)">
	<input type="text" name="user_id" placeholder="아이디 입력" value="test1" /><br/>
	<input type="password" name="user_pwd" placeholder="비밀번호 입력" value="1234" /><br/>
	<input id="submit_btn" type="submit" value="로그인"/>
	</form>
	<input type="checkbox" name="open" id="open" />
			<label for="open">아이디 저장</label><br/>
	<input type="button" name="fnd_id" value="아이디 찾기"/>
	<input type="button" name="fnd_pwd" value="비밀번호 찾기"/>
	<input type="button" name="fnd_join" value="회원가입"/>
</div>

</body>
<%@ include file="../../inc_footer.jsp" %>
</html>