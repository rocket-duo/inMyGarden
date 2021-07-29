<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="../inc_header.jsp" %>
<%
if (loginMember == null) {
	out.println("<script>");
	out.println("alert('잘못된 경로로 들어오셨습니다.');");
	out.println("history.back();");
	out.println("</script>");
	out.close();
}

ArrayList<OrderInfo> orderList = (ArrayList<OrderInfo>)request.getAttribute("orderList");
OrderPageInfo pageInfo = (OrderPageInfo)request.getAttribute("pageInfo");

String args = "", schargs = "";
// 검색관련 쿼리스트링 제작
if 	(pageInfo.getOistatus() == null) schargs += "&oistatus=";
else		schargs += "&oistatus=" + pageInfo.getOistatus();
if (pageInfo.getSdate() == null) schargs += "&sdate=";
else		schargs += "&sdate=" + pageInfo.getSdate();

if (pageInfo.getEdate() == null) schargs += "&edate=" ;
else		schargs += "&edate=" + pageInfo.getEdate();
args = "?cpage=" + pageInfo.getCpage() + schargs;


// 날짜 관련 계산
Calendar cal = Calendar.getInstance();
SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
String today = date.format(cal.getTime());
	cal.add(Calendar.DATE, -7);
String week = date.format(cal.getTime());
	cal.add(Calendar.DATE, -8);
String twoWeek = date.format(cal.getTime());
	cal.add(Calendar.DATE, -15);
String month = date.format(cal.getTime());
	cal.add(Calendar.DATE, -60);
String threeMonth = date.format(cal.getTime());
	cal.add(Calendar.DATE, -275);
