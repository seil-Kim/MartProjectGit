<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method = "post" action = "cdCheck.jsp" name = "cdcheckform">
		코드 : <input type = "text" name = "ccd">
		<input type = "submit" value = "중복 확인">
	</form>
	
	<%
		if(request.getAttribute("result") != null){
			String result = (String) request.getAttribute("result");
			String ccd = (String) request.getAttribute("ccd");
			if(result.equals("true")){ %>
				<script type = "text/javascript">
				alert('이미 사용중인 코드 입니다');
				history.go(-1);
				</script>					
<%			}else {%>
				<script type = "text/javascript">
					alert('사용 가능한 코드 입니다');
					opener.document.form.Gds_cd.value = "${ccd}";
					opener.form.Gds_nm.focus();
					window.self.close();
				</script>
<%			}
		}%>
</body>
</html>