<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LoginForm</title>
</head>
<body>
	<form action = 'login.jsp'>
		<table>
			<tr><td colspan = "2" align = "center"><h2>로그인</h2></td></tr>
			<tr>
			 <td id = 'Mshp_id'>아이디</td>
			 <td><input type = text name = Mshp_id></td>
			 </tr><tr> <td>패스워드</td>
			 <td><input type = password name = Mshp_pw></td>
			 </tr>
			 <tr>
			 <td colspan = "2" align = "center">
			  <input type = "submit" value = '로그인'>
			  </td>
			  </tr>
		</table>
	</form>
</body>
</html>