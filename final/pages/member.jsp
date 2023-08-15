<!DOCTYPE html>
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>

<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>會員介面</title>
  <script src="https://kit.fontawesome.com/fced69ddc3.js" crossorigin="anonymous"></script>
  <style>

    @import url(../assets/css/member.css);
  </style>
</head>

<body>

  <!--個人資料 start-->
  <%
  String id=String.valueOf(session.getAttribute("id"));
  
	
	PreparedStatement pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
	ResultSet rs = pstmt.executeQuery();
	sql = "SELECT * FROM `member` WHERE `mid` = '" + id + "'";
	rs=con.createStatement().executeQuery(sql);
			
	rs.next();

  %>
	<form method="post" action="member_update.jsp">
    <div class="member-data">
      <div class="container">
        <div class="rg-header">
          <h2>會員檔案</h2>
          <hr>
        </div>
        <div class="field-title">
          <label>收件人姓名</label>
        </div>
        <div class="field-info">
          <input type="text" placeholder="name" name="username" value="<%= rs.getString("username") %>">
        </div>

        <div class="field-title" >
          <label>電子郵件</label>

        </div>
        <div class="field-info">
          <input type="text" placeholder="e-mail" name="mail" value="<%= rs.getString("email") %>">
        </div>

        <div class="field-title">
          <label>手機號碼</label>

        </div>
        <div class="field-info">
          <input type="text" placeholder="phone number" name="phone" value="<%= rs.getString("phone") %>">
        </div>

        <div class="field-title">
          <label>會員密碼</label>

        </div>
        <div class="field-info">
          <input type="text" placeholder="password" name="pwd" value="<%= rs.getString("password") %>">
        </div>

        <div class="field-title">
          <label>收件地址</label>

        </div>
        <div class="field-info">
          <input type="text" placeholder="address" style="width: 500px;" name="adr"  value="<%= rs.getString("address") %>">
        </div>
        <div class="field-title">
        </div>
        <div class="field-info">
          <button type="submit" class="lgbtn" >儲存</button>
        </div>
      </div>

    </div>
	</form>
	<!--訂單-->
	<br><br><br>
	
	<a href='index.jsp'>按此回首頁</a>
	<a href='mem_orders.jsp'>訂單查看</a>
  <!--個人資料 end-->
  

  
</body>

</html>