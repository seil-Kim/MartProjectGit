<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script>
		var str1="꽝 ! 다음을 기약하세요 !";
		var str2="당첨 ! 축하합니다. !";
	</script>
	
	<style>
		table{ position:absolute; left:50%; top:50%;
      transform:translate(-50%, -50%);}
      
		div{width: 100px; height: 100px; border-radius: 50%;
			display: inline-block;}
			
		#b1{background:red;} #b2{background:green;}
		#b3{background:blue;} #b4{background:orange;}
		#b5{background:skyblue;}
	</style>
</head>
<body>
<table>
	<tr>
		<td><div id="b1" onclick="alert(str1);"></div></td>
		<td><div id="b2" onclick="alert(str1);"></div></td>
		<td><div id="b3" onclick="alert(str1);"></div></td>
		<td><div id="b4" onclick="alert(str2);"></div></td>
		<td><div id="b5" onclick="alert(str1);"></div></td>
	</tr>
</table>

</body>
</html>