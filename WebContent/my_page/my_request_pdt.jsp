<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc_header.jsp" %>
<%@ page import="vo.*" %>
<%
// 프론트 p.51 나의 상품 문의
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
	<h2>나의 상품 문의</h2><hr/>
	<table width="800" border="1" cellspacing="0">
		<tr>
			<th>번호</th>
			<th>날짜</th>
			<th>제목</th>
			<th>상태</th>
		</tr><!-- 
		<tr>
			<td colspan="4"  height="50">작성된 문의가 없습니다.</td>
		</tr> -->
		<tr>
			<td height="50">5</td>
			<td>21-05-22</td>
			<td>문의드립니다.</td>
			<td>답변 완료</td>
		</tr>
		<tr>
			<td height="50">4</td>
			<td>21-05-22</td>
			<td>문의드립니다.</td>
			<td>답변 완료</td>
		</tr>
		<tr>
			<td height="50">3</td>
			<td>21-05-22</td>
			<td>문의드립니다.</td>
			<td>답변 완료</td>
		</tr>
		<tr>
			<td height="50">2</td>
			<td>21-05-22</td>
			<td>문의드립니다.</td>
			<td>답변 완료</td>
		</tr>
		<tr>
			<td height="50">1</td>
			<td>21-05-22</td>
			<td>문의드립니다.</td>
			<td>답변 완료</td>
		</tr>
		<!-- 아래는 클릭 하였을 경우 보여줄 부분
		<tr>
			<td colspan = "2"><img src=""/></td><td colspan = "2">상추 넓은 잎 모종</td>
		</tr>
		<tr>
			<th colspan = "2">제목</th><td colspan = "2">문의드립니다.</td>
		</tr>
		<tr>
			<td colspan = "4">쌈용으로 좋나요</td>
		</tr>
		<tr>
			<th colspan = "2">작성일</th><td colspan = "2">2021-05-24</td>
		</tr>
		<tr>
			<th colspan = "2">작성자</th><td colspan = "2">CS팀</td>
		</tr>
		<tr>
			<td colspan = "4">제격입니다.</td>
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