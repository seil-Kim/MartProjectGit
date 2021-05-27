<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "martcon.TR_GDS" %>
    <%@ page import = "martcon.gdsDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>joinItemView</title>
</head>
<body>
	<%
		String ccd = request.getParameter("Gds_cd");
		gdsDAO gdsdao = new gdsDAO();
		TR_GDS gds = gdsdao.readgdsDB(ccd);
	%>
	
	<style>
		body,html{width : 100%, height : 100%}
		table{
			position : absolute; left : 50%; top : 50%;
			transform : translate(-50%, -50%);
			cellpadding : 10px;
			width : 300px;
			height : 200px;
		}
	</style>
	<table border = 1>
		<tr><td width = 80>상품코드</td><th><%=gds.getGds_cd() %></th></tr>
		<tr><td>상품명</td><th><%=gds.getGds_nm() %></th></tr>
		<tr><td>판매가격</td><th><%=gds.getSale_amt() %></th></tr>
		<tr><td>재고</td><th><%=gds.getGds_cnt() %></th></tr>
		<tr><td>등록일자</td><th><%=gds.getReg_dt() %></th></tr>
		<tr><th colspan = 2>
		<input type = "button" value = "정보수정 " onclick = "location.href='idx_Jsp.jsp?Gds_cd=<%=gds.getGds_cd() %>&idx=joinUpdateProcess'">
		<input type = "button" value = "정보삭제 " onclick = "location.href='idx_Jsp.jsp?Gds_cd=<%=gds.getGds_cd() %>&idx=joindelete'">
		</th></tr>
	</table>
</body>
</html>