<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%@ include file="../inc_header.jsp" %>
<%
/* request.setCharacterEncoding("utf-8");
ArrayList<ProductInfo> pdtList = (ArrayList<ProductInfo>)request.getAttribute("pdtList");
System.out.println(pdtList.size()); */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/inMyGarden/css/default.css?ver0.1" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 작은 텃밭</title>
<script src="jquery-3.6.0.js"></script>
<script src="jquery-ui-1.10.3.custom.min.js"></script>
<script src="inmygarden.js"></script>
<style>
#d_mainpage { margin:0 auto; width:1080px; }
#d_stedySeller { margin:0 auto; width:1080px; height:300px; border:0; text-align:center; }
#d_newArrivals { margin:0 auto; width:1080px; height:900px; text-align:center; }
#d_mdChoice { margin:0 auto; width:1080px; height:350px; border:0; }
#d_stedySeller img { padding:30px 5px 0 5px; }
#d_newArrivals img { padding:30px 5px 0 5px; }
#d_mdChoice img { float:right; }
.mdChoiceBtn input[type=button] { width:180px; height:40px; font-size:16px; margin:3px 0 3px 20px; border-radius:2em; display:inline-block; }
.d_mdChoiceImg { display:inline-block; padding:10px 5px 0 20px; }
.mdChoiceImg { width:130px; padding-left:10px; }

