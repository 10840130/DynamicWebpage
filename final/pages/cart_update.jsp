<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
	int new_cart_num = Integer.parseInt(request.getParameter("cart_num"));
	String new_cart_pid = request.getParameter("cart_pid");
	String id = (String) session.getAttribute("id");
	
	
if(session.getAttribute("id") == null ){
	response.sendRedirect("sign.jsp");
}


 if(session.getAttribute("id") != null ){    

	int buy = 0;

	sql = "SELECT * FROM `cart`, `product` WHERE `mid` = '" + id + "' AND `product`.`pid` = '" + new_cart_pid + "' AND `cart`.`pid` = `product`.`pid`";

	ResultSet rs=con.createStatement().executeQuery(sql);

	
 if (rs.next())
	{
		buy = rs.getInt("num")+new_cart_num;
		sql = "INSERT `cart` (mid, pid, num) VALUES ('" + id + "', '" + new_cart_pid + "', '" + buy + "') ON DUPLICATE KEY UPDATE `num` = '" + buy + "'";
		con.createStatement().execute(sql);
		
		
	}
	else 
	{
		sql = "SELECT * FROM `product` WHERE `pid` = '" + id + "'";
		rs = con.createStatement().executeQuery(sql);

		buy = new_cart_num;
		sql = "INSERT `cart` (mid, pid, num) VALUES ('" + id + "', '" + new_cart_pid + "', '" + buy + "') ON DUPLICATE KEY UPDATE `num` = '" + buy + "'";
		con.createStatement().execute(sql);
	}	
	
	
	
	
%>
		<script>
			alert("成功加入");
			location.href = "<%=new_cart_pid%>.jsp";
		</script>
<%	

}




%>
