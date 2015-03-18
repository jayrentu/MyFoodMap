<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/MyFoodFix.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="shortcut icon" href="img\logo\MyFoodMap icon.png" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>MyFoodMap</title>
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<link href="css/me.css" rel="stylesheet" type="text/css" />
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
<div style="padding-bottom:20px;height:800px">
  <div class="header" id="header1">
    <p><strong>餐廳介紹：</strong></p>
    <ul>
      <li><strong>餐廳列表</strong></li>
      <li><strong>回到首頁</strong></li>
    </ul>
  </div>
  
  <div class="header" id="header2">依縣市：
    <label for="list1"></label>
    <select name="list1" id="list1">
      <option>請選擇</option>
      <option>基隆市</option>
      <option>台北市</option>
      <option>新北市</option>
      <option>桃園縣</option>
      <option>新竹縣</option>
      <option>新竹市</option>
      <option>苗栗縣</option>
      <option>台中縣</option>
      <option>台中市</option>
      <option>彰化縣</option>
      <option>雲林縣</option>
      <option>嘉義縣</option>
      <option>嘉義市</option>
      <option>台南縣</option>
      <option>高雄縣</option>
      <option>屏東縣</option>
      <option>南投縣</option>
      <option>宜蘭縣</option>
      <option>花蓮縣</option>
      <option>台東縣</option>
      <option>澎湖</option>
      <option>金門</option>
      <option>馬祖</option>
    </select>
    依類別：
  <select name="list2" id="list2">
    <option>台式料理</option>
    <option>中式料理</option>
    <option>日式料理</option>
    <option>泰式料理</option>
    <option>美式餐廳</option>
  </select>
  </div>
  
  <div class="main" id="left"> 
        <div id="rs1">
              	  <p><img src="img/image/gra1.jpg" width="300" height="347" alt="１" /></p>
              <p>饗宴鐵板燒</p>
              <p>『饗宴鐵板燒』市一家高價位的鐵板燒餐廳，老闆阿勇對於新鮮當季食材、手工釀製、當地元素，多有所堅持...</p>
       　　  
  </div>
  </div>
  
  <div class="main" id="right"> 
    	<div id="rs1">
              <p><img src="img/image/gra2.jpg" width="300" height="347" alt="１" /></p>
              <p>冒煙的喬美式墨西哥餐廳</p>
              <p>『冒煙的喬』料理創意來自於喜愛旅行的Amy，除了典型美國南方家鄉菜『煙燻豬肋排』、『墨西哥玉米總...</p>
       　　  </div>
        
        <p>&nbsp;</p>
  </div>
  
  <div class="main" id="center"> 
   		<div id="rs1">
              <p><img src="img/image/gra3.jpg" width="300" height="347" alt="１" /></p>
              <p>響羅雷美食餐廳</p>
              <p>「響羅雷」美食餐廳是一場原住民音樂及原味的美食饗宴！位於利嘉部落上的響羅雷美食坊，平時提供原住...</p>
       　　  </div>
        
        <p>&nbsp;</p>     
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
