<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的作业</title>
<style>
.sidebar{
	width: 10%;
	height: 100%;
	box-shadow:1px 1px 5px #756b6b;
}
.sidebar ul li{
	text-align: center;
	border: 1px solid #c9c9c9;
	line-height: 45px;
}

</style>
</head>
<body>
<!-- 头部导航  -->
<div class="nav-box clearfix">
	<jsp:include page="title.jsp"/> 
</div>
<!-- 侧边栏  bg -->
<div class="sidebar hide-sidebar">
	<ul>
		<li class="">隐藏</li>
		<li class="now"><a href="${pageContext.request.contextPath}/Task_execute2/getwork.action?pageNow=1&info_id=${student_id}&task_execute_finish=0">未完成的作业</a></li>
		<li class="after"><a href="${pageContext.request.contextPath}/Task_execute2/getwork.action?pageNow=1&info_id=${student_id}&task_execute_finish=1">已完成的作业</a></li>
		<li><a href="${pageContext.request.contextPath}/Task_execute2/getwork.action?pageNow=1&info_id=${student_id}&task_execute_finish=2">草稿</a></li>
	</ul>
</div>
<!-- 侧边栏  end -->

<div style="border:1px solid white;width:85%;background-color: white;margin-top: 100px;margin-left: 12.5%;">
<div class="middle">
<div class="aaaaa">
  <table class="table table-hover" style="width: 100%;">
    <thead>
		    <tr class="active">
            <th>作业名称</th>
				<th>老师</th>
				<th>教学计划</th>
				<th>上课时间</th>
            <th class="hidden-sm hidden-xs">操作</th>
		    </tr>
    </thead>
    <tbody>
    	<c:forEach items="${pageBean.datas}" var="list">
        <tr class="reclick" onclick="review('264aa590-97f1-11e7-8a86-001921d1a1fa','52')">
            <td>${list.task_package_name}</td>
				<td>${list.info_name}</td>
				<td>${list.plan_name}</td>
				<td>${list.start_time}</td>
            <td class="hidden-sm hidden-xs"><a href="${pageContext.request.contextPath}/Task_execute2/selectList.action?task_package_id=${list.task_package_id}&token=${list.token}&info_id=${student_id}&task_execute_id=${list.task_execute_id} " <%-- onclick="look(${list.task_package_id})" --%>>查看</a></td>
        </tr>
       </c:forEach>
	</table>
	<div class="pagin">
     <div class="message">共<i class="blue">${pageBean.totalRows}</i>条记录，当前显示第&nbsp;<i class="blue">${pageBean.pageNow}&nbsp;</i>页</div>
				<ul class="pagination">
				    <li><a href="${pageContext.request.contextPath}/Task_execute2/getwork.action?pageNow=1&info_id=${student_id}&task_execute_finish=0"><</a></li>
				    <c:forEach begin="1" end="${pageBean.totalPages }" var="page"> 
				    <li><a href="${pageContext.request.contextPath}/Task_execute2/getwork.action?pageNow=${page}&info_id=${student_id}&task_execute_finish=0">${page}</a></li>
				    </c:forEach>
				    <li><a href="${pageContext.request.contextPath}/Task_execute2/getwork.action?pageNow=${pageBean.totalPages }&info_id=${student_id}&task_execute_finish=0">></a></li>
				</ul>
     </div>
     </div>
</div>
</div>

<script type="text/javascript">
//显示隐藏侧边栏
$(".hide-sidebar").click(function(){
  $(".sidebar-list").slideToggle();
})
/* 
function look(task_package_id){
	
	var task_package_id = task_package_id;
   alert('task_package_id'+task_package_id)
	$.ajax({
    	type:'post',
    	url:'${pageContext.request.contextPath}/Task_execute2/selectList.action',
    	data:'task_package_id='+task_package_id,
    	success:function(resultData){
    		
    		alert(resultData)
    		$(".aaaaa").css("display","none")
    		$(".middle").html(resultData) 
    	}
    	
     })
     alert('111')
     } */
     
     
     
     $(".after").click(function(){
    	 $(".none").css("display","none")
     })
</script>


</body>
</html>