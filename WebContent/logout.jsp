<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/MyFoodFix.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="shortcut icon" href="img\logo\MyFoodMap icon.png" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>MyFood樣板</title>
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<!-- 登入檢查 -->
<style type="text/css">

#logoutbackground {
	height: 400px;
	width: 890px;
	/* border: 5px solid #FFF; */
	box-shadow: 5px 5px 10px #863;
	background-color: #fef196;
	font-size: 36px;
	color: #000;
	text-align: center;
}
.p1 {
	position: relative;
	top: 20px;
	box-shadow: 5px 0px 10px #863;
}

.input1 {
	height: 22px;
}

h3 {
	line-height: 1.5px;
}
#back {
	height: 500px;
	width: 900px;
	background-color: #FFF;
	opacity: 0.4;
}
.a1 {
	color: #000;
	text-decoration: none;
}


.message {
	font-size: 75%;
	color: #FF0000;
}  
.message1 {
	font-size: 22px;
	color: #FF0000;
	height:25px;
	text-align:center;
	margin: 7px 0px;
}  
</style>



<!-- InstanceEndEditable -->
<link href="css/MyFoodFix.css" rel="stylesheet" type="text/css" />
<style type="text/css">
body {
	background-image: url(img/bg/bg_m3.jpg);
}
</style>
</head>

<body>
<!-- InstanceBeginEditable name="bodyfirst" --><!-- InstanceEndEditable -->

<div id="login">

<!-- 設置登入與登出的差異 -->
<span id="login_y" style="display:${login_y}"><span id="username"><b>${name}&nbsp;</b>${times}登入</span>&nbsp;您好！&nbsp;<a href="Validateout.do"><img src="img/btn/btn_m7.png" width="48" height="24" alt="登出"/></a></span>
<span id="login_n" style="display:${login_n}">
<a href="login.jsp"><img src="img/btn/btn_m5.png" width="47" height="24" alt="登入"/></a>
<a href="register.jsp"><img src="img/btn/btn_m6.png" width="82" height="24" alt="註冊會員"/></a></span>
</div>
<div id="title">
  <div id="logo"></div>
   <div id="menu"> <a href="frontpage.jsp"><img src="img/btn/btn_m1.png" width="89" height="40" alt="首頁" /></a>&nbsp;
     <a href="search.jsp"><img src="img/btn/btn_m2.png" width="136" height="40" alt="餐廳查詢" /></a>&nbsp;
     <a href="recommend.jsp"><img src="img/btn/btn_m3.png" width="136" height="40" alt="餐廳推薦" /></a>&nbsp;
     <a href="foodmymap.jsp"><img src="img/btn/btn_m4.png" width="136" height="40" alt="個人地圖" /></a>
   </div>
  </div>
  <br/>
<div id="main"><!-- InstanceBeginEditable name="Main" -->
<center>
  <div id="logoutbackground">
    <p>&nbsp; </p>
    <p>&nbsp;</p>
    您已登出成功，歡迎下次再度光臨~~

    <p>&nbsp;</p>
    <p>&nbsp;</p>
    
  </div>
</center>
<!-- InstanceEndEditable --></div>
	<br/>
<div id="button">
<div id="connent"><a href="#">聯絡我們</a></div>
<p>目前瀏覽人數：9527人</p>
<p>主辦單位：職訓局　承辦單位：銘傳大學</p>
<p>CopyRight&copy;&nbsp;Java專班第二組&nbsp;</p>
</div>


<!-- InstanceBeginEditable name="botton" --><!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
