<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html dir="ltr" lang="en-US">

<head>
<link rel="shortcut icon" href="img\logo\MyFoodMap icon.ico" />

<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<!-- Document Title
============================================= -->
<title>login | java</title>

    <!-- Stylesheets
    ============================================= -->
    <link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
    <link rel="stylesheet" href="style.css" type="text/css" />
    <link rel="stylesheet" href="css/dark.css" type="text/css" />
    <link rel="stylesheet" href="css/font-icons.css" type="text/css" />
    <link rel="stylesheet" href="css/animate.css" type="text/css" />
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />

    <link rel="stylesheet" href="css/responsive.css" type="text/css" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <!--[if lt IE 9]>
        <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
    <![endif]-->

    <!-- External JavaScripts
    ============================================= -->
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/plugins.js"></script>
    <style>
	.message {
		font-size: 95%;
		color: #FF0000;
	}  
	.message1 {
		font-size: 110%;
		color: #FF0000;
		height:25px;
		text-align:center;
		margin: 7px 0px;
	}  
	
	.total {
	font-size: 42px;
	font-weight: 600;
	font-family: 'Raleway', sans-serif;
	}
	
	</style>

	<script>
	$( document ).ready( function() {
		document.forms.form1.account.focus();
	});
	
	</script>

    <script>
			  function checkdata(){
			    var account = document.getElementById('account');
			    var password = document.getElementById('password');
			    var bool = true;
			    var messacco ='';
			    var messpass='';
			
			    document.getElementById('disperror').innerHTML= '';
			
			    if (account.value==''){
			      messacco +=' *姓名欄必須輸入';
			      bool = false;
			    }
			
			    if(password.value==''){
			      messpass +=' *密碼欄必須輸入';
			      bool = false;
			    }
			
			   // if(bool){
			   //  document.getElementById('dispacco').innerHTML= account.value;
			   //  document.getElementById('disppass').innerHTML= password.value;
			   // }
			
			
			    if(!bool){
			      document.getElementById('dispacco').innerHTML= messacco;
			      document.getElementById('disppass').innerHTML= messpass;
			    }
			
			    return bool;
			    // return false;
			
			  }
	</script>
	
</head>

