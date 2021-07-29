<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc_header.jsp" %>
<%@ page import="vo.*" %>
<%
// 프론트 p.52 나의 상품 후기
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의작은텃밭</title>
</head>
<body>
<div style="width:1080px; margin:0 auto;">
<%@ include file="inc_my_page_side_menu.jsp" %>
<div style="text-align:center;">
	<h2>나의 상품 후기</h2><hr/>
	<table border="1" width="800"cellspacing="0">
		<tr>
			<th>번호</th>
			<th>날짜</th>
			<th>제목</th>
			<th>별점</th>
		</tr>
		<!-- <tr>
			<td colspan="4">작성된 후기가 없습니다.</td>
		</tr> -->
		<tr>
			<td height="50">5</td>
			<td>2105220001</td>
			<td>제품이 좀 그래요</td>
			<td>★☆☆☆☆</td>
		</tr>
		<tr>
			<td height="50">4</td>
			<td>2105220001</td>
			<td>제품이 좀 그래요</td>
			<td>★☆☆☆☆</td>
		</tr>
		<tr>
			<td height="50">3</td>
			<td>2105220001</td>
			<td>제품이 좀 그래요</td>
			<td>★☆☆☆☆</td>
		</tr>
		<tr>
			<td height="50">2</td>
			<td>2105220001</td>
			<td>제품이 좀 그래요</td>
			<td>★☆☆☆☆</td>
		</tr>
		<tr>
			<td height="50">1</td>
			<td>2105220001</td>
			<td>제품이 좀 그래요</td>
			<td>★☆☆☆☆</td>
		</tr>
		<!--
		<tr>
			<td colspan = "2"><img src=""/></td><td colspan = "2">상추 넓은 잎 모종</td>
		</tr>
		<tr>
			<th>제목</th><td>문의드립니다.</td><th>작성일</th><td>2021-05-25</td>
		</tr>
		<tr>
			<th>별점</th><td colspan = "3">★☆☆☆☆</td>
		</tr>
		<tr>
			<td colspan = "4">쌈용으론 그렇게 좋지 않네요!</td>
		</tr> -->
	</table>
	<!-- <input type="button" value="삭제" />
	&nbsp;&nbsp;&nbsp;
	<input type="button" value="수정" /> -->
</div>
</div>
</body>

<%@ include file="../../inc_footer.jsp" %>
</html>