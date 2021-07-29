<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 문의 질문 등록 화면</title>
<link rel="stylesheet" type="text/css" href="../css/default.css" />
<style>
#d_qnaPdtForm { width:800px; float:right; margin:0 auto; }
#d_qnaPdtForm table { width:800px; align:center; }
#d_qnaPdtForm th { border-right:1px solid lightgray; width:120px; }
#t_qnaPdtFormContent { border:1px solid black; margin:5px 0 5px 0; }
#qnaPdtFormFile { padding-top:7px; }
.qnaPdtFormBtn { width:70px; }
#qnaPdtFormContent { outline:none; width:755px; height:350px; resize:none; border:0px; padding:20px; }
</style>
</head>
<body>
<%@ include file="../inc_header.jsp" %>
<div style="margin:0 auto; width:1080px;">
<!-- <a href="#" style="padding:5px;">HOME</a> ＞
<a href="#">고객센터</a><br /> -->
	<div id="d_qnaPdtForm"><h2>질문과 답변</h2>
	<hr />
		<form name="review_frm" action="" method="post">
			<!-- 분류 선택 및 제목 등 작성 -->
			<table>
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
			<table>
				<tr>
					<th>제목</th>
					<td>&nbsp;&nbsp;&nbsp;<input type="text" placeholder="제목을 입력하세요." size="50" style="height:20px;" /></td>
				</tr>
			</table>
			<hr/>
			<table>
				<tr>
					<th>작성자</th>
					<td>&nbsp;&nbsp;
						<input type="text" style="height:20px;" readonly="readonly" value="회원 아이디" />
						<input type="radio" style="margin-left:30px;" readonly="readonly" value="회원 이메일" checked="checked"/> 비밀 글
						<input type="radio" style="margin-left:20px;" readonly="readonly" value="회원 이메일" /> 공개 글
					</td>
				</tr>
			</table>
			<table height="400" id="t_qnaPdtFormContent">
			<tr>
				<th height="20" style="border-bottom:1px solid black; padding:10px;" align="left">문단 및 글꼴 등</th>
			<!-- 본문 내용 작성 및 글꼴 등 디자인 항목(추후 선생님 파일 참고) -->
			</tr>
				<tr height="400" valign="top">
					<td><textarea id="qnaPdtFormContent"></textarea>
					</td>
				</tr>
			</table>
			<table id="qnaPdtFormFile">
				<tr>
					<th>첨부파일</th>
					<td>&nbsp;&nbsp;
						<input type="text" style="height:25px;" />
						<input type="file" style="width:75px;" />
						<input type="button" value="+ 추가" class="qnaPdtFormBtn" />
					</td>
				</tr>
			</table>
			<hr />
			<table>
				<tr>
					<td align="right">
					<input type="submit" value="등록" class="qnaPdtFormBtn" />
					<input type="button" value="취소" class="qnaPdtFormBtn" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
<%@ include file="../inc_footer.jsp" %>
</body>
</html>
