<!DOCTYPE html>
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<html>

<head>
    <meta charset="utf-8" />
    <meta name="author" content="www.frebsite.nl" />
    <meta name="viewport" content="width=device-width minimum-scale=1.0 maximum-scale=1.0 user-scalable=no" />
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <title>商品列</title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Farro&display=swap" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="../assets/css/index.css" />
    <link type="text/css" rel="stylesheet" href="../assets/css/style.css" />
    <link type="text/css" rel="stylesheet" href="../assets/css/mmenu.css" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@300&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Farro&family=Oswald:wght@200&family=Pattaya&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display&display=swap" rel="stylesheet">
    <script src="http://hovertree.com/texiao/js/4/hvtjs4.js"></script>
    <link type="text/css" rel="stylesheet" href="../assets/css/float.css" />
    <base target="_blank" />
</head>

<body>

    <div id="page">
        <div class="header headlist qwe1">
            <a href="#menu"><span></span></a>

            <p class="cb">C.B</p>

        </div>
        <!--<div>
            <a><img src="./assets/img/logo.png" style="isplay: block;width: 50%;position: fixed;left: 45%;height: 100px;width: auto;"></a>
        </div>-->
<!--商品卡-->
<% 
							sql="select * from product where pid='2'";
							ResultSet rs=con.createStatement().executeQuery(sql);
							rs.next();
							%>
        <div class="prod-card mmm">
            <div class="top-section">
                <img id="image-container" src="<%=rs.getString(7)%>" alt="">
            </div>
            <div class="nav1">
                <img onclick="change_img(this)" src="<%=rs.getString(8)%>" alt="">
                <img onclick="change_img(this)" src="<%=rs.getString(9)%>" alt="">
                <img onclick="change_img(this)" src="<%=rs.getString(10)%>" alt="">
            </div>
            <div class="prod-info">
                <h2 name="name"><%=rs.getString(2)%></h2>
                <span class="desc"><%=rs.getString(3)%></span>
                <span class="price" name="price"><i class="ion-social-usd"></i><%=rs.getString(4)%></span>
                <h3>Sizes</h3>
                <span>
                      <a href="#">X</a>
                      <a href="#">L</a>
                      <a href="#">XL</a>
                      <a href="#">XXL</a>
                    </span>
                <h3>Colors</h3>
                <span>
                      <a href="#">Black</a>                       
                      <a href="#">Gray</a>
                      <a href="#">Brown</a>
					  <a href="#">white</a>
				</span>
				<span>庫存:<%=rs.getInt(5)%></span><br>
	<form method="get" action="cart_update.jsp">				
				購買數量
				<select name="cart_num">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
				<br><br>
				
				<input type="hidden" id="cart_pid" name="cart_pid" value="<%=rs.getString(1)%>">
                <input id="btn_cart" type="submit" name="addcart" value="Add to Cart"/>
            </div>
        </div>
	</form>
		<!--留言板-->
		<div style="width:800px; margin:auto;  padding-top: 300px; display:flex;flex-direction:column;">
		<!---星級評分開始-->
            <div class="rating" style="display:flex; align-items:center;">
                    評分
                    <input type="radio" id="star1" name="rating" value="1" hidden/>
                    <label for="star1"></label>
                    <input type="radio" id="star2" name="rating" value="2" hidden/>
                    <label for="star2"></label>
                    <input type="radio" id="star3" name="rating" value="3" hidden/>
                    <label for="star3"></label>
                    <input type="radio" id="star4" name="rating" value="4" hidden/>
                    <label for="star4"></label>
                    <input type="radio" id="star5" name="rating" value="5" hidden/>
                    <label for="star5"></label>
            </div>
        <!---星級評分結束-->
			<form name="msgform" method="post" action="addview.jsp">
				
				姓名：<input type="text" name="name" style="width:400px; font-size:12pt;"><br>
				郵件：<input type="text" name="mail" style="width:400px; font-size:12pt;"><br>
				主題：<input type="text" name="subject" style="width:400px; font-size:12pt;"><br>
				內容：<textarea rows=8 name="content" style="width:400px; font-size:14pt;"></textarea><br>
				<input type="hidden" id="pid" name="pid" value="<%=rs.getString(1)%>">
				<input type="submit" class="q66" name="Submit" value="送出">
				<input type="Reset" class="q66" name="Reset" value="重新填寫">		
			</form>
		</div>

		<%
		try {
		//Step 1: 載入資料庫驅動程式 
		Class.forName("com.mysql.jdbc.Driver");
		try {
			
			sql="SELECT * FROM `board` where pid='2'"; //算出共幾筆留言
				PreparedStatement pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
				ResultSet rr = pstmt.executeQuery();
				rr.last();
				int total_content=rr.getRow();
				out.println("<div  style='width:800px; margin:auto;  padding-top: 50px;'>");
				out.println("共"+total_content+"筆留言");
							

				int page_num=(int)Math.ceil((double)total_content/5.0); //無條件進位

				String page_string = request.getParameter("page");
				if (page_string == null || page_string.trim().equals("")) 
					page_string = "0";          
				int current_page=Integer.valueOf(page_string);
				if(current_page==0) //若未指定page, 令current_page為1
					current_page=1;
				out.println("<br><br>");
				out.print("請選擇頁數&nbsp");					
				if (current_page > 1)
				{
					out.println("<a href='2.jsp?page=1'>第一頁</a>&nbsp;");
					out.println("<a href='2.jsp?page="+(current_page-1)+ "'>上一頁</a>&nbsp;");						
				}
				//使用超連結方式, 呼叫自己, 使用get方式傳遞參數(變數名稱為page)
				for(int i=1;i<=page_num;i++) //建立1,2,...頁超連結
					out.print("<a href='2.jsp?page="+i+"'>"+i+"</a>&nbsp;"); //&nbsp;html的空白
				
				if (current_page < page_num)
				{
					out.println("<a href='2.jsp?page="+(current_page+1)+"'>下一頁</a>&nbsp;");
					out.println("<a href='2.jsp?page="+page_num+"'>最後一頁</a>");						
				}
				out.print("，目前在第"+current_page+"頁");				
				out.println("<br>");
					
				out.println("<form action='2.jsp' method='get'  style='padding: 10px 0;'>");
				out.println("跳至第");
				out.println("<input type='text' size='1' name='page' value=1>");
			
				out.println("頁&nbsp;&nbsp;");
				out.println("<button type='submit'>確定</button>");
				out.println("</form >");									
									
	
				//計算開始記錄位置   
				//顯示結果 
				int start_record=(current_page-1)*5;
				//遞減排序, 讓最新的資料排在最前面
				sql="SELECT * FROM `board` where pid='2' ORDER BY `DATE` DESC LIMIT ";
				sql+=start_record+",5";


				rr=con.createStatement().executeQuery(sql);
				//  逐筆顯示, 直到沒有資料(最多還是5筆)
				while(rr.next())
				{	
					out.println("留言主題:"+rr.getString(3)+"<br>");
					out.println("訪客姓名:"+rr.getString(2)+"<br>");
					out.println("E-mail:"+rr.getString(4)+"<br>");
					out.println("IP位置："+rr.getString(8)+"<br>");
					out.println("留言內容:"+rr.getString(5)+"<br>");
					out.println("留言時間:"+rr.getString(7)+"<br><hr style='width:500px;'><br><br>");
				}				
				
				out.println("</div>");
		}		
		catch (SQLException sExec) {
			out.println("SQL錯誤"+sExec.toString());

		}
	}
	catch (ClassNotFoundException err) {
		out.println("class錯誤"+err.toString());
	}
			
		%>

		
		<!--留言板END-->


        <!-- 浮動特賣 -->
        <div class="float_layer_hovertree fff" id="hovertree_float_layer">
            <h2 class="h22">特賣商品下殺8折!!
                <a id="btn_min" href="javascript:;" class="min" target="_self"></a>
                <a id="btn_close" href="javascript:;" class="close" target="_self"></a>
            </h2>
            <div class="content">
                <div class="wrap">
                    <a href="./items 2.html" target="_blank">
                        <img src="../assets/img/a1.1.jpg" width="400" height="400" class="simg">
                    </a>
                </div>
            </div>
        </div>
        <!-- 結束 -->

        <footer class="footer12 rrr">

            <div>

                <p class="ppp">
                    Copyright © 2021 CYIM <br> 32023 桃園市中壢區中北路200號 <br> Tel：+886-3-265-9999 , +886-3-456-317</p>
            </div>

        </footer>



        <script type="text/javascript">
            var container = document.getElementById("image-container");

            function change_img(image) {
                container.src = image.src;
            }
        </script>


        <nav id="menu">
        <form method="post" action="items2.jsp">
            <div class="box">
                <div class="container-1">
                    <span class="icon"><i class="fa fa-search"></i></span>
                    <input type="search" id="search" placeholder="Search..." name="search_btn" />
                </div>
            </div>
        </form>
			<ul>
                <li>
                    <a href="./index.jsp" class="ali"><img src="../assets/img/home.png" class="imgg">&nbsp;HOME</a>
                </li>
                <li>
                    <a href="./items.jsp" class="ali"><img src="../assets/img/hot.png" class="imgg">&nbsp;HOT</a>
                </li>
                <li>
                    <span><a class="ali"><img src="../assets/img/information.png" class="imgg">&nbsp;ABOUT</a></span>
                    <ul>
                        <li>
                            <a href="./logo.jsp" class="ali"><img src="../assets/img/logo-design.png" class="imgg">&nbsp;LOGO</a>
                        </li>
                        <li>
                            <a href="./question.jsp" class="ali"><img src="../assets/img/question.png" class="imgg">&nbsp;QUESTION</a>
                        </li>
                    </ul>
                </li>
                <br>
                <li class="alil"><img src="../assets/img/member-card.png" class="imgg">&nbsp;MEMBER</li>
                <br>
				<form name="list" method="post" action="logout.jsp" style="display:flex; flex-direction:column;">
				<%
				String id=String.valueOf(session.getAttribute("id"));
				
				if((id).equals("0000")){
					out.print("<li><a href='./pd-control.jsp' class='ali'><img src='../assets/img/sign-in.png' class='imgg'>&nbsp;Control Center</a></li>");	
				}
							
				
				
				if(session.getAttribute("id")!=null)
				{
				out.print("<li><a href='./member.jsp' class='ali'><img src='../assets/img/member-card.png' class='imgg'>&nbsp;MEMBER PROFILE</a></li>");
				out.print("<li><a href='./mem_orders.jsp' class='ali'><img src='../assets/img/member-card.png' class='imgg'>&nbsp;PURCHASE RECORD</a></li>");
				out.print("<li><a href='cart.jsp' class='ali'><img src='../assets/img/shopping-cart.png' class='imgg'>&nbsp;SHOPPING CAR</a></li>");
				%>
				<input class='lobtn' type='submit' value='登出' style="width:80px">
				<%
				}
				else{
				out.print("<li><a href='./sign.jsp' class='ali'><img src='../assets/img/sign-in.png' class='imgg'>&nbsp;SIGN IN</a></li>");
				out.print("<li><a href='./registered.jsp' class='ali'><img src='../assets/img/add-user.png' class='imgg'>&nbsp;Registered</a></li>");
				}
				
				%>
				</form>
            </ul>


        </nav>
    </div>

    <!-- scripts -->
    <script>
        function myFunction() {
            confirm("請先登入帳號!!");
        }
    </script>
    <script src="../assets/js/mmenu.polyfills.js"></script>
    <script src="../assets/js/mmenu.js"></script>
    <script>
        new Mmenu(document.querySelector('#menu'));

        document.addEventListener('click', function(evnt) {
            var anchor = evnt.target.closest('a[href^="#/"]');
            if (anchor) {
                alert("Thank you for clicking, but that's a demo link.");
                evnt.preventDefault();
            }
        });
    </script>


</body>

</html>