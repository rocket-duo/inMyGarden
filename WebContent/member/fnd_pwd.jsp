<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc_header.jsp" %>
<%@ include file="../../inc_footer.jsp" %>
<%
// 식물 프론트 ppt p.3 비밀번호 찾기 부분
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의작은텃밭</title>
</head>
<body>
	<p>비밀번호 찾기</p>
	<div class="fnd_pwd1">
		<fieldset class="fnd_pwd1">
			<form action="" method="post">
				<p>회원 아이디 입력</p>
				<p>비밀번호를 찾고자 하는 아이디를 입력해 주세요.</p>
				<input type="text" size="20" placeholder="아이디" />
				<input id="fnd_id" type="submit" value="다음"/>
				<p>아이디를 입력해 주세요.</p>
				<p>조회할 수 없는 아이디 입니다.</p>
			</form>
			<p>아이디를 모르시나요?</p>
			<input id="fnd_id" type="button" value="아이디 찾기"/>
			<input id="lnk_login" type="button" value="로그인"/>
		</fieldset>
	</div>
		<div class="fnd_pwd2">
		<fieldset class="fnd_pwd2">
			<form action="" method="post">
				<p>인증번호 입력</p>
				<p>입력하신 이메일을 통해 수신된 인증번호를 입력해 주세요.</p>
				<input type="text" size="20" placeholder="인증번호 입력" />
				<input id="fnd_pwd" type="submit" value="확인"/>
				<p>아이디를 입력해 주세요.</p>
				<p>조회할 수 없는 아이디 입니다.</p>
			</form>
			<p>인증번호를 입력해 주세요.</p>
			<p>인증번호의 입력이 올바르지 않습니다.</p>
		</fieldset>
	</div>
		</div>
		<div class="fnd_pwd3">
		<fieldset class="fnd_pwd3">
			<form action="" method="post">
				<p>비밀번호 변경</p>
				<p>새로운 비밀번호로 변경해 주세요.</p>
				<input type="password" size="20" placeholder="새 비밀번호 입력" /><br/>
				<p>비밀번호는 6~15자 로 입력해 주세요.</p>
				<input type="password" size="20" placeholder="새 비밀번호 확인" />
				<p>비밀번호가 일치하지 않습니다.</p>
				<input id="fnd_pwd" type="submit" value="확인"/>
			</form>
		</fieldset>
	</div>
</body>
</html>