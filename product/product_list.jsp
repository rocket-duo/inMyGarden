<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%@ include file="../inc_header.jsp" %>
<%
request.setCharacterEncoding("utf-8");
ArrayList<ProductInfo> pdtList = (ArrayList<ProductInfo>)request.getAttribute("pdtList");
ArrayList<CataBigInfo> cataBigList = 
	(ArrayList<CataBigInfo>)request.getAttribute("cataBigList");		// 대분류 목록
ArrayList<CataSmallInfo> cataSmallList = 
	(ArrayList<CataSmallInfo>)request.getAttribute("cataSmallList");	// 소분류 목록
PdtPageInfo pageInfo = (PdtPageInfo)request.getAttribute("pageInfo");
/* System.out.println(pageInfo.getSpage());
System.out.println(pageInfo.getEpage());
System.out.println(pageInfo.getBsize()); */
String args = "", schargs = "";
// 검색관련 쿼리스트링 제작
if (pageInfo.getKeyword() == null)	schargs += "&keyword=";
else		schargs += "&keyword=" + pageInfo.getKeyword();

if (pageInfo.getBcata() == null)	schargs += "&bcata=";
else		schargs += "&bcata=" + pageInfo.getBcata();

if (pageInfo.getScata() == null)	schargs += "&scata=";
else		schargs += "&scata=" + pageInfo.getScata();

if (pageInfo.getSprice() == null)	schargs += "&sprice=";
else		schargs += "&sprice=" + pageInfo.getSprice();

if (pageInfo.getEprice() == null)	schargs += "&eprice=";
else		schargs += "&eprice=" + pageInfo.getEprice();
args = "?cpage=" + pageInfo.getCpage() + schargs;
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

/* 상품검색  */
#t_schPdt { text-align:center; }
#t_schPdt th {  }
#t_schPdt td { text-align:left; }
#schBtn { text-align:center; }


/* 상품정렬 */
.d_ordPdt { width:1040px; padding:20px;}
#d_ordPdtDetail { width:1000px; height:30px;text-align:right; border-top:1px solid black; border-bottom:1px solid black; }
#d_ordPdtDetail ol { display:inline; list-style:none; margin:0; padding:0; float:right; }
#d_ordPdtDetail li { padding:0px 10px 20px 0px; border:0; float: left; }

/* 상품목록 */
.d_pdtList { width:1040px; padding:20px; }
#t_pdtListInfo { table-layout:fixed; }
#t_pdtListInfo td { border:1px solid black; text-align:center; font-size:15px; }
#t_pdtListInfo td span { width:50px; float:right; padding:5px 10px 0 0;""" }


#d_selectOpt {}
</style>
<script>
<%
String cbid = "", arrName = "";
int j = 0;
for (int i = 0 ; i < cataSmallList.size() ; i++) {
	if (!cbid.equals(cataSmallList.get(i).getCb_id())) {
		cbid = cataSmallList.get(i).getCb_id();
		arrName = "arr" + cbid;
		out.println("var " + arrName + " = new Array();");
		out.println(arrName + "[0] = new Option(\"\", \"소분류 전체\");");
		j = 1;
	}
	out.println(arrName + "[" + j + "] = new Option(\"" + 
	cataSmallList.get(i).getCs_id() + "\", \"" + cataSmallList.get(i).getCs_name() + "\");");
	j++;
}
%>
function setCategory(x, target) {
// x : 선택한 대분류 ID, target : 선택한 대분류에 속한 소분류를 보여줄 컨트롤 객체
	for (var i = target.options.length - 1 ; i > 0 ; i--) {
		target.options[i] = null;
	}
	
	if (x != "") {
		var arr = eval("arr" + x);
		for (var i = 0 ; i < arr.length ; i++) {
			target.options[i] = new Option(arr[i].value, arr[i].text);
		}
		target.options[0].selected = true;
	}
}
</script>
</head>
<body>

