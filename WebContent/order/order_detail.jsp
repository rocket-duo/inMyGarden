<%@page import="java.sql.Savepoint"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="vo.*" %>
<%@ include file="../inc_header.jsp" %>
<%
if (loginMember == null) {
	out.println("<script>");
	out.println("alert('잘못된 경로로 들어오셨습니다.');");
	out.println("history.back();");
	out.println("</script>");
	out.close();
}



String kind = request.getParameter("kind");	// 장바구니와 바로 구매의 구분자

ArrayList<CartInfo> cartList = (ArrayList<CartInfo>)request.getAttribute("cartList");
MemberInfo addrList = (MemberInfo)request.getAttribute("addrList");
ArrayList<AddrInfo> addrListInfo = (ArrayList<AddrInfo>)request.getAttribute("addrListInfo");
ProductInfo pdtInfo = (ProductInfo)request.getAttribute("pdtInfo");
String[] arrMiPhone = loginMember.getMi_phone().split("-", 3);	// 회원의 전화번호를 잘라서 배열에 담음

String[] arrEmail = loginMember.getMi_email().split("@");	// 회원의 이메일을 잘라서 배열에 담음
String[] arrDomain = new String[5];
arrDomain[0] = "naver.com";
arrDomain[1] = "nate.com";
arrDomain[2] = "gmail.com";
arrDomain[3] = "daum.net";

String miName = loginMember.getMi_name();	// 회원 정보
String maName = addrList == null ? "" : addrList.getMa_name();
String maZip =  addrList == null ? "" :addrList.getMa_zip();
String maAddr1 = addrList == null ? "" : addrList.getMa_addr1();
String maAddr2 = addrList == null ? "" : addrList.getMa_addr2();
String arrMaPhonetest = addrList == null ? "" : addrList.getMa_phone();	
String[] arrMaPhone = arrMaPhonetest.split("-", 3);	// 기본배송지 전화번호를 잘라서 배열에 담음

Calendar cal = Calendar.getInstance();

SimpleDateFormat date = new SimpleDateFormat("yyMMddHHmm");
String today = date.format(cal.getTime());


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/inMyGarden/css/default.css?ver0.1" />
<link rel="stylesheet" type="text/css" href="/inMyGarden/css/order.css?ver0.1" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="jquery-3.6.0.js"></script>
<script>history.scrollRestoration = "manual"</script>
<script>

function text(a) {
	console.log(a);
}

function chkValue(frm){
    var oiName = frm.oiName.value;   
    
    var oip1 = frm.oip1.value;      
    var oip2 = frm.oip2.value;      
    var oip3 = frm.oip3.value;
    
    var e1 = frm.e1.value;      
    var e2 = frm.e2.value;      
    var e3 = frm.e3.value;
    var maName = frm.maName.value; 
    var maZip = frm.maZip.value; 
    var maAddr1 = frm.maAddr1.value; 
    var maAddr2 = frm.maAddr2.value; 
    var p1 = frm.p1.value;      
    var p2 = frm.p2.value;      
    var p3 = frm.p3.value;
    var oiPayment = frm.oiPayment;
    var chkAgree = frm.chkAgree.checked;
    
    if (oiName == ""){
       	alert("주문자명을 입력하세요.");               frm.oiName.focus();   return false;
    }
    if (oip1 == ""){
       	alert("휴대폰 번호를 확인해주세요.");				frm.oip1.focus();     return false;
    }
    if (oip2 == "" || oip2.length < 3){
       	alert("휴대폰 번호를 확인해주세요.");				frm.oip2.focus();     return false;
    }
    if (oip3 == "" || oip3.length < 4){
       	alert("휴대폰 번호를 확인해주세요.");				frm.oip3.focus();     return false;
    }
  	if (e1 == "") {
  		alert("이메일을 입력하세요.");					frm.e1.focus();     return false;	
  	}
  	if (e2 == "") {
  		alert("도메인을 선택하세요.");					frm.e2.focus();     return false;	
  	}
  	if (e2 == "direct" && e3 == "") {
  		alert("도메인을 입력하세요.");					frm.e3.focus();     return false;	
  	}
  	if (maName == "") {
  		alert("받으실분 이름을 입력하세요.");					frm.maName.focus();     return false;	
  	}
  	if (maZip == "") {
  		alert("우편번호를 입력해주세요.");					frm.maZip.focus();     return false;	
  	}
  	if (maAddr1 == "") {
  		alert("받으실 주소를 입력해주세요.");					frm.maAddr1.focus();     return false;	
  	}
  	if (maAddr2 == "") {
  		alert("받으실 주소를 입력해주세요.");					frm.maAddr2.focus();     return false;	
  	}
  	if (p1 == "") {
  		alert("휴대폰 번호를 확인해주세요.");					frm.p1.focus();     return false;	
  	}
  	if (p2 == "" || p2.length < 3) {
  		alert("휴대폰 번호를 확인해주세요.");					frm.p2.focus();     return false;	
  	}
  	if (p3 == "" || p3.length < 4) {
  		alert("휴대폰 번호를 확인해주세요.");					frm.p3.focus();     return false;	
  	}

    
 	var isChecked = true; 
    for (var i = 0; i < oiPayment.length; i++){
       if (oiPayment[i].checked){
          isChecked = false;
          break;
       }
    }
    if (isChecked){
        alert("결제수단을 선택해주세요.");               return false;
     }   
  	if(!chkAgree) {
  		alert("구매진행에 동의해주세요.");
  		return false;
  	}
    return true;
}


