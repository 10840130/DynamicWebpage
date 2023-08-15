<!-- Step 0: import library -->
<%@ page import="java.util.*, java.sql.*, java.text.*" pageEncoding="UTF-8"  %>
<%@include file="config.jsp" %>

<html>
<head>
<title>order_check</title>
</head>
<body>
<%

  


		   request.setCharacterEncoding("UTF-8");
		   
		   String id = (String) session.getAttribute("id");	   
           String new_name=request.getParameter("order_name");
		   String new_address=request.getParameter("order_adrs");
		   String new_phone=request.getParameter("order_phone");
		   String new_pay_way=request.getParameter("pay");
		   
		   PreparedStatement pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
		   ResultSet rs = pstmt.executeQuery();


		  
			SimpleDateFormat D_head = new SimpleDateFormat ("yyyy/MM/dd HH:mm:ss");
			java.util.Date dateobj = new java.util.Date();
			String new_Date =  D_head.format(dateobj);
			dateobj = D_head.parse(new_Date);
			Timestamp tm = new Timestamp(dateobj.getTime());
			
           sql="INSERT `orders` (`mid`,`receiver_name`,`receiver_address`,`receiver_phone`,`pay_time`, `pay_way`) ";
           sql+="VALUES ('" + id + "', ";
           sql+="'"+new_name+"', ";
		   sql+="'"+new_address+"', ";
		   sql+="'"+new_phone+"', ";
		   sql+="'"+tm+"', ";
           sql+="'"+new_pay_way+"')";
		   con.createStatement().execute(sql);
		   
		   sql = "SELECT @oid:= `oid` FROM `orders` ORDER BY `oid` DESC LIMIT 1" ;
		   con.createStatement().executeQuery(sql);
		   
		   
		   sql="INSERT INTO `order_detail` SELECT @oid, pid, num FROM `cart` WHERE `mid`='"+id+"'";
		   con.createStatement().execute(sql);
		   
		   sql="DELETE FROM `cart` WHERE `mid`='"+id+"'";
		   con.createStatement().execute(sql);
		   
			
		   
           con.close();

           
       response.sendRedirect("member.jsp");
%>
</body>
</html>