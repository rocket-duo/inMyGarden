<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc_header.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%
MemberInfo loginInfo = (MemberInfo)session.getAttribute("loginInfo");
if (loginInfo != null) {
%>
<script>
	alert("잘못된 경로로 들어오셨습니다.");
	history.back();
</script>
<%
	out.close();	// 파일 실행을 강제로 종료시킴
}
request.setCharacterEncoding("utf-8");
Calendar today = Calendar.getInstance();
int year = today.get(Calendar.YEAR);	// 올해 연도
int month = today.get(Calendar.MONTH) + 1;	// 현재 월
int day = today.get(Calendar.DATE);		// 오늘 일

String[] arrDomain = new String[5];
arrDomain[0] = "naver.com";
arrDomain[1] = "nate.com";
arrDomain[2] = "gmail.com";
arrDomain[3] = "daum.net";
arrDomain[4] = "yahoo.com";

String[] arrGarden = new String[5];
arrGarden[0] = "베란다";
arrGarden[1] = "작은 화분";
arrGarden[2] = "개인 정원";
arrGarden[3] = "대여 텃밭";
arrGarden[4] = "가족 텃밭";

String[] arrAccount = new String[9];
arrAccount[0] = "SC제일은행";
arrAccount[1] = "KB국민은행";
arrAccount[2] = "IBK기업은행";
arrAccount[3] = "NH농협은행";
arrAccount[4] = "신한은행";
arrAccount[5] = "우리은행";
arrAccount[6] = "하나은행";
arrAccount[7] = "우체국";
arrAccount[8] = "새마을금고";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="../jsjq/jquery-3.6.0.js"></script>
<script>
function setDomain(){
	if(document.frmJoin.email2.options[document.frmJoin.email2.selectedIndex].value == ''){
		 document.frmJoin.email3.disabled = true;
		 document.frmJoin.email3.value = "";
		}
		if(document.frmJoin.email2.options[document.frmJoin.email2.selectedIndex].value == 'direct'){
		 document.frmJoin.email3.disabled = false;
		 document.frmJoin.email3.value = "";
		 document.frmJoin.email3.focus();
		} else{
		 document.frmJoin.email3.disabled = true;
		 document.frmJoin.email3.value = document.frmJoin.email2.options[document.frmJoin.email2.selectedIndex].value;
		}
}
function setGarden(){
	if(document.frmJoin.g1.options[document.frmJoin.g1.selectedIndex].value == ''){
		 document.frmJoin.user_garden.disabled = true;
		 document.frmJoin.user_garden.value = "";
		}
		if(document.frmJoin.g1.options[document.frmJoin.g1.selectedIndex].value == 'direct'){
		 document.frmJoin.user_garden.disabled = false;
		 document.frmJoin.user_garden.value = "";
		 document.frmJoin.user_garden.focus();
		} else{
		 document.frmJoin.user_garden.disabled = true;
		 document.frmJoin.user_garden.value = document.frmJoin.g1.options[document.frmJoin.g1.selectedIndex].value;
		}
}
function setAccount(){
	if(document.frmJoin.a1.options[document.frmJoin.a1.selectedIndex].value == ''){
		document.frmJoin.user_rebank.disabled = true;
		document.frmJoin.user_rebank.value = "";
	}
	if(document.frmJoin.a1.options[document.frmJoin.a1.selectedIndex].value == 'direct'){
		document.frmJoin.user_rebank.disabled = false;
		document.frmJoin.user_rebank.value = "";
		document.frmJoin.user_rebank.focus();
	} else{
	 document.frmJoin.user_rebank.disabled = true;
	 document.frmJoin.user_rebank.value = document.frmJoin.a1.options[document.frmJoin.a1.selectedIndex].value;
	}
}
</script>
<link rel="stylesheet" type="text/css" href="../css/join_form.css" />
<title>나의작은텃밭</title>
</head>
<body>
<div class="join_frm_body">
	<form name="frmJoin" action="insert.profile" method="post" onsubmit="return chkValue(this);">
	<p>회원종류</p><hr/>
		<div align="center">
		<input type="radio" name="mi_business" value="a" checked="checked" />개인 회원
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio" name="mi_business" value="b" />사업자 회원
		</div>
	<span>회원정보</span>
	<span style="font-size: 10px; color: blue;">* 필수 입력 항목</span>
	<hr/>
		<table border="0" cellpadding="1" width="700">
		<tr>
		<th width="20%"><span id=blue_mark>*</span>아이디</th>
		<td width="*"><input type="text" name="user_id" onkeyup="chkDupID(this.value);"/> <span id="idMsg" style="font-size:80%">아이디는 4~20자의 영문 및 숫자 조합으로 입력하세요.</span></td>
		</tr>
		<tr><th><span id=blue_mark>*</span>비밀번호</th><td><input type="password" name="user_pwd" /> <span>비밀번호는 6자 이상 15자 이하로 설정해 주세요.</span></td></tr>
		<tr><th><span id=blue_mark>*</span>비밀번호 확인</th><td><input type="password" name="user_pwd2" /> <span>비밀번호가 일치하지 않습니다.</span></td></tr>
		<tr><th><span id=blue_mark>*</span>이름</th><td><input type="text" name="user_name" /></td></tr>
		<tr>
		<th><span id=blue_mark>*</span>성별</th>
		<td>
			<input type="radio" name="user_gender" value="m" />남
			<input type="radio" name="user_gender" value="f" checked="checked" />여
		</td>
		</tr>
		<tr>
		<th><span id=blue_mark>*</span>생년월일</th>
		<td>
			<select name="birth_year">
		<% for (int i = 1950 ; i <= year ; i++) { %>
				<option value="<%=i%>" <% if(i == year) { %>selected="selected"<% } %>><%=i%></option>
		<% } %>
			</select>년
			<select name="birth_month">
		<% for (int i = 1 ; i <= 12 ; i++) { %>
				<option value="<%=i%>" <% if(i == month) { %>selected="selected"<% } %>><%=i%></option>
		<% } %>
			</select>월
			<select name="birth_day">
		<% for (int i = 1 ; i <= 31 ; i++) { %>
				<option value="<%=i%>" <% if(i == day) { %>selected="selected"<% } %>><%=i%></option>
		<% } %>
			</select>일
		</td>
		</tr>
		<tr>
		<th><span id=blue_mark>*</span>이메일</th>
		<td>
			<input type="text" name="email1" style="width:80px"/> @
			<select name="email2" onchange="setDomain(this.value);">
				<option value="">도메인 선택</option>
		<% for (int i = 0 ; i < arrDomain.length ; i++) { %>
				<option value="<%=arrDomain[i] %>"><%=arrDomain[i] %></option>
		<% } %>
				<option value="direct">직접 입력</option>
			</select>
			<input type="text" name="email3" disabled style="width:100px"/>
			<br/>
			<span style="font-size:10px;">※.아이디 비밀번호 찾기에 활용 되므로 정확하게 입력해 주세요.</span>
			<br/>
			<span>(선택) 정보/이벤트 메일 수신에 동의합니다.</span><br />
			<input type="radio" name="user_ismail" value="y" checked="checked" />동의 함
			<input type="radio" name="user_ismail" value="n" />동의 안함
		</td>
		</tr>
		<tr>
		<th><span id=blue_mark>*</span>전화번호</th>
		<td>
			<select name="phone1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="019">019</option>
			</select> -
			<input type="text" name="phone2" size="4" maxlength="4" /> -
			<input type="text" name="phone3" size="4" maxlength="4" />
			<br/>
			<span style="font-size:10px;">※.주문, 결제 배송 등의 안내를 받기 위해 활용 되므로 정확하게 입력해 주세요.</span>
			<br/>
			<span>(선택) 정보/이벤트 SNS 수신에 동의합니다.</span><br />
			<input type="radio" name="user_issns" value="y" checked="checked" />동의 함
			<input type="radio" name="user_issns" value="n" />동의 안함
		</td>
		</tr>
		</table>
	<p>부가정보</p>
	<hr/>
		<table border="0" cellpadding="1" width="700">
		<tr>
		<th width="20%">나의 주요 텃밭</th>
		<td width="*">
			<input type="text" size="30" name="user_garden" disabled/>
			<select name="g1" onchange="setGarden(this.value);">
				<option value="">나의 텃밭 선택</option>
					<% for (int i = 0 ; i < arrGarden.length ; i++) { %>
				<option value="<%=arrGarden[i] %>"><%=arrGarden[i] %></option>
					<% } %>
				<option value="direct">직접 입력</option>
			</select>
		</td>
		</tr>
		<tr>
			<th>환불 계좌</th>
			<td>
				<input type="text" size="12" name="user_account" placeholder="계좌 번호"/>
				<input type="text" size="12" name="user_rebank" disabled />
				<select name="a1" onchange="setAccount(this.value);">
					<option value="">환불 은행 선택</option>
						<% for (int i = 0 ; i < arrAccount.length ; i++) { %>
					<option value="<%=arrAccount[i] %>"><%=arrAccount[i] %></option>
						<% } %>
					<option value="direct">직접 입력</option>
				</select>
			</td>
		</tr>
		</table>
		<br />
			<span>(필수) 개인정보 수정 및 이용 약관</span>
			<input type="radio" name="user_agree" value="y" checked="checked" />동의 함
			<input type="radio" name="user_agree" value="n" />동의 안함<br /><br />
	<p style="width:700px; text-align:center;">
		<input type="reset" value="이전" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" value="동의&가입"/>
	</p>
	</form>
	<div class="agreementBox">
		<input type="image" id="image" alt="Login" src="../img/iconmonstr-x-mark-1-240.png" width="30px;" />
		<div>사이트 이용 약관 및 개인정보 수집 및 이용 약관</div>
			<div>개인정보 수집 및 이용</div>
				<div class="agreement" style="width:700px; height:500px; overflow:auto;" >
					<p> <p class="ls2 lh6 bs5 ts4"><em class="emphasis"><나의작은텃밭>('www.inmygarden.com'이하 'inmygarden')</em>은(는) 「개인정보 보호법」 제30조에 따라 정부주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리방침을 수립·공개합니다.</p><p class="ls2">○ 이 개인정보처리방침은 <em class="emphasis">2021</em>년 <em class="emphasis">7</em>월 <em class="emphasis">15</em>부터 적용됩니다.</p></br><p class='lh6 bs4'><strong>제1조(개인정보의 처리 목적)<br/><br/><em class="emphasis"><나의작은텃밭>('www.inmygarden.com'이하  'inmygarden')</em>은(는) 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며 이용 목적이 변경되는 겨우에는 「개인정보 보호법」 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.</strong></p><ul class="list_indent2 mgt10"><p class="ls2">1. 홈페이지 회원가입 및 관리</p><p class="ls2">회원 가입의사 확인, 회원자격 유지·관리, 서비스 부정이용 방지 목적으로 개인정보를 처리합니다.</p></br><p class="ls2">2. 재화 또는 서비스 제공</p><p class="ls2">물품배송, 서비스 제공, 맞춤서비스 제공, 요금결제·정산을 목적으로 개인정보를 처리합니다.</p></br><p class="ls2">3. 마케팅 및 광고에의 활용</p><p class="ls2">신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회 제공  등을 목적으로 개인정보를 처리합니다.</p></br></ul></br></br><p class='lh6 bs4'><strong>제2조(개인정보의 처리 및 보유 기간)</strong></br></br>① <em class="emphasis"><나의작은텃밭></em>은(는) 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의받은 개인정보 보유·이용기간 내에서 개인정보를 처리·보유합니다.</br></br>② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.</p><ul class='list_indent2 mgt10'><li class='tt'>1.<홈페이지 회원가입 및 관리></li><li class='tt'><홈페이지 회원가입 및 관리>와 관련한 개인정보는 수집.이용에 관한 동의일로부터<1년>까지 위 이용목적을 위하여 보유.이용됩니다.</li><li>보유근거 : 법규</li><li>관련법령 : 1)신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년</br>2) 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년</br>3) 대금결제 및 재화 등의 공급에 관한 기록 : 5년</br>4) 계약 또는 청약철회 등에 관한 기록 : 5년</br>5) 표시/광고에 관한 기록 : 6개월</br></li><li>예외사유 : 고객의 요청 시</li></ul><br/><br/><p class="lh6 bs4"><strong>제3조(정보주체와 법정대리인의 권리·의무 및 그 행사방법)</strong></p><p class="ls2"><br/><br/>① 정보주체는 나의작은텃밭에 대해 언제든지 개인정보 열람·정정·삭제·처리정지 요구 등의 권리를 행사할 수 있습니다.</p><p class='sub_p'>② 제1항에 따른 권리 행사는나의작은텃밭에 대해 「개인정보 보호법」 시행령 제41조제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 나의작은텃밭은(는) 이에 대해 지체 없이 조치하겠습니다.</p><p class='sub_p'>③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다.이 경우 “개인정보 처리 방법에 관한 고시(제2020-7호)” 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.</p><p class='sub_p'>④ 개인정보 열람 및 처리정지 요구는  「개인정보 보호법」  제35조 제4항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.</p><p class='sub_p'>⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.</p><p class='sub_p'>⑥ 나의작은텃밭은(는) 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.</p></br></br><p class='lh6 bs4'><strong>제4조(처리하는 개인정보의 항목 작성) </strong></br></br> ① <em class="emphasis"><나의작은텃밭></em>은(는) 다음의 개인정보 항목을 처리하고 있습니다.</p><ul class='list_indent2 mgt10'><li class='tt'>1< 홈페이지 회원가입 및 관리 ></li><li>필수항목 : 이메일, 휴대전화번호, 비밀번호, 로그인ID</li><li>선택항목 : 자택주소, 성별, 생년월일</li></ul><ul class='list_indent2 mgt10'><li class='tt'>2< 제화 또는 서비스 제공 ></li><li>필수항목 : 이메일, 휴대전화번호, 자택주소, 로그인ID, 이름</li><li>선택항목 : 신용카드정보, 은행계좌정보</li></ul></br></br><p class='lh6 bs4'><strong>제5조(개인정보의 파기)<em class="emphasis"></strong></p><p class='ls2'></br>① <나의작은텃밭> 은(는) 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.</br></br>② 정보주체로부터 동의받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다.</br>1. 법령 근거 :</br>2. 보존하는 개인정보 항목 : 계좌정보, 거래날짜</br></br>③ 개인정보 파기의 절차 및 방법은 다음과 같습니다.</br>1. 파기절차</br> <나의작은텃밭> 은(는) 파기 사유가 발생한 개인정보를 선정하고, <나의작은텃밭> 의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.</br></p><p class='sub_p mgt10'></p></br></br><p class='lh6 bs4'><strong>제6조(개인정보의 안전성 확보 조치)<em class="emphasis"></br></br><나의작은텃밭></em>은(는) 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다.</strong></p><p class='sub_p mgt10'>1. 정기적인 자체 감사 실시</br> 개인정보 취급 관련 안정성 확보를 위해 정기적(분기 1회)으로 자체 감사를 실시하고 있습니다.</br></br>2. 개인정보 취급 직원의 최소화 및 교육</br> 개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.</br></br>3. 해킹 등에 대비한 기술적 대책</br> <<em class="emphasis">나의작은텃밭</em>>('<em class="emphasis">inmygarden</em>')은 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신·점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다.</br></br>4. 접속기록의 보관 및 위변조 방지</br> 개인정보처리시스템에 접속한 기록을 최소 6개월 이상 보관, 관리하고 있으며, 접속 기록이 위변조 및 도난, 분실되지 않도록 보안기능 사용하고 있습니다.</br></br>5. 개인정보에 대한 접근 제한</br> 개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.</br></br>6. 문서보안을 위한 잠금장치 사용</br> 개인정보가 포함된 서류, 보조저장매체 등을 잠금장치가 있는 안전한 장소에 보관하고 있습니다.</br></br>7. 비인가자에 대한 출입 통제</br> 개인정보를 보관하고 있는 물리적 보관 장소를 별도로 두고 이에 대해 출입통제 절차를 수립, 운영하고 있습니다.</br></br></p></br></br><p class="lh6 bs4"><strong>제7조(개인정보 자동 수집 장치의 설치•운영 및 거부에 관한 사항)</strong></p><p class="ls2"><br/><br/>나의작은텃밭 은(는) 정보주체의 이용정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를 사용하지 않습니다.<p class='sub_p mgt30'><strong>제8조 (개인정보 보호책임자) </strong></p><p class='sub_p mgt10'> ①  <span class='colorLightBlue'>나의작은텃밭</span> 은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.</p><ul class='list_indent2 mgt10'><li class='tt'>▶ 개인정보 보호책임자 </li><li>성명 :강태훈</li><li>직책 :대리</li><li>직급 :관리자</li><li>연락처 :000000, 000, 00000</li></ul><p class='sub_p'>※ 개인정보 보호 담당부서로 연결됩니다.<p/> <ul class='list_indent2 mgt10'><li class='tt'>▶ 개인정보 보호 담당부서</li><li>부서명 :관리부</li><li>담당자 :박창주</li><li>연락처 :00, 00, 000</li></ul><p class='sub_p'>② 정보주체께서는 나의작은텃밭 의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 나의작은텃밭 은(는) 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.</p><p class='sub_p mgt30'><strong>제9조(개인정보 열람청구)</br> 정보주체는 ｢개인정보 보호법｣ 제35조에 따른 개인정보의 열람 청구를 아래의 부서에 할 수 있습니다.<br/><나의작은텃밭></span>은(는) 정보주체의 개인정보 열람청구가 신속하게 처리되도록 노력하겠습니다. </strong></p><ul class='list_indent2 mgt10'><li class='tt'>▶ 개인정보 열람청구 접수·처리 부서 </li><li>부서명 : 관리부</li><li>담당자 : 배준호</li><li>연락처 : 00000, 00000, 00000</li></ul></br></br><p class='lh6 bs4'><strong>제10조(권익침해 구제방법)<em class="emphasis"></em></strong></p><br/><br/>정보주체는 개인정보침해로 인한 구제를 받기 위하여 개인정보분쟁조정위원회, 한국인터넷진흥원 개인정보침해신고센터 등에 분쟁해결이나 상담 등을 신청할 수 있습니다. 이 밖에 기타 개인정보침해의 신고, 상담에 대하여는 아래의 기관에 문의하시기 바랍니다.<br/><br/>
		
		
		
		  1. 개인정보분쟁조정위원회 : (국번없이) 1833-6972 (www.kopico.go.kr)<br/>
		
		  2. 개인정보침해신고센터 : (국번없이) 118 (privacy.kisa.or.kr)<br/>
		
		  3. 대검찰청 : (국번없이) 1301 (www.spo.go.kr)<br/>
		
		  4. 경찰청 : (국번없이) 182 (cyberbureau.police.go.kr)<br/><br/>
		
		
		
		「개인정보보호법」제35조(개인정보의 열람), 제36조(개인정보의 정정·삭제), 제37조(개인정보의 처리정지 등)의 규정에 의한 요구에 대 하여 공공기관의 장이 행한 처분 또는 부작위로 인하여 권리 또는 이익의 침해를 받은 자는 행정심판법이 정하는 바에 따라 행정심판을 청구할 수 있습니다.<br/><br/>
		
		
		
		※ 행정심판에 대해 자세한 사항은 중앙행정심판위원회(www.simpan.go.kr) 홈페이지를 참고하시기 바랍니다.</br></br><p class='lh6 bs4'><strong>제11조(개인정보 처리방침 변경)<em class="emphasis"></em></strong></p><br/></p><p class='sub_p'>① 이 개인정보처리방침은 2021년 7월 15부터 적용됩니다.</p><p class='sub_p'></p><p class='sub_p'></p><p class='sub_p'>② 이전의 개인정보 처리방침은 아래에서 확인하실 수 있습니다. </p><p class='sub_p'></p><p class='sub_p'></p><p class='sub_p'>예시 ) - 20XX. X. X ~ 20XX. X. X 적용   (클릭) </p><p class='sub_p'></p><p class='sub_p'></p><p class='sub_p'>예시 ) - 20XX. X. X ~ 20XX. X. X 적용   (클릭) </p><p class='sub_p'></p><p class='sub_p'></p><p class='sub_p'>예시 ) - 20XX. X. X ~ 20XX. X. X 적용   (클릭)</p></p>
		</div>
	</div>
</div>
</body>
<%@ include file="../../inc_footer.jsp" %>
</html>