<body class="stretched">

    <!-- Document Wrapper
    ============================================= -->
    <div id="wrapper" class="clearfix">

        <!-- Top Bar
        ============================================= -->
        <div id="top-bar">

            <div class="container clearfix">

                <div class="col_half nobottommargin clearfix">

                    <!-- Top Links
                    ============================================= -->
                    <div class="top-links">
                        <ul>
                            <li><a href="frontpage.jsp">Home</a></li>

                            <li>
                                <span id="login_y" style="display:${login_y}">
                                        <span id="username">
                                            <b>${name}&nbsp;</b>
                                        </span>
                                &nbsp;您好！&nbsp;
                                <a href="Validateout.do">登出</a>&nbsp;&nbsp;
                                </span>
                            </li>

                            <li>
                                <span id="login_n" style="display:${login_n}">
                                &nbsp;&nbsp;&nbsp;<a href="login.jsp">登入</a>&nbsp;&nbsp;&nbsp;
                                    <div class="top-link-section">
                                        <form id="top-login" role="form">
                                            <div class="input-group" id="top-login-username">
                                                <span class="input-group-addon"><i class="icon-user"></i></span>
                                                <input type="email" class="form-control" placeholder="Email address" required="">
                                            </div>
                                            <div class="input-group" id="top-login-password">
                                                <span class="input-group-addon"><i class="icon-key"></i></span>
                                                <input type="password" class="form-control" placeholder="Password" required="">
                                            </div>
                                            <label class="checkbox">
                                              <input type="checkbox" value="remember-me"> Remember me
                                            </label>
                                            <button class="btn btn-danger btn-block" type="submit">Sign in</button>
                                        </form>
                                    </div>
                                </span>
                            </li>

                            <li><a href="register.jsp" style="display:${login_n}">註冊會員</a></li>

                            <li><a href="revise.jsp" style="display:${login_y}">修改會員資料</a></li>

                        </ul>
                    </div><!-- .top-links end -->

                </div>

                <div class="col_half fright col_last clearfix nobottommargin">

                    <!-- Top Social
                    ============================================= -->
                    <div id="top-social">
                        <ul>
                            <li><a href="#" class="si-facebook"><span class="ts-icon"><i class="icon-facebook"></i></span><span class="ts-text">Facebook</span></a></li>
                            <li><a href="#" class="si-twitter"><span class="ts-icon"><i class="icon-twitter"></i></span><span class="ts-text">Twitter</span></a></li>
                            <li><a href="#" class="si-dribbble"><span class="ts-icon"><i class="icon-dribbble"></i></span><span class="ts-text">Dribbble</span></a></li>
                            <li><a href="#" class="si-github"><span class="ts-icon"><i class="icon-github-circled"></i></span><span class="ts-text">Github</span></a></li>
                            <li><a href="#" class="si-pinterest"><span class="ts-icon"><i class="icon-pinterest"></i></span><span class="ts-text">Pinterest</span></a></li>
                            <li><a href="#" class="si-instagram"><span class="ts-icon"><i class="icon-instagram2"></i></span><span class="ts-text">Instagram</span></a></li>
                            <li><a href="tel:+91.11.85412542" class="si-call"><span class="ts-icon"><i class="icon-call"></i></span><span class="ts-text">+91.11.85412542</span></a></li>
                            <li><a href="mailto:alex@handsome.com" class="si-email3"><span class="ts-icon"><i class="icon-envelope-alt"></i></span><span class="ts-text">alex@handsome.com</span></a></li>
                        </ul>
                    </div><!-- #top-social end -->

                </div>

            </div>

        </div><!-- #top-bar end -->

        <!-- Header
        ============================================= -->
        <header id="header" class="full-header">

            <div id="header-wrap">

                <div class="container clearfix">

                    <div id="primary-menu-trigger"><i class="icon-reorder"></i></div>

                    <!-- Logo
                    ============================================= -->
                    <div id="logo">
                        <a href="index.jsp" class="standard-logo" data-dark-logo="img/logo/Logo2.png"><img src="img/logo/Logo2.png" alt="MyFoodMap Logo"></a>
                        <a href="index.jsp" class="retina-logo" data-dark-logo="img/logo/Logo2.png"><img src="img/logo/Logo2.png" alt="MyFoodMap Logo"></a>
                    </div><!-- #logo end -->

                    <!-- Primary Navigation
                    ============================================= -->
                    <nav id="primary-menu" class="dark">

                        <ul>
                            <li class="current"><a href="frontpage.jsp"><div  style="color:gray;">首頁</div></a></li>
                            <li><a href="search.jsp"><div  style="color:gray;">餐廳查詢</div></a></li>
                            <li class="mega-menu"><a href="recommend.jsp"><div  style="color:gray;">餐廳推薦</div></a></li>
                            <li class="mega-menu"><a href="#"><div  style="color:gray;">個人地圖</div></a></li>
                        </ul>

                    </nav><!-- #primary-menu end -->

                </div>

            </div>

        </header><!-- #header end -->

        <!-- Page Title
        ============================================= -->
        <section id="page-title"  style="background-image: url('img/bg/bg_m3.jpg');">

            <div class="container clearfix">
                <h1>我的帳戶</h1>
            </div>

        </section><!-- #page-title end -->

        <!-- Content
        ============================================= -->
        <section id="content">

            <div class="content-wrap">

                <div class="container clearfix" style="background-image: url('img/bg/bg_m3.jpg');">

                    <div class="col_one_third nobottommargin">

                        <div class="well well-lg nobottommargin" style="margin-top: 50px;">
                             <form id="form1" name="form1" method="post" action="Validate.do" onsubmit="return checkdata();">

                                <h3>請登入您的帳號密碼</h3>

                                <div class="col_full">
                                    <label for="login-form-username">Username:</label>
                                    <input type="text" id="account" name="account" class="required form-control input-block-level"/>
                                	<span id="dispacco" class="message"></span>
                                </div>
                                 
                                

                                <div class="col_full">
                                    <label for="login-form-password">Password:</label>
                                    <input type="password" id="password" name="password" class="required form-control input-block-level" />
                                    <span id="disppass" class="message"></span>
                                </div>

                                <div class="col_full nobottommargin">
                              <button class="button button-3d nomargin" id="login-form-submit" name="login-form-submit" value="login">Login</button>
                                <!--
                                    <input type="image" src="img/btn/btn_log3.png" onclick="document.formname.submit();" >
                                -->    
                                    <a href="#" class="fright">忘記密碼?</a>
                                </div>

                            </form>
                            
                                  <div class="message1" ><span id="disperror" >${loginfailmessage}</span></div>
                        </div>

                    </div>

                    <div class="col_two_third col_last nobottommargin" style="margin-bottom: 20px;">


                        <h3  style="margin-bottom: 20px;font-size: 250%;" ><br/>沒有帳號嗎? <br/>立即申請您的專屬帳號吧!!</h3>

                        <p>Have no personal account? &nbsp; Apply for your own exclusive account of it</p>

                        <p>點此<a href="register.jsp">連結</a>進行註冊頁面</p>
                        
                        <div><img src="img/image/newrestaurant1.jpg" ></div>

                    </div>

                </div>

            </div>

        </section><!-- #content end -->

        <!-- Footer
        ============================================= -->
        <footer id="footer" class="dark">

            <div class="container">

                <!-- Footer Widgets
                ============================================= -->
                <div class="footer-widgets-wrap clearfix">

                    <div class="col_two_third">

                        <div class="col_one_third">

                            <div class="widget clearfix">

                                <p>我們堅持 <strong>美味</strong>, <strong>簡單</strong> &amp; <strong>輕鬆</strong> 的享用餐點.</p>

                                <div style="background: url('images/world-map.png') no-repeat center center; background-size: 100%;">
                                    <address>
                                        <strong>主辦單位:</strong><br>
							                                          基河校區：臺北市基河路 130 號 3 樓 <br>
							                                          台北校區：臺北市中山北路五段 250 號 電話：02-2882-4564<br>
                                    </address>
                                    <abbr title="Phone Number"><strong>Phone:</strong></abbr> 電話：02-2882-4564<br>
                                    <abbr title="Fax"><strong>Fax:</strong></abbr> 傳真:(02)28891626.<br>
                                    <abbr title="Email Address"><strong>Email:</strong></abbr> alex@handsome.com
                                </div>

                            </div>

                        </div>


                        <div class="col_one_third col_last">

                            <div class="widget clearfix">
                                <h4>近期報告</h4>

                                <div id="post-list-footer">
                                    <div class="spost clearfix">
                                        <div class="entry-c">
                                            <div class="entry-title">
                                                <h4><a href="#">可設定連結區域一</a></h4>
                                            </div>
                                            <ul class="entry-meta">
                                                <li>11th March 2015</li>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="spost clearfix">
                                        <div class="entry-c">
                                            <div class="entry-title">
                                                <h4><a href="#">可設定連結區域二</a></h4>
                                            </div>
                                            <ul class="entry-meta">
                                                <li>11th March 2015</li>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="spost clearfix">
                                        <div class="entry-c">
                                            <div class="entry-title">
                                                <h4><a href="#">可設定連結區域三</a></h4>
                                            </div>
                                            <ul class="entry-meta">
                                                <li>11th March 2015</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>

                    <div class="col_one_third col_last">

                        <div class="widget clearfix" style="margin-bottom: -20px;">

                            <div class="row">

                                <div class="col-md-6 bottommargin-sm">
                                    <div class="total"><span>${TotalVisit}</span></div>
                                    <h5 class="nobottommargin">總瀏覽人次</h5>
                                </div>

                                <div class="col-md-6 bottommargin-sm">
                                    <div class="total"><span>${Online}</span></div>
                                    <h5 class="nobottommargin">在線人數</h5>
                                </div>

                            </div>

                        </div>

                        <div class="widget subscribe-widget clearfix">
                            <h5><strong>Subscribe</strong> to Our Newsletter to get Important News, Amazing Offers &amp; Inside Scoops:</h5>
                            <div id="widget-subscribe-form-result" data-notify-type="success" data-notify-msg=""></div>
                            <form id="widget-subscribe-form" action="include/subscribe.php" role="form" method="post" class="nobottommargin">
                                <div class="input-group divcenter">
                                    <span class="input-group-addon"><i class="icon-email2"></i></span>
                                    <input type="email" id="widget-subscribe-form-email" name="widget-subscribe-form-email" class="form-control required email" placeholder="Enter your Email">
                                    <span class="input-group-btn">
                                        <button class="btn btn-success" type="submit">Subscribe</button>
                                    </span>
                                </div>
                            </form>
                            <script type="text/javascript">
                                jQuery("#widget-subscribe-form").validate({
                                    submitHandler: function(form) {
                                        jQuery(form).find('.input-group-addon').find('.icon-email2').removeClass('icon-email2').addClass('icon-line-loader icon-spin');
                                        jQuery(form).ajaxSubmit({
                                            target: '#widget-subscribe-form-result',
                                            success: function() {
                                                jQuery(form).find('.input-group-addon').find('.icon-line-loader').removeClass('icon-line-loader icon-spin').addClass('icon-email2');
                                                jQuery('#widget-subscribe-form').find('.form-control').val('');
                                                jQuery('#widget-subscribe-form-result').attr('data-notify-msg', jQuery('#widget-subscribe-form-result').html()).html('');
                                                SEMICOLON.widget.notifications(jQuery('#widget-subscribe-form-result'));
                                            }
                                        });
                                    }
                                });
                            </script>
                        </div>

                        <div class="widget clearfix" style="margin-bottom: -20px;">

                            <div class="row">

                                <div class="col-md-6 clearfix bottommargin-sm">
                                    <a href="#" class="social-icon si-dark si-colored si-facebook nobottommargin" style="margin-right: 10px;">
                                        <i class="icon-facebook"></i>
                                        <i class="icon-facebook"></i>
                                    </a>
                                    <a href="#"><small style="display: block; margin-top: 3px;"><strong>Like us</strong><br>on Facebook</small></a>
                                </div>
                                <div class="col-md-6 clearfix">
                                    <a href="#" class="social-icon si-dark si-colored si-rss nobottommargin" style="margin-right: 10px;">
                                        <i class="icon-rss"></i>
                                        <i class="icon-rss"></i>
                                    </a>
                                    <a href="#"><small style="display: block; margin-top: 3px;"><strong>Subscribe</strong><br>to RSS Feeds</small></a>
                                </div>

                            </div>

                        </div>

                    </div>

                </div><!-- .footer-widgets-wrap end -->

            </div>

            <!-- Copyrights
            ============================================= -->
            <div id="copyrights">

                <div class="container clearfix">

                    <div class="col_half">
                        Copyrights &copy; 2015 All Rights Reserved by Onion.<br>
                        <div class="copyright-links"><a href="#">Terms of Use</a> / <a href="#">Privacy Policy</a></div>
                    </div>

                    <div class="col_half col_last tright">
                        <div class="fright clearfix">
                            <a href="#" class="social-icon si-small si-borderless si-facebook">
                                <i class="icon-facebook"></i>
                                <i class="icon-facebook"></i>
                            </a>

                            <a href="#" class="social-icon si-small si-borderless si-twitter">
                                <i class="icon-twitter"></i>
                                <i class="icon-twitter"></i>
                            </a>

                            <a href="#" class="social-icon si-small si-borderless si-gplus">
                                <i class="icon-gplus"></i>
                                <i class="icon-gplus"></i>
                            </a>

                            <a href="#" class="social-icon si-small si-borderless si-pinterest">
                                <i class="icon-pinterest"></i>
                                <i class="icon-pinterest"></i>
                            </a>

                            <a href="#" class="social-icon si-small si-borderless si-vimeo">
                                <i class="icon-vimeo"></i>
                                <i class="icon-vimeo"></i>
                            </a>

                            <a href="#" class="social-icon si-small si-borderless si-github">
                                <i class="icon-github"></i>
                                <i class="icon-github"></i>
                            </a>

                            <a href="#" class="social-icon si-small si-borderless si-yahoo">
                                <i class="icon-yahoo"></i>
                                <i class="icon-yahoo"></i>
                            </a>

                            <a href="#" class="social-icon si-small si-borderless si-linkedin">
                                <i class="icon-linkedin"></i>
                                <i class="icon-linkedin"></i>
                            </a>
                        </div>

                        <div class="clear"></div>

                        <i class="icon-envelope2"></i> alex@handsome.com <span class="middot">&middot;</span> <i class="icon-headphones"></i> (香港)-3345678 <span class="middot">&middot;</span> <i class="icon-skype2"></i> OnionOnSkype
                    </div>

                </div>

            </div><!-- #copyrights end -->

        </footer><!-- #footer end -->

    </div><!-- #wrapper end -->

    <!-- Go To Top
    ============================================= -->
    <div id="gotoTop" class="icon-angle-up"></div>

    <!-- Footer Scripts
    ============================================= -->
    <script type="text/javascript" src="js/functions.js"></script>

</body>
</html>