<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>팁 게시판 상세 화면</title>
<link rel="stylesheet" type="text/css" href="/inMyGarden/css/default.css" />
<link rel="stylesheet" type="text/css" href="/inMyGarden/css/cs.css" />
</head>
<body>
<%@ include file="../inc_header.jsp" %>
<div style="margin:0 auto; width:1080px;">
<a href="#" style="padding:5px;">HOME</a> ＞
<a href="#">커뮤니티</a><br />
<%@ include file="../inc_cs.jsp" %>
	<div id="d_tipDeatil"><h2>팁 게시판</h2>
	<hr />
	<!-- 팁 게시글 내용 -->
	<br />
		<form name="tip_detail_frm" action="" method="post">
			<table height="600" align="center">
				<tr>
					<th>제목</th>
					<td class="td">분갈이 하기</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td class="td">나의 작은 텃밭 관리자</td>
				</tr>
				<tr>
					<th>추천</th>
					<td class="td">111&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="추천하기" style="width:80px;" />
					&nbsp;&nbsp;&nbsp;&nbsp;
					조회수&nbsp;&nbsp;&nbsp;&nbsp;
					1111&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<tr height="450">
					<td valign="top" colspan="5" id="tipDetailContent">
					본문내용<br />
					...<br />
					...<br />
					...
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td><img src="../img/clip-240.png" width="15" class="td" />
					herb01.jpg</td>
				</tr>
			</table>
		</form>
		<div>
			<input type="button" value="목록" id="tipDetailList" />
		</div>
	<!-- 이전글 및 다음글로 이동 -->
	<br /><br /><br />
		<div>
			<table cellpadding="6">
				<tr style="border-bottom:1px solid black;">
					<td width="19%" class="tipDetailMove">
						<img src="../img/up-arrow-240.png" width="15" alt="이전글로 이동" class="tipDetailArrow" />&nbsp;&nbsp;이전글</td>
					<td>씨앗 파종 따라하기</td>
				</tr>
				<tr>
					<td class="tipDetailMove">
						<img src="../img/down-arrow-240.png" width="15" alt="다음글로 이동" class="tipDetailArrow" />&nbsp;&nbsp;다음글</td>
					<td>요리에 활용하기 좋은 허브 알아보기</td>
				</tr>
			</table>
		</div>
	</div>
</div>
<%@ include file="../inc_footer.jsp" %>
</body>
</html>


