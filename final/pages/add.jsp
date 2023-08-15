<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>add</title>
</head>
<body>
<%
try { 
    Class.forName("com.mysql.jdbc.Driver");
    try {
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        String sql="USE `final_web`";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
  
           sql="use final_web";
           con.createStatement().execute(sql);
		   request.setCharacterEncoding("UTF-8");  
           String rst_mid=request.getParameter("mem_id");
           String rst_mail=request.getParameter("email");
		   String rst_password=request.getParameter("password");
		   String rst_ckpassword=request.getParameter("check_password");
		   
           sql="INSERT member (`mid`,`email`,`password`) ";
           sql+="VALUES ('" + rst_mid + "', ";
           sql+="'"+rst_mail+"', ";
           sql+="'"+rst_password+"')";
		
           con.createStatement().execute(sql);
           con.close();

           out.print("註冊成功");
		   out.print("<a href='index.jsp'>按此回到首頁!!</a>");
       }
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}
%>
</body>
</html>
