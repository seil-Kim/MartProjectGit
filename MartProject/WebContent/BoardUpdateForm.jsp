<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
	<form action = BoardUpdate.jsp>
		<input type = hidden name = "bno" value = "${board.getBno()}">
		<table>
			<tr><td colspan="2" height="50" align="center"><font size="5">게시글 입력</font></td></tr>
			<tr><td>작성자</td>
			<td><input type=text name="writer" value="${board.getWriter()}" readonly></td></tr>
			<tr><td>제 목</td><td>
			<input type=text name="title" size="60" maxlength="60" value="${board.getTitle()}"></td></tr>
			<tr><td>내 용</td><td>
			<textarea cols="65" rows="10" name="content" maxlength="2000">${board.getContent()}</textarea>
			</td></tr>
			<tr><td colspan="2" height="10"></td></tr>
			<tr><td colspan="2" align="right">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
				 <tr><td width="28%">&nbsp;</td><td width="51%">&nbsp;</td>
				 <td width="12%"><a href = 'BoardList.jsp'><input type = "button" value = "목록으로"></td></a>
				 <td>&nbsp;&nbsp;</td><td width="9%"><input type="submit" value="수정"></td>
				 </tr></table>
				</td></tr>
		</table>
	</form>
</body>