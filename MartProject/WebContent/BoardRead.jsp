<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "martcon.BoardDAO" %>
<jsp:useBean id = "board" class = "martcon.BoardDTO" />
<jsp:setProperty property="*" name="board"/>

<%
	String SeqNo = request.getParameter("SEQ_NO");
	int bno = Integer.parseInt(SeqNo);
	BoardDAO bdao = new BoardDAO();
	board = bdao.readDB(bno);
%>
[제목]<%=board.getTitle() %><br>
[작성자]<%=board.getWriter() %><br>
[작성일시]<%=board.getRegdate() %><br>
--------------------------------------------------------------------<br>
<%=board.getContent() %> <br><br>
<a href = 'BoardUpdateInput.jsp?bno=<%=board.getBno() %>'>[수정]</a>
<a href = 'BoardDelete.jsp?bno=<%=board.getBno() %>'>[삭제]</a>
<a href = 'BoardList.jsp'>[목록으로]</a>