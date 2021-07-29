<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%@ include file="../inc_header.jsp" %>
<%
// if (!isLogin) {
//	out.println("<script>");
//	out.println("alert('잘못된 경로로 들어오셨습니다.');");
//	out.println("history.back();");
//	out.println("</script>");
//	out.close();
//}

//ArrayList<CartInfo> cartList = (ArrayList<CartInfo>)request.getAttribute("cartList");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/inMyGarden/css/default.css?ver0.1" />
<link rel="stylesheet" type="text/css" href="/inMyGarden/css/order.css?ver0.1" /> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#btnOption { position:relative; }
</style>
<script src="jquery-3.6.0.js"></script>
<script>
function changeOpt(idx, opt, piid) {
	$.ajax({
		type : "POST", 
		url : "/mvcSite/cart_up_proc.ord", 
		data : {"kind" : "opt", "op" : opt, "idx" : idx, "piid" : piid}, 
		success : function(chkRst) {
			if (chkRst == 0) {	// 옵션 변경에 실패했을 경우
				alert("상품 옵션 변경에 실패했습니다.\n다시 시도해 주십시오.");
			} else {
				location.reload();
			}
		}
	});
}

function changeCnt(op, idx, cnt, max) {	// 장바구니의 수량을 변경시키는 함수
	if (op == "+" && (cnt + 1) > max) {
		alert("재고량(" + max + ")보다 많이 주문할 수 없습니다.");	return;
	} else if (op == '-' && (cnt - 1) < 1) {
		alert("최소 1개는 주문해야 합니다.");	return;
	}

	$.ajax({
		type : "POST", 
		url : "/mvcSite/cart_up_proc.ord", 
		data : {"kind" : "cnt", "op" : op, "idx" : idx, "piid" : ""}, 
		success : function(chkRst) {
			if (chkRst == 0) {	// 수량 변경에 실패했을 경우
				alert("상품 수량 변경에 실패했습니다.\n다시 시도해 주십시오.");
			} else {
				location.reload();
			}
		}
	});
}

