<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课堂试题</title>
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

</div>	
<!-- 正文 end -->

<input type="hidden" id="student_id" value="${student_id }">
<input type="hidden" id="token" value="">
<input type="hidden" id="packet_id" value="">

<script type="text/javascript">

function selectclazz(pageNow){
		
		/* 查询是否有课 */
		info_id = $("#student_id").val() 
		   $.ajax({
				type:'POST',
				data:"info_id="+info_id,
				url:'${pageContext.request.contextPath}/instanceAnswer/selectClazz.action',
				success:function(resultData){
					if(resultData == "repeat"){
						alert("当前没有课")
						return;
					}
					 $("#token").val(resultData[0].token)
					alert(resultData[0].packet_name) 
			 		   $.ajax({
							type:'POST',
							data:"info_id="+info_id+"&token="+resultData[0].token+"&packet_name="+resultData[0].packet_name+"&pageNow="+pageNow,
							url:'${pageContext.request.contextPath}/instanceAnswer/packetIdselect.action',
							success:function(resultData){
								$(".middle").html(resultData)
								aa()
							} 
						})  
						 
				} 
				
			}) 	
	}
/* packet_id 查询题目 end */
 	
	/* 查询选项 */
	function aa(){
		question_option = JSON.parse($(".qfrom input[type='hidden']").val());
		$(".xx").children().eq(1).html(question_option.A)
		$(".xx").children().eq(4).html(question_option.B)
		$(".xx").children().eq(7).html(question_option.C)
		$(".xx").children().eq(10).html(question_option.D)
		$(".xx").children().eq(13).html(question_option.E)
		
		$(".tg").children().eq(1).html()
		alert($(".tg").children().eq(1).attr("lang"))
		type= $(".tg").children().eq(1).attr("lang")
		if(type == 1){
			$(".tg").children().eq(1).attr("class","name")
			$(".tg").children().eq(2).attr("class","")
		}else if(type == 2){
			$(".tg").children().eq(2).attr("class","name")
			$(".tg").children().eq(1).attr("class","")
		}
	}
	
 	function sub(question_id,question_prompt ,student_answer){
 		
		info_id = $("#student_id").val()
		token = $("#token").val()
		answer = $("input:radio:checked").val()
		if(answer =="" || answer == null){
			 $(".err").html("请选择一项答案")
			 return;
		}
 		$(":radio").click(function(){
			$(".err").html("")
		}) 

		var student_answer;
 		var student_score;
 		var student_prompt;
 		price = $("#price").val()
 		
 		if(price == "提交"){
 			if(student_answer == answer){
 				student_score = 100
 				student_prompt = 0
 				alert("100--0")
 			}else{
 				alert("回答错误，提示：阿恶趣味的权威的"+question_prompt)
 				price = $("#price").val("修改")
 				return;
 			}
 		}else{
 			if(student_answer == answer){
 				student_score = 80
 				student_prompt = 1
 				alert("80---1")
 				price = $("#price").val("提交")
 			}else{
 				student_score = 0
 				student_prompt = 1
 				alert("0---1")
 				price = $("#price").val("提交")
 			}
 		}
 		alert("student_score--"+student_score)
 	    $.ajax({
			type:'POST',
			data:"info_id="+info_id+"&token="+token+"&question_id="+question_id+"&answer_student="+student_answer+"&answer_score="+student_score+"&answer_prompt="+student_prompt,
			url:'${pageContext.request.contextPath}/instanceAnswer/updateAnswer.action',
			success:function(resultData){
				 if(resultData == "success"){
					page = parseInt($("#page").val())
					var totalpage = parseInt($("#totalpage").val())
					var total = parseInt($("#totalpage").val())-1
					var datas = $("#datas").val()
					var packet_name = $("#packet_name").html()
					if(total == 0){
						 alert("答题完成")
						 window.location.href ="${pageContext.request.contextPath}/instanceAnswer/stuScore.action?packet_name="+packet_name+"&token="+token+"&info_id="+info_id;
						 return;
					}else{
						selectclazz(totalpage-total)
					}  

				} 
			} 
		})  
		
		
 		
	} 
	
	window.onload = function(){
		selectclazz(1)
	}
	
	
	var audio ;
	var initAudio = function(){
		
		audio = document.getElementById('audio');
	}

	function playOrPaused(id,obj){
		if(audio.paused){
			audio.play();
			obj.innerHTML='暂停';
			return;
		}
		audio.pause();
		obj.innerHTML='播放';
	}

	 function hideOrShowControls(id,obj){
		if(audio.controls){
			audio.removeAttribute('controls');
			obj.innerHTML = '显示控制框'
			return;
		}
		audio.controls = 'controls';
		obj.innerHTML = '隐藏控制框'
		return;
	} 
	 //保留一位小数点

	function returnFloat1(value) {    
		value = Math.round(parseFloat(value) * 10) / 10;
		if (value.toString().indexOf(".") < 0){
			value = value.toString() + ".0";
		}
		return value;
	}
</script>

</body>
</html>