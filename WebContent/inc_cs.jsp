<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>카테고리 선택</title>
<style>
#inc_cs { display:inline-block; width:280px; height:1000px; float:left; }
#inc_cs table { width:230px; padding-top:30px; table-layout:fixed; }
#inc_cs .cata { font-weight:bold; }
#inc_cs .info_num { color:#00aa00; font-size:16px; font-weight:normal; }
#inc_cs p { font-size:12px; padding-left:10px; }
</style>
</head>
<body>
<div style="width:280px;" id="inc_cs">
	<form name="cs_cata_frm" action="" method="post">
<!-- 커뮤니티 -->
		<table height="120" cellpadding="5">
			<tr>
				<td width="50" class="cata" style="padding-bottom:10px;">커뮤니티</td>
			</tr>
			<tr>
				<td style="border-top:1px solid lightgray; padding-top:10px;"><a href="review_board.jsp">후기 게시판</a></td>
			</tr>
			<tr>
				<td><a href="tip_board.jsp">팁 게시판</a></td>
			</tr>
		</table>
<br />
<!-- 고객센터 -->
		<table height="160" cellpadding="5">
			<tr>
				<td class="cata" style="padding-bottom:10px;">고객센터</td>
			</tr>
			<tr>
				<td style="border-top:1px solid lightgray; padding-top:10px;"><a href="faq_board.jsp">FAQ</a></td>
			</tr>
			<tr>
				<td><a href="notice_board.jsp">공지사항</a></td>
			</tr>
			<tr>
				<td><a href="qna_board.jsp">1:1 문의하기</a></td>
			</tr>
		</table>
<br /><br /><br />
<!-- 고객센터 안내 -->
		<table>
			<tr>
				<td class="cata">CS CENTER</td>
			</tr>
			<tr>
				<td><strong class="info_num">02-1234-5678</strong></td>
			</tr>
			</table>
			<p>inMyGarden@garden.com</p>
			<p>	평일 AM 9:00 - PM 6:00<br />
				점심시간 PM 12:00 - PM 1:00<br />
				토.일요일.공휴일 휴무</p>
			<p>시간 외 상담은 게시판을 이용해주세요.</p>
<br />
<!-- 계좌 안내 -->
		<table>
			<tr>
				<td class="cata">BANK INFO</td>
			</tr>
		</table>
			<p>	텃밭은행 &nbsp;<strong class="info_num">1111-123-123456</strong><br />
				텃밭협동조합 &nbsp;<strong class="info_num">222-123-123456</strong>
			</p>
			<p>예금주 : 나의작은텃밭</p>
	</form>
</div>
</body>
</html>