String year = date.format(cal.getTime());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/default.css" />
<title>나의작은텃밭</title>
<style>
a { color:#000; }
a:link { text-decoration: none; color:#000; }
a:visited { color:#000; }
a:hover { color:red; }
a:active { color:blue; }
table th { font-size:13px; }
table td { font-size:14px; background:white; }
input[type=text]{ height:20px; }

.btn { background:lightgray; border:1px solid black; margin:0px; cursor:pointer; }
.btn:hover { background:whiteSmoke; }
.btn:active { background:gray; }
.btnLeft { width:100px; height:30px; }
.btnRight { width:200px; height:60px; }

#t_myOrdList th{background:whitesmoke;border-top:1px solid black; border-bottom:1px solid black; border-collapse:collapse;  }
#t_myOrdList td{ border-bottom:1px solid black;   border-collapse:collapse; }

</style>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script> 
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script> 
<script>
$(function() {
	$.datepicker.regional['ko'] = {
		closeText: '닫기',
		prevText: '이전달',
		nextText: '다음달',
		currentText: '오늘',
		monthNames: ['1월','2월','3월','4월','5월','6월',
		'7월','8월','9월','10월','11월','12월'],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월',
		'7월','8월','9월','10월','11월','12월'],
		dayNames: ['일','월','화','수','목','금','토'],
		dayNamesShort: ['일','월','화','수','목','금','토'],
		dayNamesMin: ['일','월','화','수','목','금','토'],
		//buttonImage: "/images/kr/create/btn_calendar.gif",
		buttonImageOnly: true,
		// showOn :"both",
		weekHeader: 'Wk',
		dateFormat: 'yy-mm-dd',
		firstDay: 0,
		isRTL: false,
		duration:200,
		showAnim:'show',
		showMonthAfterYear: false
		// yearSuffix: '년'
	};
	$.datepicker.setDefaults($.datepicker.regional['ko']);

	$( "#sdate" ).datepicker({
		//defaultDate: "+1w",
		changeMonth: true,
		//numberOfMonths: 3,
		dateFormat:"yy-mm-dd",
		onClose: function( selectedDate ) {
			//$( "#eday" ).datepicker( "option", "minDate", selectedDate );
		}
	});
	$( "#edate" ).datepicker({
		//defaultDate: "+1w",
		changeMonth: true,
		//numberOfMonths: 3,
		dateFormat:"yy-mm-dd",
		onClose: function( selectedDate ) {
			//$( "#sday" ).datepicker( "option", "maxDate", selectedDate );
		}
	});
});


// 날짜를 yyyy-mm-dd 형식으로 만들어 줌.
function date_mask(objValue) {
 var v = objValue.replace("--", "-");

    if (v.match(/^\d{4}$/) !== null) {
        v = v + '-';
    } else if (v.match(/^\d{4}\-\d{2}$/) !== null) {
        v = v + '-';
    }
 
    return v;
}

function changeDate(type, today, date) {
	if (type == "a") {
		document.getElementById("sdate").value = today;
		document.getElementById("edate").value = today;
	} else if (type == "b") {
		document.getElementById("sdate").value = date;
		document.getElementById("edate").value = today;
	} else if (type == "c") {
		document.getElementById("sdate").value = date;
		document.getElementById("edate").value = today;
	} else if (type == "d") {
		document.getElementById("sdate").value = date;
		document.getElementById("edate").value = today;
	} else if (type == "e") {
		document.getElementById("sdate").value = date;
		document.getElementById("edate").value = today;
	} else if (type == "f") {
		document.getElementById("sdate").value = date;
		document.getElementById("edate").value = today;
	}
}
</script>
</head>
<body>
<form name="frmOrd" method="get" >
<input type="hidden" name="psize" value="<%=pageInfo.getPsize() %>" />
<div style="width:1080px; margin:0 auto;">
<%@ include file="inc_my_page_side_menu.jsp" %>
<div id="shop" style="width:800px;  display:inline-block;" > 
<h2 >마이 쇼핑</h2>
<div style="width:400px;background-image:url(/inMyGarden/img/my_shop_bar_open.png); width:390px; height:30px; text-align:center; display:inline-block; color:white;">주문 목록/배송 조회 (<%=pageInfo.getRcnt() %>)</div>
<div style="width:400px;background-image:url(/inMyGarden/img/my_shop_bar_close.png); width:390px; height:30px; text-align:center; display:inline-block;">취소/반품/교환 내역(0)</div>	<br/>
<br />
	<div style="width:800px;display:inline-block; text-align:center;">
		<select name="oistatus">
			<option value="">- 주문상태 -</option>
			<option value="a">입금대기</option>
			<option value="b">상품준비중</option>
			<option value="c">배송중</option>
			<option value="d">배송완료</option>
			<option value="e">구매확정</option>
		</select>
		<div style="width:500px; display:inline;" >
				<input type="button" class="btn" style="margin:1px;" value="오늘" onclick="changeDate('a','<%=today %>', '');" /><input type="button" class="btn" style="margin:1px;" value="7일" onclick="changeDate('b','<%=today %>', '<%=week %>');"/><input type="button" class="btn" style="margin:1px;" value="15일" onclick="changeDate('c','<%=today %>', '<%=twoWeek%>');"/><input type="button" class="btn" style="margin:1px;" value="1개월" onclick="changeDate('d','<%=today %>', '<%=month%>');"/><input type="button" class="btn" style="margin:1px;" value="3개월" onclick="changeDate('e','<%=today %>', '<%=threeMonth%>');"/><input type="button" class="btn" style="margin:1px;" value="1년" onclick="changeDate('f','<%=today %>', '<%=year%>');"/>
			</div>
		<input type="text" name="sdate" id="sdate" size="10" class="ipt" maxlength="10" onkeyup="this.value = date_mask(this.value)" /> ~
		<input type="text" name="edate" id="edate" size="10" class="ipt" maxlength="10" onkeyup="this.value = date_mask(this.value)"/>
		<input type="submit" value="조회"/>
	</div>
<br /><br />
	<div style="text-align:center;">
		<table id="t_myOrdList" cellspacing="0" width="800" height="300" >
			<tr >
				<th width="110" height="50">날짜/주문번호</th>
				<th colspan="2">상품/옵션정보</th>
				<th width="115">상품금액/수량</th>
				<th width="70">총 결제금액</th>
				<th width="95">주문상태</th>
				<th width="65">확인/리뷰</th>
			</tr>
			
<%
if (orderList != null && orderList.size() > 0) {	// 주문내역이 있으면
	
	for (int i = 0 ; i < orderList.size() ; i++) {
		OrderInfo order = orderList.get(i);
		int idx = order.getOd_idx();	// 주문내역 인덱스번호
		String lnk = "<a href=\"order_detail.ord"+ args + "&id=" + order.getOi_id() + "&psize=" + pageInfo.getPsize() + "\">";
		
		String imglnk = order.getOd_pdtimg();
		String imgFolder = imglnk.substring(4,5);
		String oistatus = order.getOi_status();
		if ("a".equals(oistatus)) oistatus = "입금대기";
		if ("b".equals(oistatus)) oistatus = "상품준비중";
		if ("c".equals(oistatus)) oistatus = "배송중";
		if ("d".equals(oistatus)) oistatus = "배송완료";
		if ("e".equals(oistatus)) oistatus = "구매확정";
%>
			<tr>
				<td height="130"><%=order.getOi_date().substring(0,10) %><br/><%=lnk %><%=order.getOi_id() %></a></td>
				<td width="100">
				<a href="product_detail.pdt?cpage=1&psize=20&id=<%=order.getPi_id() %>" >
				<img src="/inMyGarden/product/img/<%=imgFolder %>/<%=imglnk %>" width="100px" height="100px"/></a></td><td align="left">
				<a href="product_detail.pdt?cpage=1&psize=20&id=<%=order.getPi_id() %>" ><%=order.getOd_pdtname() %><br/>( <%=order.getOd_option() %> )</a></td>
				<td><%=order.getOd_pdtprice() %>원 / <%=order.getOd_cnt() %>개</td>
				<td><%=order.getOd_pdtprice() * order.getOd_cnt() %>원</td>
				<td><%=oistatus %>
<% 
if (!"입금대기".equals(oistatus) && !"상품준비중".equals(oistatus) ) {
%>
					<br/><br/>
					<input type="button" class="btn" value="배송조회"/>
<%
}

%>
				</td>
				<td style="line-height:2;">
<% 
if (!"입금대기".equals(oistatus) && !"상품준비중".equals(oistatus) && !"배송중".equals(oistatus) ) {
%>
					<input type="button" class="btn" value="구매확정"/><br/><br/>
					<input type="button" class="btn" value="리뷰쓰기"/>
<%
}
%>
				</td>
			</tr>
<%
	}
} else {
%>
			<tr>
				<td colspan="6" height="100">조회된 내역이 없습니다.</td>
			</tr>
<%
}
%>
		</table>
		<br />
<%
if (orderList != null && orderList.size() > 0) {
	args = "?psize=" + pageInfo.getPsize() + schargs;

	out.println("<p style=\"width:800px;\" align=\"center\">");

	if (pageInfo.getCpage() == 1) {	// 현재 페이지 번호가 1이면
		out.println("<img src='/inMyGarden/img/left-arrow-240.png' width='12' /><img src='/inMyGarden/img/left-arrow-240.png' width='12' />&nbsp;&nbsp;<img src='/inMyGarden/img/left-arrow-240.png' width='12' />&nbsp;&nbsp;");
	} else {
		out.print("<a href='order_list.ord" + args + "&cpage=1" + "'>");
		out.println("<img src='/inMyGarden/img/left-arrow-240.png' width='12' /><img src='/inMyGarden/img/left-arrow-240.png' width='12' /></a>&nbsp;&nbsp;");
		out.print("<a href='order_list.ord" + args + 
			"&cpage=" + (pageInfo.getCpage() - 1) + "'>");
		out.println("<img src='/inMyGarden/img/left-arrow-240.png' width='12' /></a>&nbsp;&nbsp;");
	} // 첫 페이지와 이전 페이지 링크

	for (int i = 1, k = pageInfo.getSpage() ; i <= pageInfo.getBsize() && k <= pageInfo.getEpage() ; i++, k++) {
	// i : 루프돌릴 횟수를 검사하는 용도의 변수, k : 페이지 번호 출력용 변수
	// 조건 : bsize만큼 루프를 도는데 페이지가 마지막 페이지일 경우 bsize보다 작아도 멈춤
		if (pageInfo.getCpage() == k) {	// 현재 페이지 번호일 경우 링크없이 강조만 함
			out.print("&nbsp;<strong>" + k + "</strong>&nbsp;");
		} else {
			out.print("&nbsp;<a href='order_list.ord" + args + "&cpage=" + k + "'>");
			out.print(k + "</a>&nbsp;");
		}
	}

	if (pageInfo.getCpage() == pageInfo.getPcnt()) {	// 현재 페이지번호가 마지막 페이지 번호이면
		out.println("&nbsp;&nbsp;<img src='/inMyGarden/img/right-arrow-240.png' width='12' />&nbsp;&nbsp;<img src='/inMyGarden/img/right-arrow-240.png' width='12' /><img src='/inMyGarden/img/right-arrow-240.png' width='12' />");
	} else {
		out.println("&nbsp;&nbsp;<a href='order_list.ord" + args + "&cpage=" + 
			(pageInfo.getCpage() + 1) + "'><img src='/inMyGarden/img/right-arrow-240.png' width='12' /></a>");
		out.print("&nbsp;&nbsp;<a href='order_list.ord" + args + 
			"&cpage=" + pageInfo.getPcnt() + "'>");
		out.println("<img src='/inMyGarden/img/right-arrow-240.png' width='12' /><img src='/inMyGarden/img/right-arrow-240.png' width='12' /></a>");
	}

	out.println("</p>");
}
%>
	</div>
</div>
</div>
</form>
<br /><br />
<%@ include file="../inc_footer.jsp" %>
</body>
</html>