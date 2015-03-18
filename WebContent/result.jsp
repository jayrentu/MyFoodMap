
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/MyFoodFix.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="shortcut icon" href="img\logo\MyFoodMap icon.png" />
<!-- InstanceBeginEditable name="doctitle" -->

<title>MyFoodMap</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script src="js/jquery.js"></script>
<script src="js/jquery.tinyMap.min.js"></script>
<script src="js/json2.js"></script>


<script>

$(document).ready( function() 
{
	
	
	$.ajax({
		
	    url:"CheckVote?RSID=<%= request.getParameter("RSID") %>",
	    type:"GET",
	    async: false,
	    dataType: "JSON",
		
	    success:function(data)
	    {
	    	var dt = new Date();	    	
	    	dt = dt.getFullYear() + "-" + (dt.getMonth()>9?"":"0") +  (dt.getMonth() +  + 1) + "-" + dt.getDate();
    	
	    	//抓取餐廳的資料
	    	var RName = data.rName;
	    	var RAdd = data.rAdd;
	    	var RTel = data.rTel;
	    	var RRuntime = data.rRuntime;
	    	var RMeautime = data.rMeautime;
	    	var RWeb = data.rWeb;
	    	var RInfo = data.rInfo;
	    	var RRank_a = data.rRank_a;
	    	var RRank_n = data.rRank_n;
	    	
	    	var RCoor = data.rCoor;
	    	
	    	var hisran = data.hisran;
	    	var hiseat = data.hiseat;
	    	var hisdate = data.hisdate;
	    	
	    	//更新網頁上的資訊
	    	$('#RName').html(RName);
	    	$('#RAdd').html(RAdd);
	    	$('#RTel').html(RTel);
	    	$('#RRuntime').html(RRuntime);
	    	$('#RMeautime').html(RMeautime);
	    	$('#RWeb').html(RWeb);
	    	$('#RInfo').html(RInfo);
	    	$('#RRank_a').html(RRank_a);
	    	$('#RRank_n').html(RRank_n);
	    	
	    	//將座標指向迷你地圖
	    	$(function() {
	    		$('#map').tinyMap({
	    			center : RCoor,
	    			zoom : 16,
	    			marker:[{
	    		          addr: RAdd,
	    		          text:   "店名：" + RName + "<br>"
	    		          		+ "電話：" + RTel ,
	    		          },{}]
	    		});
	    		
	    	})
	    	

	    	//判斷歷史紀錄
	    	switch(hisran)
	    	{
	    		case 1 :
	    			$("#ran_1").attr("checked",true);
	    			break;
	    		case 2 :
	    			$("#ran_2").attr("checked",true);
	    			break;
	    		case 3 :
	    			$("#ran_3").attr("checked",true);
	    			break;
	    		default :
	    			
	    			break;
	    	}
	    	
	    	//已吃過為1時，將以吃過打勾
	    	if(hiseat == 1){ $("#iseat").attr("checked",true); }
	    	
	    	//無人評分過時，將評分人數修改
	    	if(RRank_n.match("無資料"))
	    	{
	    		$("#RRank_z").html("(尚未有人評分)");
	    	}
	    	
	    	//如果日期為1900-01-01，將日期清空
	    	//時間要求清空時，不顯示歷史日期
	    	if(hisdate.match("1900-01-01"))
	    	{
	    		hisdate = "default";
	    		//DoNothing!
	    	}
	    	else
	    	{
	    		$('#eatT').val(hisdate); 
	    	}	    	
    	
	    	//判斷是否登入	
	    	if(data.islogin == "true")
	    	{
	    		
	    		if(data.isnew == "nv")
	    		{
	    			//沒有紀錄
	    			$('#list_word').css({display: "none"});
	    			$('#list2').css({display: "inline"});
	    			$('#list3').css({display: "none"});
	    			$('#RYouRank').css({display: "none"});
	    		}
	    		else if(data.isnew == "v")
	    		{
	    			//已有紀錄，但是沒評分
	    			$('#list_word').css({display: "none"});
	    			$('#list2').css({display: "none"});
	    			$('#list3').css({display: "inline"});
	    			$('#RYouRank').css({display: "none"});
	    		}
	    		else if(data.isnew == "u")
	    		{
	    			//已有紀錄，已有評分
	    			$('#list_word').css({display: "none"});
	    			$('#list2').css({display: "none"});
	    			$('#list3').css({display: "inline"});
	    			$('#RYouRank').css({display: "inline"});
	    			$('#RYouRank_R').html(hisran);
	    			$('#RToRank').html("更新評分：");
	    		}
	    		else
	    		{
	    			alert("是否評分的錯誤...");
	    		}
	    				    		
	    	}
	    	else if(data.islogin == "false")
	    	{
	    		//沒登入
    			$('#list_word').css({display: "inline"});
    			$('#list2').css({display: "none"});
    			$('#list3').css({display: "none"});
    			$('#RYouRank').css({display: "none"});
    			$('#RToRank').css({display: "none"});
    			$('#RToRank_c').css({display: "none"});
    			$('#iseat_n').css({display: "none"});
    			$('#iseat_t').css({display: "none"});
	    	}
	    	else
	    	{
	    		alert("登入判斷的錯誤...");
	    	}
	    	
	    },
	    
	    error:function(response , xml)
		{
			alert("大問題！");
		},
		
	});
	
//---返回上一頁--------------------------------
	
	$("#list1").click( function(){
		
		window.history.back();
	
	})
	
/*	
 *	votetype:評分類型(n:新增進地圖,nv新增且評分,u更新資料)
 *	ran:評分
 *	iseat:是否吃過
 *	ew:吃過的時間 
 */
	
//---只加入地圖--------------------------------
//---加入且進行評分--------------------------------
	
	$("#list2").click( function(){
		
		var s=0;
		var iseat=0;
				
		if($('#ran_1').prop("checked")){ s=1; }		
		if($('#ran_2').prop("checked")){ s=2; }		
		if($('#ran_3').prop("checked")){ s=3; }		
		if($('#iseat').prop("checked")){ iseat=1; }
				
		$.ajax({
		    url:"RankVote",
		    type:"POST",
		    async: false,
		    dataType: "JSON",
		    	    
		     data: { rsid:<%= request.getParameter("RSID") %>,
		    	 	 votetype:"nv",
		    	 	 ran:s,
		    	 	 iseat:iseat,
					 tw:$('#eatT').val(),		     
		     				},
		     								
		    success:function(data)
		    {
		    	
		    	if(data.islogin == "true")
		    	{
		    		
		    		if(data.isvote == "true")
		    		{
		    			alert("評分建立完成!");
		    			location.reload();
		    		}
		    		else if(data.isvote == "false")
		    		{
		    			alert("評分建立失敗!");
		    		}
		    		else
		    		{
		    			alert("評分建立的錯誤...");
		    		}
		    				    		
		    	}
		    	else if(data.islogin == "false")
		    	{
		    		alert("請先登入會員!");
		    		window.location.href = 'login.jsp';
		    	}
		    	else
		    	{
		    		alert("登入狀態有誤，請重新登入");
		    		window.location.href = 'login.jsp';
		    	}
		    	
		    },
		    error:function(response)
		    {
				alert("新增地圖失敗!?");
		    },
		    
		  });
	
	})
	
//---已加入後，進行更新--------------------------------
	
	$("#list3").click( function(){
			
		var s=0;
		var iseat=0;
				
		if($('#ran_1').prop("checked")){ s=1; }		
		if($('#ran_2').prop("checked")){ s=2; }		
		if($('#ran_3').prop("checked")){ s=3; }		
		if($('#iseat').prop("checked")){ iseat=1; }
				
		$.ajax({
		    url:"RankVote",
		    type:"POST",
		    async: false,
		    dataType: "JSON",
		    	    
		     data: { rsid:<%= request.getParameter("RSID") %>,
		    	 	 votetype:"u",
		    	 	 ran:s,
		    	 	 iseat:iseat,
					 tw:$('#eatT').val(),		     
		     				},
		 
		    success:function(data)
		    {
		    	
		    	if(data.islogin == "true")
		    	{
		    		
		    		if(data.isvote == "true")
		    		{
		    			alert("評分更新完成!");
		    			location.reload();
		    		}
		    		else if(data.isvote == "false")
		    		{
		    			alert("評分更新失敗!");
		    		}
		    		else
		    		{
		    			alert("評分更新的錯誤...");
		    		}
		    				    		
		    	}
		    	else if(data.islogin == "false")
		    	{
		    		alert("請先登入會員!");
		    		window.location.href = 'login.jsp';
		    	}
		    	else
		    	{
		    		alert("登入狀態有誤，請重新登入");
		    		window.location.href = 'login.jsp';
		    	}
		    	
		    },
		    error:function(response)
		    {
				alert("更新資料失敗!?");
		    },
		    
		  });
	
	})
	
	
})


