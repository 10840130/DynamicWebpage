<!DOCTYPE html>
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>商品控管</title>
  <script src="https://kit.fontawesome.com/fced69ddc3.js" crossorigin="anonymous"></script>
  <style>
    @import url(../assets/css/pd-control.css);
  </style>
</head>

<body>
							<% 							
							sql="select * from product order by pid";
							ResultSet rs = con.createStatement().executeQuery(sql);	
                           
							rs=con.createStatement().executeQuery(sql);	
							%>
	
	<div class="order-data">
    <div class="order">
      <h1>後台介面</h1>
      <table class="table-box">
        <thead>
          <tr>
            <th class="od-id">商品編號</th>
            <th class="od-name">商品名稱</th>
            <th class="od-number">商品庫存</th>
            <th class="od-price">商品價格</th>
			<th class="od-on"></th>
			<th class="od-off"></th>
            <th class="od-modify"></th>
            <th class="od-delete"></th>
          </tr>
		  <%
		  int i=0;
		  while (rs.next())
		  {i+=1;
			  %>
        <tbody>
		<form method="post" action="control.jsp">
          <td class="od-id"><input type="text"   value="<%=rs.getString(1)%>" name="pd_order" style="width:50px; text-align: center;" readonly ></td>
          <td class="od-name"><input type="text" name="pd_name" value="<%=rs.getString(2)%>" style="width:250px; text-align: left;" ></td>
          <td class="od-number"><input type="text" name="pd_num" value="<%=rs.getString(5)%>" style="width:60px; text-align: right;" ></td>
          <td class="od-price"><span class="price"><input type="text" name="pd_price" value="<%=rs.getString(4)%>"  style="width:60px; text-align: right;" ></span></td>
		  <td class="od-on"> <input type="submit" name="button_ON" value="上架" /></td>
		  <td class="od-off"><input type="submit" name="button_OFF" value="下架" /></td>
          <td class="od-modify"><input type="submit" name="button_mdf" value="修改商品" /></td>
          <td class="od-delete"><input type="submit" name="button_del" value="刪除商品" /></td>
        </form>
		</tbody>
		
		  <%}%>
        </thead>
      </table>
    </div>
		
	</div>
	<br><br><br><hr>
	<span>新增商品</span>
	  <table class="table-box">
        <thead>
          <tr>
            <th class="od-name">商品名稱</th>
            <th class="od-number">商品庫存</th>
            <th class="od-price">商品價格</th>
			<th class="od-add"></th>
          </tr>
        <tbody>
		<form method="post" action="insert.jsp">
          <td class="od-name"><input type="text" name="pd_name" value="" style="width:250px; text-align: left;" ></td>
          <td class="od-number"><input type="text" name="pd_num" value="" style="width:60px; text-align: right;" ></td>
          <td class="od-price"><span class="price"><input type="text" name="pd_price" value=""  style="width:60px; text-align: right;" ></span></td>
		  <td class="od-add"><input type="submit" name="button_add" value="新增" /></td>
        </form>
		</tbody>
		

        </thead>
      </table>
	
</body>

</html>