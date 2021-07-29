<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc_header.jsp" %>
<%
//식물 프론트 ppt p.43 마이페이지 본문 부분
if (loginMember == null) {
	out.println("<script>");
	out.println("alert('로그인 후 사용하실 수 있습니다.');");
	out.println("location.href='../login_form.jsp?url=member/mypage.mem';");
	out.println("</script>");
	out.close();
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의작은텃밭</title>
<style>
#wellcome_box {
	float:left;
	border-color: black;
}
#milige_box {
	width:360px;
	float:right;
	top:10px;
}
.board {
	width:610px;
	display:inline;
	float:right;
	margin-top:50px;
}
#mypage_review_box {
	float:left;
}
</style>
</head>
<body>
	<div style="width:1080px; margin:0 auto;">
	<%@ include file="inc_my_page_side_menu.jsp" %>
	<div class="innder_box1" id="wellcome_box" style="display:inline-block;">
	<h3 align="left">어서오세요! 님</h3>
		<table width="350" border="1">
		<tr align="center">
		<td><a href="">회원정보</a></td>
		<td><a href="">주소록</a></td>
		<td><a href="">구매건수</a><br/>0건</td>
		<td><a href="">적립금</a><br/>1,000원</td></tr>
		</table>
	</div>
	<div class="innder_box1" id="milige_box">
		<div style="text-align: right;">
		<h3 style="display:inline" align="left">적립금</h3>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<span class="tag_p" id="milige_box_more"><a href=""><strong>+more</strong></a></span>
		<table width="350px;" border="1" align="right">
			<tr align="left">
				<td width="50%">가용적립금</td><td width="*">&nbsp;1,000원</td>
			</tr>
			<tr align="left">
				<td>사용적립금</td><td>&nbsp;1,000원</td>
			</tr>
			<tr align="left">
				<td>총적립금</td><td>&nbsp;2,000원</td>
			</tr>
		</table>
		</div>
	</div>
	<div class="board" id="mypage_review_box" style="width:800px; text-align:center;">
		<h3 align="left">나의 상품 후기</h3>
		<span style="float:right"><a href=""><strong>+more</strong></a></span>
		<table width="800px">
			<tr><th width="5%">번호</th><th width="*">제목</th><th width="30%">주문번호</th><th width="20%">별점</th></tr>
			<tr><td>5</td><td>싹이 나길 기다립니다.</td><td>20210523-02001</td><td>★★★★★</td></tr>
			<tr><td>4</td><td>싹이 나길 기다립니다.</td><td>20210523-02001</td><td>★★★★☆</td></tr>
			<tr><td>3</td><td>싹이 나길 기다립니다.</td><td>20210523-02001</td><td>★★★☆☆</td></tr>
			<tr><td>2</td><td>싹이 나길 기다립니다.</td><td>20210523-02001</td><td>★★☆☆☆</td></tr>
		</table>
	</div>
	<div class="board" id="mypage_request_box">
		<h3 style="display:inline" align="left">나의 상품 문의</h3>
		<span style="float:right"><a href=""><strong>+more</strong></a></span>
		<table width="800px">
			<tr><th width="5%">번호</th><th width="*">제목</th><th width="30%">작성일</th><th width="20%">상태</th></tr>
			<tr><td>5</td><td>문의드립니다.</td><td>21-05-23</td><td>답변 완료</td></tr>
			<tr><td>4</td><td>문의드립니다.</td><td>21-05-23</td><td>답변 완료</td></tr>
			<tr><td>3</td><td>문의드립니다.</td><td>21-05-23</td><td>답변 완료</td></tr>
			<tr><td>2</td><td>문의드립니다.</td><td>21-05-23</td><td>답변 완료</td></tr>
		</table>
	</div>
	<div class="board" id="mypage_oneone_box">
		<h3 style="display:inline" align="left">나의 1:1 문의</h3>
		<span style="float:right"><a href=""><strong>+more</strong></a></span>
		<table width="600px">
			<tr><th width="5%">번호</th><th width="30%">분류</th><th width="*">제목</th><th width="20%">상태</th></tr>
			<tr><td>5</td><td><a href="">배송 문의</a></td><td>문의드립니다</td><td>답변 대기</td></tr>
			<tr><td>4</td><td>개인 정보 문의</td><td>문의드립니다</td><td>답변 완료</td></tr>
			<tr><td>3</td><td>문의 종류</td><td>문의드립니다</td><td>답변 완료</td></tr>
			<tr><td>2</td><td>문의 종류</td><td>문의드립니다</td><td>답변 완료</td></tr>
		</table>
	</div>
</div>
</body>
<%@ include file="../../inc_footer.jsp" %>
</html>