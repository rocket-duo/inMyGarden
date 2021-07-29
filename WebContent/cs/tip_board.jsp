<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>팁 게시판 목록</title>
<link rel="stylesheet" type="text/css" href="/inMyGarden/css/default.css" />
<link rel="stylesheet" type="text/css" href="/inMyGarden/css/cs.css" />
</head>
<body>
<%@ include file="../inc_header.jsp" %>
<div style="margin:0 auto; width:1080px;">
<a href="#" style="padding:5px;">HOME</a> ＞
<a href="#">커뮤니티</a><br />
<%@ include file="../inc_cs.jsp" %>
	<div id="d_tipBoard"><h2>팁 게시판</h2>
	<hr />
	<!-- 팁 게시판 -->
	<br />
	<form name="tip_brd_frm" action="" method="get" id="tip_board">
		<div id="d_tipBoardSort">
			<select name="choice" id="select">
				<option value=""> - 선택 - </option>
				<option value="1"> 조회수 ↑ </option>
				<option value="2"> 조회수 ↓ </option>
				<option value="3"> 추천수 ↑ </option>
				<option value="4"> 추천수 ↓ </option>
				<option value="5"> 평점순 ↑ </option>
				<option value="6"> 평점순 ↓ </option>
				<option value="7"> 최신순 </option>
				<option value="8"> 작성순 </option>
			</select>
		</div>
		<hr />
		<table cellspacing="0" id="t_tipBoard">
			<tr id="top" align="center">
				<td width="10%">번호</td><td width="20%">분류</td><td width="*">제목</td><td width="10%">조회</td><td width="10%">추천</td>
			</tr>
			<tr>
				<td>522</td><td>텃밭가꾸기 팁</td><td class="subject"><a href="">만족입니다~</a></td><td>5220</td><td>520</td>
			</tr>
			<tr>
				<td>521</td><td>텃밭가꾸기 팁</td><td class="subject"><a href="">싹이 났어요~</a></td><td>1111</td><td>111</td>
			</tr>
			<tr>
				<td>520</td><td>텃밭가꾸기 팁</td><td class="subject"><a href="">좋아요~!</a></td><td>3333</td><td>333</td>
			</tr>
			<tr>
				<td>...</td><td>...</td><td class="subject"><a href="">...</a></td><td>...</td><td>...</td>
			</tr>
			<tr>
				<td>...</td><td>...</td><td class="subject"><a href="">...</a></td><td>...</td><td>...</td>
			</tr>
			<tr>
				<td>...</td><td>...</td><td class="subject"><a href="">...</a></td><td>...</td><td>...</td>
			</tr>
			<tr>
				<td>...</td><td>...</td><td class="subject"><a href="">...</a></td><td>...</td><td>...</td>
			</tr>
			<tr>
				<td>...</td><td>...</td><td class="subject"><a href="">...</a></td><td>...</td><td>...</td>
			</tr>
			<tr>
				<td>...</td><td>...</td><td class="subject"><a href="">...</a></td><td>...</td><td>...</td>
			</tr>
			<tr>
				<td>...</td><td>...</td><td class="subject"><a href="">...</a></td><td>...</td><td>...</td>
			</tr>
		</table>
	</form>
	<p align="center">＜＜   ＜   1   ＞   ＞＞
	</p>
	<p align="center">
		<select name="keyword">
			<option value=""> 제목 </option>
			<option value="1"> 내용 </option>
			<option value="2"> 제목+내용 </option>
		</select> &nbsp;&nbsp;&nbsp;
		<input type="text" size="20" name="search" />&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" value="검 색" />
	</p>
	</div>
</div>
<%@ include file="../inc_footer.jsp" %>
</body>
</html>


