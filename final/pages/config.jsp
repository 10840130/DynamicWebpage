<%
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/?serverTimezone=UTC";
Connection con=DriverManager.getConnection(url,"root","1234");
String sql="USE `final_web`";
con.createStatement().execute(sql);
response.setContentType("text/html;charset=utf-8");
request.setCharacterEncoding("utf-8");
%>