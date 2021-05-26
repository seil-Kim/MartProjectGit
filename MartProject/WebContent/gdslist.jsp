<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "martcon.TR_GDS" %>
    <%@ page import = "martcon.gdsDAO" %>
    <%@ page import = "java.util.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gdslist</title>
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
		gdsDAO mdao = new gdsDAO();
		List<TR_GDS> gdslist = mdao.readAllDB();
	%>
  <form ACTION="incart.jsp" METHOD=post name="form"> 
	<table CELLPADDING="10" width = "300">
		<thead>
			<tr>
				<th>체크</th>
				<th>상품명</th>
				<th>가격</th>
				<th>재고</th>
				<th>수량</th>
			</tr>
			
			<%
			for(int i = 0; i < gdslist.size(); i++){
				TR_GDS gds = (TR_GDS)gdslist.get(i);%>
				<tr><td><input type = "checkbox" value = "i""/>
				<%out.print("<td>" + gds.getGds_nm() + "</td>");
				out.print("<td>" + gds.getSale_amt() + "</td>");
				out.print("<td>" + gds.getGds_cnt() + "</td>");%>
				<td><SELECT NAME="cnt">     
            		<OPTION SELECTED> 1</OPTION>     
            		<OPTION> 2</OPTION>     
            		<OPTION> 3</OPTION>     
            		<OPTION> 4</OPTION>
            		<OPTION> 5</OPTION>     
          		</SELECT></td>
          		</td></tr><br><%
			}			
		%>
			<tr>
				<td colspan = "6" align = "center" id = "last"> <input type = "submit" value = "장바구니 담기">&nbsp;&nbsp;
				<input type = "reset" value = "체크 초기화"></td>
			</tr>
			
		</thead>
	</table>
   </form>
</body>
</html>