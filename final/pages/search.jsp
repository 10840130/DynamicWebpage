<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
sql="use final_web";
           con.createStatement().execute(sql);
		   
		   request.setCharacterEncoding("UTF-8");  
		   
           
		   
		if(request.getParameter("search_btn") != null ){
			
			String new_search=request.getParameter("search_btn");
									
			
			
			sql = "SELECT * FORM `product` WHERE `pd_name`='"+new_search+"'";
			con.createStatement().execute(sql);
			
			out.print("修改成功,<a href='pd-control.jsp'>回到後台介面</a>");
			
			}