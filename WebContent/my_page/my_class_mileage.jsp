<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc_header.jsp" %>
<%@ page import="vo.*" %>
<%
// 프론트 p.50 회원 주소 추가 및 수정 부분
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/default.css" />
<title>나의작은텃밭</title>
</head>
<body>
<div style="width:1080px; margin:0 auto;">
<%@ include file="inc_my_page_side_menu.jsp" %>
	<div style="width:300px; display:inline-block; text-align:center;">
		<img src="/inMyGarden/img/mileage_pig.png" width="150px;" />
		<h2>적립금</h2>
	</div>
	<div style="width:400px;display:inline-block; text-align:center;">
		<h2>나의 적립금 내역</h2>
		<h2><%=loginMember.getMi_point() %>원</h2>
	</div>
	<div style="text-align:center;">
		<table width="800" border="1" cellspacing="0">
			<tr>
				<th height="30">날짜</th>
				<th>적립금 유형</th>
				<th>내용</th>
				<th>적립금 내역</th>
				<th>잔여 적립금</th>
			</tr>
			<tr>
				<td height="50">21-05-22</td>
				<td>사용</td>
				<td>구매시 사용</td>
				<td>-3,000원</td>
				<td>0원</td>
			</tr>
			<tr>
				<td height="50">21-05-22</td>
				<td>적립</td>
				<td>신규회원 가입</td>
				<td>+3,000원</td>
				<td>3,000원</td>
			</tr>
		</table>
	</div>
</div>
</body>

<%@ include file="../../inc_footer.jsp" %>
</html>