function onlyNum(obj){
	//특정 컨트롤에 숫자만 입력되도록 하는 함수로 숫자가 아닌 값이 입력될 경우 값을 모두 삭제시킴
		
	if (isNaN(obj.value)){
		obj.value = "";
	} 
		
}


function onlyNumPoint(obj){
// 적립금에 숫자만입력되도록 하는 함수로 숫자가 아니면 0이 기본값으로 입력됨
	
	if (isNaN(obj.value)){
		obj.value = 0;
	} 

}

function onlyZero(obj, point, total){
	// 적립금 사용 기본값 0, 최대 사용 적립금 한도를 정하는 함수
		
	if (obj.value == ""){
		obj.value = 0;
	} else {
		obj.value = obj.value.replace(/(^0+)/, "");
		document.getElementById("totalPay").innerText = total - obj.value ;
	}
	if (obj.value > point) {
		alert ('보유 적립금을 확인해주세요');
		obj.value = 0;
		document.getElementById("totalPay").innerText = total - obj.value ;
	}
	if (obj.value > total) {
		alert('상품 금액보다 크게 입력할 수 없습니다.');
		obj.value = 0;
	}

}
function onlyTen(obj, total) {
	// 적립금 1원단위 절삭
	if (obj.value.length >= 1) {
		obj.value = Math.floor(obj.value/10) * 10; 
		document.getElementById("totalPay").innerText = total - obj.value ;
	}
	if (obj.value.length <= 3 && obj.value != 0) {
		obj.value = 0;
		alert('적립금 사용은 1,000원부터 가능합니다');
	}
}

//이메일이 잘못되었는지 확인하는 함수 

function CheckEmail(email) {   
	let email_id = /^[a-z0-9_-]{4,20}$/;
	
	if(!email_id.test(email)){
		alert('이메일을 확인해주세요!\n영문소문자, 숫자, 언더바/하이픈 허용\n4~20자리 입력가능합니다.');
		document.getElementById("e1").value = "";
	}
}               




function showE3(val){
    var obj = document.getElementById("e3");
    if (val == "direct"){
       obj.style.display = "inline";   obj.focus();
    }else{
       obj.style.display = "none";
    }
}

function showAddr(type) {	// 옵션수량변경 버튼 클릭시 박스 보이기
	if(type == "a") {
	var obj = document.getElementById("d_addrInfo");
	obj.style.display = "block";
	
	}
	if(type == "b") {
		var obj2 = document.getElementById("d_addrInsert");
		obj2.style.display = "block";
		var obj = document.getElementById("d_addrInfo");
		obj.style.display = "none";
	}
	if(type == "c") {
		var obj3 = document.getElementById("schAddrZip");
		obj3.style.display = "block";
		var obj = document.getElementById("d_addrInfo");
		obj.style.display = "none";
	}
	if(type == "d") {
		var obj4 = document.getElementById("schMyAddrZip");
		obj4.style.display = "block";
	}
}
function hideAddr(type) {	// 박스 숨기기
	if(type == "a") {
		var obj = document.getElementById("d_addrInfo");
		obj.style.display = "none";
	}
	if(type == "b") {
		var obj2 = document.getElementById("d_addrInsert");
		obj2.style.display = "none";
		var obj4 = document.getElementById("schMyAddrZip");
		obj4.style.display = "none";
	}
	if(type == "c") {
		var obj3 = document.getElementById("schAddrZip");
		obj3.style.display = "none";		
	}
	if(type == "d") {
		var obj4 = document.getElementById("schMyAddrZip");
		obj4.style.display = "none";
	}
	return false;
}

function changeAddr(type, Name, Zip, Addr1, Addr2, p1, p2, p3) {

		var maName = document.getElementById("maName");
		var maZip = document.getElementById("maZip");
		var maAddr1 = document.getElementById("maAddr1");
		var maAddr2 = document.getElementById("maAddr2");
		var phone1 = document.getElementById("p1");
		var phone2 = document.getElementById("p2");
		var phone3 = document.getElementById("p3");
		console.log(maName.value);
		maName.value = Name;
		maZip.value = Zip;
		maAddr1.value = Addr1;
		maAddr2.value = Addr2;
		phone1.value = p1;
		phone2.value = p2;
		phone3.value = p3;
		var obj = document.getElementById("d_addrInfo");
		obj.style.display = "none";
		arrAddr = document.getElementsByName("addr");
		if(type == 'e') {
			for (var i = 0 ; i < arrAddr.length ; i++) {
				arrAddr[i].checked = false;
			}
		}
		if(type == 'c') {
			document.getElementById("maZip").readOnly = false;
			document.getElementById("maAddr1").readOnly = false;
			document.getElementById("maAddr2").readOnly = false;
		}
		
}

