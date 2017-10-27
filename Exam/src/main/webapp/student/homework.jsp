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
		<li><a href="${pageContext.request.contextPath}/Task_execute2/getwork.action?pageNow=1&info_id=${student_id}&task_execute_finish=1">已完成的作业</a></li>
		<li><a href="${pageContext.request.contextPath}/Task_execute2/getwork.action?pageNow=1&info_id=${student_id}&task_execute_finish=2">草稿</a></li>
	</ul>
</div>
<!-- 侧边栏  end -->
<div style="margin-left: 12.5%;margin-top: 90px;">
	<a href="${pageContext.request.contextPath}/Task_execute2/getwork.action?pageNow=1&info_id=${student_id}&task_execute_finish=0""><input type="button" value="返回" style="background-color:#60ac62;"></a><br/>
	<p style="font-size: 25px;">试题：</p>
	
	<c:forEach items="${list}" var="list" varStatus="vas">
		<div style="margin-left: 5%;margin-top: 10px;" class="qname">
			${vas.count+pageBean.start}.${list.task_name}<i class="task_id" style="display:none;">${list.task_id}</i><br/>
			<div class="xx" lang='${list.task_option}' vvv='${list.task_answer_answer}'>
			<input class="${vas.count}" type="radio" name="${vas.count}" value="A">
			A:<font></font><br/>
			<input type="radio" name="${vas.count}" value="B">
			B:<font></font><br/>
			<input type="radio" name="${vas.count}" value="C">
			C:<font></font><br/>
			<input type="radio" name="${vas.count}" value="D">
			D:<font></font><br/>
			<input type="radio" name="${vas.count}" value="E">
			E:<font></font><br/>
			<input type="hidden" value='${list.task_option }' name="task_option">
			<input type="hidden" value="${list.task_id}" name="task_id${vas.count}">
			<input type="hidden" value="${list.task_package_id}" name="task_package_id${vas.count}">
			<input type="hidden" value="${token}" name="token${vas.count}">
			<input type="hidden" value="${task_execute_id}" name="task_execute_id${vas.count}">
			<input type="hidden" value="${list.task_answer_answer}">
			</div>
			<br/>
		</div>
	</c:forEach>

</div>

<div class="none" style="margin-left: 40%;">
	<input type="button" onclick="submit()" value="提交">	
	<input type="button" onclick="save()" value="存为草稿">
</div>
<script type="text/javascript">
	function qqq(){
		
		var count = 1;
		var question_option;
			$(".xx").each(function(){
				var a = $(this).attr("lang")
				var v = $(this).attr("vvv")
				alert("uuuuu"+a+"vvvv"+v)
				question_option = JSON.parse(a)
				alert("a----"+a)
				alert(question_option.A)
				
				$(this).children().eq(1).html(question_option.A)
				$(this).children().eq(4).html(question_option.B)
				$(this).children().eq(7).html(question_option.C)
				$(this).children().eq(10).html(question_option.D)
				$(this).children().eq(13).html(question_option.E)
				if(v == null || v == ""){
					
				}else{
					$("input[type='radio'][name="+count+"][value="+v+"]").attr("checked",true);
				}
				count++
			});
			
			
			
		
	}
	
	window.onload = function(){
		qqq()
	}
	
	//存草稿
	function save(){
		var count = 1;
		var answer;
		var task_id;
		var task_package_id;
		var token;
		$(".qname").each(function(){
			answer = $("input:radio[name="+count+"]:checked").val()
			task_id = $("input[name='task_id"+count+"']").val()
			task_package_id = $("input[name='task_package_id"+count+"']").val()
			token = $("input[name='token"+count+"']").val()
			task_execute_id = $("input[name='task_execute_id"+count+"']").val()
			alert(answer+task_id+task_package_id+token+task_execute_id)
			count++
				if(answer != null){
					$.ajax({
						type:'post',
						url:'${pageContext.request.contextPath}/Task_answer/save_draft.action?&info_id=${student_id}',
						data:'answer='+answer+'&task_id='+task_id+'&task_package_id='+task_package_id+'&token='+token+'&task_execute_id='+task_execute_id,		
						success:function(success){
							window.location.href="${pageContext.request.contextPath}/Task_execute2/getwork.action?pageNow=1&info_id=${student_id}&task_execute_finish=0";
						}
					}) 
				}
			
			})
			
			 
		}
	
	//提交
	function submit(){
		
		var count = 1;
		var answer;
		var task_id;
		var task_package_id;
		var token;
		$(".qname").each(function(){
			answer = $("input:radio[name="+count+"]:checked").val()
			task_id = $("input[name='task_id"+count+"']").val()
			task_package_id = $("input[name='task_package_id"+count+"']").val()
			token = $("input[name='token"+count+"']").val()
			task_execute_id = $("input[name='task_execute_id"+count+"']").val()
			alert(answer+task_id+task_package_id+token+task_execute_id)
			count++
				 $.ajax({
					type:'post',
					url:'${pageContext.request.contextPath}/Task_answer/save.action?&info_id=${student_id}',
					data:'answer='+answer+'&task_id='+task_id+'&task_package_id='+task_package_id+'&token='+token+'&task_execute_id='+task_execute_id,		
					success:function(relutData){
						window.location.href="${pageContext.request.contextPath}/Task_execute2/getwork.action?pageNow=1&info_id=${student_id}&task_execute_finish=0";
					}
				}) 
				
			})
		}
		
</script>
</body>
</html>