﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/MyFoodFix.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="shortcut icon" href="img\logo\MyFoodMap icon.png" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>MyFoodMap</title>
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
<link href="css/MyFoodFix.css" rel="stylesheet" type="text/css" />
<style type="text/css">
body {
	background-image: url(img/bg/bg_m3.jpg);
}
</style>
</head>

<body>
<!-- InstanceBeginEditable name="bodyfirst" --><script src="http://maps.googleapis.com/maps/api/js?sensor=false">
    </script>
    <script src="js/jquery.js"></script>
    <script src="js/jquery.tinyMap.min.js"></script>
<script src="js/jqmap.js"></script><!-- InstanceEndEditable -->

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
<div style="width: 900px; height: 600px">
	<div style="float:right">
		<select name="list">
    		<option value="tup">時間遞增</option>
       	    <option value="tdown">時間遞減</option>
      	    <option value="dup">距離遞增</option>
            <option value="ddown">距離遞減</option>
   	    </select>
	</div><br/>
	<div id="map" style="width: 540px; height: 500px;float: left"></div>
    <div id="list" style="width: 350px; height: 500px; float: right;">
    <table width="300" align="center" cellpadding="0" cellspacing="5">
        <tr>       	
        	<td><p>一號餐廳 (2015/02/17)</p>
       	    <p>新北市士林區有條路12號<br />
            0.3公里
       	    </p></td>
        </tr>
        <tr>
            <td><p>一號餐廳 (2015/02/17)</p>
       	    <p>新北市士林區有條路12號<br />
            0.3公里
       	    </p>
            </td>
        </tr>
            <td><p>一號餐廳 (2015/02/17)</p>
       	    <p>新北市士林區有條路12號<br />
            0.3公里
       	    </p>
            </td>
            <tr>
              <td><p>一號餐廳 (2015/02/17)</p>
       	    <p>新北市士林區有條路12號<br />
            0.3公里
       	    </p></td>            
            <tr>
              <td><p>一號餐廳 (2015/02/17)</p>
       	    <p>新北市士林區有條路12號<br />
            0.3公里
       	    </p></td>       	             
</table>
    </div>
</div>
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