<div style="width:1080px; margin:0 auto; padding-top:20px;">
<form name="frmPdtList" action="" method="get">
<input type="hidden" name="ord" value="<%=pageInfo.getOrd() %>" />
<input type="hidden" name="psize" value="<%=pageInfo.getPsize() %>" />
<!-- 상품 검색창 시작 -->
<div style="width:680px; border:1px solid black; padding:10px 40px 20px 40px; margin:0 auto;">
<h3>검색</h3>
<hr style="border-top:1px solid black;"/>
<table width="680" id="t_schPdt" height="120" cellspacing="0">
	<tr>
		<th width="200">상품분류</th>
		<td>
			<select name="bcata" onchange="setCategory(this.value, this.form.scata);">
				<option value="">대분류 전체</option>
<%
for (CataBigInfo cata : cataBigList) {
	String slt = "";
	if (pageInfo.getBcata() != null && pageInfo.getBcata().equals(cata.getCb_id()))
		slt = " selected='selected'";
%>
		<option value="<%=cata.getCb_id() %>"<%=slt %>><%=cata.getCb_name() %></option>
<% } %>
			</select>
			<select name="scata">
				<option value="">소분류 전체</option>
<%
if (pageInfo.getBcata() != null && !pageInfo.getBcata().equals("")) {
// 대분류 검색조건이 있을 경우
	for (CataSmallInfo cata : cataSmallList) {
		if (pageInfo.getBcata().equals(cata.getCb_id())) {
		// 검색조건의 대분류와 동일한 대분류를 가진 소분류일 경우
			String slt = "";
			if (pageInfo.getScata() != null && pageInfo.getScata().equals(cata.getCs_id()))
				slt = " selected='selected'";
%>
		<option value="<%=cata.getCs_id()%>"<%=slt%>><%=cata.getCs_name()%></option>
<%
		}
	}
}
%>
			</select>
		</td>
	</tr>
	<tr>
		<th>상품명</th>
		<td>
			<input type="text" name="keyword" placeholder="상품명" value="<%=pageInfo.getKeyword() %>" />
		</td>
	</tr>
	<tr>
		<th>판매가격대</th>
		<td>
			<input type="text" name="sprice" placeholder="최소가격" value="<%=pageInfo.getSprice()%>" /> ~ 
			<input type="text" name="eprice" placeholder="최대가격" value="<%=pageInfo.getEprice()%>" /> 
		</td>
	</tr>
</table>
<br />
	<div id="schBtn"><input type="submit" class="btn btnLeft" value="검색" /></div>
</div>
<!-- 상품 검색창 종료 -->

<!-- 상품 정렬창 시작 -->
<div class="d_ordPdt" >
	<h5 style="margin:10px; font-size:14px;">검색된 상품 : <%=pageInfo.getRcnt() %>개</h5>
	<div class="d_ordPdt" id="d_ordPdtDetail">
		<ol>
			<li><a href="product_list.pdt<%=args%>&ord=idd" 
				style="font-weight:<%=(pageInfo.getOrd().equals("idd")) ? "bold" : "normal" %>">신상품순</a></li>
			<li><a href="product_list.pdt<%=args%>&ord=namea" 
				style="font-weight:<%=(pageInfo.getOrd().equals("namea")) ? "bold" : "normal" %>">상품명순</a></li>
			<li><a href="product_list.pdt<%=args%>&ord=pricea" 
				style="font-weight:<%=(pageInfo.getOrd().equals("pricea")) ? "bold" : "normal" %>">낮은가격순</a></li>
			<li><a href="product_list.pdt<%=args%>&ord=priced" 
				style="font-weight:<%=(pageInfo.getOrd().equals("priced")) ? "bold" : "normal" %>">높은가격순</a></li>
			<li><a href="product_list.pdt<%=args%>&ord=salecntd" 
				style="font-weight:<%=(pageInfo.getOrd().equals("salecntd")) ? "bold" : "normal" %>">인기상품순</a></li>
			<li><a href="product_list.pdt<%=args%>&ord=reviewd" 
				style="font-weight:<%=(pageInfo.getOrd().equals("reviewd")) ? "bold" : "normal" %>">후기순</a></li>
		</ol>
	</div>
</div>
<!-- 상품 정렬창 종료 -->

