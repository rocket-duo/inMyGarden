<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후기 글 작성 페이지</title>
<link rel="stylesheet" type="text/css" href="/inMyGarden/css/default.css" />
<link rel="stylesheet" type="text/css" href="/inMyGarden/css/cs.css" />
</head>
<body>
<%@ include file="../inc_header.jsp" %>
<div style="margin:0 auto; width:1080px;">
<a href="#" style="padding:5px;">HOME</a> ＞
<a href="#">커뮤니티</a><br />
<%@ include file="../inc_cs.jsp" %>
	<div id="d_reviewForm"><h2>후기 게시판</h2>
	<hr />
	<form name="review_frm" action="" method="post">
		<table>
			<tr>
				<td width="100" height="120" bgcolor="lightgray" style="text-align:center;">No image</td>
				<td>&nbsp;&nbsp;&nbsp;<input type="button" value="상품정보선택＞" /></td>
			</tr>
		</table>
	<hr />
	<table>
		<tr>
			<th>제목</th>
			<td>&nbsp;&nbsp;&nbsp;<input type="text" placeholder="제목을 입력하세요." style="height:20px;" /></td>
		</tr>
	</table>
	<hr/>
	<table align="center" id="reviewFormStar">
		<tr>
			<th>평점</th>
			<td style="height:25px;">&nbsp;
				<input type="radio" name="star" checked="checked" />★★★★★
				<input type="radio" name="star" />★★★★
				<input type="radio" name="star" />★★★
				<input type="radio" name="star" />★★
				<input type="radio" name="star" />★
			</td>
		</tr>
	</table>
	<table height="400" id="t_reviewFormContent">
	<tr>
		<th height="20" style="border-bottom:1px solid black; padding:10px;" align="left">문단 및 글꼴 등</th>
		<!-- 문단 및 글꼴 등 디자인 항목(추후 선생님 파일 참고) -->
	</tr>
		<tr height="400" valign="top">
			<td><textarea id="reviewFormContent"></textarea>
			</td>
		</tr>
	</table>
	<table id="reviewFormFile">
		<tr>
			<th>첨부파일</th>
			<td>&nbsp;&nbsp;
				<input type="text" style="height:25px;" />
				<input type="file" style="width:75px;" />
				<input type="button" value="+ 추가" class="reviewFormBtn" />
			</td>
		</tr>
	</table>
	<hr />
	<table>
		<tr>
			<td align="right">
			<input type="submit" value="등록" class="reviewFormBtn" />
			<input type="button" value="취소" class="reviewFormBtn" />
			</td>
		</tr>
	</table>
	</form>
	</div>
</div>
<%@ include file="../inc_footer.jsp" %>
</body>
</html>
