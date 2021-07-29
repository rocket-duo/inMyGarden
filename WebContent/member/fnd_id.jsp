<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc_header.jsp" %>
<%
// 식물 프론트 ppt p.3 아이디 찾기 부분
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/default.css" />
<link rel="stylesheet" type="text/css" href="../css/fnd_id.css" />
<script type="text/javascript" src="../jsjq/fnd_id.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>나의작은텃밭</title>
</head>
<body>
<div class="fnd_box">
	<h3 style="display:block;">아이디 찾기</h3>
	<div id="fnd_id1">
		<form name="fndId" action="" method="post">
			<input id="fnd_id_text" type="text" size="20" name="name" placeholder="회원의 이름을 입력해 주세요." />
			<br/>
			<input type="text" size="15" name="e1" placeholder="가입메일주소"/>@
			<input type="text" size="15" name="e2" disabled /><br/>
			<select name="email" onchange="email_change()">
				<option value="">선택하세요.</option>
				<option value="naver.com">네이버</option>
				<option value="daum.net">다음</option>
				<option value="google.com">구글</option>
				<option value="yahoo.co.kr">야후</option>
				<option value="nate.net">네이트</option>
				<option value="direct">직접입력</option>
			</select>
			&nbsp;&nbsp;&nbsp;<input id="fnd_id" type="submit" value="아이디 찾기" onclick="return findId(this)"/>
		</form>
	</div>
	<div id="sub_menu">
		<hr/>
		<input id="fnd_Pwd" type="button" value="비밀번호 찾기"/>
		<input id="lnk_login" type="button" value="로그인"/>
		<input id="join" type="button" value="회원 가입"/>
	</div>
</div>
</body>
<%@ include file="../../inc_footer.jsp" %>
</html>