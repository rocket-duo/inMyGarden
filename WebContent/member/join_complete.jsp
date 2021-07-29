<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc_header.jsp" %>
<%
MemberInfo loginInfo = (MemberInfo)session.getAttribute("loginInfo");
if (loginInfo != null) {
%>
<script>
	alert("잘못된 경로로 들어오셨습니다.");
	history.back();
</script>
<%
	out.close();	// 파일 실행을 강제로 종료시킴
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의작은텃밭</title>
<style>
#welcom_Box {
	height:400px;
	width:500px;
	display:inherit;
	position:relative;
	margin:100px auto;
	align:center;
}
</style>
</head>
<body>
<div id="welcom_Box">
<h3>회원가입</h3>
	<div style="border:1px solid; padding:10px; width:500px;">
		<h4>회원가입이 완료 되었습니다.</h4><br/>
		<p> 님의 회원가입을 축하합니다.</p>
		<p>지금 나의 배송지와 환불 계좌를 등록 해주세요.</p>
		<hr/>
		<a href="../index.jsp" value="나중에 입력"><img src="../img/write-later.png" width="150px" height="80px;"/></a>
		&nbsp;&nbsp;
		<a href="../my_page/my_info_addr.jsp" value="배송지 입력"><img src="../img/write-addr.png" width="150px" height="80px;"/></a>
		&nbsp;&nbsp;
		<a href="../my_page/my_info_form.jsp" value="환불계좌등록"><img src="../img/write-acnt.png" width="150px" height="80px;"/></a>
	</div>
</div>
</body>
<%@ include file="../../inc_footer.jsp" %>
</html>