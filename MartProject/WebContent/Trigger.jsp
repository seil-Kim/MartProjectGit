<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "martcon.DBCon" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일자별 작업 목록</title>
</head>
<body>
	<table border = "1" cellpadding = "5">
		<tr>
			<th>상품 코드</th>
			<th>상품명</th>
			<th>판매 가격</th>
			<th>재고</th>
			<th>등록 일자</th>
		</tr>
	<%
		Connection con = DBCon.getCon();
		String sql = "select * from TR_GDSCOPY";
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			out.print("<tr><td>" + rs.getString("Gds_cd") + "</td><td>"
					+ rs.getString("Gds_nm") + "</td><td>"
					+ rs.getInt("Sale_amt") + "</td><td>"
					+ rs.getInt("Gds_cnt") + "</td><td>"
					+ rs.getString("Reg_dt") + "</td><td>"
					);
		}
	%>
	</table>
</body>
</html>