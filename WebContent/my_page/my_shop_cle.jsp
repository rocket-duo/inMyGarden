<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="../inc_header.jsp" %>
<%
// 프론트 44페이지
%>
<%
if (loginMember == null) {
	out.println("<script>");
	out.println("alert('잘못된 경로로 들어오셨습니다.');");
	out.println("history.back();");
	out.println("</script>");
	out.close();
}



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
</script>
</head>
<body>
<div style="width:1080px; margin:0 auto;">
<%@ include file="inc_my_page_side_menu.jsp" %>
<div id="shop" style="width:800px; display:inline-block;"> 
<h2>마이 쇼핑</h2>
<div style="width:400px;background-image:url(/inMyGarden/img/my_shop_bar_open.png); width:390px; height:30px; text-align:center; display:inline-block; color:white;">주문 목록/배송 조회 (0)</div>
<div style="width:400px;background-image:url(/inMyGarden/img/my_shop_bar_close.png); width:390px; height:30px; text-align:center; display:inline-block;">취소/반품/교환 내역(0)</div>	<br/>
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
			<tr>
				<td height="130">2021-07-09<br/>2107091001001</td>
				<td width="100">
				<img src="/inMyGarden/product/img/e/pdt_ea04_1.jpg" width="100px" height="100px"/></td><td align="left">
				양손가위<br/>( 양손가위 )</td>
				<td>9500원 / 1개</td>
				<td>9500원</td>
				<td>상품준비중</td>
				<td></td>
			</table>
</div>
</div>
</div>
</body>

<%@ include file="../inc_footer.jsp" %>
</html>