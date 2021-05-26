<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
 <head>
  <meta charset="utf-8" />
  <title> seil mart 회원 정보 입력 </title>
  <style>
       body,html{width:100%, height:100%}  
    table{
      position:absolute; left:50%; top:50%;
      transform:translate(-50%, -50%);
      cellpadding:10px;
      width : 600px;
      height:400px;
   }
	 td:nth-child(odd) {
		background:#EAEAEA;
	 }
	 td:nth-child(even) {
		background:rgba(32,52,58,.2);
	 }
	 #last{
	    background:white;
	}
  </style>
  <script>
    function id_search(){
       theURL = "id.jsp";
       window.open(theURL,'idcheck','width=500, height=200');
    }
 </script>
 
 <script>
 
 function check() {
    var regExp = /^[a-z][0-9a-z]*$/g;
    var string = form.Mshp_id.value;
    
    if(!regExp.test(string)){
       alert('올바른 아이디를 입력하세요.\n영문소문자+숫자조합');
       form.Mshp_id.focus();
       return false;      
    }
    if(!form.Mshp_pw.value){
       alert('비밀번호를 입력하세요.');
       form.Mshp_pw.focus();
       return false;      
    }
    if(!form.Mshp_name.value){
       alert('이름을 입력하세요.');
       form.Mshp_name.focus();
       return false;      
    }
    if(!form.Mshp_tel2.value || !form.Mshp_tel3.value){
       alert('전화번호를 입력하세요.');
       form.Mshp_tel2.focus();
       return false;      
    }
    return true;
 } 
 
 </script>
 
 </head>

 <BODY> 
   <FORM ACTION="join.jsp" METHOD=post name="form"
   	onsubmit = "return check()">   
   <TABLE>     
     <tr><td COLSPAN="2" ALIGN="center"><h2>seil mart 회원 정보 입력</h2></td></tr>   
     <TR>   
      <TD> 아이디 </TD>   
      <TD> <INPUT TYPE="text" NAME="Mshp_id" SIZE="10" readonly> 
            <INPUT TYPE="button" value="아이디 생성"  onclick="id_search()"></TD> 
     <TR>   
      <TD> 이름 </TD>
         
      <TD> <INPUT TYPE="text" NAME="Mshp_name" SIZE="10"></TD> 
      </TR> <TR>   <TD> 암호 </TD>   
      <TD> <INPUT TYPE="password" NAME="Mshp_pw" SIZE="10"></TD> 
     </TR> 
     <TR>   
      <TD> 전화번호 </TD>   
      <TD> <SELECT NAME="Mshp_tel1">     
            <OPTION SELECTED> 010</OPTION>     
            <OPTION> 02</OPTION>     
            <OPTION> 053</OPTION>     
            <OPTION> 011</OPTION>     
          </SELECT>
         - <INPUT NAME="Mshp_tel2" SIZE="4" maxlength=4>
         - <INPUT NAME="Mshp_tel3" SIZE="4" maxlength=4> </TD> 
     </TR>
     <TR>   
      <TD> 성별 </TD>   
      <TD> <INPUT TYPE="radio" NAME="Mshp_gender" VALUE="1" CHECKED>남자&nbsp;&nbsp;       
           <INPUT TYPE="radio" NAME="Mshp_gender" VALUE="2">여자 </TD> 
     </TR>
     <TR>   
      <TD COLSPAN="2" ALIGN="center"> <INPUT TYPE="submit" VALUE="등록하기">
         <INPUT TYPE="reset" VALUE="취소하기"> 
       </TD>  
     </TR> 
   </TABLE> 
  </FORM>
 </BODY> 
</html>