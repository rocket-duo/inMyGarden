<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ include file="../inc_header.jsp" %>
<%
request.setCharacterEncoding("utf-8");
ProductInfo pdtInfo = (ProductInfo)request.getAttribute("pdtInfo");
/* if (pdtInfo == null) {
	out.println("<script>");
	out.println("alert('잘못된 경로로 들어오셨습니다.');");
	out.println("history.back();");
	out.println("</script>");
	out.close();
} */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" type="text/css" href="/inMyGarden/css/default.css?ver0.1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.btn { background:lightgray; border:1px solid black; margin:0px; cursor:pointer; }
.btn:hover { background:whiteSmoke; }
.btn:active { background:gray; }
.btnLeft { width:100px; height:30px; }
.btnRight { width:200px; height:60px; }


/* 상품이미지 */
#d_pdtImg { width:350px; height:400px; padding:20px; }
#d_pdtImg td { padding-top:10px; }

/* 상품 상세정보  */
#d_pdtDetailInfo { padding:20px; text-align:left;}
#t_pdtDetailInfo td { padding:5px 0 5px 0; }

/* 선택된 옵션 및 수량 정보 */
#d_selectOpt { margin:0 auto; width:100%; background:whiteSmoke; text-align:center;}

/* 탭메뉴 */
.d_tabMenu { width:1078px; background:ghostwhite; text-align:center; }
.d_tabMenu ol { display:inline-block; list-style:none; margin:0; padding:0; }
.d_tabMenu li {	padding:20px 30px 20px 30px; border:0; float: left;}

/* 배송안내 */
#d_deliveryGuide { width:800px; text-align:left; margin:0 auto;}
#d_deliveryGuide th { font-size:14px; }
#d_deliveryGuide td { font-size:12px; }
#d_deliveryGuide ul { margin:0px;}

/* 교환/환불 안내 */
#d_exchangeGuide { width:800px; margin:0 auto; }
#t_exchangeGuide { margin:0 auto; }
#t_exchangeGuide th { font-size:20px; }
#t_exchangeGuide td { text-align:left; font-size:16px; }
#d_exchangeGuide span { font-size:16px; }
#d_exchangeGuide ul { display:inline-block;  margin:0; padding:0; }
#d_exchangeGuide li { text-align:left; font-size:12px; 	padding:5px; }
#d_exchangeGuide h4 { margin:0px; }
#d_exchangeGuideInfo { font-size:12px; }
#d_exchangeDeliGuide { width:600px; margin:0 auto; text-align:left }

/* 관련상품 */
#d_relatedPdt { width:1038px; padding:20px; background:whiteSmoke; border:1px solid lightgray;}
#t_relatedPdt { table-layout: fixed; }
#t_relatedPdt td { text-align:center; border:1px solid lightgray; padding-top:20px;}

/* 상품 구매평 */
#t_reviewPdt { border-right:1px soild black; padding:10px 0px 10px 0px; border-collapse: collapse; text-align:center; }
#t_reviewPdt th { background:whiteSmoke; }
#t_reviewPdt th, #t_reviewPdt td {border-bottom:1px solid black; border-top:1px solid black; padding:20px; border-collapse: collapse; }
#t_reviewPdt td { font-size:14px; }

/* 질문과 답변 */
#t_QnApdt { border-right:1px soild black; padding:10px 0px 10px 0px; border-collapse: collapse; text-align:center; }
#t_QnApdt th { background:whiteSmoke; }
#t_QnApdt th, #t_QnApdt td {border-bottom:1px solid black; border-top:1px solid black; padding:20px; border-collapse: collapse; }
#t_QnApdt td { font-size:14px; }

</style>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.0/jquery-ui.min.js"></script>
<script>

