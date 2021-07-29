<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1:1 문의하기 상세 화면</title>
<link rel="stylesheet" type="text/css" href="/inMyGarden/css/default.css" />
<link rel="stylesheet" type="text/css" href="/inMyGarden/css/cs.css" />
</head>
<body>
<%@ include file="../inc_header.jsp" %>
<div style="margin:0 auto; width:1080px;">
<a href="#" style="padding:5px;">HOME</a> ＞
<a href="#">고객센터</a><br />
<%@ include file="../inc_cs.jsp" %>
	<div id="d_qnaDetail"><h2>1:1 문의</h2>
	<hr />
		<form name="review_frm" action="" method="post">
			<!-- 분류 선택 및 제목 등 작성 -->
			<table align="center">
				<tr>
					<th>분류</th>
					<td style="height:25px;">&nbsp;&nbsp;
						<select style="height:25px;">
							<option>문의내용</option>
							<option>회원/정보관리</option>
							<option>주문/결제</option>
							<option>배송</option>
							<option>반품/환불/교환</option>
							<option>영수증/증빙서류</option>
							<option>상품/이벤트</option>
							<option>기타</option>
						</select>
					</td>
				</tr>
			</table>
			<hr/>
			<table align="center" id="sub">
				<tr>
					<th>제목</th>
					<td>&nbsp;&nbsp;&nbsp;<input type="text" placeholder="제목을 입력하세요." size="50" style="height:20px;" /></td>
				</tr>
			</table>
			<hr/>
			<table align="center" id="mail">
				<tr>
					<th>이메일</th>
					<td>&nbsp;&nbsp;&nbsp;<input type="email" style="height:20px;" readonly="readonly" value="회원 이메일" /> @ 
					<input type="email" style="height:20px;" readonly="readonly" value="회원 이메일" />
					</td>
				</tr>
			</table>
			<table height="400" align="center" id="qnaDetailContent" style="margin:5px 0 5px 0;">
			<tr>
				<th height="20" style="border-bottom:1px solid black; padding:10px;" align="left">문단 및 글꼴 등</th>
			<!-- 본문 내용 작성 및 글꼴 등 디자인 항목(추후 선생님 파일 참고) -->
			</tr>
				<tr height="400" valign="top">
					<td><textarea style="width:755px; height:350px; resize:none; border:0px; padding:20px;"></textarea>
					</td>
				</tr>
			</table>
			<table align="center" id="t_qnaDetailFile">
				<tr>
					<th>첨부파일</th>
					<td>&nbsp;&nbsp;
						<input type="text" style="height:25px;" />
						<input type="file" style="width:75px;" />
						<input type="button" value="+ 추가" class="qnaDetailBtn" />
					</td>
				</tr>
			</table>
			<hr />
			<table align="center">
				<tr>
					<td align="right">
					<input type="submit" value="수정" class="qnaDetailBtn" />
					<input type="button" value="삭제" class="qnaDetailBtn" />
					<input type="button" value="목록" class="qnaDetailBtn" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
<%@ include file="../inc_footer.jsp" %>
</body>
</html>