function myAddrDel(idx, isbasic) {
	if (isbasic == 'y') {
		alert("기본배송지는 삭제할 수 없습니다.");
		return false;
	} else {
		if (confirm("선택하신 주소를 삭제하시겠습니까?")) {
			$.ajax({
				type : "POST", 
				url : "/inMyGarden/addr_del_proc.ord", 
				data : {"idx" : idx}, 
				success : function(chkRst) {
					if (chkRst == 0) {	// 삭제에 실패했을 경우
						alert("주소 삭제에 실패했습니다.\n다시 시도해 주십시오.");
					} else {
						location.reload();
					}
				}
			});
		}
	}
}


function myAddrAdd() {
	var myAddrName = document.getElementById("myAddrName").value;
	var myAddrP1 = document.getElementById("myAddrP1").value;
	var myAddrP2 = document.getElementById("myAddrP2").value;
	var myAddrP3 = document.getElementById("myAddrP3").value;
	var myAddrReceiver = document.getElementById("myAddrReceiver").value;
	var myAddrZip = document.getElementById("myAddrZip").value;
	var myAddrAddr1 = document.getElementById("myAddrAddr1").value;
	var myAddrAddr2 = document.getElementById("myAddrAddr2").value;
	
	var myAddrIsbasic = "";
	var isbasic = document.getElementById("myAddrIsbasic").checked;
	
		if (isbasic == false) {
			myAddrIsbasic = "n";
		} else {
			myAddrIsbasic = "y";
		}
	
	if (myAddrName == ""){
       	alert("배송지별명을 입력하세요.");               	document.frmOrd.myAddrName.focus();   return false;
    }
	if (myAddrP1 == ""){
       	alert("휴대폰번호를 선택해주세요.");               	document.frmOrd.myAddrP1.focus();   return false;
    }
	if (myAddrP2 == ""){
       	alert("휴대폰번호를 확인해주세요.");               	document.frmOrd.myAddrP2.focus();   return false;
    }
	if (myAddrP3 == ""){
       	alert("휴대폰번호를 확인해주세요.");               	document.frmOrd.myAddrP3.focus();   return false;
    }
	if (myAddrReceiver == ""){
       	alert("받으실분 이름을 입력해주세요.");         		document.frmOrd.myAddrReceiver.focus();   return false;
    }
	if (myAddrZip == "" || myAddrZip.length < 5){
       	alert("우편번호를 확인해주세요.");               	document.frmOrd.myAddrZip.focus();   return false;
    }
	if (myAddrAddr1 == ""){
       	alert("주소를 확인해주세요.");               		document.frmOrd.myAddrAddr1.focus();   return false;
    }
	if (myAddrAddr2 == ""){
       	alert("주소를 확인해주세요.");               		document.frmOrd.myAddrAddr2.focus();   return false;
    }
		
		if (confirm("주소를 등록하시겠습니까?")) {
			$.ajax({
				type : "POST", 
				url : "/inMyGarden/addr_add_proc.ord", 
				data : {
					"myAddrName" : myAddrName, "myAddrP1" : myAddrP1, "myAddrP2" : myAddrP2,
					"myAddrP3" : myAddrP2, "myAddrReceiver" : myAddrReceiver, "myAddrIsbasic" : myAddrIsbasic,
					"myAddrZip" : myAddrZip, "myAddrAddr1" : myAddrAddr1, "myAddrAddr2" : myAddrAddr2
				}, 
				success : function(chkRst) {
				if (chkRst == 0) {	// 등록에 실패했을 경우
						alert("주소 등록에 실패했습니다.\n다시 시도해 주십시오.");
				} else {
					location.reload();
				}
			}
		});
	}
}


function allUsePoint(myPoint, totalPay, chk) {
	var oiUsepnt = document.getElementById("oiUsepnt");
	var allUsepnt = chk.checked;
	if(allUsepnt) {

		if(myPoint <= totalPay){
			oiUsepnt.value = myPoint;
			document.getElementById("totalPay").innerText = totalPay - myPoint;
		} 
		if(myPoint >= totalPay) {
			oiUsepnt.value = totalPay;
			document.getElementById("totalPay").innerText = 0;
		}
	} else {
		oiUsepnt.value = 0;
		document.getElementById("totalPay").innerText = totalPay;
	}
}


function test(a) {
	console.log(a.checked);
	
}





//function goOrderView() {
//	document.frmOrd.action = "order_proc.ord";
//	document.frmOrd.submit();
//}

</script>
</head>
<body>
<div style="width:1080px; margin:0 auto;">
<form name="frmOrd"  action="order_view.ord" method="post" onsubmit="return chkValue(this);">
<input type="hidden" name="today" value="<%=today %>" />
<a href="/inMyGarden/index.jsp">HOME</a> > 주문서작성/결제<br /><br />
	<div class="d_order_title">
		<h2 style="display:inline;">주문서작성/결제</h2>
		<ol>
		    <li class="page_on"><span>01</span> 장바구니 <span><img src="/inMyGarden/img/right-arrow-240.png" width="13"></span></li>
		    <li><strong><span>02</span> 주문서작성/결제<span><img src="/inMyGarden/img/right-arrow-240.png" width="13"></span></strong></li>
		    <li><span>03</span> 주문완료</li>
		</ol>
	</div>
