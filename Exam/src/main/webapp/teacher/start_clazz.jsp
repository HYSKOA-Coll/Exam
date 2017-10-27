<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/teacher/css/start_clazz.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
.tableFrom{
	width:70%;
	float: right;
	margin-top: -16.5%;
	margin-right: -40px;
}
.table-bordered{
	width: 93%;
	margin-bottom: 20px;
	margin-top: 25px;
}
.table-bordered td{
	height:38px;
}
.p1{
	font-size: 18px;
	margin-top: 10px;
	text-align: 3;
}
.p2{
	font-size: 18px;
	margin-top: 10px;
}
#selsorce{
	margin-top: 0px;
	margin-bottom:-30px;
	margin-left: 32%;
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
      <div class="hide-sidebar"></div>
      <ul id="left_nav_ul" class="sidebar-list">
      	<li id="id">
	         <a href="javascript:void()">
              <img alt="" src="${pageContext.request.contextPath}/teacher/img/hide_sidebar_0.png">
	         </a>
        </li>
      </ul>
</div>
<!-- 侧边栏  end -->
<input id="token_id" type="hidden" value="${token }">
<input id="clazz_id" type="hidden" value="${clazz_id }">
<div class="content-box clearfix">
   <div class="slug slug_left pull-left clearfix" id="slug_load_media" style="height: auto;">
                 <!-- 头部 标题+查询 bg -->
      	<div class="content-head clearfix">
       		  <input type="button" name="sure-btn" value="< 上一资源"   class="pull-left" onclick="medio_prev()">
            <p class="pull-left" id="show_media_name">基础听力A</p>
            <input type="button" name="sure-btn" value="下一资源 >"  class="pull-left" onclick="medio_next()">
         	 	<div class="pull-right">
		         		<b>班级：</b><span>${clazz_name } </span>
		         		<span>&nbsp;/&nbsp;</span>
		         		<b>教学计划：</b><span>${plan_name } </span>
		         		<input name="cancel-btn" value="布置作业"  id="cancel_add" onclick="task_add()" type="button"/>
		         	  <select class="form-control" style="display:none ;width: 100px; height: 37px;margin-left: 8px;margin-right: 8px;">
		         				 <option id="p1">请选择作业</option>
		         		</select>
		         		<input type="button" class="sure" name="search-btn" value="确定"  style="display:none " onclick="sure()">
	         		 </div>
     		 </div>
                  <!-- 头部 标题+查询 end -->
                  
                  <!-- 正文 内容 bg -->
         <div class="content-detail" style="height: auto; width: 100%; ">
         <input name="cancel-btn" value="查看分数"  id="selsorce" type="button" onclick="selscore()"/>
         <c:forEach items="${packetlist }" var="list">
        			   <!-- 上课资源 左侧部分 bg -->
			      <div class="qustion_media" style="height: auto">
			      	 <div class="clearfix media-name">
	                 <span class="pull-left">${list.packet_name }</span>
	                 <input type="button" idd="14" class="pull-right" name="cancel-btn" value="发送试题"  onclick="student_answer(${list.packet_id },$(this))">
                </div>
                <div class="media-content">
			      			 <audio src="http://localhost:8080/Exam/media/bbb.ogg" controls="controls"></audio>
			      			 <div>
			     		  			<font>口语大赛(干预模式一)</font>
			     		  			<font class="heng">————————</font><br/>
			     		  			<span class="ztgy">整体干预</span>
			     		  			<span>${list.packet_prompt }</span>
			     		 		 </div>
			     		 		 <div class="question" style="margin-top: 16px;">
			     		 		 </div>
			     		  </div>
			     		  <div class="yinying" onclick="show_question($(this),${list.packet_id })" title="显示试题">
			     		 		 <img src="/Exam/teacher/img/uew_icon.png" alt="显示" >
			     		 	</div>
			      </div>
			      </c:forEach>
			          
    <div class="tableFrom">
    </div>
    
       	</div>
                <!-- 正文 内容 end -->
    </div>
</div>
<input type="hidden" id="packet_id">

<script type="text/javascript">
function show_question(t,packet_id){
	 
	if(t.attr("title")=="显示试题"){
	 $.ajax({
			type:'POST',
			url:'${pageContext.request.contextPath}/question/getquestion.action',
			data:"packet_id="+packet_id,
			success:function(resultData){
				console.log(resultData)
				var data = "";
				for(var i=0; i<resultData.length;i++){
					var question_option = JSON.parse(resultData[i].question_option);
					console.log(question_option);
					type = resultData[i].question_type
					id="audio";
					data
						+="<p>"		
						+"<span>"+ (i+1) +". 题干：</span>"
						if(type == 1){
						data+="<audio src='http://localhost:8080/Exam/media/bbb.ogg' id='audio' controls='controls' ></audio>"
						}else{
						data+="<span>"+resultData[i].question_name+"</span>"
						}
						data+="</p>" 
						+"<li>A:"+question_option.A+"</li>"
						+"<li>B:"+question_option.B+"</li>"
						+"<li>C:"+question_option.C+"</li>"
						+"<li>D:"+question_option.D+"</li>"
						+"<P>&nbsp;&nbsp;&nbsp; 答案 ："+ resultData[i].question_correct +"</P>"
						+"<P>&nbsp;&nbsp;&nbsp; 干预 ："+ resultData[i].question_prompt +"</P>"
				} 

				t.prev().children().eq(2).html(data);
				t.attr("title","隐藏试题")
			}
		})  
	}else if(t.attr("title")=="隐藏试题"){
				t.prev().children().eq(2).html("");
        t.attr("title","显示试题");
	}
}

