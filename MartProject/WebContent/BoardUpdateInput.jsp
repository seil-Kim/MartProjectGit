<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="martcon.BoardDTO" %>
<%@ page import="martcon.BoardDAO" %>
<%
	int bno = Integer.parseInt(request.getParameter("bno"));
	BoardDAO bdao = new BoardDAO();
	BoardDTO board = bdao.readDB(bno);
	
	request.setAttribute("board", board);
%>
<jsp:forward page="BoardUpdateForm.jsp"/>