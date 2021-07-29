<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 목록 화면</title>
<link rel="stylesheet" type="text/css" href="/inMyGarden/css/default.css" />
<link rel="stylesheet" type="text/css" href="/inMyGarden/css/cs.css" />
</head>
<body>
<%@ include file="../inc_header.jsp" %>
<div style="margin:0 auto; width:1080px;">
<a href="#" style="padding:5px;">HOME</a> ＞
<a href="#">고객센터</a><br />
<%@ include file="../inc_cs.jsp" %>
	<div id="d_notice_board">
		<form name="faq_brd_frm" action="" method="get">
			<h2>공지사항</h2>
			<hr />
				<table width="790" border="1" cellpadding="5" cellspacing="0" id="t_noticeBrd">
				<tr style="font-weight:bold; background:lightgray;">
					<td width="10%">번호</td><td width="*">제목</td><td width="20%">날짜</td><td width="15%">작성자</td><td width="12%">조회</td>
				</tr>
				<tr>
					<td>중요</td><td class="sub"><a href="#">매우 중요한 공지글</a></td><td>****.**.**</td><td>관리자</td><td>55</td>
				</tr>
				<tr>
					<td>중요</td><td class="sub"><a href="#">매우 중요한 공지글</a></td><td>****.**.**</td><td>관리자</td><td>45</td>
				</tr>
				<tr>
					<td>99</td><td class="sub"><a href="#">...</a></td><td>****.**.**</td><td>관리자</td><td>36</td>
				</tr>
				<tr>
					<td>98</td><td class="sub"><a href="#">...</a></td><td>****.**.**</td><td>관리자</td><td>28</td>
				</tr>
				<tr>
					<td>97</td><td class="sub"><a href="#">...</a></td><td>****.**.**</td><td>관리자</td><td>21</td>
				</tr>
				<tr>
					<td>96</td><td class="sub"><a href="#">...</a></td><td>****.**.**</td><td>관리자</td><td>15</td>
				</tr>
				<tr>
					<td>95</td><td class="sub"><a href="#">...</a></td><td>****.**.**</td><td>관리자</td><td>10</td>
				</tr>
				<tr>
					<td>94</td><td class="sub"><a href="#">...</a></td><td>****.**.**</td><td>관리자</td><td>6</td>
				</tr>
				<tr>
					<td>93</td><td class="sub"><a href="#">...</a></td><td>****.**.**</td><td>관리자</td><td>3</td>
				</tr>
				<tr>
					<td>92</td><td class="sub"><a href="#">...</a></td><td>****.**.**</td><td>관리자</td><td>1</td>
				</tr>
			</table>
		</form>
	<!-- 페이지 번호 -->
	<p align="center">＜＜   ＜   1   ＞   ＞＞
	</p>
	<!-- 검색 조건 -->
	<p align="center">
		<select name="keyword">
			<option value=""> 제목 </option>
			<option value="1"> 내용 </option>
			<option value="2"> 제목+내용 </option>
			<option value="3"> 작성자 </option>
		</select> &nbsp;&nbsp;&nbsp;
		<input type="text" size="20" name="search" />&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" value="검 색" />
	</p>
	</div>
</div>
<%@ include file="../inc_footer.jsp" %>
</body>
</html>