function clearCart(kind) {
	var msg = "지정한 상품을 ";	var idx = kind;
	if (kind == -1) {
		msg = "선택한 상품들을 모두 ";
		idx = getSelectedChk();	// 선택된 체크박스의 value들을 받아 옴
		if (idx == "") {
			alert("삭제할 상품을 선택해야 합니다.");	return;
		}
	} else if (kind == 0)	msg = "장바구니안의 모든 상품을 ";

	if (confirm(msg + "삭제하시겠습니까?")) {
		$.ajax({
			type : "POST", 
			url : "/mvcSite/cart_del_proc.ord", 
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
	var arrChk = document.frmCart.chk;
	for (var i = 0 ; i < arrChk.length ; i++) {
		if (arrChk[i].checked)	idx += "," + arrChk[i].value;
	}
	if (idx != "")	idx = idx.substring(1);

	return idx;
}

function chkAll(all) {
	var arrChk = document.frmCart.chk;
	for (var i = 0 ; i < arrChk.length ; i++) {
		arrChk[i].checked = all.checked;
	}
}

function choose(chk) {
	if (!chk.checked) {	// 현재 체크박스를 체크 해제했을 경우
		document.frmCart.all.checked = false;
	}
}

function goOrder(kind) {
	if (kind == "a") {	// 전체 상품 구매하기일 경우
		var arrChk = document.frmCart.chk;
		for (var i = 0 ; i < arrChk.length ; i++)	arrChk[i].checked = true;
		// 모든 체크박스를 체크된 상태로 변경
	}
	document.frmCart.submit();
}

function showOption() {
	var obj = document.getElementById("d_option");
	obj.style.display = "block";
}
function hideOption() {
	var obj = document.getElementById("d_option");
	obj.style.display = "none";
}
</script>
</head>
<body>


<div style="width:1080px; margin:0 auto;">
<form name="frmOrd"  action="order_form.ord" method="post">
<input type="hidden" name="kind" value="cart" />
<a href="">HOME</a> > <a href="">장바구니</a><br /><br />
	<div class="d_order_title">
		<h2 style="display:inline;">장바구니</h2>
		<ol>
		    <li><strong><span>01</span> 장바구니 <span><img src="/inMyGarden/img/right-arrow-240.png" width="13"></span></strong></li>
		    <li><span>02</span> 주문서작성/결제 <span><img src="/inMyGarden/img/right-arrow-240.png"width="13"></span></li>
		    <li><span>03</span> 주문완료</li>
		</ol>
  	</div>
<hr width="1080" /><br /><br />

<!-- 장바구니 상품정보 테이블 시작 -->
<table width="1080" class="t_ordPdtInfo" >
	<tr height="60">
		<th width="10%"><input type="checkbox" name="allcheck" checked="checked" onclick="chkAll(this);" /></th>
		<th width="*" colspan="2">상품/옵션 정보</th>
		<th width="8%">수량</th>
		<th width="10%">상품금액</th>
		<th width="15%">할인/적립</th>
		<th width="15%">합계금액</th>
	</tr>
	<tr>
		<td height="100"><input type="checkbox" name="chk" checked="checked" onclick="choose(this);" /></td>
		<td width="150"><a href="#"><img src="/inMyGarden/product/img/a/pdt_aa01_1.jpg" width="100" height="100" alt="상품 이미지" /></a></td>
		<td align=left>다용도 배양토</td>
		<td id="btnOption">1<br /><br /><input type="button" class="btn" value="옵션/수량변경" onclick="showOption();"/>
		
		<!-- 옵션/수량변경 폼  시작 -->
<div id="d_option" style="border:1px solid black; width:440px; padding:10px 20px 10px 20px; position:absolute; left:-170px; top:-100px; background:white;" >
		<h4>옵션선택 (옵션/수량변경 폼)</h4>
	<hr style="width:440px;" />
	<table width="440" height="350" class="t_selectOpt" align="center" style="table-layout: fixed; " >
		<tr ><td rowspan="2" width="40%" valign="top" style="border:none;" >
				<img src="/inMyGarden/product/img/a/pdt_aa01_1.jpg" width="100" height="100" /></td>
			<td height="50" style="border:none; text-aling:left;">화분(소/중/대)</td>
		</tr>
		<tr height="50" ><td style="border:none;" >옵션
				<select>
					<option>== 옵션선택 ==</option>
				</select>
		</td></tr>
		<tr><td colspan="2" style="border:none;" >
		<hr style="width:440px;" />
		<!--  선택된 옵션 및 수량 시작 -->
		<div  style=" margin:0 auto; padding:0px; width:440px; background:whitesmoke; text-align:center;">
			<table width="440" style="all:unset; table-layout: fixed;"  >
				<tr>
					<td width="220" height="50" style="border:none;  padding:10px 0 10px 0;" >화분(소/중/대)-빨강</td>
					<td width="100" style="border:none;" >
					 	수량
						<input type="button" class="btn" value="-" onclick="changeCnt(this.value);"/>
						<span>1</span>
						<input type="button" class="btn" value="+" onclick="changeCnt(this.value);"/>
					</td >
					<td width="120" style="border:none;" >
					가격 : 3,500원 <input type="button" class="btn" value="x" />
					</td>
				</tr>
			</table>
		</div>
		<hr style="width:440px;" />
		<!-- 선택된 옵션 및 수량 종료 -->
		</td></tr>
		<tr>
			<td colspan="2"  align="center" valign="top" style="border:none;" >
			<input type="button" class="btn btnLeft" value="취소" onclick="hideOption();" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" class="btn btnLeft" value="확인" /></td>
		</tr>
	</table>
</div>
<!-- 옵션/수량변경 폼  종료 -->
		
		</td>
		<td>5000원</td>
		<td>적립 250원</td>
		<td>5000원</td>
	</tr>
</table>
<!-- 장바구니 상품정보 테이블 종료 -->
<br />
<a href="pdt_list.pdt">◁ 쇼핑 계속하기</a>
<br /><br />
<!-- 장바구니 금액정보 테이블 시작 -->
<table width="1080" height="100" id="t_ordPriceInfo" style="text-align:right;">
	<tr >
		<th colspan="3" width="*">총 n개의 상품금액</th>
		<th width="10%">배송비</th>
		<th width="10%'">합계</th>
	</tr>
	<tr>
	<td colspan="3">0원</td>
	<td>0원</td>
	<td>0원</td>
	</tr>

</table>
<!-- 장바구니 금액정보 테이블 종료 -->
<br /><br />

<!-- 선택 버튼 시작  -->
<table width="1080">
	<tr>
	<td align="left">
		<input type="button" class="btn btnLeft"  name="chkDel" value="선택 상품 삭제" />
		<input type="button" class="btn btnLeft" name="chkWish" value="선택 상품 찜" />
		<input type="button" class="btn btnLeft" name="ordSheet" value="견적서 출력" />
	</td>
	<td align="right">
		<input type="button" class="btn btnRight" id="btnChkOrd" name="chkOrd" value="선택 상품 주문" />&nbsp;&nbsp;
		<input type="button" class="btn btnRight" id="btnAllOrd"name="allOrd" value="전체 상품 주문" />
	</td>
	</tr>
</table>

<!-- 선택 버튼 종료  -->
</form>


<br /><br /><br /><br /><br /><br />
<!-- 옵션/수량변경 폼  시작 -->
<div  style="border:1px solid black; width:400px; padding:10px 20px 10px 20px; position:absolute; " >
	<h4>옵션선택 (옵션/수량변경 폼)</h4>
	<hr />
	<table width="400" height="350" align="center">
		<tr ><td rowspan="2" width="40%" valign="top" >
				<img src="/inMyGarden/product/img/a/pdt_aa01_1.jpg" width="100" height="100" /></td>
			<td height="50">화분(소/중/대)</td>
		</tr>
		<tr height="50"><td>옵션
				<select>
					<option>== 옵션선택 ==</option>
				</select>
		</td></tr>
		<tr><td colspan="2">
		<hr />
		<!--  선택된 옵션 및 수량 시작 -->
		<div id="d_selectOpt" style=" margin:0 auto; width:400px; background:whitesmoke; text-align:center; ">
			<table width="400">
				<tr>
					<td width="*">화분(소/중/대)-빨강</td>
					<td width="30%" >
					 	수량
						<input type="button" class="btn" value="-" onclick="changeCnt(this.value);"/>
						<span>1</span>
						<input type="button" class="btn" value="+" onclick="changeCnt(this.value);"/>
					</td >
					<td>
					가격 : 3,500원 <input type="button" class="btn" value="x" />
					</td>
				</tr>
			</table>
		</div>
		<hr />
		<!-- 선택된 옵션 및 수량 종료 -->
		</td></tr>
		<tr>
			<td colspan="2"  align="center" valign="top"><input type="button" class="btn btnLeft" value="취소" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" class="btn btnLeft" value="확인" /></td>
		</tr>
	</table>
</div>
<!-- 옵션/수량변경 폼  종료 -->

<br /><br /><br /><br /><br /><br />


<!-- 견적서 폼 시작 8x13 -->
<div style="width:850px; height:500; padding:20px 50px 20px 50px;" >
<h2>견적서<input type="button" class="btn" value="인쇄하기" style="float:right; padding:10px;" /></h2>
<hr />
<br />
<table width="850" height="100" id="t_receiptInfo" style="text-align:left; padding:20px;" align="center">
	<tr >
		<td>
		견적서
		</td>
	</tr>
	<tr>
		<td>
		※ 견적서에 기재된 판매가는 할인/적립금/배송비가 제외된 금액입니다.<br />실제 주문시, 거래명세서에 기재된 금액과 차이가 날 수 있습니다.
		</td>
	</tr>
</table>
<br />
<table width="800"  border="1" cellspacing="0" style="text-align:center;" align="center">
<tr height="35">
	<th rowspan="6" width="10%">공급자</th>
	<th width="10%" >등록번호</th>
	<td colspan="3" >123-12-12312</td>
	<td colspan="3" rowspan="3">견적일 : 2021년 06월 11일<br /><br />고객명 귀하</td>
</tr>
<tr height="50">
	<th>상호<br />(법인명)</th>
	<td>주식회사<br />나의 작은 텃밭</td>
	<th>성명</th>
	<td>나작텃</td>
</tr>
<tr height="100">
	<th>사업장<br />소재지</th>
	<td colspan="3">서울시 강남구 ~~</td>
</tr>
<tr height="50">
	<th>업 태</th>
	<td>도소매</td>
	<th>종목</th>
	<td>배양토, 무역업</td>
	<td colspan="3" rowspan="3">아래와 같이 견적합니다.</td>
</tr>
<tr height="50">
	<th>연락처</th>
	<td colspan="3">02-0000-0000</td>
</tr>
<tr height="50">
	<th colspan="3">팩스 번호</th>
	<td>02-0000-0001</td>
</tr>
<tr height="35">
	<th>번호</th>
	<th colspan="4">상품명</th>
	<th>판매가</th>
	<th>수량</th>
	<th>상품구매금액</th>
</tr>
<tr height="100">
	<td>1</td>
	<td colspan="4">화분(소/중/대)<br />옵션 : 단품/크기-소(빨강)</td>
	<td>3,500원</td>
	<td>1</td>
	<td>3,500원</td>
</tr>
<tr height="50">
	<th colspan="2">합계</th>
	<td colspan="6">3,500원</td>
</tr>
<tr height="50">
	<th colspan="2">입금계좌</th>
	<td colspan="6">신한은행 111-222-333333 나의작은텃밭</td>
</tr>
</table>
<br />
</div>
</div>
<!-- 견적서 폼 종료  -->


<%@ include file="../inc_footer.jsp" %>
</body>
</html>








