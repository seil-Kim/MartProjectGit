<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="martcon.BoardDAO" %>
<%
	int bno = Integer.parseInt(request.getParameter("bno"));
	BoardDAO bdao = new BoardDAO();
	bdao.deleteDB(bno);
	
	response.sendRedirect("BoardList.jsp");
%>
<%-- <jsp:forward page="BoardList.jsp"/> --%>