</script>

<style>
	
	#map
	{
		float:left;
		text-align:left;
	}
	
	#rsinfo
	{
		float:left;
		width:350px;
		padding:0;
		margin-left:20px;
		text-align:left;	
	}
	
	#clear
	{
		clear:both;
	}
	
	#endlist
	{
		list-style-type:none;
	}	
	
	.endli
	{
		display: inline;
	}
		
</style>


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
<!-- InstanceBeginEditable name="bodyfirst" -->

<script>



</script>
    
    
<!-- InstanceEndEditable -->

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
<div id="main"><!-- InstanceBeginEditable name="Main" --><center>


<div id="content">

    <div id="map" style="width:500px; height:500px">
    </div>
    <div id="rsinfo">
    	<p>餐廳名稱：<span id="RName">(讀取中...)</span></p>
    	<p>餐廳地址：<span id="RAdd">(讀取中...)</span></p>
    	<p>餐廳電話：<span id="RTel">(讀取中...)</span></p>
        <p>營業時間：<span id="RRuntime">(讀取中...)</span></p>
        <p>最後點餐時間：<span id="RMeautime">(讀取中...)</span></p>
        <p>餐廳網站：<span id="RWeb">(讀取中...)</span></p>
        <p>餐廳介紹：<span id="RInfo">(讀取中...)</span></p>
        <p>餐廳平均分數：<span id="RRank_a">(讀取中...)</span> <span id="RRank_z">(共有 <span id="RRank_n">(讀取中...)</span> 人進行了評分)</span></p>
        <p><span id="RYouRank">你的評比分數：<span id="RYouRank_R">(讀取中...)</span></span></p>
        <p><span id="RToRank">為餐廳評分：</span>
            	<span id="RToRank_c">普通<input type="radio" name="ran" id="ran_1" value="1"/>
    			好<input type="radio" name="ran" id="ran_2" value="2"/>
    			非常好<input type="radio" name="ran" id="ran_3" value="3"/></span></p>       
        <p><span id="iseat_n">是否已用餐：<input type="checkbox" name="iseat" id="iseat"/></span></p>
        <p><span id="iseat_t">用餐時間：<input type="date" name="eatT" id="eatT"/></span></p>
    </div>
    <div id="clear">
    </div>

</div>

<form action="RankVote" method="post">
<ul id="endlist">
    <li class="endli"><span id="list_word" style="display: inline">如需評分，請先進行<a href="login.jsp" style="color:#00F">登入</a>才能進行&nbsp;</span></li>
    <li class="endli"><input type="button" value="回搜尋結果" id="list1"/></li>
    <li class="endli"><input type="button" value="加入個人地圖" id="list2" style="display: none"/></li>
    <li class="endli"><input type="button" value="更新個人地圖" id="list3" style="display: none"/></li>
</ul>
</form>



<!-- InstanceEndEditable --></div>
	<br/>
<div id="button">
<div id="connent"><a href="#">聯絡我們</a></div>
<p>目前瀏覽人數：9527人</p>
<p>主辦單位：職訓局　承辦單位：銘傳大學</p>
<p>CopyRight&copy;&nbsp;Java專班第二組&nbsp;</p>
</div>


<!-- InstanceBeginEditable name="botton" -->  
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
