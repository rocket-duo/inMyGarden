<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc_header.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%
if (loginMember == null) {
	out.println("<script>");
	out.println("alert('잘못된 경로로 들어오셨습니다.');");
	out.println("history.back();");
	out.println("</script>");
	out.close();
}

OrderInfo orderInfo = (OrderInfo)request.getAttribute("orderInfo");
ArrayList<OrderInfo> orderList = (ArrayList<OrderInfo>)request.getAttribute("orderList");

String oistatus = orderInfo.getOi_status();
String oipayment = orderInfo.getOi_payment();

if ("a".equals(oistatus)) oistatus = "입금대기";
if ("b".equals(oistatus)) oistatus = "상품준비중";
if ("c".equals(oistatus)) oistatus = "배송중";
if ("d".equals(oistatus)) oistatus = "배송완료";
if ("e".equals(oistatus)) oistatus = "구매확정";

if ("a".equals(oipayment)) oipayment = "무통장입금";
if ("b".equals(oipayment)) oipayment = "신용카드";
if ("c".equals(oipayment)) oipayment = "계좌이체";
if ("d".equals(oipayment)) oipayment = "가상계좌";
if ("e".equals(oipayment)) oipayment = "휴대폰결제";

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

<br /><br />

<div style="width:1080px; margin:0 auto;">
<form name="ftmOrd"  action="" method="get">
<a href="#">HOME</a> > <a href="#">마이페이지</a> > 주문상세<br /><br />
<hr width="1080" />
<h3 style="display:inline-block;">주문상세정보</h3> <a href="#">(<%=orderInfo.getOi_id() %>)</a><br />
<!-- 주문상세정보 테이블 시작 -->
<table width="1080" id="t_ordDetailInfo"  >
	<tr>
		<th width="20%">날짜/주문번호</th>
		<th width="*" colspan="2">상품/옵션정보</th>
		<th width="10%">상품금액/수량</th>
		<th width="10%">주문상태</th>
		<th width="10%">확인/리뷰</th>
	</tr>
<%
int total = 0;	// 총 구매가격을 누적할 변수
if (orderList != null && orderList.size() > 0) {	
	
	for (int i = 0 ; i < orderList.size() ; i++) {
		OrderInfo order = orderList.get(i);
		String lnk = "<a href=\"product_detail.pdt?id=" + order.getPi_id() + "\">";
		
		
		String imglnk = order.getOd_pdtimg();
		String imgFolder = imglnk.substring(4,5);
		total += order.getOd_pdtprice() * order.getOd_cnt();
		
		String odpdtname = order.getOd_pdtname();
		if (odpdtname.length() > 15) {
			odpdtname = odpdtname.substring(0, 15) + "...";
		}
		String odpdtoption = order.getOd_option();
		if (odpdtoption.length() > 15) {
			odpdtoption = odpdtoption.substring(0, 15) + "...";
		}
%>		
	<tr>
		<td><%=orderInfo.getOi_date().substring(0,10) %><br /><a href="#"><%=orderInfo.getOi_id() %></a></td>
		<td width="100">
			<a href="product_detail.pdt?cpage=1&psize=20&id=<%=order.getPi_id() %>" ><img src="/inMyGarden/product/img/<%=imgFolder %>/<%=imglnk %>" width="100" height="100" alt="상품 이미지" /></a>
		</td>
		<td style="margin:0px; padding:0px; text-align:left">
			<a href="product_detail.pdt?cpage=1&psize=20&id=<%=order.getPi_id() %>" ><%=odpdtname %></a><br />( <%=odpdtoption %> )
		</td>
		<td><%=order.getOd_pdtprice() %> 원 / <%=order.getOd_cnt() %> 개</td>
		<td><%=oistatus %><br />
		
<%
if(!"입금대기".equals(oistatus) && !"상품준비중".equals(oistatus) ) {
%>
			<br />
			<input type="button" class="btn btnLeft" value="배송조회" />
<%
}
%>
		</td>
		<td>
<% 
if (!"입금대기".equals(oistatus) && !"상품준비중".equals(oistatus) && !"배송중".equals(oistatus) ) {
%>
			<input type="button" class="btn btnLeft" value="구매확정" /><br /><br />
			<input type="button" class="btn btnLeft" value="후기작성" />
<%
}
%>
		</td>
	</tr>
<%
	}
}
%>
</table>
<!-- 주문상세정보 테이블 종료 -->

<br />

<!-- 주문자 정보 테이블 시작 -->
<h3>주문자 정보</h3>

<table width="1080"   id="t_ordererInfo" >
	<tr>
		<th width="30%" height="30">주문자</th><td width="*"><%=orderInfo.getOi_name() %></td>
	</tr>
	<tr>
		<th height="30">휴대폰 번호</th><td><%=orderInfo.getOi_phone() %></td>
	</tr>
	<tr>
		<th height="30">이메일</th>
		<td>
			<%=orderInfo.getOi_email() %>
		</td>
	</tr>
</table>
<!-- 주문자 정보 테이블 종료 -->

<br /><br />

<!-- 배송 정보 테이블 시작 -->
<h3>배송 정보</h3>

<table width="1080" id="t_addrInfo" >
	<tr>
		<th width="30%" height="30" >■받으실 분</th><td><%=orderInfo.getOi_receiver() %></td>
	</tr>
	<tr>
		<th height="30">■받으실 곳</th>
		<td>[<%=orderInfo.getOi_zip() %>] <%=orderInfo.getOi_addr1() %> <%=orderInfo.getOi_addr2() %></td>
	</tr>
	<tr>
		<th height="30">■휴대폰 번호</th>
		<td>
			<%=orderInfo.getOi_recphone() %>
		</td>
	</tr>
	<tr>
		<th height="30">남기실 말씀(메모)</th>
		<td><%=orderInfo.getOi_cmt() %></td>
	</tr>
</table>
<!-- 배송 정보 테이블 종료 -->
<br /><br />
<!-- 결제 정보 테이블 시작 -->
<h3>결제 정보</h3>
<%
int totalSavePoint = (int)Math.floor(total / 200) * 10;
%>
<table width="1080"  id="t_payInfo" >
	<tr>
		<th width="30%" height="30">결제수단</th>
		<td><%=oipayment %></td>
	</tr>
	<tr>
		<th  height="30">상품 합계 금액</th><td width="*"><%=orderInfo.getOi_pay() %> 원</td>
	</tr>
	<tr>
		<th height="30">배송비</th><td><%=orderInfo.getOi_delipay() %> 원</td>
	</tr>
	<tr>
		<th height="30">사용 적립금</th>
		<td><%=orderInfo.getOi_usepnt() %>원</td>
	</tr>
	<tr>
		<th rowspan="2" height="30">할인 및 적립</th><td>할인 : (-) 0원</td>
	</tr>
	<tr>
		<td>적립 : (+) <%=totalSavePoint %>원</td>
	</tr>
	<tr>
		<th height="30">최종 결제금액</th>
		<td>
			<%=orderInfo.getOi_totalpay() %>원
		</td>
	</tr>
</table>
<!-- 결제 정보 테이블 종료 -->
</form>
</div>
<br /><br />
<%@ include file="../inc_footer.jsp" %>
<br /><br /><br /><br /><br />
</body>
</html>








