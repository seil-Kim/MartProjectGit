<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="martcon.BoardDTO" %>
<%@ page import="martcon.BoardDAO" %>
<%
	String SeqNo = request.getParameter("SEQ_NO");
	int pageLine;
	int rowcnt;
	session = request.getSession();
	if(request.getParameter("line") != null){
		pageLine = Integer.parseInt(request.getParameter("line"));
		session.setAttribute("pageLine", pageLine);
	}else if(session.getAttribute("pageLine") != null){
		pageLine = (int)session.getAttribute("pageLine");
	}else{
		pageLine = 5;
	}
	
	int pageNo;
	if(SeqNo != null)
		pageNo = Integer.parseInt(SeqNo);
	else
		pageNo = 1;
	
	String s_cond = request.getParameter("cond");
	String s_text = request.getParameter("ctext");
	BoardDAO bdao = new BoardDAO();
	List<BoardDTO> list = bdao.readDBList(pageNo, pageLine, s_cond, s_text);
	
	int totalcnt = bdao.totalCnt();
	if(totalcnt > 0)
		rowcnt = (int) Math.ceil((double)totalcnt/pageLine);
	else
		rowcnt = 0;
	request.setAttribute("list", list);
	request.setAttribute("rowcnt", rowcnt);
%>
<jsp:forward page="BoardListView.jsp"/>