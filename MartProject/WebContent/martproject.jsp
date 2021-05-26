<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>martproject</title>
	<style>
	.cust{
		list-style : none; float : right;
	}
	.cust_id{
		float : left; margin : 5px 20px 5px 20px; color : #000000;
		font-weight : bold; line-height : "70px;"
	}
	.menu{
		list-style : none; float : right;
	}
	.menu_li{
		float : left; margin : 5px 20px 5px 20px; color : #000000;
		font-weight : bold; line-height : "70px;"
	}
	
	.logo{
		float : left;
	}
	
	.frame{
   		position : absolute; left: 50%; top: 50%;
   		transform : translate(-50%, -50%);
	}
	
	.footer{
		position : fixed; bottom : 0px; text-align : center;
		width : 100%; height : 50px;
	}
	li.menu{display : inline-block;}
	
	.submenu{display: none; position: absolute;
			boxshadow: 0px 8px 16px 0px rgba(0,0,0,0.8);}
		
	.submenu a{display: block; color: black; padding: 12px 16px;
				text-decoration: none; text-align: left;}
	
	.submenu a:hover{background : lavender; color : #000000;}
	.menu:hover .submenu{display : block; color : #000000;}
	
	a:link{text-decoration : none; color : #000000}
	a:visited{text-decoration : none; color : #000000}
	a:active{text-decoration : none; color : #000000}
	a:hover{text-decoration : none; color : #000000}
	</style>
</head>
<body>
<div style = "width : 100%">
	<div class = "logo">
		<a href = "idx_Jsp.jsp?idx=home">
			<img src = "logo.PNG" style = "height : 80px"/>
		</a></li>
	</div>
	
	<ul class = "cust" style = "width : 150px;">
		<%
			Object s_name = session.getAttribute("Mshp_name");
			Object s_id = session.getAttribute("Mshp_id");
			session.setAttribute("Mshp_id", s_id);
			if(session.getAttribute("Mshp_id")==null){
				out.println("<a href = 'idx_Jsp.jsp?idx=loginForm'>로그인</a>");
				out.print("<a href = 'idx_Jsp.jsp?idx=custcheck'>회원가입</a>");
			}else{
				out.print("<li><a href = 'logout.jsp'>로그아웃</a></li>");
			}%>
	</ul>
	
	<ul class = "menu">
		<li class = "menu_li"><a href = "idx_Jsp.jsp?idx=home">홈</a></li>
		<li class = "menu_li"><a href = "idx_Jsp.jsp?idx=gdslist">상품</a>
			<div class = "submenu">
				<a href = "idx_Jsp.jsp?idx=gdslist">상품목록</a>
				<a href = "idx_Jsp.jsp?idx=cart"">장바구니</a>
			</div>
		</li>
		<li class = "menu_li"><a href = "idx_Jsp.jsp?idx=event">이벤트</a></li>
		<li class = "menu_li"><a href = "idx_Jsp.jsp?idx=BoardList" target = "center">고객센터</a></li>
	</ul>
<!-- 	<iframe frameborder = 0 src = "home.html" 
			name = "center" width = "100%" height = "1000">
	</iframe> -->
	
	<div class = "frame" name = "center">
		<jsp:include page="${target}.jsp"/>
	</div>
	
	<div class = "footer">
		<jsp:include page = "footer.jsp"/>
	</div>
</body>
</html>