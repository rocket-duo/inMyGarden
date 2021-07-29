<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%@ include file="../inc_header.jsp" %>
<%
request.setCharacterEncoding("utf-8");
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
.btn:active { backgrou\nd:gray; }
.btnLeft { width:100px; height:30px; }
.btnRight { width:200px; height:60px; }

/* 상품검색  */
#t_schPdt { text-align:center; }
#t_schPdt th {  }
#t_schPdt td { text-align:left;  }
#schBtn { text-align:center; }


/* 상품정렬 */
.d_ordPdt { width:1040px; padding:20px;}
#d_ordPdtDetail { width:1000px; height:30px;text-align:right; border-top:1px solid black; border-bottom:1px solid black;}
#d_ordPdtDetail ol { display:inline; list-style:none; margin:0; padding:0; float:right }
#d_ordPdtDetail li { padding:0px 10px 20px 0px; border:0; float: left; }

/* 상품목록 */
.d_pdtList { width:1040px; padding:20px;}
#t_pdtListInfo { table-layout: fixed; }
#t_pdtListInfo td { border:1px solid black; text-align:center;}
#t_pdtListInfo td span { width:50px; float:right; padding:5px 10px 0 0;"}

#d_selectOpt {}
</style>
<script>

</script>
</head>
<body>

<div style="width:1080px; margin:0 auto; padding-top:20px;">
<form action="" method="get">
<!-- 상품 검색창 시작 -->
<div style="width:680px; border:1px solid black; padding:10px 40px 20px 40px; margin:0 auto;">
<h3>검색</h3>
<hr style="border-top:1px solid black;"/>
<table width="680" id="t_schPdt" height="120" cellspacing="0">
	<tr>
		<th width="200">상품분류</th>
		<td>
			<select>
				<option>대분류 전체</option>
		<!-- 	<option>배양토/퇴비</option> 
				<option>화분</option>
				<option>씨앗</option>
				<option>영양제/관리제</option>
				<option>원예도구/자제</option>
				<option>자갈/모래</option>
				<option>받침대</option>
				<option>텃밭세트</option>	 -->
			</select>
			<select>
				<option>소분류 전체</option>
		<!-- 	<option>소분류1</option>
				<option>소분류2</option>
				<option>소분류3</option>	 -->
			</select>
		</td>
	</tr>
	<tr>
		<th>상품명</th>
		<td>
			<input type="text" placeholder="상품명" value="" />
		</td>
	</tr>
	<tr>
		<th>판매가격대</th>
		<td>
			<input type="text" placeholder="최소가격" value="" /> ~ 
			<input type="text" placeholder="최대가격" value="" /> 
		</td>
	</tr>
</table>
<br />
	<div id="schBtn"><input type="submit" class="btn btnLeft" value="검색" /></div>
</div>
<!-- 상품 검색창 종료 -->

<!-- 상품 정렬창 시작 -->
<div class="d_ordPdt" >
	<h5 style="margin:10px;">상품 4개</h5>
	<div class="d_ordPdt" id="d_ordPdtDetail">
		<ol>
			<li><a href="#">신상품</a></li>
			<li><a href="#">상품명</a></li>
			<li><a href="#">낮은가격</a></li>
			<li><a href="#">높은가격</a></li>
			<li><a href="#">인기상품</a></li>
			<li><a href="#">후기순</a></li>
		</ol>
	</div>
</div>
<!-- 상품 정렬창 종료 -->