<hr width="1080" />
<h3>주문상세내역</h3>
<!-- 주문상세내역 상품정보 테이블 시작 -->
<table width="1080" id="t_orderDetailInfo" >

	<tr >
		<th width="*" height="30" colspan="2">상품/옵션 정보</th>
		<th width="8%">수량</th>
		<th width="10%">상품금액</th>
		<th width="12%">할인/적립</th>
		<th width="10%">합계금액</th>
	</tr>
<%
int total = 0;	// 총 구매가격을 누적할 변수
int savePoint = 0;
if ("cart".equals(kind)) {	// 장바구니를 통한 구매시
	for (int i = 0 ; i < cartList.size() ; i++) {
		CartInfo cart = cartList.get(i);
		String lnk = "<a href=\"product_detail.pdt?id=" + cart.getPi_id() + "\">";
		String imglnk = cart.getPi_img1();
		String imgFolder = imglnk.substring(4,5);
%>	
	<input type="hidden" name="idx" value="<%=cart.getOc_idx() %>" />
	<tr >
		<td width="100" height="100"><a href="product_detail.pdt?cpage=1&psize=20&id=<%=cart.getPi_id() %>" ><img src="/inMyGarden/product/img/<%=imgFolder %>/<%=imglnk %>" width="100" height="100" alt="상품 이미지" /></a></td>
		<td align="left"><a href="product_detail.pdt?cpage=1&psize=20&id=<%=cart.getPi_id() %>" ><%=cart.getPi_name() %><br />( <%=cart.getOc_option() %> )</a></td>
		<td><%=cart.getOc_cnt() %></td>
<%
 	savePoint = (int)Math.floor(cart.getPi_price() * cart.getOc_cnt() /200) * 10; 
// // 적립금 1원단위 절삭
%>		
		<td><%=cart.getPi_price() %>원</td>
		<td>적립 + <%=savePoint %>원</td>
		<td><%=cart.getPi_price() * cart.getOc_cnt()%> 원</td>
	</tr>
<%
		total += cart.getPi_price() * cart.getOc_cnt();
	}


%>	
	<input type="hidden" name="wtype" value="cart" />
</table>
<!-- 주문상세내역 상품정보 테이블 종료 -->
<br />
<a href="cart_list.ord">◁ 장바구니 가기</a>
<br /><br />
<%
} else {	// 상품상세화면에서 '바로 구매' 클릭시
	int occnt = Integer.parseInt((String)request.getAttribute("occnt"));
	String ocoption = (String)request.getAttribute("ocoption");
	String lnk = "<a href=\"product_detail.pdt?id=" + pdtInfo.getPi_id() + "\">";
	String imglnk = pdtInfo.getPi_img1();
	String imgFolder = imglnk.substring(4,5);
%>
	<input type="hidden" name="wtype" value="pdt" />
	<input type="hidden" name="piid" value="<%=pdtInfo.getPi_id() %>" />
	<input type="hidden" name="occnt" value="<%=occnt %>" />
	<input type="hidden" name="ocoption" value="<%=ocoption %>" />
	<tr >
		<td width="100" height="100"><a href=""><img src="/inMyGarden/product/img/<%=imgFolder %>/<%=imglnk %>" width="100" height="100" alt="상품 이미지" /></a></td>
		<td align="left"><%=pdtInfo.getPi_name() %><br />( <%=ocoption %> )</td>
		<td><%=occnt %></td>
<%
 	savePoint = (int)Math.floor(pdtInfo.getPi_price() * occnt /200) * 10; 
// // 적립금 1원단위 절삭
%>		
		<td><%=pdtInfo.getPi_price() %>원</td>
		<td>적립 + <%=savePoint %>원</td>
		<td><%=pdtInfo.getPi_price() * occnt%> 원</td>
	</tr>

<%
		total += pdtInfo.getPi_price() * occnt;
}
%>
</table>
<br /><br />
<!-- 주문상세내역 금액정보 테이블 시작 -->
<%
	int delipay = 0;
	if(total < 50000) {
		delipay = 3000;
	}
	
	int totalSavePoint = (int)Math.floor(total / 200) * 10;
	// 적립금 1원단위 절삭
%>
<table width="1080" height="100" id="t_orderPrice" style="text-align:right;">
	<tr >
		<th colspan="3" width="*">총 <%=cartList.size() == 0 ? "1" : cartList.size() %>개의 상품금액</th>
		<th width="10%">배송비</th>
		<th width="10%'">합계</th>
	</tr>
	<tr>
	<td colspan="3"><%=total %> 원</td>
	<td><%=delipay %> 원</td>
	<td><%=total + delipay %> 원</td>
	</tr>
</table>
<!-- 주문상세내역 금액정보 테이블 종료 -->

<br /><br />

<!-- 주문상세내역 주문자 정보 테이블 시작 -->
<h3>주문자 정보</h3>

