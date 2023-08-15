<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%

           sql="use final_web";
           con.createStatement().execute(sql);
		   
		   request.setCharacterEncoding("UTF-8");  
		   
           
		   
		if(request.getParameter("button_add") != null ){
			

			String new_pd_name=request.getParameter("pd_name");
			String new_pd_num=request.getParameter("pd_num");
			String new_pd_price=request.getParameter("pd_price");										
			
			
			sql = "INSERT product (`pd_name`, `pd_number`, `pd_price`) VALUES ('"+new_pd_name+"', '"+new_pd_num+"', '"+new_pd_price+"') ";
			con.createStatement().execute(sql);
			
			out.print("修改成功,<a href='pd-control.jsp'>回到後台介面</a>");
			
			}

%>