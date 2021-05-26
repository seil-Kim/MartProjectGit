<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "martcon.DBCon" %>
<%
	try{
		Connection con = DBCon.getCon();
		out.print("연결 성공<br>");
		DBCon.close(con, null, null);
	}catch(Exception e){
		out.print("연결실패<br>");
	}
%>