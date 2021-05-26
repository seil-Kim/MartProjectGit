<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>custcheck</title>
	<script>
		function check(){
			var frm = document.frm;
			if(!frm.agree1.checked){
				alert("약관에 동의하세요!");
				return;
			}
			if(!frm.agree2.checked){
				alert("개인정보에 동의하세요!");
				return;
			}
			location.href = "inputForm.jsp";
		}
		function allCheck(){
			if(frm.all.checked){
				frm.agree1.checked = true;
				frm.agree2.checked = true;
			}else{
				frm.agree1.checked = false;
				frm.agree2.checked = false;
			}
		}
		function changechk(){
			if(frm.agree1.checked && frm.agree2.checked){
				frm.all.checked = true;
			}else{
				frm.all.checked = false;
			}
			return true;
		}
	</script>
</head>
<body>
   <form action = "#" name = "frm">
      <div>
         <input type = "checkbox" name = "all" id = "all" onclick = "allCheck()"/>
            <label for = "all">
            전체 동의
            </label>
      </div>
      
      <p><textarea cols = "30" rows = "10"> 약관동의
약관에 동의하십니까?</textarea><br>
      <input type = "checkbox" name = "agree1" id = "agree1" onchange="changechk()" />
         <label for = "agree1">약관동의</label>
      </p>
      
      <p><textarea cols = "30" rows = "10"> 개인정보
개인정보 이용에 동의하십니까?</textarea><br>
      <input type = "checkbox" name = "agree2" id = "agree2" onchange="changechk()"/>
         <label for = "agree2">개인정보동의</label>
      </p>
      
      <p><input type = "button" value = "동의" onclick = "check()" />
         <input type = "reset" value = "취소" /></p>
   </form>

</body>

</html>