/* 이미지 슬라이드 */
.d_imgSlide { background:#fff; margin:0 auto; height:500px; width:100%; overflow:hidden; border:0; position:relative; }
.d_imgSlides { height:100%; width:100%; position:absolute; }
.d_imgSlides .slide { height:100%; width:100%; overflow:hidden; position:absolute; }
.d_imgSlides .slide img { left:50%; }
.d_slideshowNav a, .d_slideshow-indicator a { background:rgba(0, 0, 0, 0); overflow:hidden; }
.d_slideshowNav a:before { content:url("/inMyGarden/img/slides/sprites.png"); display:inline-block; font-size:0; line-height:0; }
.d_slideshow-indicator a:before { content:url("/inMyGarden/img/slides/sprites.png"); display:inline-block; font-size:0; line-height:0; }
.d_slideshowNav a { position:absolute; top:50%; left:50%; width:72px; height:72px; margin-top:-36px; }
.d_slideshowNav a.prev { margin-left:-850px; }
.d_slideshowNav a.prev:before { margin-top:-20px; }
.d_slideshowNav a.next { margin-left:770px; }
.d_slideshowNav a.next:before { margin:-20px 0 0 -80px; }
.d_slideshowNav a.disabled { display:none; }

.d_slideshow-indicator { bottom:30px; height:16px; left:0; position:absolute; right:0; text-align:center; }
.d_slideshow-indicator a { display:inline-block; width:16px; height:16px; margin:0 3px; }
.d_slideshow-indicator a.active { cursor:default; }
.d_slideshow-indicator a:before { margin-left:-110px; }
.d_slideshow-indicator a.active:before { margin-left:-130px; }
</style>
</head>
<body >
<!-- 이미지 슬라이드 영역 -->
<div class="d_imgSlide" style="text-align:center;">
	<div class="d_imgSlides">
		<a href="product_list.pdt?ord=idd&psize=20&bcata=B2" class="slide" id="slide-1"><img src="/inMyGarden/img/slides/slide-1.png" width="100%" height="500" /></a>
		<a href="product_detail.pdt?cpage=1&bcata=B1&id=pdt_aa01&ord=idd&psize=20" class="slide" id="slide-2"><img src="/inMyGarden/img/slides/slide-2.png" width="100%" height="500" /></a>
		<a href="product_detail.pdt?cpage=1&bcata=B1&id=pdt_ab02&ord=idd&psize=20" class="slide" id="slide-3"><img src="/inMyGarden/img/slides/slide-3.png" width="100%" height="500" /></a>
		<a href="product_list.pdt?ord=idd&psize=20&bcata=B1" class="slide" id="slide-4"><img src="/inMyGarden/img/slides/slide-4.png" width="100%" height="500" /></a>
		<a href="product_list.pdt?ord=idd&psize=20&bcata=B4" class="slide" id="slide-5"><img src="/inMyGarden/img/slides/slide-5.png" width="100%" height="500" /></a>
	</div>
	<div class="d_slideshowNav">
		<a href="#" class="prev">Prev</a>
		<a href="#" class="next">Next</a>
	</div>
	<div class="d_slideshow-indicator"></div>
</div>
<div id="d_mainpage">
	<br />
	<!-- 스테디 셀러 영역 -->
	<div id="d_stedySeller">
		<div style="padding-top:30px; font-size:30px;">스테디 셀러</div>
		<div>
			<a href="product_detail.pdt?cpage=1&keyword=&bcata=B2&scata=&sprice=&eprice=&id=pdt_ba01&ord=idd&psize=20"><img src="/inMyGarden/product/img/b/pdt_ba01_1.jpg" width="220" height="200" /></a>&nbsp;
			<a href="product_detail.pdt?cpage=1&keyword=&bcata=B2&scata=&sprice=&eprice=&id=pdt_ba02&ord=idd&psize=20"><img src="/inMyGarden/product/img/b/pdt_ba02_1.jpg" width="220" height="200" /></a>&nbsp;
			<a href="product_detail.pdt?cpage=1&keyword=&bcata=B2&scata=&sprice=&eprice=&id=pdt_bb03&ord=idd&psize=20"><img src="/inMyGarden/product/img/b/pdt_bb03_1.jpg" width="220" height="200" /></a>&nbsp;
			<a href="product_detail.pdt?cpage=1&keyword=&bcata=B2&scata=&sprice=&eprice=&id=pdt_ba04&ord=idd&psize=20"><img src="/inMyGarden/product/img/b/pdt_ba04_1.jpg" width="220" height="200" /></a>
		</div>
	</div><br /><br />
<%-- <table width="800" cellpadding="5" align="center">
<%
for (int i = 0 ; i < pdtList.size() ; i++) {
	ProductInfo pi = pdtList.get(i);
	
	if (i % 4 == 0)		out.println("<tr align=\"center\">");
%>
<td width="200">
	<div class="outerBox">
		<span class="innerBox"><img src="product/sample/<%=pi.getTp_img()%>" width="150" height="150" /></span><br />
		<span class="pdtName"><%=pi.getTp_name()%></span><br />
		<span class="pdtPrice"><%=pi.getTp_price()%> 원</span>
	</div>
</td>
<%
	if (i % 4 == 3)		out.println("</tr>");
	
}
%> --%>
	<!-- 신상품 영역 -->
	<div id="d_newArrivals">
		<div style="padding-top:30px; font-size:30px;">신규 입고 상품</div>
		<div>
			<a href="product_detail.pdt?cpage=1&keyword=&bcata=B3&scata=&sprice=&eprice=&id=pdt_ca01&ord=idd&psize=20"><img src="/inMyGarden/product/img/c/pdt_ca01_1.jpg" width="220" /></a>&nbsp;
			<a href="product_detail.pdt?cpage=1&keyword=&bcata=B3&scata=&sprice=&eprice=&id=pdt_ca02&ord=idd&psize=20"><img src="/inMyGarden/product/img/c/pdt_ca02_1.jpg" width="220" /></a>&nbsp;
			<a href="product_detail.pdt?cpage=1&keyword=&bcata=B3&scata=&sprice=&eprice=&id=pdt_ca03&ord=idd&psize=20"><img src="/inMyGarden/product/img/c/pdt_ca03_1.jpg" width="220" /></a>&nbsp;
			<a href="product_detail.pdt?cpage=1&keyword=&bcata=B3&scata=&sprice=&eprice=&id=pdt_ca04&ord=idd&psize=20"><img src="/inMyGarden/product/img/c/pdt_ca04_1.jpg" width="220" /></a><br />
			<a href="product_detail.pdt?cpage=1&keyword=&bcata=B3&scata=&sprice=&eprice=&id=pdt_ca05&ord=idd&psize=20"><img src="/inMyGarden/product/img/c/pdt_ca05_1.jpg" width="220" /></a>&nbsp;
			<a href="product_detail.pdt?cpage=1&keyword=&bcata=B3&scata=&sprice=&eprice=&id=pdt_cb01&ord=idd&psize=20"><img src="/inMyGarden/product/img/c/pdt_cb01_1.jpg" width="220" /></a>&nbsp;
			<a href="product_detail.pdt?cpage=1&keyword=&bcata=B3&scata=&sprice=&eprice=&id=pdt_cb02&ord=idd&psize=20"><img src="/inMyGarden/product/img/c/pdt_cb02_1.jpg" width="220" /></a>&nbsp;
			<a href="product_detail.pdt?cpage=1&keyword=&bcata=B3&scata=&sprice=&eprice=&id=pdt_cb03&ord=idd&psize=20"><img src="/inMyGarden/product/img/c/pdt_cb03_1.jpg" width="220" /></a><br />
			<a href="product_detail.pdt?cpage=1&keyword=&bcata=B3&scata=&sprice=&eprice=&id=pdt_cb04&ord=idd&psize=20"><img src="/inMyGarden/product/img/c/pdt_cb04_1.jpg" width="220" /></a>&nbsp;
			<a href="product_detail.pdt?cpage=1&keyword=&bcata=B3&scata=&sprice=&eprice=&id=pdt_cb05&ord=idd&psize=20"><img src="/inMyGarden/product/img/c/pdt_cb05_1.jpg" width="220" /></a>&nbsp;
			<a href="product_detail.pdt?cpage=1&keyword=&bcata=B3&scata=&sprice=&eprice=&id=pdt_cc01&ord=idd&psize=20"><img src="/inMyGarden/product/img/c/pdt_cc01_1.jpg" width="220" /></a>&nbsp;
			<a href="product_detail.pdt?cpage=1&keyword=&bcata=B3&scata=&sprice=&eprice=&id=pdt_cc02&ord=idd&psize=20"><img src="/inMyGarden/product/img/c/pdt_cc02_1.jpg" width="220" /></a><br />
		</div>
	</div><br />
<%-- <table id="t_newArrivals" width="800" cellpadding="5" align="center">
	<tr style="padding-top:30px; font-size:30px;"><td colspan="4">신규 입고 상품</td></tr>
<%
for (int i = 0 ; i < pdtList.size() ; i++) {
	ProductInfo pi = pdtList.get(i);
	String imglnk = pi.getPi_img1();
	String imgFolder = imglnk.substring(4,5);
	
	if (i % 4 == 0)		out.println("<tr align=\"center\">");
%>
	<td width="25%" height="300">
		<a href="#"><img src="/inMyGarden/product/img/<%=imgFolder %>/<%=imglnk %>"width="230" height="230" alt="상품이미지"/></a><br />
			<a href="#" align="right"><%=pi.getPi_name()%></a><hr />
			<span>
				<a href="#"><img src="/inMyGarden/img/heart-empty-240.png" width="18" height="18" /></a>&nbsp;
				<a href="#"><img src="/inMyGarden/img/cart-240.png" width="18" height="18" /></a>
			</span>
			<%=pi.getPi_price()%>원
	</td>
<%
	if (i % 4 == 3)		out.println("</tr>");
	
}
%> --%>
</tr>
</table>
	<!-- MD 추천 상품 영역 -->
	<div id="d_mdChoice" >
		<table width="1080">
			<tr>
				<td width="20%">
					<div style="padding:10px 0 10px 20px; font-size:27px; display:inline-block;">MD 추천 상품</div>
					<div class="mdChoiceBtn"><input type="button" value="배양토/퇴비" /></div>
					<div class="mdChoiceBtn"><input type="button" value="각종 화분 및 씨앗" /></div>
					<div class="mdChoiceBtn"><input type="button" value="기타 용품" /></div>
				</td>
				<td width="*">
					<div class="d_mdChoiceImg" style="padding-top:35px;">
						<a href="product_detail.pdt?cpage=1&keyword=&bcata=B1&scata=&sprice=&eprice=&id=pdt_aa01&ord=idd&psize=20"><img src="/inMyGarden/product/img/a/pdt_aa01_1.jpg" class="mdChoiceImg" height="130" /></a>&nbsp;
						<a href="product_detail.pdt?cpage=1&keyword=&bcata=B1&scata=&sprice=&eprice=&id=pdt_aa02&ord=idd&psize=20"><img src="/inMyGarden/product/img/a/pdt_aa02_1.jpg" class="mdChoiceImg" height="130" /></a>&nbsp;
						<a href="product_detail.pdt?cpage=1&keyword=&bcata=B1&scata=&sprice=&eprice=&id=pdt_ab01&ord=idd&psize=20"><img src="/inMyGarden/product/img/a/pdt_ab01_1.jpg" class="mdChoiceImg" height="130" /></a>&nbsp;
						<a href="product_detail.pdt?cpage=1&keyword=&bcata=B1&scata=&sprice=&eprice=&id=pdt_ab02&ord=idd&psize=20"><img src="/inMyGarden/product/img/a/pdt_ab02_1.jpg" class="mdChoiceImg" height="130" /></a>&nbsp;
						<a href="product_detail.pdt?cpage=1&keyword=&bcata=B1&scata=&sprice=&eprice=&id=pdt_ab03&ord=idd&psize=20"><img src="/inMyGarden/product/img/a/pdt_ab03_1.jpg" class="mdChoiceImg" height="130" /></a>
					</div>
					<div class="d_mdChoiceImg">
						<a href="product_detail.pdt?cpage=1&keyword=&bcata=B6&scata=&sprice=&eprice=&id=pdt_fa01&ord=idd&psize=20"><img src="/inMyGarden/product/img/f/pdt_fa01_1.jpg" class="mdChoiceImg" height="130" /></a>&nbsp;
						<a href="product_detail.pdt?cpage=1&keyword=&bcata=B6&scata=&sprice=&eprice=&id=pdt_fa02&ord=idd&psize=20"><img src="/inMyGarden/product/img/f/pdt_fa02_1.jpg" class="mdChoiceImg" height="130" /></a>&nbsp;
						<a href="product_detail.pdt?cpage=1&keyword=&bcata=B6&scata=&sprice=&eprice=&id=pdt_fb01&ord=idd&psize=20"><img src="/inMyGarden/product/img/f/pdt_fb01_1.jpg" class="mdChoiceImg" height="130" /></a>&nbsp;
						<a href="product_detail.pdt?cpage=1&keyword=&bcata=B4&scata=&sprice=&eprice=&id=pdt_da01&ord=idd&psize=20"><img src="/inMyGarden/product/img/d/pdt_da01_1.jpg" class="mdChoiceImg" height="130" /></a>&nbsp;
						<a href="product_detail.pdt?cpage=1&keyword=&bcata=B4&scata=&sprice=&eprice=&id=pdt_db01&ord=idd&psize=20"><img src="/inMyGarden/product/img/d/pdt_db01_1.jpg" class="mdChoiceImg" height="130" /></a>
					</div>
				</td>
			</tr>
		</table>
	</div>
</div>
<br />
<%@ include file="../inc_footer.jsp" %>
</body>
</html>