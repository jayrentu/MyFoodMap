var centerX=25.089377;var centerY=121.522989;
$(function() {
$('#map').tinyMap({
	center: '彰化縣和美鎮糖友里東萊路107號',
	zoom:16,
    marker: [
        {
            addr: '彰化縣和美鎮糖友里東萊路107號',
            text: '110台灣台北市信義區逸仙路28號',
            label: '請點我',
            // 自訂 marker click 事件
            event: function (e) {
                alert(e.latLng);
            },
            // 或是下列方式綁定多種事件
            event: {
                'click' : function (e) {
                    alert('緯度: ' + e.latLng.lat() + ', 經度: ' + e.latLng.lng());
                },
            },
            // 動畫效果
            animation: 'DROP|BOUNCE'
        },
        
    ]
});
});