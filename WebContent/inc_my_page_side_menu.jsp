<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
//식물 프론트 ppt p.43 마이페이지 왼편 include 부분
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/default.css" />
<style>
#include_side_menu {
   display:inline-block;
   float:left;
   padding-left:0px;
   width:280px;
}
</style>
</head>
<body>
<div id="include_side_menu">
   <div>
   <a href="my_page_home.jsp"><h3>마이페이지</h3></a>
   </div>
   <div>
   <h4>마이쇼핑</h4>
   <a href=""><p>주문목록/배송조회</p></a>
   <a href=""><p>취소/반품/교환 내역</p></a>
   <a href=""><p>찜리스트</p></a>
   </div>
   <div>
   <h4>회원정보</h4>
   <a href="../member/my_info_form.jsp"><p>회원정보 수정</p></a>
   <a href="my_info_addr.jsp"><p>배송 주소록 관리</p></a>
   </div>
   <div>
   <h4>혜택관리</h4>
   <a href=""><p>나의 적립금 내역</p></a>
   </div>
   <div>
   <h4>고객편의</h4>
   <a href=""><p>나의 상품 문의</p></a>
   <a href=""><p>나의 상품 후기</p></a>
   </div>
</div>
</body>
</html>