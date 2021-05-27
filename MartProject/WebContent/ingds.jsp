<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ingds</title>
<title> 회원정보 입력 양식 </title>
  <style>
       body,html{width:100%, height:100%}  
    table{
      position:absolute; left:50%; top:50%;
      transform:translate(-50%, -50%);
      cellpadding:10px;
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
    function cd_search(){
       theURL = "cd.jsp";
       window.open(theURL,'cd_check','width=500, height=200');
    }
 </script>
 
 <script>
 
 function check() {
    var regExp = /^[a-z][0-9a-z]*$/g;
    var string = form.id.value;
    
    if(!regExp.test(string)){
       alert('올바른 코드를 입력하세요.\n영문소문자+숫자조합');
       form.id.focus();
       return false;      
    }
    if(!form.Gds_nm.value){
       alert('상품명을 입력하세요.');
       form.Gds_nm.focus();
       return false;      
    }
    if(!form.Sale_amt.value){
       alert('판매가격을 입력하세요.');
       form.Sale_amt.focus();
       return false;      
    }
    if(!form.Gds_cnt.value){
       alert('재고를 입력하세요.');
       form.Gds_cnt.focus();
       return false;      
    }
    return true;
 } 
 </script>
 
</head>
<body>
<FORM ACTION="joingds.jsp" METHOD=post name="form">   
   <TABLE  width = 500>     
     <tr><td COLSPAN="2" ALIGN="center"><h2>상품 정보 입력</h2></td></tr>   
     <TR>   
      <TD> 상품코드 </TD>   
      <TD> <INPUT TYPE="text" NAME="Gds_cd" SIZE="10" readonly> 
            <INPUT TYPE="button" value="상품 코드 확인"  onclick="cd_search()"></TD> 
     <TR>   
      <TD> 상품명 </TD>
         
      <TD> <INPUT TYPE="text" NAME="Gds_nm" SIZE="10"></TD>
     </TR> 
     <TR>   
      <TD> 판매가격 </TD>   
      <TD> <INPUT TYPE="text" NAME="Sale_amt" SIZE="10"></TD> 
     </TR>

     <TR>   
      <TD> 재고 </TD>   
      <TD> <INPUT TYPE="text" NAME="Gds_cnt" SIZE="10"></TD>
     </TR> 
     <TR>   
      <TD> 등록일자 </TD>   
      <TD> <INPUT TYPE="text" NAME="Reg_dt" SIZE="10"></TD>
     </TR>
     <TR>   
      <TD COLSPAN="2" ALIGN="center"> <INPUT TYPE="submit" VALUE="등록하기">
         <INPUT TYPE="reset" VALUE="취소하기"> 
       </TD>  
     </TR> 
   </TABLE> 
  </FORM>
</body>
</html>