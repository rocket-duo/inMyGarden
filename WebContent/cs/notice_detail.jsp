<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 상세 화면</title>
<link rel="stylesheet" type="text/css" href="/inMyGarden/css/default.css" />
<link rel="stylesheet" type="text/css" href="/inMyGarden/css/cs.css" />
</head>
<body>
<%@ include file="../inc_header.jsp" %>
<div style="margin:0 auto; width:1080px;">
<a href="#" style="padding:5px;">HOME</a> ＞
<a href="#">고객센터</a><br />
<%@ include file="../inc_cs.jsp" %>
	<div id="d_noticeDetail"><h2>공지사항</h2>
	<hr />
		<table>
			<tr>
				<th>제목</th>
				<td>&nbsp;&nbsp;매우 중요한 공지글</td>
			</tr>
		</table>
		<hr />
		<table style="padding-bottom:10px;">
			<tr>
				<th>관리자</th>
				<td> &nbsp;&nbsp;****.**.** &nbsp;**:**
				<div style="float:right; padding-right:10px; display:inline;">조회수 &nbsp;55</div>
				</td>
			</tr>
		</table>
		<textarea readonly="readonly" placeholder="공지내용..." id="noticeDetailContent"></textarea>
	<table align="center">
		<tr>
			<td align="right">
			<input type="submit" value="목록" id="noticeDetailList" />
			</td>
		</tr>
	</table>
	</div>
</div>
<%@ include file="../inc_footer.jsp" %>
</body>
</html>