<!-- 상품 목록 시작 -->
<div class="d_pdtList">
<table width="1040" id="t_pdtListInfo" cellspacing="20px;">
<tr><td colspan="4" style="border:none;"></td></tr>
<%
if (pdtList != null && pdtList.size() > 0) {
// 상품 검색결과가 있으면
	for (int i = 0 ; i < pdtList.size() ; i++) {
		ProductInfo pi = pdtList.get(i);
		String imglnk = pi.getPi_img1();
		String imgFolder = imglnk.substring(4,5);
		String lnk = null;
		if (pi.getPi_stock() != 0) {
			lnk = "<a href=\"product_detail.pdt" + args + "&id=" + pi.getPi_id() + 
			"&ord=" + pageInfo.getOrd() + "&psize=" + pageInfo.getPsize() + "\">";
		} else {
			lnk = "<a href=\"javascript:alert('품절 상품입니다.');\">";
		}
		if (pageInfo.getPsize() == 20) {	// 상품목록을 한 줄에 4개씩 보여주기
			if (i % 4 == 0)		out.println("<tr align=\"center\">");
%>
		<td width="25%" height="300">
			<%=lnk%><img src="/inMyGarden/product/img/<%=imgFolder %>/<%=imglnk %>"width="230" height="230" alt="상품이미지" /></a><br />
			<%=lnk%><%=pi.getPi_name()%></a><hr />
			<span>
				<a href="#"><img src="/inMyGarden/img/heart-empty-240.png" width="18" height="18" /></a>&nbsp;
				<a href="#"><img src="/inMyGarden/img/cart-240.png" width="18" height="18" /></a>
			</span>
			<%=pi.getPi_price()%>원
		</td>
<%
			if (i % 4 == 3)		out.println("</tr>");
		} 
	}
} else {
	out.println("<tr><th>검색결과가 없습니다.</th></tr>");
}
%>
</table>
</div>
<!-- 상품 목록 종료 -->
<%
if (pdtList != null && pdtList.size() > 0) {
	args = "?ord=" + pageInfo.getOrd() + "&psize=" + pageInfo.getPsize() + schargs;

	out.println("<p style=\"width:1080px;\" align=\"center\">");

	if (pageInfo.getCpage() == 1) {	// 현재 페이지 번호가 1이면
		out.println("<img src='/inMyGarden/img/left-arrow-240.png' width='12' /><img src='/inMyGarden/img/left-arrow-240.png' width='12' />&nbsp;&nbsp;<img src='/inMyGarden/img/left-arrow-240.png' width='10' />&nbsp;&nbsp;");
	} else {
		out.print("<a href='product_list.pdt" + args + "&cpage=1" + "'>");
		out.println("<img src='/inMyGarden/img/left-arrow-240.png' width='12' /><img src='/inMyGarden/img/left-arrow-240.png' width='12' /></a>&nbsp;&nbsp;");
		out.print("<a href='product_list.pdt" + args + 
			"&cpage=" + (pageInfo.getCpage() - 1) + "'>");
		out.println("<img src='/inMyGarden/img/left-arrow-240.png' width='12' /></a>&nbsp;&nbsp;");
	} // 첫 페이지와 이전 페이지 링크

	for (int i = 1, k = pageInfo.getSpage() ; i <= pageInfo.getBsize() && k <= pageInfo.getEpage() ; i++, k++) {
	// i : 루프돌릴 횟수를 검사하는 용도의 변수, k : 페이지 번호 출력용 변수
	// 조건 : bsize만큼 루프를 도는데 페이지가 마지막 페이지일 경우 bsize보다 작아도 멈춤
		if (pageInfo.getCpage() == k) {	// 현재 페이지 번호일 경우 링크없이 강조만 함
			out.print("&nbsp;<span style='font-size:17px;'><strong>" + k + "</strong></span>&nbsp;");
		} else {
			out.print("&nbsp;<span style='font-size:17px;'><a href='product_list.pdt" + args + "&cpage=" + k + "'>");
			out.print(k + "</a></span>&nbsp;");
		}
	}

	if (pageInfo.getCpage() == pageInfo.getPcnt()) {	// 현재 페이지번호가 마지막 페이지 번호이면
		out.println("&nbsp;&nbsp;<img src='/inMyGarden/img/right-arrow-240.png' width='12' />&nbsp;&nbsp;<img src='/inMyGarden/img/right-arrow-240.png' width='12' /><img src='/inMyGarden/img/right-arrow-240.png' width='12' />");
	} else {
		out.println("&nbsp;&nbsp;<a href='product_list.pdt" + args + "&cpage=" +
			(pageInfo.getCpage() + 1) + "'><img src='/inMyGarden/img/right-arrow-240.png' width='12' /></a>");
		out.print("&nbsp;&nbsp;<a href='product_list.pdt" + args + 
			"&cpage=" + pageInfo.getPcnt() + "'>");
		out.println("<img src='/inMyGarden/img/right-arrow-240.png' width='12' /><img src='/inMyGarden/img/right-arrow-240.png' width='12' /></a>");
	}

	out.println("</p>");
}
%>
<!-- <br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br />
<br /><br /><br /><br /> -->
<!-- 옵션/수량변경 폼  시작 -->
<!-- <div style="border:1px solid black; width:400px; padding:10px 20px 10px 20px; " >
	<h4 style="display:inline-block;">옵션선택 (옵션/수량변경 폼)</h4><img src="/inMyGarden/img/x-240.png" width="30" alt="닫기" style="float:right; padding:15px 5px 0 0;"/>
	<hr />
	<table width="400" height="350" align="center">
		<tr ><td rowspan="2" width="40%" valign="top" >
				<img src="/inMyGarden/product/img/b/pdt_ba03_1.jpg" width="100" height="100" /></td>
			<td height="50">화분</td>
		</tr>
		<tr height="50"><td>옵션
				<select>
					<option>== 옵션선택 ==</option>
				</select>
		</td></tr>
		<tr><td colspan="2">
		<hr /> -->
		<!--  선택된 옵션 및 수량 시작 -->
		<!-- <div id="d_selectOpt" style=" margin:0 auto; width:400px; background:whitesmoke; text-align:center; ">
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
		<hr /> -->
		<!-- 선택된 옵션 및 수량 종료 -->
		<!-- </td></tr>
		<tr>
			<td colspan="2"  align="center" valign="top"><input type="button" class="btn btnLeft" value="장바구니 담기" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" class="btn btnLeft" value="바로 구매하기" /></td>
		</tr>
	</table>
