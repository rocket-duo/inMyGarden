<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
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

ArrayList<WishInfo> wishList = (ArrayList<WishInfo>)request.getAttribute("wishList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" type="text/css" href="/inMyGarden/css/default.css?" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
table { table-layout: fixed; }
table th { font-size:15px; }
table td { font-size:13px; }
.btn { background:lightgray; border:1px solid black; margin:0px; cursor:pointer; }
.btn:hover { background:whiteSmoke; }
.btn:active { background:gray; }
.btnLeft { width:100px; height:30px; }
.btnRight { width:200px; height:60px; }

/* 찜리스트 */
#frm { margin:0 auto; width:800px; border:none; }
#t_wishPdtInfo { 
	border-right:1px soild black; padding:10px 20px 10px 0px; 
	border-collapse: collapse; text-align:center; 
}
#t_wishPdtInfo th { 
	background:whiteSmoke; border-bottom:1px solid black; border-top:1px solid black; 
	padding:10px 20px 10px 0px; border-collapse: collapse; 
}
#t_wishPdtInfo td {	border-bottom:1px solid black; border-top:1px solid black; 
	padding:10px 20px 10px 0px; border-collapse: collapse; 
}
</style>


<script src="jquery-3.6.0.js"></script>
<script>

function changeCnt(idx, cnt, owPrice) {	// 장바구니의 수량을 변경시키는 함수
	var textSpan = document.getElementById("owcnt" + idx);
	var textCnt = textSpan.innerText;
	var priceSpan = document.getElementById("priceSpan" + idx);
	var price = owPrice; 	// 1개의 상품 금액
	textCnt = parseInt(textCnt) + parseInt(cnt);
	priceSpan.innerText = textCnt * price;	// 화면에 보이는 총 금액
	
	if (textCnt <= 1) {
		textSpan.innerText = "1"
		priceSpan.innerText = owPrice;
	} else {
		textSpan.innerText = textCnt
	}

}

function changeOpt(idx, opt) {
	var owopt = document.getElementById("owopt" + idx).value;
	var optSpan =document.getElementById("optSpan" + idx);

	optSpan.innerText = owopt;
}

function changeTotal(idx, piid){
	var opt = document.getElementById("owopt" + idx).value;
	var cnt = document.getElementById("owcnt" + idx).innerText;
	
	$.ajax({
		type : "POST", 
		url : "/inMyGarden/wish_up_proc.ord", 
		data : {"idx" : idx, "piid" : piid, "opt" : opt , "cnt" : cnt}, 
		success : function(chkRst) {
			console.log(chkRst)
			if (chkRst == 0) {	// 옵션 변경에 실패했을 경우
				alert("상품 옵션 변경에 실패했습니다.\n다시 시도해 주십시오.");
			} else {
				location.reload();
			}
		}
	});
	
}
function clearCart(kind) {
	var msg = "지정한 상품을 ";	var idx = kind;
	console.log(kind);
	if (kind == -1) {
		msg = "선택하신 상품들을 모두 ";
		idx = getSelectedChk();	// 선택된 체크박스의 value들을 받아 옴
		if (idx == "") {
			alert("선택한 상품이 없습니다.");	return;
		}
	} else if (kind == 0) { 
		msg = "장바구니안의 모든 상품을 ";
	} 
	if (confirm(msg + "삭제하시겠습니까?")) {
		$.ajax({
			type : "POST", 
			url : "/inMyGarden/wish_del_proc.ord", 
			data : {"kind" : kind, "idx" : idx}, 
			success : function(chkRst) {
				if (chkRst == 0) {	// 삭제에 실패했을 경우
					alert("상품 삭제에 실패했습니다.\n다시 시도해 주십시오.");
				} else {
					location.reload();
				}
			}
		});
	}
}

function getSelectedChk() {	// 선택한 체크박스들의 value값을 리턴하는 함수
	var idx = "";	// 선택한 체크박스들의 value값을 쉼표로 구분하여 저장하는 변수
	var arrChk = document.getElementsByName("chk");
	for (var i = 0 ; i < arrChk.length ; i++) {
		if (arrChk[i].checked)	idx += "," + arrChk[i].value;
	}
	if (idx != "")	idx = idx.substring(1);

	return idx;
}

function chkAll(all) {	// 전체 선택했을 경우
	var arrChk = document.frmWish.chk;
	for (var i = 0 ; i < arrChk.length ; i++) {
		arrChk[i].checked = all.checked;
	}
	
}