<table width="1080" height="200"  id="t_ordererInfo" >
	<tr>
		<th width="30%">주문자</th>
		<td width="*">
			<input type="text" name="oiName" value="<%=loginMember.getMi_name()%>"/>
		</td>
	</tr>
	<tr>
		<th>휴대폰 번호</th>
		<td>
			<select id="oip1" name="oip1">
				<option value="">- 선 택 -</option>
				<option value="010" <%if ("010".equals(arrMiPhone[0])) { %> selected="selected" <% } %>>010</option>
				<option value="011" <%if ("011".equals(arrMiPhone[0])) { %> selected="selected" <% } %>>011</option>
				<option value="016" <%if ("016".equals(arrMiPhone[0])) { %> selected="selected" <% } %>>016</option>
				<option value="019" <%if ("019".equals(arrMiPhone[0])) { %> selected="selected" <% } %>>019</option>
			</select>-
			<input type="text" maxlength="4" size="4" id="oip2" name="oip2" value="<%=addrList == null ? "" :arrMiPhone[1] %>" onkeyup="onlyNum(this);"/>-
			<input type="text" maxlength="4" size="4" id="oip3" name="oip3" value="<%=addrList == null ? "" :arrMiPhone[2] %>" onkeyup="onlyNum(this);"/>
		</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>
			<input type="text" id="e1" name="e1" value="<%=arrEmail[0] %>" onchange="CheckEmail(this.value);"/> @
			<input type="text" name="e3" id="e3" value="<%=arrEmail[1] %>" <%if (arrEmail[1] == null || "".equals(arrEmail[1])) { %> style="display:none;" <% } %>/>
      		<select name="e2"  onchange="showE3(this.value);">
				<option value="" >도메인 선택</option>
				<option value="naver.com">naver.com</option>
				<option value="nate.com">nate.com</option>
				<option value="daum.net">daum.net</option>
				<option value="gmail.com">gmail.com</option>
				<option value="direct"<%if (arrEmail[1] != null ||!"".equals(arrEmail[1])) {%> selected="selected"<% } %>>직접 입력</option>
			</select>
			
		</td>
	</tr>
</table>
<!-- 주문상세내역 주문자 정보 테이블 종료 -->

<br /><br />

<!-- 주문상세내역 배송 정보 테이블 시작 -->
<h3>배송 정보</h3>


<table width="1080" height="400"  id="t_addrInfo" >
	<tr>
		<th width="30%">배송지 확인</th>
		<td width="*" style="position:relative;">
			<input type="radio" name="addr" value="addr1" checked="checked" onclick="changeAddr('a', '<%=maName%>', '<%=maZip%>','<%=maAddr1%>','<%=maAddr2%>','<%=addrList == null ? "" :arrMaPhone[0]%>','<%=addrList == null ? "" :arrMaPhone[1]%>','<%=addrList == null ? "" :arrMaPhone[2]%>');"/>기본 배송지
<%
if (addrListInfo != null && addrListInfo.size() >= 1) {
	AddrInfo lastAddr = addrListInfo.get(0);		// 최근 배송지 정보
	String[] lastAddrPhone = lastAddr.getMa_phone().split("-",3);

%>
			<input type="radio" name="addr" value="addr2" onclick="changeAddr('b', '<%=addrListInfo == null ? "" :lastAddr.getMa_name()%>', '<%=addrListInfo == null ? "" :lastAddr.getMa_zip()%>','<%=addrListInfo == null ? "" :lastAddr.getMa_addr1()%>','<%=addrListInfo == null ? "" :lastAddr.getMa_addr2()%>','<%=addrListInfo == null ? "" : lastAddrPhone[0]%>','<%=addrListInfo == null ? "" :lastAddrPhone[1]%>','<%=addrListInfo == null ? "" :lastAddrPhone[2]%>');" />최근 배송지
<%
} else {
%>
			<input type="radio" name="addr" value="addr2" onclick="changeAddr('b', '', '','','','','','');" />최근 배송지
<%			
}
%>
			<input type="radio" name="addr" value="addr3" onclick="changeAddr('c', '', '', '', '', '', '', '');" />직접 입력
			<input type="radio" name="addr" value="addr4" onclick="changeAddr('d','<%=miName %>', '','','','<%=arrMiPhone[0]%>','<%=arrMiPhone[1]%>','<%=arrMiPhone[2]%>' );"/>주문자정보와 동일
			<input type="button" class="btn" name="addrInfo"value="배송지관리" onclick="showAddr('a');" />


			<!-- 나의 배송지 관리 팝업창 시작  -->
			<div id="d_addrInfo" style="width:800px;  border:1px solid black; padding:20px; position:absolute;left:-180px; top:-150px; background:white; display:none; z-index:10;">
			<h3 style="font-size:20px;">나의 배송지 관리<input type="image" src="/inMyGarden/img/x-240.png" width="30" style="padding:0 10px 30px 0; float:right;" onclick="hideAddr('a'); return false;"/></h3>
			<hr style="width:800px;"/>
			<input type="button" class="btn btnLeft" value="+ 새 배송지 추가" style="float:right; width:130px;" onclick="showAddr('b');" /><br /><br />
			<table width="800" height="70" align="center" id="t_ordPrice" style="border:1px solid black;text-align:center; padding:5px 10px 5px 10px; ">
				<tr >
					<th width="5%" height="70" style="border:unset; background:unset;">선택</th>
					<th width="13%" style="border:unset; background:unset;">배송지이름</th>
					<th width="10%" style="border:unset; background:unset;">받으실 분</th>
					<th width="*" style="border:unset; background:unset;">주소</th>
					<th width="20%" style="border:unset; background:unset;">연락처</th>
					<th width="10%" style="border:unset; background:unset;">삭제</th>
				</tr>
			</table>
				<div style="width:800px; height:400px; overflow:auto;">
				<table width="800" height="200" align="center"  cellspacing="0" id="t_myAddr" >
				
