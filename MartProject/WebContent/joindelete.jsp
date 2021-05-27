<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "martcon.gdsDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>joindelete</title>
</head>
<body>
	<%
		String Gds_cd = request.getParameter("Gds_cd");
		gdsDAO udao = new gdsDAO();
		udao.deleteDB(Gds_cd);
		request.setAttribute("target", "gdslistview");
	%>
	<jsp:forward page = "martproject.jsp"/>
</body>
</html>