</div> -->
<!-- 옵션/수량변경 폼  종료 -->

<br /><br />
<!-- 장바구니 확인창 시작 -->
<!-- <div style="border:1px solid black; width:300px; padding:10px 20px 10px 20px; " >
	<h4 style="display:inline-block;">장바구니 담기</h4><img src="/inMyGarden/img/x-240.png" width="30" alt="닫기" style="float:right; padding:15px 5px 0 0;"/>
	<div style="width:300px; text-align:center;">
		<hr /><br />
		장바구니에 상품이 담겼습니다.
		<br /><br /><hr />
		<input type="button" class="btn btnLeft" value="장바구니 이동" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" class="btn btnLeft" value="쇼핑 계속하기" />
	</div>
</div> -->
<!-- 장바구니 확인창 종료 -->
<br /><br />
<!-- 관심상품 확인창 시작 -->
<!-- <div style="border:1px solid black; width:300px; padding:10px 20px 10px 20px; " >
	<h4 style="display:inline-block;">장바구니 담기</h4><img src="/inMyGarden/img/x-240.png" width="30" alt="닫기" style="float:right; padding:15px 5px 0 0;"/>
	<div style="width:300px; text-align:center;">
		<hr /><br />
		관심 상품에 상품이 담겼습니다.
		<br /><br /><hr />
		<input type="button" class="btn btnLeft" value="관심상품 이동" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" class="btn btnLeft" value="쇼핑 계속하기" />
	</div>
</div> -->
<!-- 관심상품 확인창 종료 -->
</form>
</div>
<br /><br /><br /><br />
<%@ include file="../inc_footer.jsp" %>
</body>
</html>
