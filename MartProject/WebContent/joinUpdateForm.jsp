<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>joinUpdateForm</title>
</head>
<body>
	<form action = "joinUpdate.jsp" method = post name = "form">
		<table>
			<tr><td colspan = "2" align = "center"><h2>상품 정보 수정</h2></td></tr>
			<tr><td>상품코드</td>
			<td><input type = "text" name = "Gds_cd" size = "10" readonly value = ${gds.getGds_cd()}></td></tr>
			<tr><td>상품명</td>
			<td><input type = "text" name = "Gds_nm" size = "10" value = ${gds.getGds_nm()}></td></tr>
			<tr><td>판매가격</td>
			<td><input type = "text" name = "Sale_amt" size = "20" value = ${gds.getSale_amt()}></td></tr>
			<tr><td>재고</td>
			<td><input type = "text" name = "Gds_cnt" size = "20" value = ${gds.getGds_cnt()}></td></tr>
			<tr><td>등록일자</td>
			<td><input type = "text" name = "Reg_dt" size = "20" value = ${gds.getReg_dt()}></td></tr>
			<tr><td colspan = "2" align = "center"><input type = "submit" value = "수정하기"></td></tr>
		</table>
	</form>
</body>
</html>