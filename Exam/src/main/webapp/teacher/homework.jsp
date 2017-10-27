<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>作业管理</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
<style>
	#poi{
		border:1px solid white;
		height: auto;
		background-color: white;
	}
	#poi p{
		font-size: 22px;
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
      <ul id="left_nav_ul" class="sidebar-list" data-toggle="collapse" data-target="#demo">
      	<li id="id">
	         <a href="javascript:void()">
              <img alt="" src="${pageContext.request.contextPath}/teacher/img/hide_sidebar_0.png">
	         </a>
        </li>
      </ul>

<div id="demo" class="collapse in">
    <ul id="left_nav_ul" class="sidebar-list">
       <li id="id1" style="background-color:#60ac62;">
          <a href="${pageContext.request.contextPath}/Taskp2/getTask_pack.action?pageNow=1">
            <img alt="查询" src="${pageContext.request.contextPath}/teacher/img/search_2.png">
            <p style="color:white;">查询</p>
          </a>
       </li>
        <li id="id2">
            <a href="${pageContext.request.contextPath}/teacher/addhomework.jsp">
               <img alt="新增" src="${pageContext.request.contextPath}/teacher/img/add_0.png">
               <p>新增</p>
            </a>
        </li>
     </ul>
</div>
</div>
<!-- 侧边栏  end -->

<!-- 中间部分  -->
<div class="content-box clearfix">
    <div class="slug slug_left pull-left clearfix" id="slug_load_media">
          <!-- 头部 标题+查询 bg -->
    <div class="content-head clearfix">
    		<h3>作业列表</h3>
    		<div class="con-head-infoSearch pull-right clearfix">
	   				<form action="${pageContext.request.contextPath}/Taskp2/getTask_pack.action?pageNow=1">
	   			 		<select class="form-control" name="info_id" style="display:inline;margin-right: 10px;">
                     	<option value="0">全部资源</option>
                    	 	<option value="${teacher_id}">我的资源</option>
              			</select>
	   			 		<input type="text" id="search_name" name="nameOrapply" placeholder="名称/适用学科"  style="margin-right:10px;">
	   			 		<input style="background-color:#60ac62;" type="submit" value="查询">
	   			 	</form>
     		</div> 
    </div>
    
    <div class="content-detail" id="media_show">
  			<table class="table table-bordered table-hover">
  					 <thead>
						    <tr class="table_thead">
						      <th>编号</th>
						      <th>教学计划</th>
						      <th>作业名称</th>
						      <th>创建时间</th>
						      <th>操作</th>
						    </tr>
						  </thead>
						   <tbody>
						   	<c:forEach items="${pageBean.datas}" var="list" varStatus="vas">
						   	<tr>
									<td>${vas.count+pageBean.start}</td>
                     		<td>${list.plan_name}</td>
                     		<td>${list.task_package_name}</td>
                     		<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${list.task_package_time}"></fmt:formatDate></td>
                     		<td class="edit-td">
                     					<input class="task_package_id" type="hidden" value="${list.task_package_id}">
                       			<a href="javascript:void(0)"  title="查看"  onclick="sele_homework_child(${list.task_package_id})"><img src="${pageContext.request.contextPath}/teacher/img/see_0.png" alt="查看"></a>
                       			<a href="javascript:void(0)" onclick="media_del(${list.task_package_id})" title="删除"><img src="${pageContext.request.contextPath}/teacher/img/delete_0.png" alt="删除"></a>
                     		</td>
						  		</tr>
						  		</c:forEach>
						   </tbody>
  			</table>
  				
    </div>
     <div class="pagin">
     <div class="message">共<i class="blue">${pageBean.totalRows}</i>条记录，当前显示第&nbsp;<i class="blue">${pageBean.pageNow}&nbsp;</i>页</div>
				<ul class="pagination">
				    <li><a href="${pageContext.request.contextPath}/Taskp2/getTask_pack.action?pageNow=${pageBean.pageNow-1}&info_id=${info_id}"><</a></li>
				    <c:forEach begin="1" end="${pageBean.totalPages }" var="page"> 
				    <li><a href="${pageContext.request.contextPath}/Taskp2/getTask_pack.action?pageNow=${page}&info_id=${info_id}">${page}</a></li>
				    </c:forEach>
				    <li><a href="${pageContext.request.contextPath}/Taskp2/getTask_pack.action?pageNow=${pageBean.totalPages}&info_id=${info_id}">></a></li>
				</ul>
     </div>
     <div id="poi" class="slug_right">
		
	  </div>
