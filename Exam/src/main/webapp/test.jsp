<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>测试</title>
</head>
<body>
<div>
“┌”（\u250c），“┐”（\u2510），“└”（\u2514），“┘”（\u2518）：图表外框转角符号
“─”（\u2500），“│”（\u2502）：图表中的横、竖线
“├”（\u251c），“┤”（\u2524），“┬”（\u252c），“┴”（\u2534），“┼”（\u253c）：图表中的各种交叉线
“█”（\u2588）：用来拼柱子的字符
“ ”（\u0020）：图表中的空格
</div><br/><br/>


<span>┌─┬───┐</span><br/>
<span>│a│███│</span><br/>
<span>├─┼───┤</span><br/>
<span>│b│███│</span><br/>
<span>└─┴───┘</span><br/>
 <style>
   .container {
    margin: 30px auto;
    width: 600px;
    height: 300px;
    border: 1px solid #000;
   }
  </style>
 </head>
 <body>
  <div class="container">
   <svg width="100%" height="100%"></svg>
  </div>

<script type="text/javascript">

window.onload = function() {
    var width = 600, height = 300;
    // SVG画布边缘与图表内容的距离
    var padding = { top: 50, right: 50, bottom: 50, left: 50 };
    // 创建一个分组用来组合要画的图表元素
    var main = d3.select('.container svg').append('g')
     // 给这个分组加上main类
     .classed('main')
     // 设置该分组的transform属性
     .attr('transform', "translate(" + padding.top + ',' + padding.left + ')');
   };

//模拟数据
var dataset = {
 x: ["赵","钱","孙","李","周","吴","郑","王"],
 y: [40, 30, 50, 70, 90, 20, 10, 40]
};
// 定义x轴的比例尺(序数比例尺)
var xScale = d3.scale.ordinal()
  .domain(dataset.x)
  .rangeRoundBands([0, width - padding.left - padding.right],0,0);
// 定义y轴的比例尺(线性比例尺)
var yScale = d3.scale.linear()
  .domain([0, d3.max(dataset.y)])
  .range([height - padding.top - padding.bottom, 0]);
// 定义x轴和y轴
var xAxis = d3.svg.axis()
  .scale(xScale)
  .orient('bottom');
var yAxis = d3.svg.axis()
  .scale(yScale)
  .orient('left');
// 添加坐标轴元素
main.append('g')
  .attr('class', 'axis')
  .attr('transform', 'translate(0,' + (height - padding.bottom - padding.top) + ')')
  .call(xAxis);
main.append('g')
  .attr('class', 'axis')
  .call(yAxis);
	
</script>

</body>
</html>