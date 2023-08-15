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
  
  
  <div class="cart-container">
    <h1>購物車</h1>
	<h4>會員:<%out.print(id);%></h4>
	<form>
    <div class="cart">
      <table class="table-box">
        <thead>
          <tr>
            <th class="cart-name">訂單名稱</th>
            <th class="cart-number">數量</th>
            <th class="cart-price">商品價格</th>
            <th class="cart-total">總價</th>
            <th class="cart-delete"></th>
          </tr>
		  		<%

			
			
			sql = "SELECT * FROM `cart`, `product` WHERE `mid` = '" + id + "' AND `cart`.`pid` = `product`.`pid`";
			PreparedStatement pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			ResultSet rs = pstmt.executeQuery();
	
			rs.last();
			int strNo=rs.getRow();
			
			int price = 0;
			int total = 0;
			
			sql = "SELECT * FROM `cart`, `product` WHERE `mid` = '" + id + "' AND `cart`.`pid` = `product`.`pid`";
			rs=con.createStatement().executeQuery(sql);
			
			for (int i=0; i<strNo; i++){
				rs.next();
			price = rs.getInt("num")*rs.getInt("pd_price");
				%>
        <tbody>
          <td class="od-name"><%= rs.getString("pd_name") %></td>
          <td class="od-number">
			<input type="text" name="cart_num" value="<%= rs.getInt("num") %>" step="1" />
		  </td>
          <td class="od-price"><span class="price">$<span class=""><%= rs.getInt("pd_price") %></span></span></td>
          <td class="od-total"><span class="price">$<span class=""><%=price%></span></span></td>
		  <form method="post" action="cart_delete.jsp">
		  <input type="hidden" id="pd_id" name="pd_id" value="<%= rs.getString("pid") %>">
          
		  </form>
        </tbody>
			<%
			total+=price;
			}
			
			%>
        </thead>
      </table>
    </div>
    <div class="hr-line">
      <hr class="purchase-hr">
    </div>
	<div style="float:right;">
		<ul class="cart-footer">
			<li class="msg-box">
			總金額:<span>$<span><%=total%></span></span>
			</li>
		</ul>
		<form  method="post" action="order.jsp">
		<input  type="button" class="purchase-btn" value="確定購買"  onclick="window.location.href='order.jsp'">
		</form>
	</div>
	</form>
  </div>
<br><br><br>
<a href='index.jsp'>按此回首頁</a>
  
</body>

</html>