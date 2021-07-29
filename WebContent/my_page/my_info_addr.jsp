<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc_header.jsp" %>
<%@ page import="vo.*" %>
<%
// 프론트 p.49 회원 주소 추가 및 수정 부분
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
<link rel="stylesheet" type="text/css" href="../css/default.css" />
<title>나의작은텃밭</title>
</head>
<body>
<div style="width:1080px; margin:0 auto;">
<%@ include file="inc_my_page_side_menu.jsp" %>
	<div>
		<p>회원정보</p><hr/>
		<span>어서오세요! <%=loginMember.getMi_name() %>(<%=loginMember.getMi_id() %>)님</span>
		<% if (loginMember.getMa_idx() == 0 ) { %>
		<p>현재 <%=loginMember.getMi_name() %> 회원님의 기본 주소가 없습니다.</p>
		<% } else { %>
		<p>현재 <%=loginMember.getMi_name() %> 회원님의 기본 주소는 [</p>배송지1<p>] 입니다.</p>
		<% } %>
	</div>
	<div>
		<p>배송 주소록 관리</p>
		<input type="button" name="" value="+새 배송지 추가"/>
		<hr/>
		<table>
			<tr>
				<th>배송지 이름</th>
				<th>수취인</th>
				<th>주소</th>
				<th>연락처</th>
				<th>수정/삭제</th>
			</tr>
			<tr>
				<td colspan="5">등록된 주소가 없습니다.</td>
			</tr>
			<tr>
				<td>(기본배송지)<br/>배송지1</td>
				<td>이름</td>
				<td>(12345)<br/>경기도 성남시 중원구 어쩌구<br/>야탑동 어디구 머라구 아파트 123동 567동</td>
				<td>010-1234-5678</td>
				<td>
					<input type="button" name="" value="수정"/>
					<input type="button" name="" value="삭제"/>
				</td>
			</tr>
		</table>
	</div>
	<div>
		<form name="New_addr">
		<img src="../../../img/iconmonstr-x-mark-1-240.png" width="20px;"/>
		<table>
			<tr>
				<th>배송지</th>
				<td>(배송지이름)</td>
				<th>기본주소 설정 여부</th>
				<td><input type="checkbox" name=""></td>
			</tr>
			<tr>
				<th>수취인</th>
				<td>(수취인)</td>
				<th>연락처</th>
				<td>(연락처)</td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td>(숫자5자리)</td>
				<th><input type="button" nale="" value="우편번호 찾기"/></th>
				<td></td>
			</tr>
			<tr>
				<td colspan="2">(앞주소)</td>
				<td colspan="2">(뒷주소)</td>
			</tr>
		</table>
		<input type="submit" value="수정"/>
		<input type="reset" value="다시입력"/>
		</form>
	</div>
	<div>
		<form name="Re_addr">
		<img src="../../../img/iconmonstr-x-mark-1-240.png" width="20px;"/>
		<table>
			<tr>
				<th>배송지</th>
				<td>(배송지이름)</td>
				<th>기본주소 설정 여부</th>
				<td><input type="checkbox" name=""></td>
			</tr>
			<tr>
				<th>수취인</th>
				<td>(수취인)</td>
				<th>연락처</th>
				<td>(연락처)</td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td>(숫자5자리)</td>
				<th><input type="button" nale="" value="우편번호 찾기"/></th>
				<td></td>
			</tr>
			<tr>
				<td colspan="2">(앞주소)</td>
				<td colspan="2">(뒷주소)</td>
			</tr>
		</table>
		<input type="submit" value="수정"/>
		<input type="reset" value="다시입력"/>
		</form>
		</div>
</div>
</body>
<%@ include file="../../inc_footer.jsp" %>
</html>