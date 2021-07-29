<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ page import="vo.*" %>
<%@ include file="../inc_header.jsp" %>
<%
OrderInfo order = (OrderInfo)request.getAttribute("order");
ArrayList<OrderInfo> orderDetail = (ArrayList<OrderInfo>)request.getAttribute("orderDetail");

String oiPayment = order.getOi_payment();
if ("a".equals(oiPayment) ) oiPayment = "무통장입금";
if ("b".equals(oiPayment) ) oiPayment = "신용카드";
if ("c".equals(oiPayment) ) oiPayment = "계좌이체";
if ("d".equals(oiPayment) ) oiPayment = "가상계좌";
if ("e".equals(oiPayment) ) oiPayment = "휴대폰결제";



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/inMyGarden/css/default.css?ver0.1" />
<link rel="stylesheet" type="text/css" href="/inMyGarden/css/order.css?ver0.1" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


</head>
<body>

<div style="width:1080px; margin:0 auto;">
<form name="ftmOrd"  action="" method="get">
<a href="">HOME</a><br /><br />
	<div class="d_order_title">
        <h2 style="display:inline;">주문완료</h2>
	    <ol>
	        <li><span>01</span> 장바구니 <span><img src="/inMyGarden/img/right-arrow-240.png" width="13"></span></li>
	        <li><span>02</span> 주문서작성/결제<span><img src="/inMyGarden/img/right-arrow-240.png" width="13"></span></li>
	        <li><strong><span>03</span> 주문완료</strong></li>
	    </ol>
    </div>
<hr width="1080" /><br />
	<div align="center">
		<img src="/inMyGarden/img/order_ok.png" width="80" alt="결제완료 이미지"/><br /><br />
		결제가 완료되었습니다.<br />
		감사합니다.
	</div>
<br />
<hr width="1080" />
<h3>주문요약정보</h3>

<!-- 주문요약정보 시작 -->
<table width="1080" id="t_orderView">
	<tr>
		<th width="30%">결제수단</th>
		<td><%=oiPayment %><br /><%=order.getOi_totalpay() %> 원</td>
	</tr>
	<tr>
		<th>주문번호</th>
		<td><%=order.getOi_id() %></td>
	</tr>
	
	<tr>
		<th>주문일자</th>
		<td><%=order.getOi_date() %></td>
	</tr>
	<tr>
		<th>주문상품</th>
		<td>
		<%
		String odPdtname = "";
		if (orderDetail != null && orderDetail.size() > 0) {
		for (int i = 0 ; i < orderDetail.size() ; i++) {
			OrderInfo ord = orderDetail.get(i);
			odPdtname +=", " +ord.getOd_pdtname() + "(" + ord.getOd_cnt() + "개)";
		}
		odPdtname = odPdtname.substring(2);
		}
		%>
		<%=odPdtname %>
		</td>
	</tr>
	<tr>
		<th>주문자명</th>
		<td><%=order.getOi_name() %></td>
	</tr>
	<tr>
		<th>배송정보</th>
		<td>
		<ol>
			<li><%=order.getOi_receiver() %></li>
			<li>[<%=order.getOi_zip() %>]</li> 
			<li><%=order.getOi_addr1() %> <%=order.getOi_addr2() %></li>
			<li>//<%=order.getOi_recphone() %></li>
			<li>남기실 말씀 : <%=order.getOi_cmt() %></li>
		</ol>
		</td>
	</tr>
	<tr>
		<th>상품금액</th>
		<td><%=order.getOi_pay() %> 원</td>
	</tr>
	<tr>
		<th>배송비</th>
		<td><%=order.getOi_delipay() %> 원</td>
	</tr>
	<tr>
		<th>사용 적립금</th>
		<td><%=order.getOi_usepnt() %> 원</td>
	</tr>
	<tr>
		<th rowspan="2">할인 및 적립</th>
		<td>할인 : (-) 0원</td>
	</tr>
	<tr>
		<td>적립 : (+) <%=order.getOd_savepnt() %>원</td>
	</tr>
	<tr>
		<th>총 결제금액</th>
		<td><%=order.getOi_totalpay() %>원</td>
	</tr>
</table>
<br /><br />
<div align="center">
<input type="button" class="btn btnLeft" value="확인" onclick="location.href='/inMyGarden/order_list.ord';"/>
</div>
<!-- 주문요약정보 종료 -->
<br /><br />
<hr width="1080" />
<br /><br />
</form>
</div>

<%@ include file="../inc_footer.jsp" %>
</body>
</html>