</div>

</div>

<!-- 中间部分end  -->
<script>
/*  导航 */
if(document.getElementById("tltkgl")){
$(".nav-list").children().eq(4).find("a").css({"fontSize":"21px", "color":"#60ac62"});
} 

/*  */
function sele_homework_child(task_package_id){
    /* $(".student-manage-list").children("li").css({"borderColor":"transparent","backgroundColor":"#e9e9e9"}) */
   /*  $(".slug_left").animate({"width":"68.5%"})
    $("#poi").css({"display":"block"}).animate({"right":"0%"},function(){       //slug_right 滑出
            slug_left_w = $(".slug_left").innerWidth();        //slug_right滑出后获取slug_left的宽度
    })
    
    var add_myclass_student_w = $("#poi").innerWidth();
    $("#poi").animate({"right": -add_myclass_student_w - 15 + "px"}).css({"display":"none"}); */
   
    
     var task_package_id = task_package_id;
     $.ajax({
    	type:'post',
    	url:'${pageContext.request.contextPath}/Task2/selectList.action',
    	data:'task_package_id='+task_package_id,
    	success:function(resultData){
    		 var data = resultData;
     		 var task = ""
     			 task +="<p>作业详情</p>"
					 task +="<button style='background-color:#60ac62;width:80px;height:30px;margin-left:70%;margin-top:-20px;' onclick='sele_homework_child2()'> >>> </button>"
			     for(var i=0; i<data.length; i++ ){ 
			    	 var task_type = data[i].task_type;
				   var task_option = JSON.parse(data[i].task_option);
				   
					if(task_type == 1){
						
							task+="<div style='margin-left:5%;'>"
							 task +="<span>"+ (i+1) + ".题干：" + data[i].task_name +"</span>"
							 task	+="<ul style='margin-left:5%'>"
								 task	+="<li>A："+task_option.A+"</li>"
								 task	+="<li>B："+task_option.B+"</li>"
								 task	+="<li>C："+task_option.C+"</li>"
								 task	+="<li>D："+task_option.D+"</li>"
								 task	+="<li>E："+task_option.E+"</li>"
								 task	+="</ul>"
									 task	+="<span>答案："+ data[i].task_correct +"</span>"
									 task	+="</div>" 
									 
					}else if(task_type == 2){
						
							task+="<div style='margin-left:5%;'>"
							 task +="<span>"+ (i+1) +"<audio controls='controls' src='"+ data[i].task_name +"'></audio></span>"
							 task	+="<ul style='margin-left:5%'>"
								 task	+="<li>A："+task_option.A+"</li>"
								 task	+="<li>B："+task_option.B+"</li>"
								 task	+="<li>C："+task_option.C+"</li>"
								 task	+="<li>D："+task_option.D+"</li>"
								 task	+="<li>E："+task_option.E+"</li>"
								 task	+="</ul>"
									 task	+="<span>答案："+ data[i].task_correct +"</span>"
									 task	+="</div>"
					}
						 
			}  
    		  $("#poi").html(task); 
    		  
    		  
    		  
    	}  
    	
    })
    
     $(".slug_left").animate({"width":"65.5%"})
    $(".slug_right").css({"display":"block"}).animate({"right":"0%"},function(){       //slug_right 滑出
    slug_left_w = $(".slug_left").innerWidth();
    
    
    }) 
} 

function sele_homework_child2(){
	$(".slug_left").animate({"width":"100%"})
    $(".slug_right").css({"display":"none"})
}



function media_del(task_package_id){
	$.ajax({
		type:'post',
		url:'${pageContext.request.contextPath}/Taskp/del_Task_pack.action',
		data:'task_package_id='+task_package_id,
		success:function(resultData){
			if(resultData=="success"){
			alert("删除作业成功"),
			window.location.reload();
			}else if(resultData=="repeat"){
				alert('这不是你布置的作业')
			}
		}
	})
}
</script>

</body>
</html>