function choose(chk) {
	var arrChk = document.frmWish.allcheck;
	if (!chk.checked) {	// 현재 체크박스를 체크 해제했을 경우
		arrChk.checked = false;
	}
}

function goCart() {
	var idx = getSelectedChk();	
	console.log(idx);
	if (idx == "") {
		alert("선택한 상품이 없습니다.");	return;
	}
	if(confirm("선택하신 상품을  장바구니에 담으시겠습니까?")) {
		var frm = document.frmWish;
			frm.action = "wish_cart_in_proc.ord";
			frm.submit();
	}
}


function goOrder(kind) {
	var idx = kind;
	if (kind == "a") {	// 전체 상품 구매하기일 경우
		var arrChk = document.frmWish.chk;
		idx = getSelectedChk();
		if (idx == "") {
			alert("선택한 상품이 없습니다.");	return;
		}
		for (var i = 0 ; i < arrChk.length ; i++)	arrChk[i].checked = true;
		// 모든 체크박스를 체크된 상태로 변경
		
		if(confirm("전체 상품을 주문합니다")) {
			document.frmCart.submit();
		}
	} else {	// 선택 상품 구매하기일 경우
		idx = getSelectedChk();	
		if (idx == "") {
			alert("선택한 상품이 없습니다.");	return;
		}
		if(confirm("선택하신 상품을 주문합니다")) {
			document.frmCart.submit();
		}
	}
}

function showOption(idx) {	// 옵션수량변경 버튼 클릭시 박스 보이기
	var obj = document.getElementById("d_option" + idx);
	obj.style.display = "block";
}
function hideOption(idx) {	// 박스 숨기기
	var obj = document.getElementById("d_option" + idx);
	obj.style.display = "none";
}


</script>


</head>
<body>


<div style="width:1080px; margin:0 auto !important; ">
<a href="/inMyGarden/index.jsp">HOME</a> > <a href="">마이페이지</a> > 찜리스트<br /><br />
<%@ include file="inc_my_page_side_menu.jsp" %>
<div style="width:800px; margin:0 auto; display:inline-block;">
<form name="frmWish"  action="" method="post">
		<h2 style="display:inline;">찜리스트</h2>
<hr width="800" /><br /><br />

<!-- 찜리스트 상품정보 테이블 시작 -->
<table width="800" id="t_wishPdtInfo" >
	<tr height="60">
		<th width="10%"><input type="checkbox" name="allcheck" checked="checked" onclick="chkAll(this);" /></th>
		<th width="50" colspan="2">상품/옵션 정보</th>
		<th width="10%">수량</th>
		<th width="10%">상품금액</th>
		<th width="10%">할인/적립</th>
		<th width="10%">합계금액</th>
	</tr>

