<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "martcon.userDAO" %>
    <%@ page import = "martcon.TR_BUYER" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>join</title>
</head>
<body>
	<%request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean id = "buyer" class = "martcon.TR_BUYER"/>
	<!--<jsp:setProperty property="*" name="buyer"/>-->
	<%
		buyer.setMshp_id(request.getParameter("Mshp_id"));
		buyer.setMshp_name(request.getParameter("Mshp_name"));
		buyer.setMshp_pw(request.getParameter("Mshp_pw"));
		buyer.setMshp_gender(request.getParameter("Mshp_gender"));		
	
		String Mshp_tel1 = request.getParameter("Mshp_tel1");
		String Mshp_tel2 = request.getParameter("Mshp_tel2");
		String Mshp_tel3 = request.getParameter("Mshp_tel3");
		buyer.setMshp_tel(Mshp_tel1 + "-" + Mshp_tel2 + "-" + Mshp_tel3);
		
		userDAO udao = new userDAO();
		udao.insertDB(buyer);
		request.setAttribute("Mshp_name", buyer.getMshp_name());
		request.setAttribute("target", "join_result");
	%>
	<jsp:forward page="martproject.jsp"/>
</body>
</html>