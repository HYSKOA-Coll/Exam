<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css">
.sidebar{
	width: 130px;
	height: 100%;
	box-shadow:1px 1px 5px #756b6b;
}
.sidebar ul li{
	text-align: center;
	border: 1px solid #c9c9c9;
	line-height: 45px;
}
.now{
	background-color: #60ac62;
	color: white;
	height: 45px;
	
}
.slug_left{width: 95.5%;}
.middle{
	margin-top:6.5%;
	margin-left:160px;	
	width:86.5%; 
	min-width:700px;
	min-height:460px;
 	height:100%;
 	background-color: #fff;
  border:1px solid #c9c9c9;
  
 }
  .table{
 	margin-top: 50px;
 	margin-left: 38px;
 	
 }
 .table th{
 	font-weight:bold;
 }
 .biaot{
 	margin-left: 30px;
 	margin-top: 30px;
 }
  .biaot b{
  	color: #575555;
	margin-right: 10px;
  }
  th{
  	color: #575555;
  }
</style>
</head>
<body>
<!-- 头部导航  -->
<div class="nav-box clearfix">
	<jsp:include page="title.jsp"/> 
</div>

<!-- 侧边栏  bg -->
<div class="sidebar">
	<ul>
		<li class="">隐藏</li>
		<li class=""><a href="${pageContext.request.contextPath}/student/kt.jsp">已上的课</a></li>
		<li class="now" style="color:white;">正在上的课</li>
	</ul>
</div>
<!-- 侧边栏  end -->

<!-- 正文  -->
<div class="middle">
		<div class="biaot">
			<b>试题：</b><span id="packet_name">${packet_name }</span><br/>
			<b>题量：</b><span class="totalRows">${stuListsize }</span><br/>
			</div>
	  <table class="table table-bordered" style="width: 94%;">
    <thead>
		    <tr>
            <th>题号</th>
            <th>分数</th>
            <th>干预次数</th>
		    </tr>
    </thead>
    <tbody>
    <c:forEach items="${stuListAnswer }" var="list" varStatus="vas">
				<tr>
					<td>${vas.count }</td>
					<td>${list.answer_score }</td>
					<td>${list.answer_prompt }</td>
				</tr>
		</c:forEach>
    </tbody>
</table>
</div>	
<!-- 正文 end -->
</body>
</html>