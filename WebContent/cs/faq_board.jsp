<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAQ 목록</title>
<link rel="stylesheet" type="text/css" href="/inMyGarden/css/default.css" />
<link rel="stylesheet" type="text/css" href="/inMyGarden/css/cs.css" />
</head>
<body>
<%@ include file="../inc_header.jsp" %>
<div style="margin:0 auto; width:1080px;">
<a href="#" style="padding:5px;">HOME</a> ＞
<a href="#">고객센터</a><br />
<%@ include file="../inc_cs.jsp" %>
	<!-- FAQ 게시판 목록 -->
	<div id="d_faqBoard">
		<form name="faq_brd_frm" action="" method="get" id="faqBoardFrm">
			<div id="d_boardTop">
				<div style="width:480px; font-size:20px;">자주 묻는 질문 검색<br />
					<div style="padding-top:5px;">
						<input type="text" placeholder="검색어를 입력하세요." size="35" />
						<input type="button" value="검색" id="faqBoardschBtn" />
					</div>
				</div>
				<div style="border-left:1px solid lightgray">
					<div style="padding-left:30px;">찾으시는 질문이 없다면?<br />
						<input type="button" value="1:1 문의하기" style="margin-top:10px;" />
					</div>
				</div>
			</div>
			<h2>FAQ</h2>
			<hr />
			<table width="600" cellspacing="0">
				<tr>
					<th><a href="#">전체</a></th>
					<th><a href="#">회원가입/정보</a></th>
					<th><a href="#">결제/배송</a></th>
					<th><a href="#">교환/반품/취소</a></th>
					<th><a href="#">적립금/혜택</a><th>
					<th><a href="#">상품/기타</a></th>
				</tr>
			</table>
			<br />
			<table width="790" border="1" cellpadding="5" cellspacing="0" id="t_faqBoardBrd">
				<tr style="font-weight:bold; background:lightgray;">
					<td width="15%">번호</td><td width="25%">분류</td><td width="*">내용</td>
				</tr>
				<tr>
					<td>100</td><td>회원가입/정보</td><td class="sub"><a href="#">회원가입/정보 관련...</a></td>
				</tr>
				<tr>
					<td>99</td><td>결제/배송</td><td class="sub"><a href="#">결제/배송 관련...</a></td>
				</tr>
				<tr>
					<td>98</td><td>교환/반품/취소</td><td class="sub"><a href="#">교환/반품/취소 관련...</a></td>
				</tr>
				<tr>
					<td>97</td><td>적립금/혜택</td><td class="sub"><a href="#">적립금/혜택 관련...</a></td>
				</tr>
				<tr>
					<td>96</td><td>상품/기타</td><td class="sub"><a href="#">상품/기타 관련...</a></td>
				</tr>
				<tr>
					<td>95</td><td>...</td><td class="sub">...</td>
				</tr>
				<tr>
					<td>94</td><td>...</td><td class="sub">...</td>
				</tr>
				<tr>
					<td>93</td><td>...</td><td class="sub">...</td>
				</tr>
				<tr>
					<td>92</td><td>...</td><td class="sub">...</td>
				</tr>
				<tr>
					<td>91</td><td>...</td><td class="sub">...</td>
				</tr>
			</table>
		</form>
	<!-- 페이지 번호 -->
	<p align="center">＜＜   ＜   1   ＞   ＞＞
	</p>
	</div>
</div>
<%@ include file="../inc_footer.jsp" %>
</body>
</html>
