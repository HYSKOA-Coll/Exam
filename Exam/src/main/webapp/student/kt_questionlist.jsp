<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
 	height:100%;
 	background-color: #fff;
  border:1px solid #c9c9c9;
 }
 .question{
 	margin-left: 20px;
 	margin-top: 20px;
 }
 .stufrom{
 	margin-top: 30px;
 	margin-left: 30px;
 }
 .xx{
 margin-left: 34px;
 }
 .qfrom{
 	margin-top: 30px;
 }
#err{
	display: none;
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
		<li class="now"><a style="color: white;">已上的课</a></li>
		<li class=""><a href="${pageContext.request.contextPath}/student/zkt.jsp">正在上的课</a></li>
	</ul>
</div>
<!-- 侧边栏  end -->

<!-- 正文  -->
<div class="middle">
<div class="question">
<a href="${pageContext.request.contextPath}/student/kt.jsp"><input name="search-btn" value="返回" type="submit"></a>
<c:forEach items="${stuQuestion }" var="list" varStatus="var">
 	<div class="stufrom">
			<from class="qfrom"> 
			<div class="tg">
				<font>题号：${var.count }&nbsp;&nbsp;</font><br/>
				<font>题目题干：&nbsp;&nbsp;</font>
				<span class="name${var.count }"  lang="${list.question_type }">${list.question_name }</span>
				<audio class="" id="err" src="http://localhost:8080/Exam/media/bbb.ogg" controls="controls"></audio>
				<br/>
			</div>
			选项内容：
			<div class="xx${var.count }">
				A：<font></font><br/>
				B：<font></font><br/>
				C：<font></font><br/>
				D：<font></font><br/>
				E：<font></font><br/>
				<input type="hidden" value='${list.question_option }'>
			</div>
			提示信息：${list.question_prompt }<br/>
			正确答案：${list.question_correct }
	
			</from>
		</div>
	</c:forEach>
	</div>
		
</div>	
<!-- 正文 end -->
<input type="hidden" value="${student_id }" id="student_id">

<script type="text/javascript">
//显示隐藏侧边栏
$(".hide-sidebar").click(function(){
  $(".sidebar-list").slideToggle();
})

/*  导航 */
if(document.getElementById("kt")){
$(".nav-list").children().eq(0).find("a").css({"fontSize":"21px", "color":"#60ac62"});
} 
	

function setOption(){
	var count =1;
	var count1 = 1;
	var question_option;
	var type;
	
	$(".qfrom input[type='hidden']").each(function(){
		question_option = JSON.parse($(this).val())
		$(".xx"+count).each(function(){
			$(this).children().eq(0).html(question_option.A)
			$(this).children().eq(2).html(question_option.B)
			$(this).children().eq(4).html(question_option.C)
			$(this).children().eq(6).html(question_option.D)
			$(this).children().eq(8).html(question_option.E)
			count++
		})
		$(".name"+count1).each(function(){
			type = $(this).attr("lang")
			if(type == 1){
				$(this).attr("id","err")
				$(this).next().attr("id","")
			}
			count1++
		})
		
	})
}

window.onload = function(){
	setOption()
}

</script>
</body>
</html>