<%
	if (addrListInfo != null && addrListInfo.size() > 0) {	// 주소정보에 주소값이 들어 있으면
	
		for (int i = 0 ; i < addrListInfo.size() ; i++) {
			AddrInfo addr = addrListInfo.get(i);
			int idx = addr.getMa_idx();	// 주소정보 인덱스번호
			String[] arrayPhone = addr.getMa_phone().split("-",3);
%>			

					<tr height="100">
						<td width="25" height="100" style="border:none; border-bottom:1px solid black;">
							<input type="button" class="btn" name="addr<%=addrListInfo == null ? "" : addr.getMa_idx() %>" value="선택" onclick="changeAddr('e','<%=addrListInfo == null ? "" : addr.getMa_name()%>', '<%=addrListInfo == null ? "" : addr.getMa_zip()%>','<%=addrListInfo == null ? "" : addr.getMa_addr1()%>','<%=addrListInfo == null ? "" : addr.getMa_addr2()%>','<%=addrListInfo == null ? "" : arrayPhone[0]%>', '<%=addrListInfo == null ? "" : arrayPhone[1]%>','<%=addrListInfo == null ? "" : arrayPhone[2]%>');"/>
						</td>
						<td width="100" style="border:none; border-bottom:1px solid black;"><%if ("y".equals(addrListInfo == null ? "" : addr.getMa_basic())) { %>(기본배송지)<br /><% } %><%=addrListInfo == null ? "" : addr.getMa_addrname() %></td>
						<td width="10%" style="border:none; border-bottom:1px solid black;"><%=addrListInfo == null ? "" : addr.getMa_name() %></td>
						<td width="*" style="border:none; border-bottom:1px solid black;">(<%=addrListInfo == null ? "" : addr.getMa_zip() %>)<br /><%=addrListInfo == null ? "" : addr.getMa_addr1() %> <%=addrListInfo == null ? "" : addr.getMa_addr2() %></td>
						<td width="20%" style="border:none; border-bottom:1px solid black;">휴대폰 : <%=addr.getMa_phone() %></td>
						<td width="10%" style="border:none; border-bottom:1px solid black;"><input type="button" class="btn" value="삭제" onclick="myAddrDel('<%=addr.getMa_idx() %>', '<%=addr.getMa_basic() %>');" /></td>
					</tr>
<%
		}
	} else {	// 주소가 비었으면
		out.println("<tr height='100'>");
		out.println("<td colspan='6' height='100' style='border:none; border-bottom:1px solid black;'>등록된 주소가 없습니다.</td>");
		out.println("</tr>");
	
}
%>
				</table>
				</div>
			</div>
			<!-- 나의 배송지 관리 팝업창 종료  -->



			<!-- 나의 배송지 관리 등록 팝업창 시작  -->
			<div id="d_addrInsert" style="width:700px; height:450px; border:1px solid black; padding:20px; position:absolute; left:-130px; top:-80px; background:white; display:none; z-index:10;">
			<h3 style="font-size:20px;">나의 배송지 관리<input type="image" src="/inMyGarden/img/x-240.png" width="30" style="padding:0 10px 0px 0; float:right;" onclick="hideAddr('b'); return false;"/></h3>
			<hr style="width:700px;" />
			<h4 style="padding:10px; padding:0px; font-size:16px;">배송지 등록</h4>
			<table width="700" height="250" cellspacing="0" style="text-align:left;" >
				<tr>
					<th width="120" height="40" style="border:unset; background:unset; padding:0px;" align="left">■ 배송지 별명</th>
					<td width="220" style="text-align:left; border:unset; background:unset; padding:0px;"><input type="text" size="20" id="myAddrName"/></td>
					<th width="135" style="border:unset; background:unset; padding:0px;">■ 휴대폰 번호</th>
					<td style="border:unset; background:unset; padding:0px;" >
							<select id="myAddrP1" name="myAddrP1">
								<option value="">- 선 택 -</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="019">019</option>
							</select>-
						<input type="text" maxlength="4" size="4" id="myAddrP2" name="myAddrP2" onkeyup="onlyNum(this);"/>-
						<input type="text" maxlength="4" size="4" id="myAddrP3" name="myAddrP3" onkeyup="onlyNum(this);"/>
					</td>
				</tr>
				<tr>
					<th height="40" style="border:unset; background:unset;">■ 받으실 분</th>
					<td style="border:unset; background:unset;  padding:0px;">
						<input type="text" size=20 id="myAddrReceiver" name="myAddrReceiver"/>
					</td>
					<th colspan="2"style="border:unset; background:unset; ">기본주소 설정 여부&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox" id="myAddrIsbasic" name="myAddrIsbasic" value="y" /></th>
				</tr>
				<tr>
					<th height="40" style="border:unset; background:unset;padding:0px; " >■ 우편번호</th>
					<td style="border:unset; background:unset;  padding:0px;">
						<input type="text" maxlength="5"  size="8" id="myAddrZip" name="myAddrZip"/>&nbsp;&nbsp;&nbsp;
						<input type="button" class="btn" value="우편번호 찾기" onclick="showAddr('d');"/></td>
					<td colspan="2" style="border:unset; background:unset;"></td>
				</tr>
				<tr>
					<td colspan="4" height="100" style="all:unset; background:unset;"><br />
						<input type="text"  size="50" id="myAddrAddr1" name="myAddrAddr1" placeholder="주소1, 검색으로 인한 자동완성"/>&nbsp;&nbsp;<br />
						<input type="text"size="50" id="myAddrAddr2" name="myAddrAddr2"placeholder="주소2, 직접 입력"/>
					</td>
				</tr>
				<tr>
					<td colspan="4" align="center"  height="*" style="border:unset; background:unset; text-align:center;"><br />
						<br /><input type="button" class="btn btnLeft" value="등록" onclick="myAddrAdd()"/>
					</td>
				</tr>
			</table>
			</div>
			
			<!-- 나의 배송지 관리 등록 팝업창 종료  -->




			<!-- 우편번호 찾기 팝업창 시작  -->
			<div id="schMyAddrZip"style="position:absolute; left:-30px; top:-50px; background:white; z-index:5; display:none; z-index:15;">
			
			<table style="width:600px; height:400px; border:1px solid black; padding:0px 0px 20px 20px; text-align:center;">
			<tr>
				<td  height="50" style="border:unset; background:unset;">
					<input type="image" src="/inMyGarden/img/x-240.png" width="30" style="padding:0px; float:right;" onclick="hideAddr('d'); return false;"/>
				</td>
			</tr>
			<tr>
				<td style="text-align:center; border:unset; background:unset;">
				우편번호 찾기
				</td>
			</tr>
			<tr>
				<td style="text-align:center; border:unset; background:unset;">
					<div>
						<input type="text" placehorder="검색어(도로명, 지번, 건물명)를 입력해주세요" />
						<input type="button" value="검색 " />
					</div>
				</td>
			</tr>
			<tr>
				<td style="border:unset; background:unset;">
					<ul style="text-align:left;">
						<li>도로명 + 건물번호<br />예)영동대로 513, 제주 첨단로 242<br /><br /></li>
						<li>지역명(동/리) + 번지<br />예)삼성동 25, 제주 영평동 2181<br /><br /></li>
						<li>지역명(동/리) + 건물명(아파트명)<br />예)분당 주공, 삼성동 코엑스<br /><br /></li>
					</ul>
				</td>
			</tr>
			</table>
			</div>
			<!-- 우편번호 찾기 팝업창 종료  -->


			
		</td>
	</tr>
	<tr>
		<th>■받으실 분</th><td><input type="text" id="maName" name="maName" value="<%=maName %>"/></td>
	</tr>
	<tr>
		<th rowspan="2">■받으실 곳</th>
		<td style="position:relative;">
		
		
			<!-- 우편번호 찾기 팝업창 시작  -->
			<div id="schAddrZip"style="position:absolute; left:-30px; top:-130px; background:white; z-index:5; display:none;">
			
			<table style="width:600px; height:400px; border:1px solid black; padding:0px 0px 20px 20px; text-align:center;">
			<tr>
			<td  height="50" style="border:unset; background:unset;">
				<input type="image" src="/inMyGarden/img/x-240.png" width="30" style="padding:0px; float:right;" onclick="hideAddr('c'); return false;"/>
			</td>
			</tr>
			<tr>
				<td style="text-align:center; border:unset; background:unset;">
				우편번호 찾기
				</td>
			</tr>
			<tr>
				<td style="text-align:center; border:unset; background:unset;">
				<div>
				<input type="text" placehorder="검색어(도로명, 지번, 건물명)를 입력해주세요" />
				<input type="button" value="검색 " />
				</div>
				</td>
			</tr>
			<tr>
				<td style="border:unset; background:unset;">
				<ul style="text-align:left;">
					<li>도로명 + 건물번호<br />예)영동대로 513, 제주 첨단로 242<br /><br /></li>
					<li>지역명(동/리) + 번지<br />예)삼성동 25, 제주 영평동 2181<br /><br /></li>
					<li>지역명(동/리) + 건물명(아파트명)<br />예)분당 주공, 삼성동 코엑스<br /><br /></li>
				</ul>
				</td>
			</tr>
			</table>
			</div>
			<!-- 우편번호 찾기 팝업창 종료  -->
		
		
		
		
		
			<input type="text" readonly="readonly" id="maZip" name="maZip" placeholder="우편번호" maxlength="5" size="5" value="<%=maZip %>"/>
			<input type="button" class="btn" value="우편번호 검색" onclick="showAddr('c'); return false;"/>
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" readonly="readonly" id="maAddr1" name="maAddr1" placeholder="주소1" size="50" value="<%=maAddr1 %>" />&nbsp;
			<input type="text" placeholder="주소2" id="maAddr2" name="maAddr2" size="30" value="<%=maAddr2 %>" />
		</td>
	</tr>

	<tr>
		<th>■휴대폰 번호</th>
		<td>
			<select id="p1" name="p1">
				<option value="" >- 선 택 -</option>
				<option value="010" <%if ("010".equals(arrMaPhone[0])) { %> selected="selected" <% } %>>010</option>
				<option value="011" <%if ("011".equals(arrMaPhone[0])) { %> selected="selected" <% } %>>011</option>
				<option value="016" <%if ("016".equals(arrMaPhone[0])) { %> selected="selected" <% } %>>016</option>
				<option value="019" <%if ("019".equals(arrMaPhone[0])) { %> selected="selected" <% } %>>019</option>
			</select>-
			<input type="text" maxlength="4" size="4" id="p2" name="p2" value="<%=addrList == null ? "" :arrMaPhone[1] %>" onkeyup="onlyNum(this);"/>-
			<input type="text" maxlength="4" size="4" id="p3" name="p3" value="<%=addrList == null ? "" :arrMaPhone[2] %>" onkeyup="onlyNum(this);"/>
		</td>
	</tr>
	<tr>
		<th>남기실 말씀(메모)</th>
		<td><input type="text" name="oiCmt"size="50" /></td>
	</tr>
	<tr>
		<th>회원정보반영</th>
		<td><input type="checkbox" name="addAddrInfo" id="addAddrInfo" value="y" onclick="test(this.value);"/>나의 배송지에 추가 합니다.</td>
	</tr>
