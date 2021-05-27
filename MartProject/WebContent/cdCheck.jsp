<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "martcon.gdsDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>cdCheck</title>
</head>
<body>
	<%
		String ccd = request.getParameter("ccd");
		gdsDAO gdsdao = new gdsDAO();
		request.setAttribute("ccd", ccd);
		if(gdsdao.cdcheck(ccd))
			request.setAttribute("result", "true");
		else
			request.setAttribute("result", "false");
	%>
	<jsp:forward page = "cd.jsp"/>
</body>
</html>