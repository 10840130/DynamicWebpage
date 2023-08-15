<!-- Step 0: import library -->
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<html>
<head>
<title>add</title>
</head>
<body>
<%

           sql="use final_web";
           con.createStatement().execute(sql);
		   request.setCharacterEncoding("UTF-8");  
           String new_name=request.getParameter("name");
           String new_mail=request.getParameter("mail");
		   String new_subject=request.getParameter("subject");
		   String new_content=request.getParameter("content");
		   String new_pid=request.getParameter("pid");
		   String new_ip=request.getRemoteAddr();
		   java.sql.Date new_date=new java.sql.Date(System.currentTimeMillis());
		   
           sql="INSERT board (`name`, `msg_title`,`mail`, `msg_content`,  `DATE`, `IP`, `pid`) ";
           sql+="VALUES ('" + new_name + "', ";
		   sql+="'"+new_mail+"\', ";
           sql+="'"+new_subject+"', ";
           sql+="'"+new_content+"', ";   
           sql+="'"+new_date+"',";
		   sql+="'"+new_ip+"',";
		   sql+="'"+new_pid+"')";

           con.createStatement().execute(sql);
           con.close();

		response.sendRedirect(new_pid+".jsp");
%>
</body>
</html>
