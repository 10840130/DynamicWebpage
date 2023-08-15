<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
if(session.getAttribute("id") != null ){
    if(request.getParameter("pwd")!=null){
    sql = "UPDATE `member` SET `username`='"+request.getParameter("username")+"', `email`='"+request.getParameter("mail")+"', `phone`='"+request.getParameter("phone")+"'";
	sql+= ", `password`='"+request.getParameter("pwd")+"', `address`='"+request.getParameter("adr")+"'";
	sql+= "WHERE `mid`='"+session.getAttribute("id")+"'";
	con.createStatement().execute(sql);		
	con.close();//結束資料庫連結
	
	response.sendRedirect("member.jsp");
	}
	
}
else{
	con.close();//結束資料庫連結
	}
%>