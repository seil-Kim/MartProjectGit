<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "martcon.TR_GDS" %>
    <%@ page import = "martcon.gdsDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>joinUpdate</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8"); %>
	 
	<jsp:useBean id="gds" class="martcon.TR_GDS"/>
	
	<%	
		
		gds.setGds_cd(request.getParameter("Gds_cd"));
		gds.setGds_nm(request.getParameter("Gds_nm"));
		gds.setSale_amt(Integer.parseInt(request.getParameter("Sale_amt")));
		gds.setGds_cnt(Integer.parseInt(request.getParameter("Gds_cnt")));
		gds.setReg_dt(request.getParameter("Reg_dt"));
		
		gdsDAO gdao = new gdsDAO();
		gdao.dbUpdate(gds);
		request.setAttribute("target", "gdslistview");
	%>
	<jsp:forward page="martproject.jsp"/>
</body>
</html>