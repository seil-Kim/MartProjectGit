<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "martcon.TR_GDS" %>
    <%@ page import = "martcon.gdsDAO" %>
    <%@ page import = "java.util.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gdslistview</title>
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
	<table CELLPADDING="10" width = "500">
		<thead>
			<tr>
				<th>체크</th>
				<th>코드</th>
				<th>상품명</th>
				<th>판매가격</th>
				<th>재고</th>
				<th>등록일자</th>
			</tr>
			
			<%
			for(int i = 0; i < gdslist.size(); i++){
				TR_GDS gds = (TR_GDS)gdslist.get(i);%>
				<tr><td><input type = "checkbox" value = "i""/>
				<%
				out.print("<td><a href='idx_Jsp.jsp?Gds_cd="+gds.getGds_cd()+"&idx=joinItemView'>"
						+gds.getGds_cd()+"</a></td>");
				out.print("<td>" + gds.getGds_nm() + "</td>");
				out.print("<td>" + gds.getSale_amt() + "</td>");
				out.print("<td>" + gds.getGds_cnt() + "</td>");
				out.print("<td>" + gds.getReg_dt().substring(0,10) + "</td>");%>
          		</td></tr><br><%
			}			
		%>			
		</thead>
	</table>
</body>
</html>