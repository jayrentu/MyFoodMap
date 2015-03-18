<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- InstanceBegin template="/Templates/MyFoodFix.dwt" codeOutsideHTMLIsLocked="false" -->
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
<style>
#map{
width: 64%; 
height: 100%;
float:left;
}
#result{
overflow-x:hidden;
overflow-y:auto;	
overflow:auto;
width: 34%; 
height: 100%;
float:right;
border-style:solid;
}
#resultls{
padding:0px;
width: 100%; 
border-bottom-style:solid
}
#classM{
margin:5px;
width: 900px; 
height: 500px;
}
table{
width:100%;
}

</style>
<script src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>

<script src="js/jquery.js"></script>
<script src="js/jquery.tinyMap.min.js"></script>
<script src="js/json2.js"></script>


<script>

	function panto(x){
		var x=x;
	$('#map').tinyMap('panto',x)

};
	function submit(x){
	$("#text1").html(x)
	$("#input").attr("value",x)
	$("#target").submit()
};
	$(function() {
		
		$('#map').tinyMap({
			center : '台北火車站',
			zoom : 12,
			marker:[{
		          addr:'彰化縣和美鎮糖友里東萊路107號',
		          text:'彰化縣和美鎮糖友里東萊路107號',
		          },{}]
		});
		
		$('#A').click(function() {
			  var geocoder;
			  geocoder = new google.maps.Geocoder();
			  var address = $('#addv').val();
			  var resultx;
			  var resulty;
			  
			  geocoder.geocode( { 'address': address}, function(results, status) {
				  var addx="";var addy="";
				  if($('Type').val()!="0"){
				   addx=results[0].geometry.location.D;
				   addy=results[0].geometry.location.k;}
					$.ajax({
						url : 'ajaxserch',
						data : {
							type: $('#Type').val(),
							addx:addx,
							addy:addy,
							add : $('#addv').val(),
							
						},
						type : 'POST',
						dataType : 'json',
						success : function(data) {
							$("#map").tinyMap('destroy');
							$("#map").tinyMap({
								center : '台北火車站',
								zoom : 12,
								marker : data[0]
							})
							$("#result").html(data[1][0].result)
						},
					})
				})
			});	
	});
</script>

</head>

<body>
	<!-- InstanceBeginEditable name="bodyfirst" -->

	<!-- InstanceEndEditable -->

	<div id="login">

		<!-- 設置登入與登出的差異 -->
		<span id="login_y" style="display:${login_y}"><span
			id="username"><b>${name}&nbsp;</b>${times}登入</span>&nbsp;您好！&nbsp;<a
			href="Validateout.do"><img src="img/btn/btn_m7.png" width="48"
				height="24" alt="登出" /></a></span> <span id="login_n"
			style="display:${login_n}"> <a href="login.jsp"><img
				src="img/btn/btn_m5.png" width="47" height="24" alt="登入" /></a> <a
			href="register.jsp"><img src="img/btn/btn_m6.png" width="82"
				height="24" alt="註冊會員" /></a></span>
	</div>
	<div id="title">
		<div id="logo"></div>
		<div id="menu">
			<a href="frontpage.jsp"><img src="img/btn/btn_m1.png" width="89"
				height="40" alt="首頁" /></a>&nbsp; <a href="search.jsp"><img
				src="img/btn/btn_m2.png" width="136" height="40" alt="餐廳查詢" /></a>&nbsp;
			<a href="recommend.jsp"><img src="img/btn/btn_m3.png" width="136"
				height="40" alt="餐廳推薦" /></a>&nbsp; <a href="foodmymap.jsp"><img
				src="img/btn/btn_m4.png" width="136" height="40" alt="個人地圖" /></a>
		</div>
	</div>
	<br />
	<div id="main">
		<!-- InstanceBeginEditable name="Main" -->
		<center>
			<select id="Type">
				<option value="0">依店名查詢</option>
				<option value="1">依距離查詢<1公里</option>
				<option value="2">依距離查詢<5公里</option>
			</select>
				<span id="text1">請輸入</span> <label for="add"></label> <input
					type="text" name="add" id="addv" /> <input type="button" name="b1"
					id="A" value="搜尋" />
		</center>
		<div id="classM">
			<div id="map" ></div>
			<div id="result" >
				
			</div>
		</div>
		<!-- InstanceEndEditable -->
	</div>
	<br />
	<div id="button">
		<div id="connent">
			<a href="#">聯絡我們</a>
		</div>
		<p>目前瀏覽人數：9527人</p>
		<p>主辦單位：職訓局 承辦單位：銘傳大學</p>
		<p>CopyRight&copy;&nbsp;Java專班第二組&nbsp;</p>
	</div>


	<!-- InstanceBeginEditable name="botton" -->
	<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd -->
</html>
