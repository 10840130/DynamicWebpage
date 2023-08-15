<!DOCTYPE html>
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%String id = (String) session.getAttribute("id");%>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>訂單</title>
  <script src="https://kit.fontawesome.com/fced69ddc3.js" crossorigin="anonymous"></script>
  <style>

  </style>
</head>

<body>
<table class="table-box" >
        <thead>
          <tr>
		    <th class="od-id"> 訂單編號</th>
            <th class="od-name">收件人姓名</th>
            <th class="od-time">購買時間</th>
            <th class="od-adrs">寄送地址</th>

          </tr>
		  		<%

			
			
			sql = "SELECT * FROM `orders` WHERE `mid` = '" + id + "'";
			PreparedStatement pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			ResultSet rs = pstmt.executeQuery();
	
			rs.last();
			int strNo=rs.getRow();
			

			
			sql = "SELECT * FROM `orders` WHERE `mid` = '" + id + "'";
			rs=con.createStatement().executeQuery(sql);
			
			for (int i=0; i<strNo; i++){
				rs.next();

				%>
        <tbody>
		  <td class="od-id"><%= rs.getString("oid") %></td>
          <td class="od-name"><%= rs.getString("receiver_name") %></td>
          <td class="od-time"><span class="price"><span class=""><%= rs.getString("pay_time") %></span></span></td>
          <td class="od-adrs"><span class="price"><span class=""><%= rs.getString("receiver_address") %></span></span></td>
		  <input type="hidden" id="pd_id" name="pd_id" value="">
        </tbody>
			<%

			}
			
			%>
        </thead>
      </table>
	  <a href='index.jsp'>按此回首頁</a>
	  <a href='member.jsp'>按此回會員介面</a>
  
</body>

</html>