function student_answer(packet_id,t){
	
	if(t.attr("name")=="sure-btn"){
		alert("该试题已经发送");
    return;
	}
	
	token = $("#token_id").val()
	clazz_id= $("#clazz_id").val()
	alert("aaa-----"+packet_id+"---------"+token+"------------"+clazz_id)
	$("#packet_id").val(packet_id)
	$.ajax({
			type:'POST',
			url:'${pageContext.request.contextPath}/question/getquestion.action',
			data:"packet_id="+packet_id,
			success:function(resultData){
				console.log(resultData)
				var data = "";
				for(var i=0; i<resultData.length;i++){
					var question_option = JSON.parse(resultData[i].question_option);
					console.log(question_option);
					question_id = resultData[i].question_id
					alert(question_id +"--"+clazz_id +"--"+token+"--"+packet_id)
	 				$.ajax({
						type:'POST',
						data:"token="+token+"&clazz_id="+clazz_id+"&question_id="+question_id+"&packet_id="+packet_id,
						url:'${pageContext.request.contextPath}/instanceAnswer/addInstanceAnswer.action',
						success:function(resultData){
							alert(resultData)
						} 
					})   
					
				}
			}
		}) 
		
		t.val("上课中...")
		t.attr("name","sure-btn");
}

/* 结束上课 */
 function end_class(t){
	
	 if(confirm("你确定要结束这堂课吗？")){ 
	 token = $("#token_id").val()
	 alert(token)
		$.ajax({
			type:'POST',
			data:"token="+token,
			url:'${pageContext.request.contextPath}/instance/end_instance.action',
			success:function(resultData){
				alert(resultData)
			} 
		})  
	 }else{
		 $("#start").attr("href","#")
		 alert("点击了取消");  
		 return;
	 }

}

/* 查看分数 */
function selscore(){
	token = $("#token_id").val()
	clazz_id = $("#clazz_id").val()
	packet_id = $("#packet_id").val()
	alert(packet_id)
	$.ajax({
		type:'POST',
		data:"token="+token+"&clazz_id="+clazz_id,
		url:'${pageContext.request.contextPath}/instanceAnswer/teaScore.action',
		success:function(resultData){
			/* $("#selsorce").attr("type":"hidden") */
		$(".tableFrom").html(resultData)
		
		var count = 1
		var thList = ""

		$(".score1").each(function(){
			thList +="<td>题目"+count+"</td>"
			count++
		})
		alert(thList)
	  $(".infoName").after(thList)
	  
	  var count1= 1
	  var num = 0 
	  $(".scorelist").each(function(){
		  $(".score"+count1).each(function(){  
			  alert("3333333"+$(this).html())
			  num += Number($(this).html())
		  })
		  alert("num---"+num)
		  alert("5555"+count1)
		  $(".num"+count1).html(num)
		  num = 0;
			count1++
	  })
	  
		} 
	})  
	

}

/* 布置作业查询作业包 */
function task_add(){
	$(".form-control").css("display","inline")
	$(".sure").css("display","inline")
	
	$.ajax({
		type:'POST',
		url:'${pageContext.request.contextPath}/instance/task_add.action',
		success:function(resultData){
			console.log(resultData)
			
 			var data = resultData
			if(data==null){
				return;
			}
			for(var task in data){
				var p = $("<option></option>");
				p.text(data[task].task_package_name)
			  p.val(data[task].task_package_id)
			  $("#p1").after(p)
			}
			
		} 
	})  
	
}


/* 确认布置作业 */
function sure(){
	var tackP = $(".form-control").val() 
	if(tackP == "请选择作业"){
		alert(tackP)
		return;
	}
	
	token = $("#token_id").val()
	clazz_id = $("#clazz_id").val()
	
	$.ajax({
		type:'POST',
		data:"token="+token+"&clazz_id="+clazz_id+"&task_package_id="+tackP,
		url:'${pageContext.request.contextPath}/Task_execute/instanceTask.action',
		success:function(resultData){
			alert(resultData)
		} 
	})  
	
} 
 
</script>
</body>
</html>