<!-- 상품 목록 시작 -->
<div class="d_pdtList">
<table width="1040" id="t_pdtListInfo" cellspacing="20px">
	<tr><th colspan="4"></th></tr>
	<tr>
		<td width="25%" height="300">
			<a href="#"><img src="/inMyGarden/product/img/b/pdt_ba01_1.jpg" width="230" height="230" alt="상품이미지1"/></a><br />
			<a href="#" align="right">화분</a>
			<span>
				<a href="#"><img src="../wishList.jpg" width="18" height="18" /></a>
				<a href="#"><img src="../cart.jpg" width="18" height="18" /></a>
			</span>
			<hr />
			3,500원
		</td>
		<td width="25%" height="300">
			<a href="#"><img src="/inMyGarden/product/img/b/pdt_ba02_1.jpg" width="230" height="230" alt="상품이미지2"/></a><br />
			<a href="#">화분</a>
			<span>
				<a href="#"><img src="../wishList.jpg" width="18" height="18" /></a>
				<a href="#"><img src="../cart.jpg" width="18" height="18" /></a>
			</span>
			<hr />
			3,500원
		</td>
		<td width="25%" height="300">
			<a href="#"><img src="/inMyGarden/product/img/b/pdt_ba03_1.jpg" width="230" height="230" alt="상품이미지3"/></a><br />
			<a href="#">화분</a>
			<span>
				<a href="#"><img src="../wishList.jpg" width="18" height="18" /></a>
				<a href="#"><img src="../cart.jpg" width="18" height="18" /></a>
			</span>
			<hr />
			3,500원
		</td>
		<td width="25%" height="300">
			<a href="#"><img src="/inMyGarden/product/img/b/pdt_ba04_1.jpg" width="230" height="230" alt="상품이미지4"/></a><br />
			<a href="#">화분</a>
			<span>
				<a href="#"><img src="../wishList.jpg" width="18" height="18" /></a>
				<a href="#"><img src="../cart.jpg" width="18" height="18" /></a>
			</span>
			<hr />
			3,500원
		</td>
	</tr>
</table>
</div>
<!-- 상품 목록 종료 -->

<p align="center"><a href="#">＜＜</a>   <a href="#">＜ </a>  <a href="#">1</a>   <a href="#">＞</a>  <a href="#">＞＞</a>
   	<span style="float:right;"></span>
</p>

<br /><br /><br /><br />

<!-- 옵션/수량변경 폼  시작 -->
<div style="border:1px solid black; width:400px; padding:10px 20px 10px 20px; " >
	<h4 style="display:inline-block;">옵션선택 (옵션/수량변경 폼)</h4><img src="#" alt="닫기" style="float:right;"/>
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
			<td colspan="2"  align="center" valign="top"><input type="button" class="btn btnLeft" value="장바구니 담기" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" class="btn btnLeft" value="바로 구매하기" /></td>
		</tr>
	</table>
</div>
<!-- 옵션/수량변경 폼  종료 -->

<br /><br />

<!-- 장바구니 확인창 시작 -->
<div style="border:1px solid black; width:300px; padding:10px 20px 10px 20px; " >
	<h4 style="display:inline-block;">장바구니 담기</h4><img src="#" alt="닫기" style="float:right;"/>
	<div style="width:300px; text-align:center;">
		<hr /><br />
		장바구니에 상품이 담겼습니다.
		<br /><br /><hr />
		<input type="button" class="btn btnLeft" value="장바구니 이동" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" class="btn btnLeft" value="쇼핑 계속하기" />
	</div>
</div>
<!-- 장바구니 확인창 종료 -->
<br /><br />
<!-- 관심상품 확인창 시작 -->
<div style="border:1px solid black; width:300px; padding:10px 20px 10px 20px; " >
	<h4 style="display:inline-block;">장바구니 담기</h4><img src="#" alt="닫기" style="float:right;"/>
	<div style="width:300px; text-align:center;">
		<hr /><br />
		관심 상품에 상품이 담겼습니다.
		<br /><br /><hr />
		<input type="button" class="btn btnLeft" value="관심상품 이동" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" class="btn btnLeft" value="쇼핑 계속하기" />
	</div>
</div>
<!-- 관심상품 확인창 종료 -->
</form>
</div>
<%@ include file="../inc_footer.jsp" %>
</body>
</html>