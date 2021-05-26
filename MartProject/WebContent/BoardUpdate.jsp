<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="martcon.BoardDAO" %>
<jsp:useBean id = "board" class = "martcon.BoardDTO" />
<jsp:setProperty property="*" name="board"/>

<%
	request.setCharacterEncoding("utf-8");
	int bno = Integer.parseInt(request.getParameter("bno"));
	board.setBno(bno);
	BoardDAO bdao = new BoardDAO();
	bdao.updateDB(board);
	
	response.sendRedirect("BoardList.jsp");
%>
<%-- <jsp:forward page="BoardList.jsp"/> --%>