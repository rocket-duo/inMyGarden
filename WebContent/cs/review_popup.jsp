<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후기 게시판 상품 선택 팝업</title>
<style>
.d_reviewPopup { width:700px; margin:0 auto; }
.d_reviewPopup table { border:1px solid black; text-align:center; }
.d_reviewPopup select { margin-bottom:10px; }
.reviewChoiceBtn { width:70px; border:0px; }
.t_reviewPopupBtn { border:0px !important; float:right; padding-top:10px; }
</style>
</head>
<body>
<!-- 예시1.구매한 상품이 없을 경우 -->
<div class="d_reviewPopup">
	<span>총 0개의 상품이 검색되었습니다.</span>
	<span style="float:right">
		<select>
			<option value=""> 10개 보기 </option>
			<option value="1"> 20개 보기 </option>
			<option value="2"> 30개 보기 </option>
		</select>
	</span>
	<table width="700">
		<tr style="background:lightgray;">
			<td width="10%">선택</td>
			<td width="20%">상품 이미지</td>
			<td width="*">상품 정보</td>
		</tr>
		<tr>
			<td colspan="3">구매한 상품이 없습니다.</td>
		</tr>
	</table>
	<table class="t_reviewPopupBtn">
		<tr>
			<td align="right">
			<input type="submit" value="확인" class="reviewChoiceBtn" />
			<input type="button" value="취소" class="reviewChoiceBtn" />
			</td>
		</tr>
	</table>
</div>
<br /><br /><br /><br /><br />
<!-- 예시2.구매한 상품이 있을 경우 -->
<div class="d_reviewPopup">
	<form>
		<span>총 0개의 상품이 검색되었습니다.</span>
		<span style="float:right">
			<select>
				<option value=""> 10개 보기 </option>
				<option value="1"> 20개 보기 </option>
				<option value="2"> 30개 보기 </option>
			</select>
		</span>
		<table width="700">
			<tr style="background:lightgray;">
				<td width="10%">선택</td>
				<td width="20%">상품 이미지</td>
				<td width="*">상품 정보</td>
			</tr>
			<tr>
				<td><input type="checkbox" name="reviewChoice" /></td>
				<td><img src="../img/picture-240.png" width="70"/></td>
				<td align="left">미니화분 1호<br/>2,500원</td>
			</tr>
		</table>
		<table class="t_reviewPopupBtn">
			<tr>
				<td align="right">
				<input type="submit" value="확인" class="reviewChoiceBtn" />
				<input type="button" value="취소" class="reviewChoiceBtn" />
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>
