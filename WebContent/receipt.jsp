<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%
MemberInfo loginMember = (MemberInfo)session.getAttribute("loginMember");
if (loginMember == null) {
	out.println("<script>");
	out.println("alert('잘못된 경로로 들어오셨습니다.');");
	out.println("history.back();");
	out.println("</script>");
	out.close();
}

ArrayList<CartInfo> receiptList = (ArrayList<CartInfo>)request.getAttribute("receiptList");


//견적서 오늘 날짜 구하기위해 인스턴스 생성
Calendar cal = Calendar.getInstance();

%>





<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/inMyGarden/css/order.css?ver0.1" /> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 견적서 폼 시작 8x13 -->
<div id="d_receiptInfo" style="width:850px; padding:20px 50px 20px 50px;" >
<h2>견적서<input type="button" class="btn" value="인쇄하기" style="float:right; padding:10px;" onclick="window.print()" /></h2>
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
		<td colspan="3" rowspan="3" style="font-size:15px; padding:15px;" valign="bottom">
		견적일 : <%= cal.get(Calendar.YEAR) %> 년 <%= cal.get(Calendar.MONTH)+1 %> 월 <%= cal.get(Calendar.DATE) %> 일
		
<br /><br /><br /> <%=loginMember.getMi_name() %><span style="float:right;">귀하</span></td>
	</tr>
	<tr height="50">
		<th>상호<br />(법인명)</th>
		<td>주식회사<br />나의 작은 텃밭</td>
		<th>성명</th>
		<td>나작텃</td>
	</tr>
	<tr height="100">
		<th>사업장<br />소재지</th>
		<td colspan="3">서울시 강남구 나의 작은 텃밭 101호</td>
	</tr>
	<tr height="50">
		<th>업 태</th>
		<td>도소매</td>
		<th>종목</th>
		<td>배양토, 무역업</td>
		<td colspan="3" rowspan="3" style="font-size:15px;">아래와 같이 견적합니다.</td>
	</tr>
	<tr height="50">
		<th>연락처</th>
		<td colspan="3">02-1234-5678</td>
	</tr>
	<tr height="50">
		<th colspan="3">팩스 번호</th>
		<td>02-1234-5679</td>
	</tr>
	<tr height="35">
		<th>번호</th>
		<th colspan="4">상품명</th>
		<th>판매가</th>
		<th>수량</th>
		<th>상품구매금액</th>
	</tr>
	
<%
int total = 0;	// 총 구매가격을 누적할 변수
if (receiptList != null && receiptList.size() > 0) {	// 장바구니에 상품이 들어 있으면
	
	for (int i = 0 ; i < receiptList.size() ; i++) {
		CartInfo receipt = receiptList.get(i);
		int idx = receipt.getOc_idx();	// 카트 인덱스번호
		String lnk = "<a href=\"pdt_view.pdt?id=" + receipt.getPi_id() + "\">";
		int max = receipt.getPi_stock();
		if (max == -1)	max = 1000;
		
		
		String imglnk = receipt.getPi_img1();
		String imgFolder = imglnk.substring(4,5);

%>	
	
	<tr height="80">
		<td><%=i + 1%></td>
		<td colspan="4"><%=receipt.getPi_name() %><br />옵션 : <%=receipt.getOc_option() %></td>
		<td><%=receipt.getPi_price() %>원</td>
		<td><%=receipt.getOc_cnt() %>개</td>
		<td><%=receipt.getPi_price() * receipt.getOc_cnt()  %>원</td>
<%
	total += receipt.getPi_price() * receipt.getOc_cnt();
	}
} else {	// 장바구니가 비었으면
	out.println("<td colspan='7' height='100'>장바구니가 비었습니다.</td>");
}
%>
	</tr>
	<tr height="50">
		<th colspan="2">합계</th>
		<td colspan="6"><%=total %>원</td>
	</tr>
	<tr height="50">
		<th colspan="2">입금계좌</th>
		<td colspan="6">신한은행 111-222-333333 나의작은텃밭</td>
	</tr>
</table>
<br />
</div>
<!-- 견적서 폼 종료  -->

</body>
</html>