// 탭메뉴 스크롤 이동 
jQuery(document).ready(function($) {
$(".scroll").click(function(event){            
event.preventDefault();
$('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
});
});

/* function changeCnt(cnt, ocPrice) {    // 장바구니의 수량을 변경시키는 함수
    var textSpan = document.getElementById("occnt");
    var textCnt = textSpan.innerText;
    var priceSpan = document.getElementById("priceSpan");
    var price = ocPrice;     // 1개의 상품 금액
    textCnt = parseInt(textCnt) + parseInt(cnt);
    priceSpan.innerText = textCnt * price;    // 화면에 보이는 총 금액

    if (textCnt <= 1) {
        textSpan.innerText = "1"
        priceSpan.innerText = ocPrice;
    } else {
        textSpan.innerText = textCnt
    }
} */
function changeCnt(op, pdtcnt, total) {
    var textSpan =  document.getElementById("occntspan");
	var obj2 = document.getElementById("total");
    var textCnt = textSpan.innerText;
    textCnt = parseInt(textCnt) + parseInt(pdtcnt);
    var occnt = document.getElementById("occnt");

    if (textCnt <= 1) {
        textSpan.innerText = "1";
    	obj2.innerText = total;
    	occnt.value = 1;
    } else {
        textSpan.innerText = textCnt
    	obj2.innerText = (textCnt * total);		// 총 구매가 변경
    	occnt.value = textCnt;
    }
	if (obj2.innerText < 50000) {
		delPrice.innerText = 3000;
	} else {
		delPrice.innerText = 0;
	}
	console.log(occnt.value);
}

function cartBuy(chk) {
// 장바구니나 즉시 구매로 이동시키는 함수로 비로그인 시 로그인 폼으로 이동시켜야 함
// 장바구니 : cart_in_proc.ord / 즉시 구매 : order_form.ord
	var lnk = "";
	var ocoption = document.getElementById("ocoption");
	if (ocoption.value == "") {
		alert("옵션을 선택해주세요.");
		ocoption.focus();
		return false;
	} else {
		if (chk == "c")	lnk = "cart_in_proc.ord";
		else if (chk == "d")	lnk = "order_form.ord"; 
		else if (chk == "w")	lnk = "wish_in_proc.ord"; 
	
	
		var frm = document.frmPdt;
		frm.action = lnk;
		frm.submit();
		return true;
	}
}

</script>
</head>
<body>

<div style="width:1080px; margin:0 auto; ">

<!-- 상단 시작(상품이미지, 상품정보) -->
<div style="width:1080px;">
	<!-- 상품 이미지 및 상품 정보 보기 영역 시작 -->
	<table width="100%" cellpadding="5">
	<tr align="center">
	<td width="400" valign="top">
	<!-- 상품이미지 시작 -->
		<div id="d_pdtImg">
			<table width="100%" >
<%
	String imglnk = pdtInfo.getPi_img1();
	String imgFolder = imglnk.substring(4,5);
%> 
			<tr><td align="center" valign="middle">
				<img src="/inMyGarden/product/img/<%=imgFolder %>/<%=imglnk %>" width="300" height="300" border="1" />
			</td></tr>
			<tr>
			<td align="center" valign="middle">
				<img src="/inMyGarden/product/img/<%=imgFolder %>/<%=imglnk %>" width="50" height="50" border="1" />&nbsp;
			<img src="/inMyGarden/product/img/<%=imgFolder %>/<%=imglnk %>" width="50" height="50"  border="1" />&nbsp;
			<img src="/inMyGarden/product/img/<%=imgFolder %>/<%=imglnk %>" width="50" height="50" border="1" />&nbsp;
			</td>
			</tr>
			</table>
		</div>
	<!-- 상품이미지 종료 -->
	</td>
	
	<td width="*" valign="top">
		<form name="frmPdt" method="post" onsubmit="return false;">
		<input type="hidden" name="piid" value="<%=pdtInfo.getPi_id() %>" />
		<input type="hidden" id="occnt" name="occnt" value="1" />
		
		<div id="d_pdtDetailInfo">
			<h4 style="margin:0px;"><%=pdtInfo.getPi_name() %></h4>
			<hr />
			<table width="100%" id="t_pdtDetailInfo" cellpadding="3">
				<tr>
					<th width="35%">판매가</th><td width="*"><%=pdtInfo.getPi_price() %></td>
				</tr>
				<tr>
					<th>할인율</th><td><%=pdtInfo.getPi_discount() %>%</td>
				</tr>
				<tr>
					<th>원산지</th><td><%=pdtInfo.getPi_origin() %></td>
				</tr>
				<tr>
					<th>배송비</th><td><span id="delPrice"><%if (pdtInfo.getPi_price() < 50000) {%>3000<%} else {%>0<%}%></span>원</td>
				</tr>
				<tr>
					<th>수량</th>
					<td>
						<input type="button" class="btn" value="-" onclick="changeCnt(this.value, -1, <%=pdtInfo.getPi_price() %>);"/>
						<span id="occntspan">1</span>
						<input type="button" class="btn" value="+" onclick="changeCnt(this.value, 1, <%=pdtInfo.getPi_price() %>);"/>
					</td>
				</tr>
<%
if (pdtInfo.getPi_option() != null && !pdtInfo.getPi_option().equals("")) {
	String[] arrOpt = pdtInfo.getPi_option().split(";");
%>
				<tr>
				<th>옵션</th>
				<td>
					<select id="ocoption" name="ocoption">
						<option value="">옵션 선택</option>
<%	for (int i = 0 ; i < arrOpt.length ; i++) { %>
						<option value="<%=arrOpt[i]%>"><%=arrOpt[i]%></option>
<%	} %>
					</select>
				</td>
				</tr>
<% } %>
				<tr>
					<td colspan="2">
					<hr />
					<!-- 선택된 옵션 및 수량 시작 -->
					<!-- <div id="d_selectOpt">
						<table width="100%">
							<tr>
								<td colspan="3">선택된 옵션이 없습니다.	</td>
							</tr>
							<tr>
								<td width="*">화분(소/중/대)</td>
								<td width="30%" >
								 	수량
									<input type="button" class="btn" value="-" onclick="changeCnt(this.value);"/>
									<span>1</span>
									<input type="button" class="btn" value="+" onclick="changeCnt(this.value);"/>
								</td>
								<td>
								가격 : 3,500원 <input type="button" class="btn" value="x" />
								</td>
							</tr>
						</table>
					</div>
					<hr /> -->
					<!-- 선택된 옵션 및 수량 종료 -->
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						총 구매가격 : <span id="total"><%=pdtInfo.getPi_price() %></span>원 
						<hr />
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" class="btn btnLeft" value="바로 구매" onclick="return cartBuy('d');"/>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" class="btn btnLeft" value="장바구니" onclick="return cartBuy('c');" />
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" class="btn btnLeft" value="찜리스트" onclick="return cartBuy('w');" />
					</td>
				</tr>
			</table>
		</div>
		</form>
	</td>
	</tr>
	</table>
	<!-- 상품 이미지 및 상품 정보 보기 영역 종료 -->
</div>
	<br /><br />
	<!-- 탭 메뉴 영역 시작 -->
	<div class="d_tabMenu" id="pdtDetailInfo">
	<ol>
		<li><a href="#pdtDetailInfo" class="scroll">상품상세정보</a></li>
		<li><a href="#deliveryGuide" class="scroll">배송안내</a></li>
		<li><a href="#exchangeGuide" class="scroll">교환 및 반품안내</a></li>
		<li><a href="#reviewPdt" class="scroll">상품후기</a></li>
		<li><a href="#QnApdt" class="scroll">상품문의</a></li>
	</ol>
	</div>
	<!-- 탭 메뉴 영역 종료 -->
	
	<br /><br />
	<!-- 상품상세정보 설명이미지 시작 -->
	<div style="width:1080px; text-align:center;">
		<img src="/inMyGarden/product/img/<%=imgFolder %>/<%=pdtInfo.getPi_desc() %>" alt="설명이미지" />
	</div>
	<!-- 상품상세정보 설명이미지 종료 -->
	
	
	<!-- 탭 메뉴 영역 시작 -->
	<div class="d_tabMenu" id="deliveryGuide">
	<ol>
		<li><a href="#pdtDetailInfo" class="scroll">상품상세정보</a></li>
		<li><a href="#deliveryGuide" class="scroll">배송안내</a></li>
		<li><a href="#exchangeGuide" class="scroll">교환 및 반품안내</a></li>
		<li><a href="#reviewPdt" class="scroll">상품후기</a></li>
		<li><a href="#QnApdt" class="scroll">상품문의</a></li>
	</ol>
	</div>
	<!-- 탭 메뉴 영역 종료 -->
	<br /><br />
	
	<!-- 배송안내 시작 -->
	<div id="d_deliveryGuide">
	<table width="800" height="250">
		<tr>
			<th width="15%" height="80" valign="top">
				- 주문 전 확인
			</th>
			<td width="*" valign="top">
			<ul>
				<li>단순 변심으로 이한 반품 및 교환, 수취거부, 3일 이상의 장기 부재, 전화번호 오류, 주소지 불분명, 
				출고 후 주소 변경 등으로 반송되는 경우는 1박스당 왕복 배송비가 부과되므로 주문 전 반드시 다시 한번 확인해 주세요!</li>
			</ul>
			</td>
		</tr>
		<tr>
			<th height="*" valign="top">
			- 배송안내
			</th>
			<td valign="top">
			<ul>
				<li>상품 출고 후 수령까지 평균 배송기간은 1-3일(휴일제외)입니다.</li>
				<li>재고량, 기상악화, 배송지 오기재, 연락불가 등 3-7일 정도 지연될 수 있습니다.</li>
				<li>재고부족, 입고지연 등으로 발송이 지연될 경우 고객님께 별도로 연락을 드리고 있습니다.</li>
				<li>주말 및 공휴일은 발송되지 않습니다.</li>
				<li>배송조회는 상품 발송 후 익일부터 송장번호로 조회 가능합니다.</li>
				<li>제주도/도서산간/기타 섬지역 등은 도선료가 추가 부과되며, 자동결제 또는 개별안내 드리고 있습니다.</li>
				<li>도선료는 박스당 5,000~10,000원 결제가 이뤄지며 미결제 시 임의 취소 또는 배송이 지연될 수 있습니다.</li>
			</ul>
			</td>
		</tr>
	</table>
	</div>
	<!-- 배송안내 종료 -->
	
	<br /><br /><br /><br />
	<!-- 탭 메뉴 영역 시작 -->
	<div class="d_tabMenu" id="exchangeGuide">
	<ol>
		<li><a href="#pdtDetailInfo" class="scroll">상품상세정보</a></li>
		<li><a href="#deliveryGuide" class="scroll">배송안내</a></li>
		<li><a href="#exchangeGuide" class="scroll">교환 및 반품안내</a></li>
		<li><a href="#reviewPdt" class="scroll">상품후기</a></li>
		<li><a href="#QnApdt" class="scroll">상품문의</a></li>
	</ol>
	</div>
	<!-- 탭 메뉴 영역 종료 -->
	<br /><br />
	
	<!--  교환/환불 안내 시작 -->
	<div id="d_exchangeGuide" style="text-align:center;">
		<table width="600" height="100" id="t_exchangeGuide">
			<tr>
				<th rowspan="2" valign="top"><h3>교환/반품</h3></th>
				<td>
				교환 및 반품 택배사 : CJ택배
				</td>
			</tr>
			<tr>
				<td>(11111)경기도 고양시 텃밭 101호</td>
			</tr>
		</table>
		<br />
		<div id="d_exchangeGuideInfo">
			<ul>
				<li><b>상품 수령 후 7일 이내에 신청해 주셔야 합니다.</b></li>
				<li>교환 및 반품을 원하실 경우 반드시 당사에 전화를 주시기 바랍니다.</li>
				<li>통화량이 많아 연결이 어려운 경우 게시판에 문의글을 남겨주세요.</li>
				<li>별도의 연락없이 교환 및 반품을 보내실 경우 확인이 불가능하여 미처리 건으로 처리가 지연될 수 있습니다</li>
				<li>교환의 경우 차액이 생기는 경우는 교환이 불가능합니다.</li>
				<li>
				타 택배 이용 시 추가되는 비용은 고객님 부담입니다.<br>
				(상품불량, 오배송 등 판매자 귀책사유라도 추가 비용은 부담하셔야 합니다.)
				</li>
				<li>반품 접수 시 꼭 반품할 박스 수량을 체크해서 정확하게 말씀해주세요.<br>
				(예 - 초기 3박스 수령 후 1박스만 반품시 수거접수는 1박스로 해야합니다.)
				</li>
				<li>단순 접수 시 전체 박스에 대한 배송비가 청구될 수 있습니다.</li>
			</ul>
		</div>
		<br />
		<div id="d_exchangeDeliGuide">
				<h4>교환 및 반품 시 배송비 안내</h4>
			<ul>
				<li>고객 변심 등 구매자 귀책사유로 인한 교환 및 반품<br>
				1박스 당 왕복 배송비 6,000원을 동봉하여 착불택배로 발송<br>
				펠렛, 베란다 걸이대 등 상품에 따라 반품비는 6,000원 이상 부과될 수 있습니다.
				</li>
				<li>
				상품불량 오배송 등 판매자 귀책사유로 인한 교환 및 반품<br>
				교환 빛 반품 사유를 동봉하여 착불택배로 발송
				</li>
			</ul>
			<br /><br />
				<h4>아래 사유에 해당하는 경우 교환 및 반품이 불가합니다.</h4>
			<ul>
				<li>교환 및 반품접수 기간(수령 후 7일)이 지난 경우</li>
				<li>단순 변심으로 파손의 우려가 있는 제품을 교환 및 반품하려는 경우</li>
				<li>상품의 포장이나 상품자체가 재판매가 어려울 정도로 훼손된 경우</li>
			</ul>
		</div>
	</div>
	<!--  교환/환불 안내 종료 -->
		<br /><br />
	<!-- 관련상품 시작 -->
	<div id="d_relatedPdt">
	<h4 style="margin:0px;">이 상품과 관련된 상품</h4>
	<table width="1040" id="t_relatedPdt" cellspacing="20px">
	<tr><th colspan="5"></th></tr>
		<tr>
			<td width="200" height="200">
				<a href="product_detail.pdt?cpage=1&keyword=&bcata=B2&scata=&sprice=&eprice=&id=pdt_ba01&ord=idd&psize=20"><img src="/inMyGarden/product/img/b/pdt_ba01_1.jpg" width="150" height="150" alt="상품이미지1" /></a><br />
				<a href="product_detail.pdt?cpage=1&keyword=&bcata=B2&scata=&sprice=&eprice=&id=pdt_ba01&ord=idd&psize=20">화분</a>
				<hr style="border:1px solid lightgray;"/>
				3,500원
			</td>
			<td width="200" height="200">
				<a href="product_detail.pdt?cpage=1&keyword=&bcata=B2&scata=&sprice=&eprice=&id=pdt_ba02&ord=idd&psize=20"><img src="/inMyGarden/product/img/b/pdt_ba02_1.jpg" width="150" height="150" alt="상품이미지1" /></a><br />
				<a href="product_detail.pdt?cpage=1&keyword=&bcata=B2&scata=&sprice=&eprice=&id=pdt_ba02&ord=idd&psize=20">화분</a>
				<hr style="border:1px solid lightgray;"/>
				3,500원
			</td>
			<td width="200" height="200">
				<a href="product_detail.pdt?cpage=1&keyword=&bcata=B2&scata=&sprice=&eprice=&id=pdt_ba04&ord=idd&psize=20"><img src="/inMyGarden/product/img/b/pdt_ba04_1.jpg" width="150" height="150" alt="상품이미지1" /></a><br />
				<a href="product_detail.pdt?cpage=1&keyword=&bcata=B2&scata=&sprice=&eprice=&id=pdt_ba04&ord=idd&psize=20">화분</a>
				<hr style="border:1px solid lightgray;"/>
				3,500원
			</td>
			<td width="200" height="200">
				<a href="product_detail.pdt?cpage=1&keyword=&bcata=B2&scata=&sprice=&eprice=&id=pdt_ba05&ord=idd&psize=20"><img src="/inMyGarden/product/img/b/pdt_ba05_1.jpg" width="150" height="150" alt="상품이미지1" /></a><br />
				<a href="product_detail.pdt?cpage=1&keyword=&bcata=B2&scata=&sprice=&eprice=&id=pdt_ba05&ord=idd&psize=20">화분</a>
				<hr style="border:1px solid lightgray;"/>
				3,500원
			</td>
			<td width="200" height="200">
				<a href="product_detail.pdt?cpage=1&keyword=&bcata=B2&scata=&sprice=&eprice=&id=pdt_bb01&ord=idd&psize=20"><img src="/inMyGarden/product/img/b/pdt_bb01_1.jpg" width="150" height="150" alt="상품이미지1" /></a><br />
				<a href="product_detail.pdt?cpage=1&keyword=&bcata=B2&scata=&sprice=&eprice=&id=pdt_bb01&ord=idd&psize=20">화분</a>
				<hr style="border:1px solid lightgray;"/>
				3,500원
			</td>
		</tr>
	</table>
	</div>
	<!-- 관련상품 종료 -->
	<br /><br /><br /><br />

	<!-- 탭 메뉴 영역 시작 -->
	<div class="d_tabMenu" id="reviewPdt">
	<ol>
		<li><a href="#pdtDetailInfo" class="scroll">상품상세정보</a></li>
		<li><a href="#deliveryGuide" class="scroll">배송안내</a></li>
		<li><a href="#exchangeGuide" class="scroll">교환 및 반품안내</a></li>
		<li><a href="#reviewPdt" class="scroll">상품후기</a></li>
		<li><a href="#QnApdt" class="scroll">상품문의</a></li>
	</ol>
	</div>
	<!-- 탭 메뉴 영역 종료 -->
	
	<!-- 상품구매평 시작 -->
	<div id="d_reviewPdt">
		<h4 >상품 구매평</h4>
		<table width="1080" id="t_reviewPdt" >
			<tr height="40">
				<th width="10%">번호</th>
				<th width="*">제목</th>
				<th width="15%">작성자</th>
				<th width="10%">별점</th>
				<th width="15%">작성일</th>
				<th width="10%">조회</th>
			</tr>
			<tr height="60">
				<td>2</td>
				<td><a href="#">화분 너무 이뻐요</a></td>
				<td>고길동</td>
				<td>★★★★★</td>
				<td>2021-06-21</td>
				<td>20</td>
			</tr>
			<tr height="60">
				<td>1</td>
				<td><a href="#">화분 아주 튼튼합니다</a></td>
				<td>홍길동</td>
				<td>★★★★</td>
				<td>2021-06-20</td>
				<td>15</td>
			</tr>
		</table>
    <div style="width:1080px; text-align:right; padding-top:10px; margin:0px;"><input type="button" class="btn btnLeft" value="후기작성"/></div>
   <div style="width:1080px; text-align:center; margin:0px;">
   <a href="#">＜＜</a>   <a href="#">＜ </a>  <a href="#">1</a>   <a href="#">＞</a>  <a href="#">＞＞</a>
    </div>
    
	</div>
	<!-- 상품구매평 종료 -->
	
	<br /><br /><br />

	<!-- 탭 메뉴 영역 시작 -->
	<div class="d_tabMenu" id="QnApdt">
	<ol>
		<li><a href="#pdtDetailInfo" class="scroll">상품상세정보</a></li>
		<li><a href="#deliveryGuide" class="scroll">배송안내</a></li>
		<li><a href="#exchangeGuide" class="scroll">교환 및 반품안내</a></li>
		<li><a href="#reviewPdt" class="scroll">상품후기</a></li>
		<li><a href="#QnApdt" class="scroll">상품문의</a></li>
	</ol>
	</div>
	<!-- 탭 메뉴 영역 종료 -->
	
	<!-- 질문과 답변 시작 -->
	<div id="d_QnApdt">
		<h4 >질문과 답변</h4>
		<table width="1080" id="t_QnApdt" >
			<tr height="40">
				<th width="10%">번호</th>
				<th width="10%">카테고리</th>
				<th width="*">제목</th>
				<th width="15%">작성자</th>
				<th width="10%">별점</th>
				<th width="15%">작성일</th>
				<th width="10%">조회</th>
			</tr>
			<tr height="60">
				<td>2</td>
				<td>주문/결제</td>
				<td><a href="#">상품 재입고 언제되나요?</a></td>
				<td>고길동</td>
				<td>★★★★★</td>
				<td>2021-06-21</td>
				<td>20</td>
			</tr>
			<tr height="60">
				<td>1</td>
				<td>배송관련</td>
				<td><a href="#">배송관련 문의드립니다.</a></td>
				<td>홍길동</td>
				<td>★★★★</td>
				<td>2021-06-20</td>
				<td>15</td>
			</tr>
		</table>
	<div style="width:1080px; text-align:right; padding-top:10px; margin:0px;"><input type="button" class="btn btnLeft" value="질문하기"/></div>
   <div style="width:1080px; text-align:center; margin:0px;">
   <a href="#">＜＜</a>   <a href="#">＜ </a>  <a href="#">1</a>   <a href="#">＞</a>  <a href="#">＞＞</a>
    </div>
    
	</div>
	<!-- 질문과 답변 종료 -->
<br /><br />
<%@ include file="../inc_footer.jsp" %>
</div>
</body>
</html>