</table>
<!-- 주문상세내역 배송 정보 테이블 종료 -->
<br /><br />
<!-- 주문상세내역 주문서작성/결제정보 테이블 시작 -->
<h3>결제 정보</h3>

<input type="hidden" name="oiPay" value="<%=total %>" />
<input type="hidden" name="oiDelipay" value="<%=delipay %>" />
<input type="hidden" name="odSavepnt" value="<%=totalSavePoint %>" />

<table width="1080" height="400"  id="t_payInfo" >
	<tr>
		<th width="30%">상품 합계 금액</th><td width="*"><%=total %> 원</td>
	</tr>
	<tr>
		<th>배송비</th><td><%=delipay %> 원</td>
	</tr>
	<tr>
		<th rowspan="2">할인 및 적립</th><td>할인 : (-) 0원</td>
	</tr>
	<tr>
		<td>적립 : (+) <%=totalSavePoint %>원</td>
	</tr>
	<tr>
		<th>적립금 사용</th>
		<td><input type="text" size="10" id="oiUsepnt" name="oiUsepnt" <%if (loginMember.getMi_point() < 1000) { %> readonly="readonly"  <% } %> value="0"  onkeyup="onlyNumPoint(this); onlyZero(this, <%=loginMember.getMi_point() %>, <%=total + delipay %>);" onblur="onlyTen(this, <%=total + delipay %>);"/>원&nbsp;
		<input type="checkbox" id="allUsepnt"  <%if (loginMember.getMi_point() < 1000) { %> readonly="readonly" <% } %> onclick="allUsePoint(<%=loginMember.getMi_point() %>,<%=total + delipay %>, this) " />전액 사용하기 (보유 적립금 <%=loginMember.getMi_point() %> 원)
			<br /> ※1,000원 부터 사용 가능합니다.
		</td>
	</tr>
	<tr>
		<th>최종 결제금액</th>
		<td>
			<span id="totalPay"><%=total + delipay %></span>원
		</td>
	</tr>
