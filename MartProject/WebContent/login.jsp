<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "martcon.userDAO" %>
    <%@ page import = "martcon.TR_BUYER" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
</head>
<body>
	<%
	String Mshp_id = request.getParameter("Mshp_id");
	String Mshp_pw = request.getParameter("Mshp_pw");
	userDAO userdao = new userDAO();
	TR_BUYER buyer = userdao.readDB(Mshp_id);
	
	if(Mshp_pw.equals(buyer.getMshp_pw())){
		session.setAttribute("Mshp_name", buyer.getMshp_name());
		session.setAttribute("Mshp_id", buyer.getMshp_id());
		request.setAttribute("target", "home");
	}else{
		request.setAttribute("target", "loginForm");
	}
	%>
	<jsp:forward page = "martproject.jsp"/>
</body>
</html>