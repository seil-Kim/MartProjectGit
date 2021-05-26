<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "martcon.cartDAO" %>
    <%@ page import = "martcon.incart" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean id = "incart" class = "martcon.incart"/>
	<!--<jsp:setProperty property="*" name="buyer"/>-->
	<%
		incart.setGds_nm(request.getParameter("Gds_nm"));
		incart.setSale_amt(request.getParameter("Sale_amt"));
		incart.setGds_buycnt(request.getParameter("Gds_buycnt"));	
		
		cartDAO cdao = new cartDAO();
		cdao.insertDB(incart);
		request.setAttribute("Gds_nm", incart.getGds_nm());
		request.setAttribute("target", "cart");
	%>
	<jsp:forward page="martproject.jsp"/>
</body>
</html>
</body>
</html>