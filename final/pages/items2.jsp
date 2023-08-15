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
    <link type="text/css" rel="stylesheet" href="../assets/css/float.css" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@300&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Farro&family=Oswald:wght@200&family=Pattaya&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display&display=swap" rel="stylesheet">
    <script src="http://hovertree.com/texiao/js/4/hvtjs4.js"></script>
</head>
<base target="_blank" />

<body>

    <div id="page">
        <div class="header headlist qwe1">
            <a href="#menu"><span></span></a>

            <p class="cb">C.B</p>

        </div>
        <!--<div>
            <a><img src="./assets/img/logo.png" style="isplay: block;width: 50%;position: fixed;left: 45%;height: 100px;width: auto;"></a>
        </div>-->
        <!--熱賣商品標籤-->
       <!-- <div class="ribbon-w1">
            <div class="ribbon1">
                <font color="#FF0000"><strong>TOP 1</strong></font>
            </div>
        </div>-->
        <!--熱賣商品標籤-->;
				<%			String search = request.getParameter("search_btn");
							sql="select * from product where status='ON' AND pd_name Like '%"+search+"%' order by pd_sell DESC ";
							PreparedStatement pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
							ResultSet rs = pstmt.executeQuery();
                           //先移到檔尾, getRow()後, 就可知道共有幾筆記錄
							rs.last();
							int strNo=rs.getRow();							
							sql="select * from product where status='ON' AND pd_name Like '%"+search+"%' order by pd_sell DESC ";
							rs=con.createStatement().executeQuery(sql);							
														
							for (int i=0; i<strNo; i++){
								rs.next();
									if(i<3)
									{
									out.print("<div class='ribbon-w"+(i+1)+"'>");
									out.print("<div class='ribbon1'>");
										out.print("<font color='#FF0000'><strong>TOP"+(i+1)+"</strong></font>");
									out.print("</div>");
									out.print("</div>");
									}
								
								out.print("<div class='prod-card mmm'>");
								out.print("<div class='top-section'>");
								out.print("<img id='image-container' src="+rs.getString(7)+">");
								out.print("</div>");
								out.print("<div class='nav1'>");
								out.print("<img onclick='change_img(this)' src="+rs.getString(8)+">");
								out.print("<img onclick='change_img(this)' src="+rs.getString(9)+">");
								out.print("<img onclick='change_img(this)' src="+rs.getString(10)+">");
								out.print("</div>");
								out.print("<div class='prod-info'>");
								out.print("<h2>"+rs.getString(2)+"</h2>");
								out.print("<span class='desc'>"+rs.getString(3)+"</span>");
								out.print("<span class='price'><i class='ion-social-usd'></i>"+rs.getString(4)+"</span>");
								out.print("<h3>Sizes</h3>");
								out.print("<span>");
								out.print("<a href='#'>X</a>");
								out.print("<a href='#'>L</a>");
								out.print("<a href='#'>XL</a>");
								out.print("<a href='#'>XXL</a>");
								out.print("</span>");
								out.print("<h3>Colors</h3>");
								out.print("<span>");
								out.print("<a href='#'>Black</a>");
								out.print("<a href='#'>Gray</a>");
								out.print("<a href='#'>Brown</a>");
								out.print("<a href='#'>White</a>");
								out.print("</span>");
								out.print("</span>");
								out.print("<a class='addbtn' href='"+rs.getString(1)+".jsp'><i class='ion-bag'></i>瀏覽商品</a>");
								out.print("</div></div>");
								}
		%>


        <footer class="footer12 rrr">


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

            var container1 = document.getElementById("image-container1");

            function change_img1(image1) {
                container1.src = image1.src;
            }

            var container2 = document.getElementById("image-container2");

            function change_img2(image2) {
                container2.src = image2.src;
            }
        </script>


        <nav id="menu">
            <form>
                <div class="box">
                    <div class="container-1">
                        <span class="icon"><i class="fa fa-search"></i></span>
                        <input type="search" id="search" placeholder="Search..." />
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
				if(session.getAttribute("id")!=null)
				{
				out.print("<li><a href='./member.jsp' class='ali'><img src='../assets/img/member-card.png' class='imgg'>&nbsp;MEMBER PROFILE</a></li>");
				out.print("<li><a href='./mem_orders.jsp' class='ali'><img src='../assets/img/member-card.png' class='imgg'>&nbsp;PURCHASE RECORD</a></li>");
				out.print("<li><a href='##' onclick='myFunction()' class='ali'><img src='../assets/img/shopping-cart.png' class='imgg'>&nbsp;SHOPPING CAR</a></li>");
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