</table>
<!-- 주문상세내역 주문서작성/결제정보 테이블 종료 -->
<br /><br />






<!-- 주문상세내역 결제수단 선택/결제 시작 -->
<h3>결제수단 선택 / 결제</h3>
<table width="1080" height="100"  id="t_payOptionInfo1" >
<tr>
	<td>
		<input type="radio" name="oiPayment" value="a" />무통장 입금&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio" name="oiPayment" value="b" />신용카드&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio" name="oiPayment" value="c" />계좌이체&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio" name="oiPayment" value="d" />가상계좌&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio" name="oiPayment" value="e" />휴대폰결제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</td>
</tr>
</table>
	<table width="1080" height="100" id="t_ordPrice" style="text-align:right;">
	<tr >
		<th colspan="3" width="*">최종 결제금액</th>
		<td width="10%"><%=total + delipay %> 원</td>

	</tr>
</table>
<br />
<table width="1080"  id="t_payOptionInfo2" >
<tr>
	<td>
		<input type="checkbox" name="chkAgree"/> (필수) 구매하실 상품의 결제정보를 확인하였으며, 구매진행에 동의합니다.<br /><br />
	</td>
</tr>
<tr>
	<td>
		<input type="submit" class="btn btnRight"  value="결제하기"  /><br /><br />
	</td>
</tr>
</table>
</form>
<!-- 주문상세내역 결제수단 선택/결제 종료 -->
</div>




<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />


<%@ include file="../inc_footer.jsp" %>
</body>

</html>








