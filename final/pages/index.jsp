<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<html>
<title>期末程式主頁</title>

<head>
    <meta charset="utf-8" />
    <meta name="author" content="www.frebsite.nl" />
    <meta name="viewport" content="width=device-width minimum-scale=1.0 maximum-scale=1.0 user-scalable=no" />
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <title>程式</title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Farro&display=swap" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="../assets/css/index.css" />
    <link type="text/css" rel="stylesheet" href="../assets/css/mmenu.css" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@300&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Farro&family=Oswald:wght@200&family=Pattaya&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display&display=swap" rel="stylesheet">
</head>

<body>

    <div id="page">
        <div class="header headlist">
            <a href="#menu"><span></span></a>

            <p class="cb">C.B</p>

        </div>
        <!--<div>
            <a><img src="./assets/img/logo.png" style="isplay: block;width: 50%;position: fixed;left: 45%;height: 100px;width: auto;"></a>
        </div>-->
        <div class="content">

            <div class="dpad">
                <img src="../assets/img/logo.png" class="logo">
                <table class="tabb">
                    <tbody>
                        <tr>
                            <td>
                                <a href="https://www.facebook.com/"><img class="imghw" src="../assets/img/facebook.png"></a>
                            </td>
                            <td>
                                <a href="https://www.instagram.com/"><img class="imghw" src="../assets/img/instagram.png"></a>
                            </td>
                            <td>
                                <a href="https://twitter.com/account/login_challenge?platform=web&enc_user_id=AAAAEICttYw7R0N9wLQU4YCMzN4ToBzQkopKqncZhzUKT4RRRWqfSCLchuKblQApF3bGk4eAou8&challenge_type=RetypePhoneNumber&challenge_id=veH1GYrSbET9WzyWNLUfaivvmcxBg1Ujg%252Fxl&remember_me=true&redirect_after_login_verification=%2F"><img class="imghw" src="../assets/img/twitter.png"></a>
                            </td>
                            <td>
                                <a href="https://www.pinterest.com/"><img class="imghw" src="../assets/img/pinterest.png"></a>
                            </td>
                            <td>
                                <a href="https://line.me/zh-hant/"><img class="imghw" src="../assets/img/line1.png"></a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

             <div class="hideme"></div>


			
            <a href="../pages/2.jsp">
                <div class="fixed2 diva">
                    <p class="pimg">FLOWER</p>
                    <div class="expand diva hideme"></div>
                </div>
            </a>

            <a href="../pages/6.jsp">
                <div class="fixed6 diva">
                    <p class="pimg">HIPSTER</p>
                    <div class="expand diva hideme"></div>
                </div>
            </a>


            <a href="../pages/4.jsp">
                <div class="fixed4 diva">
                    <p class="pimg">CLASSIC</p>
                    <div class="expand diva"></div>
                </div>
            </a>

            <a href="../pages/5.jsp">
                <div class="fixed5 diva">
                    <p class="pimg2">COAT</p>
                    <div class="expand diva"></div>
                </div>
            </a>


            <a href="../pages/3.jsp">
                <div class="fixed3 diva">
                    <p class="pimg">TROUSERS</p>
                    <div class="expand diva"></div>
                </div>
            </a>

        </div>

    </div>
    <footer class="footer">

        <div>

            <%
			application.setAttribute("counter","1000");
			Object counter=application.getAttribute("counter");

			String strNo=(String)application.getAttribute("counter");
			int count=Integer.parseInt(strNo);
  
			if(session.isNew()){
			count++;
			}
			%>
			<p class="ppp">觀看人數:<%=count%>
			
			
                <br> Copyright © 2021 CYIM <br> 32023 桃園市中壢區中北路200號 <br> Tel：+886-3-265-9999 , +886-3-456-317</p>
        </div>

    </footer>
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