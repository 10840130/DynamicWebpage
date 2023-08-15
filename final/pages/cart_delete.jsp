<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%

           sql="use final_web";
           con.createStatement().execute(sql);
		   
		   request.setCharacterEncoding("UTF-8");  
		   
           
		   
		if(request.getParameter("button_cart_del") != null ){
			
			String id = (String) session.getAttribute("id");
			String new_pd_id=request.getParameter("pd_id");
			
			sql = "DELETE FROM `cart`  WHERE `pid`='"+new_pd_id+"' AND `mid`='"+id+"' ";
			con.createStatement().execute(sql);
			
			response.sendRedirect("cart.jsp");   
			}
	   

%>