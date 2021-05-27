<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
    <%@ page import = "martcon.cartDAO" %>
    <%@ page import = "martcon.incart" %>
    <%@ page import = "java.util.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cart</title>
 <style>
   	 body,html{width:100%, height:100%}  

	 table{
		position:absolute; left:50%; top:50%;
		transform:translate(-50%, -50%);
	 }
	 td:nth-child(odd) {
		background:#EAEAEA;
	 }
	 td:nth-child(even) {
		background:rgba(32,52,58,.2);
	 }
	 #last{
	    background:white;
	}
</style>
</head>
<body>
	<%
		cartDAO cdao = new cartDAO();
		List<incart> cart = cdao.readAllDB();
	%>
	<table CELLPADDING="30" width = "350">
		<thead>
			<tr>
				<th>상품명</th>
				<th>가격</th>
				<th>수량</th>
			</tr>
			<%
			for(int i = 0; i < cart.size(); i++){
				incart ic = (incart)cart.get(i);%>
				<%out.print("<td>" + ic.getGds_nm() + "</td>");
				out.print("<td>" + ic.getSale_amt() + "</td>");
				out.print("<td>" + ic.getGds_buycnt() + "</td>");%></td></tr><br><%
			}			
		%>
			<tr>
				<td colspan = "6" align = "center" id = "last"> <input type = "submit" value = "상품 결제">&nbsp;&nbsp;
				<input type = "reset" value = "장바구니 제거"></td>
			</tr>
		</thead>
	</table>
</body>
</html>