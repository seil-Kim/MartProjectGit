<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "martcon.userDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>idCheck</title>
</head>
<body>
	<%
		String Mshp_id = request.getParameter("Mshp_id");
		userDAO userdao = new userDAO();
		request.setAttribute("Mshp_id", Mshp_id);
		if(userdao.idcheck(Mshp_id))
			request.setAttribute("result", "true");
		else
			request.setAttribute("result", "false");
	%>
	<jsp:forward page = "id.jsp"/>
</body>
</html>