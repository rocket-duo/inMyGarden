<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%
request.setCharacterEncoding("utf-8");
MemberInfo loginMember = (MemberInfo)session.getAttribute("loginMember");boolean isLogin = false;
if (loginMember != null)    isLogin = true;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="jquery-3.6.0.js"></script>
<script src="jquery-ui-1.10.3.custom.min.js"></script>
<title>나의 작은 텃밭</title>
<style>
#inc_header input:focus { outline:none; }
.headHr { width:100%; }
#headlogin li { float:left; padding:8px 2px 0 4px; }
#headlogin { list-style:none; margin:0 auto; float:right; font-size:12px; }
#headSearch { margin:6px 7px 0px; }
#headSearchBox { float:left; margin:5px 0 5px 0; }
/* .headMenu { list-style:none; display:inline; }
.headMenu li { float:left; font-size:16px; margin:7px 0 0 0; padding:0 26px 0 26px; } */
#headMenuImg { padding:10px; background:#9fdd00; float:left; vertical-align:middle; }
#d_headCata { width:1080px; text-align:center; margin:0 auto; z-index:25; }
.headBcataBox { padding:5px 0 10px 0; margin:0 18px 0 18px; z-index:20; font-size:17px; }
.headScataBox { width:150px; padding:5px 0 5px 0; border:1px gray solid; background:#ffffff; position:absolute; top:40px; z-index:25; }
.sCataFont { font-size:14px; }

.d_navBcata { width:600px; margin:auto; }
.d_navBcata ul { display:flex; list-style:none; }
.d_navBcata a { display:block; text-align:center; text-decoration:none; color:black; }
.d_navBcata a+nav { display:none; }
.d_navBcata { display:inline; }
</style>
<script>
function schBar() {
	var keyword = document.headSearch.keyword.value;
	document.headSearch.action = "product_list.pdt?keyword=" + keyword;
}

function showBScata(type) {
	var Bcata = document.getElementById("d_headBScata");
	if (type == "a") {
		Bcata.style.display = "block";
	}
}

function hideBScata(type) {
	var Bcata = document.getElementById("d_headBScata");
	if (type == "a") {
		Bcata.style.display = "none";
	}
}

$(document).ready(function() {
	$(".d_navBcata li").hover(
		function() {
			$(this).children("nav").slideDown(300);
			$(this).siblings().children("nav").slideUp();
		},
		function() {
			$(this).children("nav").slideUp(300);
		}
	);
});
</script>
</head>
<body>
<div style="width:1080px; height:21px; margin:0 auto;" id="inc_header">
	<form name="headSearch">
		<table cellspacing="0" cellpadding="0" style="border:1px solid lightgray;" id="headSearchBox">
			<tr>
				<td>
					<input type="text" name="keyword" style="border:0px; height:20px;" size="15" />
					<input type="image" src="/inMyGarden/img/magnifier-240.png" width="12" alt="검색" id="headSearch" 
						onclick="schBar();" />
				</td>
			</tr>
		</table>
	</form>
		<div style="width:1050px;">
			<ul id="headlogin">
				<% if (loginMember == null) { %>
				<li><a href="/inMyGarden/login_form.jsp">로그인</a>&nbsp;｜</li>
				<li><a href="#">회원가입</a>&nbsp;｜</li>
				<%} else { %>
				<li><%=loginMember.getMi_name() %>(<%=loginMember.getMi_id() %>) 님 환영합니다!</li>
				<li><a href="/inMyGarden/logout.jsp">로그아웃</a>&nbsp;｜</li>
				<li><a href="/inMyGarden/my_page/my_page_home.jsp">마이페이지</a>&nbsp;｜</li>
				<%} %>
				<li><a href="/inMyGarden/cart_list.ord">장바구니</a>&nbsp;｜</li>
				<li><a href="/inMyGarden/order_list.ord">주문조회</a>&nbsp;｜</li>
				<li><a href="/inMyGarden/cs/review_board.jsp">커뮤니티</a>&nbsp;｜</li>
				<li><a href="/inMyGarden/cs/faq_board.jsp">고객센터</a></li>
			</ul>
		</div>
</div>
<hr class="headHr" />
<br />
<div align="center" style="margin:0 auto;"><a href="/inMyGarden/inmygarden.jsp">
	<img src="/inMyGarden/img/inMyGarden_logo.png" width="280" alt="메인 로고 이미지" /></a>
</div>
<br />
<hr class="headHr" />
<div id="d_headCata">
	<a href="#" onblur="hideBScata('a');" ><img src="/inMyGarden/img/menu-240.png" width="20" id="headMenuImg" onclick="showBScata('a');" /></a>
		<div id="d_headBScata" style="width:600px; height:280px; border:1px gray solid; position:absolute; top:384px; background:#ffffff; display:none; z-index:20;">
			<table width="600">
				<tr>
					<td width="50" style="border-bottom:1px lightgray solid;"><a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B1">배양토/퇴비</a></td>
					<td width="50" style="border-bottom:1px lightgray solid;"><a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B2">화분</a></td>
					<td width="50" style="border-bottom:1px lightgray solid;"><a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B3">씨앗</a></td>
					<td width="50" style="border-bottom:1px lightgray solid;"><a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B4">영양제/관리제</a></td>
				</tr>
				<tr>
					<td class="sCataFont"><a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B1&scata=B1S01">배양토</a></td>
					<td class="sCataFont"><a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B2&scata=B2S01">화분(소)</a></td>
					<td class="sCataFont"><a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B3&scata=B3S01">잎채소류</a></td>
					<td class="sCataFont"><a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B4&scata=B4S01">영양제</a></td>
				</tr>
				<tr>
					<td class="sCataFont"><a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B1&scata=B1S02">퇴비</a></td>
					<td class="sCataFont"><a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B2&scata=B2S02">화분(대)</a></td>
					<td class="sCataFont"><a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B3&scata=B3S02">열매채소</a></td>
					<td class="sCataFont"><a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B4&scata=B4S02">관리제</a></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="sCataFont"><a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B3">뿌리채소</a></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td class="sCataFont"><a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B3">새싹허브</a></td>
				</tr>
			</table><br /><br />
			<table width="600">
				<tr>
					<td width="50" style="border-bottom:1px lightgray solid;"><a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B5">원예도구/자제</a></td>
					<td width="50" style="border-bottom:1px lightgray solid;"><a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B6">자갈/모래</a></td>
					<td width="50" style="border-bottom:1px lightgray solid;"><a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B7">받침대</a></td>
					<td width="50" style="border-bottom:1px lightgray solid;"><a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B8">텃밭세트</a></td>
				</tr>
				<tr>
					<td class="sCataFont"><a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B5&scata=B5S01">원예도구</a></td>
					<td class="sCataFont"><a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B6&scata=B6S01">자갈</a></td>
				</tr>
				<tr>
					<td class="sCataFont"><a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B5&scata=B5S02">이름표</a></td>
					<td class="sCataFont"><a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B6&scata=B6S02">모래</a></td>
				</tr>
			</table>
		</div>
	<div class="d_navBcata">
		<div>
			<ul>
				<li style="position:relative;"><a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B1" class="headBcataBox" style="width:100px;">배양토/퇴비</a>
					<nav class="headScataBox" style="left:-5px;">
					<a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B1&scata=B1S01">배양토</a>
					<a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B1&scata=B1S02">퇴비</a>
					</nav>
				</li>
				<li style="position:relative;"><a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B2" class="headBcataBox" style="width:50px;">화분</a>
					<nav class="headScataBox" style="left:-30px;">
					<a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B2&scata=B2S01">화분(소)</a>
					<a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B2&scata=B2S02">화분(대)</a>
					</nav>
				</li>
				<li style="position:relative;"><a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B3" class="headBcataBox" style="width:50px;">씨앗</a>
					<nav class="headScataBox" style="left:-30px;">
					<a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B3&scata=B3S01">잎채소류</a>
					<a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B3&scata=B3S02">열매채소</a>
					<a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B3&scata=B3S03">뿌리채소</a>
					<a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B3&scata=B3S04">새싹허브</a>
					</nav>
				</li>
				<li style="position:relative;"><a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B4" class="headBcataBox" style="width:115px;">영양제/관리제</a>
					<nav class="headScataBox" style="left:3px;">
					<a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B4&scata=B4S01">영양제</a>
					<a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B4&scata=B4S02">관리제</a>
					</nav>
				</li>
				<li style="position:relative;"><a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B5" class="headBcataBox" style="width:115px;">원예도구/자제</a>
					<nav class="headScataBox" style="left:3px;">
					<a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B5&scata=B5S01">원예도구</a>
					<a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B5&scata=B5S02">이름표</a>
					</nav>
				</li>
				<li style="position:relative;"><a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B6" class="headBcataBox" style="width:90px;">자갈/모래</a>
					<nav class="headScataBox" style="left:-9px;">
					<a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B6&scata=B6S01">자갈</a>
					<a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B6&scata=B6S02">모래</a>
					</nav>
				</li>
				<li><a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B7" class="headBcataBox" style="width:65px;">받침대</a>
				</li>
				<li><a href="/inMyGarden/product_list.pdt?ord=idd&psize=20&bcata=B8" class="headBcataBox" style="width:80px;">텃밭세트</a>
				</li>
			</ul>
		</div>
	</div>
</div>
<!-- 카테고리 영역 -->
<!-- <table id="headCata" align="center" width="1080">
	<tr>
		<td style="text-align:center;" width="1080">
			<a href="#" onblur="hideBcata('z');"><img src="/inMyGarden/img/menu-240.png" width="20" id="headMenuImg" onclick="showBcata('z');" /></a>
				<div id="d_headBcata0" style="width:600px; height:300px; border:1px gray solid; position:absolute; top:384px; background:#ffffff; display:none; z-index:25;">
					<table width="600">
						<tr>
							<td width="50" style="border-bottom:1px lightgray solid;"><a href="product_list.pdt?ord=idd&psize=20&bcata=B1">배양토/퇴비</a></td>
							<td width="50" style="border-bottom:1px lightgray solid;"><a href="product_list.pdt?ord=idd&psize=20&bcata=B2">화분</a></td>
							<td width="50" style="border-bottom:1px lightgray solid;"><a href="product_list.pdt?ord=idd&psize=20&bcata=B3">씨앗</a></td>
							<td width="50" style="border-bottom:1px lightgray solid;"><a href="product_list.pdt?ord=idd&psize=20&bcata=B4">영양제/관리제</a></td>
						</tr>
						<tr>
							<td><a href="product_list.pdt?ord=idd&psize=20&bcata=B1&scata=B1S01">배양토</a></td>
							<td><a href="product_list.pdt?ord=idd&psize=20&bcata=B2&scata=B2S01">화분(소)</a></td>
							<td><a href="product_list.pdt?ord=idd&psize=20&bcata=B3&scata=B3S01">잎채소류</a></td>
							<td><a href="product_list.pdt?ord=idd&psize=20&bcata=B4&scata=B4S01">영양제</a></td>
						</tr>
						<tr>
							<td><a href="product_list.pdt?ord=idd&psize=20&bcata=B1&scata=B1S02">퇴비</a></td>
							<td><a href="product_list.pdt?ord=idd&psize=20&bcata=B2&scata=B2S02">화분(대)</a></td>
							<td><a href="product_list.pdt?ord=idd&psize=20&bcata=B3&scata=B3S02">열매채소</a></td>
							<td><a href="product_list.pdt?ord=idd&psize=20&bcata=B4&scata=B4S02">관리제</a></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td><a href="product_list.pdt?ord=idd&psize=20&bcata=B3">뿌리채소</a></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td><a href="product_list.pdt?ord=idd&psize=20&bcata=B3">새싹허브</a></td>
						</tr>
					</table><br /><br />
					<table width="600">
						<tr>
							<td width="50" style="border-bottom:1px lightgray solid;"><a href="product_list.pdt?ord=idd&psize=20&bcata=B5">원예도구/자제</a></td>
							<td width="50" style="border-bottom:1px lightgray solid;"><a href="product_list.pdt?ord=idd&psize=20&bcata=B6">자갈/모래</a></td>
							<td width="50" style="border-bottom:1px lightgray solid;"><a href="product_list.pdt?ord=idd&psize=20&bcata=B7">받침대</a></td>
							<td width="50" style="border-bottom:1px lightgray solid;"><a href="product_list.pdt?ord=idd&psize=20&bcata=B8">텃밭세트</a></td>
						</tr>
						<tr>
							<td><a href="product_list.pdt?ord=idd&psize=20&bcata=B5&scata=B5S01">원예도구</a></td>
							<td><a href="product_list.pdt?ord=idd&psize=20&bcata=B6&scata=B6S01">자갈</a></td>
						</tr>
						<tr>
							<td><a href="product_list.pdt?ord=idd&psize=20&bcata=B5&scata=B5S02">이름표</a></td>
							<td><a href="product_list.pdt?ord=idd&psize=20&bcata=B6&scata=B6S02">모래</a></td>
						</tr>
					</table>
				</div>
			<ul id="headMenu">
				<li style="position:relative;"><a href="product_list.pdt?ord=idd&psize=20&bcata=B1" onmouseover="showBcata('a');" style="z-index:35;">배양토/퇴비</a>
				<div id="d_headBcata1" class="d_headBcataBox" style="height:50px; top:-6px;" onmouseover="showBcata('a');" onmouseout="hideBcata('a');">
					<div style="width:85px; height:50px;"></div>
					<div class="d_headScataBox" style="width:150px;">
						<a href="product_list.pdt?ord=idd&psize=20&bcata=B1&scata=B1S01">배양토</a><br />
						<a href="product_list.pdt?ord=idd&psize=20&bcata=B1&scata=B1S02">퇴비</a>
					</div>
				</div>
				</li>
				<li style="position:relative;"><a href="product_list.pdt?ord=idd&psize=20&bcata=B2" onmouseover="showBcata('b');">화분</a>
				<div id="d_headBcata2" class="d_headBcataBox" style="height:50px; top:-6px;" onmouseout="hideBcata('b');" onmouseover="showBcata('b');">
					<div style="width:30px; height:50px;"></div>
					<div class="d_headScataBox">
						<a href="product_list.pdt?ord=idd&psize=20&bcata=B1&scata=B2S01">화분(소)</a><br />
						<a href="product_list.pdt?ord=idd&psize=20&bcata=B1&scata=B2S02">화분(대)</a>
					</div>
				</div>
				</li>
				<li style="position:relative;"><a href="product_list.pdt?ord=idd&psize=20&bcata=B3" onmouseover="showBcata('c');">씨앗</a>
				<div id="d_headBcata3" class="d_headBcataBox" style="height:100px; top:-6px;" onmouseover="showBcata('c');" onmouseout="hideBcata('c');">
					<div style="width:30px; height:50px;"></div>
					<div class="d_headScataBox">
						<a href="product_list.pdt?ord=idd&psize=20&bcata=B3&scata=B3S01">잎채소류</a><br />
						<a href="product_list.pdt?ord=idd&psize=20&bcata=B3&scata=B3S02">열매채소</a><br />
						<a href="product_list.pdt?ord=idd&psize=20&bcata=B3&scata=B3S03">뿌리채소</a><br />
						<a href="product_list.pdt?ord=idd&psize=20&bcata=B3&scata=B3S04">새싹허브</a>
					</div>
				</div>
				</li>
				<li style="position:relative;"><a href="product_list.pdt?ord=idd&psize=20&bcata=B4" onmouseover="showBcata('d');">영양제/관리제</a>
				<div id="d_headBcata4" class="d_headBcataBox" style="height:50px; top:-6px;" onmouseover="showBcata('d');" onmouseout="hideBcata('d');">
					<div style="width:105px; height:50px;"></div>
					<div class="d_headScataBox">
						<a href="product_list.pdt?ord=idd&psize=20&bcata=B4&scata=B4S01">영양제</a><br />
						<a href="product_list.pdt?ord=idd&psize=20&bcata=B4&scata=B4S02">관리제</a>
					</div>
				</div>
				</li>
				<li style="position:relative;"><a href="product_list.pdt?ord=idd&psize=20&bcata=B5" onmouseover="showBcata('e');">원예도구/자제</a>
				<div id="d_headBcata5" class="d_headBcataBox" style="height:50px; top:-6px;" onmouseover="showBcata('e');" onmouseout="hideBcata('e');">
					<div style="width:105px; height:50px;"></div>
					<div class="d_headScataBox">
						<a href="product_list.pdt?ord=idd&psize=20&bcata=B5&scata=B5S01">원예도구</a><br />
						<a href="product_list.pdt?ord=idd&psize=20&bcata=B5&scata=B5S02">이름표</a>
					</div>
				</div>
				</li>
				<li style="position:relative;"><a href="product_list.pdt?ord=idd&psize=20&bcata=B6" onmouseover="showBcata('f');">자갈/모래</a>
				<div id="d_headBcata6" class="d_headBcataBox" style="height:50px; top:-6px;" onmouseover="showBcata('f');" onmouseout="hideBcata('f');">
					<div style="width:70px; height:50px;"></div>
					<div class="d_headScataBox">
						<a href="product_list.pdt?ord=idd&psize=20&bcata=B6&scata=B6S01">자갈</a><br />
						<a href="product_list.pdt?ord=idd&psize=20&bcata=B6&scata=B6S02">모래</a>
					</div>
				</div>
				</li>
				<li><a href="product_list.pdt?ord=idd&psize=20&bcata=B7" onmouseover="showBcata('g');" onmouseout="hideBcata('g');">받침대</a>
				</li>
				<li><a href="product_list.pdt?ord=idd&psize=20&bcata=B8" onmouseover="showBcata('h');" onmouseout="hideBcata('h');">텃밭세트</a>
				</li>
			</ul>
		</td>
	</tr>
</table> -->
<hr class="headHr" />
</body>
</html>