<%
int total = 0;	// 총 구매가격을 누적할 변수
if (wishList != null && wishList.size() > 0) {	// 장바구니에 상품이 들어 있으면
	
	for (int i = 0 ; i < wishList.size() ; i++) {
		WishInfo wish = wishList.get(i);
		int idx = wish.getOw_idx();	// 카트 인덱스번호
		String lnk = "<a href=\"pdt_view.pdt?id=" + wish.getPi_id() + "\">";
		int max = wish.getPi_stock();
		if (max == -1)	max = 1000;
		
		
		String imglnk = wish.getPi_img1();
		String imgFolder = imglnk.substring(4,5);

%>	
	
	<tr>
		<td height="100"><input type="checkbox" name="chk" value="<%=idx%>" checked="checked" onclick="choose(this);"  /></td>
		<td width="150"><a href="product_detail.pdt?cpage=1&psize=20&id=<%=wish.getPi_id() %>" ><img src="/inMyGarden/product/img/<%=imgFolder %>/<%=imglnk %>" width="100" height="100" alt="상품 이미지" /></a></td>
		<td align=left><a href="product_detail.pdt?cpage=1&psize=20&id=<%=wish.getPi_id() %>" ><%=wish.getPi_name() %><br />( <%=wish.getOw_option() %> )</a></td>
		<td id="btnOption" style="position:relative;"><%=wish.getOw_cnt() %><br /><br /><input type="button" class="btn" value="옵션/수량변경" style="z-index:1;"  onclick="showOption(<%=idx %>);" />


		<!-- 옵션/수량변경 폼  시작 -->
<div id="d_option<%=idx %>" style="border:1px solid black; width:440px; padding:10px 20px 10px 20px; position:absolute; left:-200px; top:-150px; background:white; display:none; z-index:5;" >
	<h4>옵션선택 (옵션/수량변경 폼)</h4>
	<hr style="width:440px;" />
	<table width="440" height="350" class="t_selectOpt" align="center" style="table-layout: fixed; " >
		<tr >
			<td rowspan="2" width="40%" valign="top" style="border:none;" >
				<img src="/inMyGarden/product/img/<%=imgFolder %>/<%=imglnk %>" width="100" height="100" width="100" height="100" /></td>
			<td height="50" style="border:none; text-align:left;"><%=wish.getPi_name() %></td>
		</tr>
		<tr height="50" >
			<td style="border:none;">옵션
				<select name="opt" id="owopt<%=idx%>" onchange="changeOpt(<%=idx%>, this.value);">
<%		
	String[] arrOpt = wish.getPi_option().split(";");
	for (int j = 0 ; j < arrOpt.length ; j++) {
		String slt = "";
		if (wish.getOw_option().equals(arrOpt[j]))	slt = " selected='selected'";
		out.println("<option value='" + arrOpt[j] + "'" + slt + ">" + arrOpt[j] + "</option>");
	}
%>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="border:none;" >
			<hr style="width:440px;" />
		
		
		<!--  선택된 옵션 및 수량 시작 -->
		<div  style=" margin:0 auto; padding:0px; width:440px; background:whitesmoke; text-align:center;">
			<table width="440" style="all:unset; table-layout: fixed;"  >
				<tr>
					<td width="250" height="50" style="border:none;  padding:10px 0 10px 0;" ><%=wish.getPi_name() %><br />( <span id="optSpan<%=idx%>"><%=wish.getOw_option() %></span> )</td>
					<td width="110" style="border:none;" >
					 	수량
						<input type="button" class="btn" value="-" onclick="changeCnt(<%=idx%>,-1,<%=wish.getPi_price()%>);"/>
						<span id="owcnt<%=idx%>"><%=wish.getOw_cnt() %></span>
						<input type="button" class="btn" value="+" onclick="changeCnt(<%=idx%>,1,<%=wish.getPi_price()%>);"/>
					</td >
					<td width="80" style="border:none;" >
					<span id="priceSpan<%=idx%>"><%=wish.getPi_price() * wish.getOw_cnt() %></span>원 <input type="button" class="btn" value="x" onclick="clearCart(<%=idx%>);" />
					</td>
				</tr>
			</table>
		</div>
		<hr style="width:440px;" />
		<!-- 선택된 옵션 및 수량 종료 -->
		
		
		</td></tr>
		<tr>
			<td colspan="2"  align="center" valign="top" style="border:none;" >
			<input type="button" class="btn btnLeft" value="취소" onclick="hideOption(<%=idx %>);" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" class="btn btnLeft" value="확인" onclick="changeTotal(<%=idx %>,'<%=wish.getPi_id()%>')"/></td>
		</tr>
	</table>
</div>
<!-- 옵션/수량변경 폼  종료 -->
<%
int savePoint = (int)Math.floor(wish.getPi_price() * wish.getOw_cnt() /200) * 10; 
// // 적립금 1원단위 절삭
%>
		</td>
		<td><%=wish.getPi_price() %>원</td>
		<td>적립 + <%=savePoint %>원</td>
		<td><%=wish.getPi_price() * wish.getOw_cnt()%> 원</td>
	</tr>

<%
	total += wish.getPi_price() * wish.getOw_cnt();
	}
} else {	// 찜리스트가 비었으면
	out.println("<td colspan='7' height='100'>찜리스트에 담겨있는 상품이 없습니다.</td>");
}
%>
</table>
<!-- 찜리스트 상품정보 테이블 종료 -->
<br />
<!-- 선택 버튼 시작  -->
<table width="800">
	<tr>
	<td align="left">
		<input type="button" class="btn btnLeft"  name="chkDel" value="선택 상품 삭제" onclick="clearCart(-1);" />
		<input type="button" class="btn btnLeft" name="chkCart" value="선택 상품 장바구니" style="width:130px;" onclick="goCart();"/>
	</td>
	</tr>
</table>
<!-- 선택 버튼 종료  -->
</form>
</div>
</div>

<br /><br /><br /><br /><br /><br />
<%@ include file="../inc_footer.jsp" %>
</body>
</html>








