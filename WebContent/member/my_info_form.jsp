<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc_header.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%
// 식물 프론트 ppt p.48 회원 정보 수정 부분
request.setCharacterEncoding("utf-8");
Calendar today = Calendar.getInstance();
int year = today.get(Calendar.YEAR);	// 올해 연도
int month = today.get(Calendar.MONTH) + 1;	// 현재 월
int day = today.get(Calendar.DATE);		// 오늘 일

String[] arrEmail = loginMember.getMi_email().split("@");
String[] arrPhone = loginMember.getMi_phone().split("-");

String[] arrDomain = new String[5];
arrDomain[0] = "naver.com";
arrDomain[1] = "nate.com";
arrDomain[2] = "gmail.com";
arrDomain[3] = "daum.net";
arrDomain[4] = "yahoo.com";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/default.css" />
<title>나의작은텃밭</title>
<style>
.member_info_head p{margin:0;}
th {text-align:left;}
</style>
</head>
<body>
<div id="info" style="width:1080px; margin:0 auto;">
<%@ include file="../my_page/inc_my_page_side_menu.jsp" %>
	<div class="member_info_head" style="width:800px; display:inline-block;">
		<h2>회원정보</h2><hr align="left" />
		<p>어서오세요! <%=loginMember.getMi_name() %> (<%=loginMember.getMi_id() %>)님</p>
		<p>오늘도 즐거운 하루 되세요!</p>
	
	<div>
		<hr/>
		<form name="frmJoin" action="update.profile" method="post">
		<input type="hidden" name="wtype" value="up" />
		<table border="0" cellpadding="1" width="700">
			<tr>
				<th width="20%">아이디</th>
				<td width="*"><%=loginMember.getMi_id() %></td>
			</tr>
			<tr>
				<th>이름</th><td><%=loginMember.getMi_name() %></td>
			</tr>
			<tr>
				<th>비밀번호</th><td><input type="password" name="old_pwd" /><span> 기존 비밀번호와 같습니다.</span></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th><td><input type="password" name="mi_pwd" /><span>비밀번호가 일치하지 않습니다.</span></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th><td><input type="password" name="mi_pwd2" /><span>비밀번호가 일치하지 않습니다.</span></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
						<input type="text" name="email1" value="<%=arrEmail[0] %>"/> @
						<select name="email2" onchange="setDomain(this.value);">
							<option value="">도메인 선택</option>
						<% for (int i = 0 ; i < arrDomain.length ; i++) { %>
							<option value="<%=arrDomain[i] %>" <% if (arrEmail[1].equals(arrDomain[i])) { %>selected="selected"<% } %>><%=arrDomain[i] %></option>
						<% } %>
							<option value="direct">직접 입력</option>
						</select>
						<input type="text" name="email3" value="<%=arrEmail[1] %>" />
					<br/>
					<span style="font-size: 12px;">※.아이디 및 비밀번호 찾기에 활동 되므로 정확하게 입력해주세요.</span>
					<br/><span style="font-size: 14px;">(선택) 정보/이벤트 메일 수신을 동의합니다.</span>
					<input type="radio" name="mi_ismail" value="y"<% if (loginMember.getMi_ismail().equals("y")) { %> checked="checked"<% } %> />동의
					<input type="radio" name="mi_ismail" value="n"<% if (loginMember.getMi_ismail().equals("n")) { %> checked="checked"<% } %> />비동의
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
	<select name="p1">
		<option value="010" <% if (arrPhone[0].equals("010")) { %>selected="selected"<% } %>>010</option>
		<option value="011" <% if (arrPhone[0].equals("011")) { %>selected="selected"<% } %>>011</option>
		<option value="016" <% if (arrPhone[0].equals("016")) { %>selected="selected"<% } %>>016</option>
		<option value="019" <% if (arrPhone[0].equals("019")) { %>selected="selected"<% } %>>019</option>
	</select> -
	<input type="text" name="p2" size="4" maxlength="4" value="<%=arrPhone[1] %>" /> -
	<input type="text" name="p3" size="4" maxlength="4" value="<%=arrPhone[2] %>" />
					<br/><span style="font-size: 12px;">※.주문, 결제, 배송 중에 안내를 받기 위해 활용되므로 정확하게 입력해주세요.</span>
					<br/><span>(선택) 정보/이벤트 SMS 수신을 동의합니다.</span>
					<input type="radio" name="mi_issns" value="y"<% if (loginMember.getMi_issns().equals("y")) { %> checked="checked"<% } %> />동의
					<input type="radio" name="mi_issns" value="n"<% if (loginMember.getMi_issns().equals("n")) { %> checked="checked"<% } %> />비동의
					<br/>
				</td>
			</tr>
		</table>
		<p>부가정보</p><hr/>
		<table border="0" cellpadding="5" width="700">
			<tr>
				<th width="20%">성별</th>
				<td>
					<input type="text" name="gender" disabled="disabled" value="<%=loginMember.getMi_gender().equals("f") ? "여자" : "남자" %>"/>
				</td>
			</tr>
			<tr>
				<th width="*">생년월일</th>
				<td>
					<input type="text" style="width:50px" name="birth_y" disabled="disabled" value="<%=loginMember.getMi_birth()%>%>년"/>
					<input type="text" style="width:50px" name="birth_m" disabled="disabled" value="<%=loginMember.getMi_birth()%>월"/>
					<input type="text" style="width:50px" name="birth_d" disabled="disabled" value="<%=loginMember.getMi_birth()%>일"/>
				</td>
			</tr>
			<tr>
				<th>
					<span>나의주요덧밭</span>
				</th>
				<td>
					<input type="text" name="my_garden_type" value="<%=loginMember.getMi_garden() %>"/>
					<select>
						<option>직접입력</option>
						<option>베란다</option>
						<option>소형화분</option>
						<option>가족농장</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					<span>환불계좌</span>
				</th>
				<td>
					<input type="text" name="my_refund" value="<%=loginMember.getMi_account() %>"/>
					<select>
						<option>SC제일은행</option>
						<option>신한은행</option>
						<option>KB은행</option>
						<option>기업은행</option>
					</select>
				</td>
			</tr>
		</table>
		<br /><br />
			<div style="width:800px; text-align:center; margin:0 auto;">
				<input type="reset" value="이전" style="width:50px;"/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" value="정보 수정" />
			</div>
			<br />
			</div>
	</form>
	</div>
</div>
</body>
<%@ include file="../../inc_footer.jsp" %>
</html>