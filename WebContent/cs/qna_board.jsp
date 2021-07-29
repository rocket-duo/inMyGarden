<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1:1 문의 목록 화면</title>
<link rel="stylesheet" type="text/css" href="/inMyGarden/css/default.css" />
<link rel="stylesheet" type="text/css" href="/inMyGarden/css/cs.css" />
</head>
<body>
<%@ include file="../inc_header.jsp" %>
<div style="margin:0 auto; width:1080px;">
<a href="#" style="padding:5px;">HOME</a> ＞
<a href="#">고객센터</a><br />
<%@ include file="../inc_cs.jsp" %>
	<div id="d_qnaBoard"><h2 style="display:inline;">1:1 문의</h2>
		<div style="width:100px; display:inline; float:right;">
			<input type="button" value="1:1 문의하기" style="margin-top:5px; width:100px; background:lightgray;"/>
		</div>
		<table width="800" height="120" id="t_qnaBoard">
			<tr>
				<td class="qnaBoardCata">문의날짜</td>
				<td class="qnaBoardCata">분류</td>
				<td class="qnaBoardCata">제목</td>
				<td style="border-bottom:1px solid lightgray;">문의상태&nbsp;<a href="#">
					<img src="../img/down-240.png" style="width:10px;" /></a>
				</td>
			</tr>
			<tr>
				<td>05.22</td>
				<td>결제/배송</td>
				<td class="qnaBoardSub">배송 관련 문의</td>
				<td>접수</td>
			</tr>
			<tr>
				<td>05.20</td>
				<td>회원가입/정보</td>
				<td class="qnaBoardSub">네이버 아이디 로그인 문의</td>
				<td>답변 완료</td>
			</tr>
		</table>
	<!-- 페이지 번호 -->
	<p align="center">＜＜   ＜   1   ＞   ＞＞
	</p>
	</div>
</div>
<%@ include file="../inc_footer.jsp" %>
</body>
</html>