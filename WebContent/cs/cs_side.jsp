<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>카테고리 선택</title>
<style>
table { width:280px; padding:5px; }
.cata { font-weight:bold; }
.info_num { color:00aa00; font-size:16px; font-weight:normal; }
p { font-size:13px; padding-left:10px; }
hr { background-color:red; }
</style>
</head>
<body>
<div style="width:280px;">
	<form name="cs_cata_frm" action="" method="post">
<!-- 커뮤니티 -->
		<table height="120" cellpadding="5">
			<tr>
				<td class="cata" style="padding-bottom:10px;">커뮤니티</td>
			</tr>
			<tr>
				<td style="border-top:1px solid lightgray; padding-top:10px;">후기 게시판</td>
			</tr>
			<tr>
				<td>팁 게시판</td>
			</tr>
		</table>
<br /><br />
<!-- 고객센터 -->
		<table height="160" cellpadding="5">
			<tr>
				<td class="cata" style="padding-bottom:10px;">고객센터</td>
			</tr>
			<tr>
				<td style="border-top:1px solid lightgray; padding-top:10px;">FAQ</td>
			</tr>
			<tr>
				<td>공지사항</td>
			</tr>
			<tr>
				<td>1:1 문의하기</td>
			</tr>
		</table>
<br /><br /><br />
<!-- 고객센터 안내 -->
		<table>
			<tr>
				<td class="cata">CS CENTER</td>
			</tr>
			<tr>
				<td><strong class="info_num">070-4262-3103</strong></td>
			</tr>
			</table>
			<p>wd6275@naver.com</p>
			<p>	평일 AM 10:00 - PM 5:00<br />
				점심시간 PM 12:00 - PM 1:00<br />
				토.일요일.공휴일 휴무</p>
			<p>시간 외 상담은 게시판을 이용해주세요.</p>
<br /><br />
<!-- 계좌 안내 -->
		<table>
			<tr>
				<td class="cata">BANK INFO</td>
			</tr>
		</table>
			<p>	우리은행 &nbsp;<strong class="info_num">1005-102-955176</strong><br />
				신용협동조합 &nbsp;<strong class="info_num">131-017-532586</strong>
			</p>
			<p>예금주 : 주식회사월드</p>
	</form>
</div>
</body>
</html>
