<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "martcon.TR_GDS" %>
    <%@ page import = "martcon.gdsDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>joinUpdateProcess</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String ccd = request.getParameter("Gds_cd");
	
		gdsDAO gdsdao = new gdsDAO();
		TR_GDS gds = gdsdao.readgdsDB(ccd);
		request.setAttribute("gds", gds);
		request.setAttribute("target", "joinUpdateForm");
	%>
	<jsp:forward page="martproject.jsp"/>
</body>
</html>