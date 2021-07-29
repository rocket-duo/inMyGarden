<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후기 게시판 목록</title>
<link rel="stylesheet" type="text/css" href="/inMyGarden/css/default.css" />
<link rel="stylesheet" type="text/css" href="/inMyGarden/css/cs.css" />
</head>
<body>
<%@ include file="../inc_header.jsp" %>
<div style="margin:0 auto; width:1080px;">
<a href="#" style="padding:5px;">HOME</a> ＞
<a href="#">고객센터</a><br />
<%@ include file="../inc_cs.jsp" %>
	<div id="d_reviewBoard"><h2>후기 게시판</h2>
	<hr />
	<!-- 적립금 배너 -->
	<table border="1" cellspacing="0">
		<tr>
			<td><img src="../img/review_point.png" width="800" alt="적립금 혜택 안내 배너" /></td>
		</tr>
	</table>
	<br />
	<!-- 후기 게시판 -->
	<br />
	<form name="review_brd_frm" action="" method="post">
		<table id="t_reviewBoardBrd">
			<div>
				<select name="choice" id="reviewBoardSelect">
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
			<tr id="reviewBoardTop" align="center">
				<td width="7%">번호</td><td width="12%">상품정보</td><td width="*">제목</td><td width="12%">날짜</td><td width="12%">작성자</td><td width="7%">조회</td><td width="7%">추천</td><td width="12%">평점</td>
			</tr>
			<tr>
				<td>2021</td><td><a href="">상품명</a></td><td class="reviewBoardSub"><a href="">만족입니다~</a></td><td>****.**.**</td><td>톰 하디</td><td>5220</td><td>520</td><td>★★★★★</td>
			</tr>
			<tr>
				<td>2020</td><td><a href="">상품명</a></td><td class="reviewBoardSub"><a href="">싹이 났어요~</a></td><td>****.**.**</td><td>하정우</td><td>1111</td><td>111</td><td>★★★☆☆</td>
			</tr>
			<tr>
				<td>2019</td><td><a href="">상품명</a></td><td class="reviewBoardSub"><a href="">좋아요~!</a></td><td>****.**.**</td><td>이정재</td><td>3333</td><td>333</td><td>★★★★☆</td>
			</tr>
			<tr>
				<td>...</td><td>...</td><td class="reviewBoardSub"><a href="">...</a></td><td>...</td><td>...</td><td>...</td><td>...</td><td>...</td>
			</tr>
			<tr>
				<td>...</td><td>...</td><td class="reviewBoardSub"><a href="">...</a></td><td>...</td><td>...</td><td>...</td><td>...</td><td>...</td>
			</tr>
			<tr>
				<td>...</td><td>...</td><td class="reviewBoardSub"><a href="">...</a></td><td>...</td><td>...</td><td>...</td><td>...</td><td>...</td>
			</tr>
			<tr>
				<td>...</td><td>...</td><td class="reviewBoardSub"><a href="">...</a></td><td>...</td><td>...</td><td>...</td><td>...</td><td>...</td>
			</tr>
			<tr>
				<td>...</td><td>...</td><td class="reviewBoardSub"><a href="">...</a></td><td>...</td><td>...</td><td>...</td><td>...</td><td>...</td>
			<tr>
			</tr>
				<td>...</td><td>...</td><td class="reviewBoardSub"><a href="">...</a></td><td>...</td><td>...</td><td>...</td><td>...</td><td>...</td>
			</tr>
			<tr>
				<td>...</td><td>...</td><td class="reviewBoardSub"><a href="">...</a></td><td>...</td><td>...</td><td>...</td><td>...</td><td>...</td>
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


