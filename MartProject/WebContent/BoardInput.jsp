<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BoardInput</title>
</head>
<body>
	<form action = BoardSave.jsp>
		<table>
			<tr><td colspan="2" height="50" align="center"><font size="5">게시글 입력</font></td></tr>
			<tr><td>작성자</td><td><input type=text name="writer"></td></tr>
			<tr><td>제 목</td><td><input type=text name="title" size="60" maxlength="60"></td></tr>
			<tr><td>내 용</td>
			 <td><textarea cols="65" rows="10" name="content" maxlength="2000"></textarea></td></tr>
			 <tr><td colspan="2" height="10"></td></tr>
			 <tr><td colspan="2" align="right">
			 	<table width="100%" border="0" cellpadding="0" cellspacing="0">
			 		<tr>
			 			<td width="28%">&nbsp;</td>
			 			<td width="51%">&nbsp;</td>
			 			<td width="12%"><a href='BoardList.jsp'><input type="button" value="목록으로"></a></td>
			 			<td>&nbsp;&nbsp;</td>
			 			<td width="9%"><input type="submit" value="전송"></td>
			 		</tr>
			 	</table>
			 </td></tr>
		</table>
	</form>
</body>
</html>