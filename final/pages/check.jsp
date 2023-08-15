<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
if(request.getParameter("id") !=null && !request.getParameter("id").equals("") 
	&& request.getParameter("pwd") != null && !request.getParameter("id").equals("")){ 
    

    sql = "SELECT * FROM `member` WHERE `mid`='"+request.getParameter("id")+"' AND `password`='"+request.getParameter("pwd")+"'";

	ResultSet rs=con.createStatement().executeQuery(sql);
    
    if(rs.next()){            
        session.setAttribute("id",request.getParameter("id"));
		con.close();//結束資料庫連結
        response.sendRedirect("member.jsp") ;
    }
    else{
        con.close();//結束資料庫連結
	    out.println("帳號密碼不符 !! <a href='sign.jsp'>按此</a>重新登入") ;
	}
}
else
	response.sendRedirect("sign.jsp");
%>
