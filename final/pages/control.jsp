<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%

           sql="use final_web";
           con.createStatement().execute(sql);
		   
		   request.setCharacterEncoding("UTF-8");  
		   
           
		   
		if(request.getParameter("button_ON") != null ){
			
			String new_pd_id=request.getParameter("pd_order");
			String new_pd_name=request.getParameter("pd_name");
			String new_pd_num=request.getParameter("pd_num");
			String new_pd_price=request.getParameter("pd_price");										
			
			
			sql = "UPDATE `product` SET `status`='ON'  WHERE `pid`='"+new_pd_id+"'";
			con.createStatement().execute(sql);
			
			
			
			}
		else if(request.getParameter("button_OFF") != null ){
			
			String new_pd_id=request.getParameter("pd_order");
			String new_pd_name=request.getParameter("pd_name");
			String new_pd_num=request.getParameter("pd_num");
			String new_pd_price=request.getParameter("pd_price");
			
			sql = "UPDATE `product` SET `status`='OFF'  WHERE `pid`='"+new_pd_id+"'";
			con.createStatement().execute(sql);
			
			
			}
			
		else if(request.getParameter("button_mdf") != null ){
			
			String new_pd_id=request.getParameter("pd_order");
			String new_pd_name=request.getParameter("pd_name");
			String new_pd_num=request.getParameter("pd_num");
			String new_pd_price=request.getParameter("pd_price");
			
			sql = "UPDATE `product` SET `pd_name`='"+new_pd_name+"',`pd_price`='"+new_pd_price+"' ,`pd_number`='"+new_pd_num+"'  WHERE `pid`='"+new_pd_id+"'";
			con.createStatement().execute(sql);
			
			
			}
			
		else if(request.getParameter("button_del") != null ){
			
			String new_pd_id=request.getParameter("pd_order");
			String new_pd_name=request.getParameter("pd_name");
			String new_pd_num=request.getParameter("pd_num");
			String new_pd_price=request.getParameter("pd_price");
			
			sql = "DELETE FROM `product`  WHERE `pid`='"+new_pd_id+"'";
			con.createStatement().execute(sql);
			
			
			}
	   response.sendRedirect("pd-control.jsp");

%>
