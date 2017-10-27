<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的作业</title>
<script src="https://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/teacher/css/addwork.css" rel="stylesheet" type="text/css" />
<style>
/* 	/* Chrome, Safari, Opera */
@-webkit-keyframes mymove {
    20% {margin-top:20px;}
}
/* Standard syntax */
@keyframes mymove {
    20% {margin-top: 15px;}
} 
 .xinxi{
 	display:block; 
 	line-height: 100%;
 	margin-left: 35%;
 }
</style>
</head>
<body>

<!-- 头部导航  -->
	<div class="nav-box clearfix">
		<jsp:include page="title.jsp"/> 
	</div>
	
	<div id="bodw">
		<div id="hide">
			<a href=""><img src="${pageContext.request.contextPath}/teacher/img/hide_sidebar_1.png"></a>
		</div>
		<div id="li">
			<ul>
				<li style="background-color:white;padding:10px;">
					<a href="${pageContext.request.contextPath}/Taskp2/getTask_pack.action?pageNow=1&info_id=${info_id}">
						<img src="${pageContext.request.contextPath}/teacher/img/search_0.png">
						<p style="color:black;">查询</p>
					</a>
				</li>
				<li style="background-color:#60ac62;padding:10px;">
					<a href="javascript:void(0)">
					<img src="${pageContext.request.contextPath}/teacher/img/add_2.png"><br/>
					<p style="color:white;">增加</p></a>
				</li>
			</ul>
		
		</div><br/>
	</div>
	<div id="all" class="slug_left">
		<h3 style="font-size: 22px;">增加作业</h3>
		<div id="button">
			<input class="button" onclick="ksct()" type="button" value="开始出题">
			<input class="button" onclick="qrct()" type="button" value="完成">
		</div>
		<hr size=1 style="color:gray;border-style:dashed;width:100%">
		<div id="auto">
			<span>请先填写作业信息</span>
		</div>
		<div id="sjx">
			
		</div>
		<div id="span">
			<span>教学计划</span>
		</div>
		
		
		<div id="name">	
			<input class="button" id="choose" type="button" value="请选择" onclick="sele_homework_child()"><span id="plan_name">选择计划</span>
			<input type="hidden" id="plan_id" name="plan_id">
		</div>
		
		<div id="homework">
			<span>作业名称</span><input id="task_package_name" name="task_package_name" type="text" placeholder="作业名称">
		</div><br>
		<div id="test">
			<p>试题显示区域</p>
			<div id="question" style="width:95%;height:auto;border:1px solid gray;">
			    <span class="xinxi">作业信息填写完成后点击“开始出题”按钮开始出题</span>
			    
			</div>
		</div>
		
		
		
		
<!--  教学计划列表  -->	
	<div class="content-box slug_right" style="width:50%;background-color:white;border:gray;box-shadow:1px 1px 10px gray;padding:20px;">
    
          <!-- 头部 标题+查询 bg -->
    <div class="content-head">
    		<h3>选择教学计划</h3>
    		<div style="margin-left:33%;margin-top:-40px;">
    			<form >
	   			 		<select id="info_id" class="form-control" name="info_id" style="display:inline;margin-right: 10px;">
                     	<option value="0">全部计划</option>
                    	 	<option value="${teacher_id}">我的计划</option>
              			</select>
	   			 		<input type="text" id="search_name" name="plan_name" placeholder="教学计划名称"  style="margin-right:10px;">
	   			 		<input style="background-color:#60ac62;" type="button" value="查询" onclick="sele_homework_child()">
	   		</form>
     		</div> 
    </div>
    
    <%-- <div style="margin-top: 20px;">
  			<table class="table table-bordered">
  					 <thead>
						    <tr>
						      <th>编号</th>
						      <th>上传者</th>
						      <th>教学计划</th>
						      <th>备注课程</th>
						      <th>创建时间</th>
						      <th>选择</th>
						    </tr>
						  </thead>
						   <tbody>
						   	<c:forEach items="${qqq.datas}" var="list2" varStatus="vas">
						   	<tr>
									<td>${vas.count+pageBean.start}</td>
                     		<td>${list2.info_name}</td>
                     		<td>${list2.plan_name}</td>
                     		<td>${list2.plan_apply}</td>
                     		<td>${list2.plan_time}</td>
                     		<td class="edit-td">
                       			<a href="javascript:void(0)"  title="查看" onclick=""><img src="img/see_0.png" alt="查看"></a>
                     		</td>
						  		</tr>
						  		</c:forEach>
						   </tbody>
  			</table>
  				
    </div>
     <div class="pagin">
     <div class="message">共<i class="blue">${qqq.totalRows}</i>条记录，当前显示第&nbsp;<i class="blue">${qqq.pageNow}&nbsp;</i>页</div>
				<ul class="pagination">
				    <li><a href="${pageContext.request.contextPath}/teacher/getTask_pack.action?pageNow=1&info_id=${info_id}"><</a></li>
				    <li><a href="${pageContext.request.contextPath}/teacher/getTask_pack.action?pageNow=${pageBean.pageNow}&info_id=${info_id}">${qqq.pageNow}</a></li>
				    <li><a href="${pageContext.request.contextPath}/teacher/getTask_pack.action?pageNow=${pageBean.totalPages}&info_id=${info_id}">></a></li>
				</ul>
     </div>
     </div> --%>
     <div class="selplan">
     <jsp:include page="selplan.jsp"/>
     </div>
     </div>
     
  <!--  开始出题  -->
	<div class="start_question" style="border:1px solid white; width:30%;background-color: white;display: none;margin-left:80%;top:100px;box-shadow:1px 1px 10px gray;position:absolute;">
		<p>开始出题</p>
		<div class="input">
			<input type="submit" id="tj" onclick="tj()" value="提交" style="background-color: #60ac62;">
			<input type="button" class="quxiao" onclick="qx()" value="取消">
		</div> 
		<hr/>
		
		<a href="#"><span onclick="wzst()"  style="font-size:16px;">文字试题 <input type="hidden" checked="checked" name="task_type" value="1" id="iwzst"></span></a>
		<a href="#"><span onclick="yyst()" style="margin-left: 7%;font-size:16px;">语音试题<input type="hidden" checked="checked" name="task_type" value="2" id="iyyst"></span></a>
		
	
		<!-- 文字试题 -->
		<div class="wzst" style="display:block;">
			<span>题干</span><br/>
			<textarea id="tmnr" cols="40" rows="5" placeholder="输入题目内容"></textarea>
		</div>
		
		<!-- 语音试题 --> 
		<div class="yyst" style="display:none;">
			<span>本地文件</span>
			<input type="file" id="bdwj"><br/>
		</div>
	
	<div>
	<hr/>
		<a href="#" onclick="kgt()"><span style="font-size:16px;">客观题<input type="hidden"  value="4" name="lx_type" class="hidd" id="ikgt"></span></a>
		
		<!-- 客观题 -->
		<div id="kgt">
			选项内容<br/>
			<span>A</span><textarea id="xxA" rows="" cols="40" palceholder="选项A"></textarea><br/>
			<span>B</span><textarea id="xxB" rows="" cols="40" palceholder="选项B"></textarea><br/>
			<span>C</span><textarea id="xxC" rows="" cols="40" palceholder="选项C"></textarea><br/>
			<span>D</span><textarea id="xxD" rows="" cols="40" palceholder="选项D"></textarea><br/>
			<span>E</span><textarea id="xxE" rows="" cols="40" palceholder="选项E"></textarea><br/>	
			正确答案 <select id="zq">
						<option value="">正确选项</option>
						<option value="A">A</option>
						<option value="B">B</option>
						<option value="C">C</option>
						<option value="D">D</option>
						<option value="E">E</option>
					</select>
		</div>
	</div>
</div>


<!--  修改出题  -->
	<div class="update_question" style="border:1px solid white; width:30%;background-color: white;display: none;margin-left:80%;top:100px;box-shadow:1px 1px 10px gray;position: absolute;">
		<p>修改出题</p>
		<div class="input">
			<input type="submit" id="tj2" onclick="tj2()" value="保存" style="background-color: #60ac62;">
			<input class="quxiao" type="button" onclick="qx()" value="取消">
		</div> 
		<hr/>
		
		<a href="#"><span onclick="wzst()"  style="font-size:16px;">文字试题 <input type="hidden" checked="checked" name="task_type" value="1" id="iwzst"></span></a>
		<a href="#"><span onclick="yyst()" style="margin-left: 7%;font-size:16px;">语音试题<input type="hidden" checked="checked" name="task_type" value="2" id="iyyst2"></span></a>
		
	
		<!-- 文字试题 -->
		<div class="wzst" style="display:block;">
			<span>题干</span><br/>
			<textarea id="tmnr2" cols="40" rows="5" placeholder="输入题目内容"></textarea>
		</div>
		
		<!-- 语音试题 --> 
		<div class="yyst" style="display:none;">
			<span>本地文件</span>
			<input type="file" id="bdwj2"><br/>
		</div>
	
	<div>
	<hr/>
		<a href="#" onclick="kgt()"><span style="font-size:16px;">客观题<input type="hidden"  value="4" name="lx_type" class="hidd" id="ikgt2"></span></a>
		
		<!-- 客观题 -->
		<div id="kgt">
			选项内容<br/>
			<span>A</span><textarea id="xxA2" rows="" cols="40" palceholder="选项A"></textarea><br/>
			<span>B</span><textarea id="xxB2" rows="" cols="40" palceholder="选项B"></textarea><br/>
			<span>C</span><textarea id="xxC2" rows="" cols="40" palceholder="选项C"></textarea><br/>
			<span>D</span><textarea id="xxD2" rows="" cols="40" palceholder="选项D"></textarea><br/>
			<span>E</span><textarea id="xxE2" rows="" cols="40" palceholder="选项E"></textarea><br/>	
			正确答案 <select id="zq2">
						<option value="">正确选项</option>
						<option value="A">A</option>
						<option value="B">B</option>
						<option value="C">C</option>
						<option value="D">D</option>
						<option value="E">E</option>
					</select>
		</div>
	</div>
</div>
	</div>
</body>

<script type="text/javascript">
 
function sele_homework_child(){
	 alert("-------------")
	 var info_id = $("#info_id").val();
 	var plan_name = $("#search_name").val();
	 
	 $.ajax({
	    	type:'post',
	    	url:'${pageContext.request.contextPath}//Taskp2/getplan.action?pageNow=1',
	    	data:"&info_id="+info_id+"&plan_name="+plan_name,
	    	success:function(resultData){
	    		$(".selplan").html(resultData)
				//如果请求成功,会执行该函数内容，resultData是响应数据
	    			$(".slug_left").animate({"width":"82%"})
	    		    $(".slug_right").css({"display":"block"}).animate({"right":"0%"},function(){       //slug_right 滑出
	    		    slug_left_w = $(".slug_left").innerWidth();
	    		    }) 
		 	}
	    }) 
    /* $(".student-manage-list").children("li").css({"borderColor":"transparent","backgroundColor":"#e9e9e9"}) */
   /*  $(".slug_left").animate({"width":"68.5%"})
    $("#poi").css({"display":"block"}).animate({"right":"0%"},function(){       //slug_right 滑出
            slug_left_w = $(".slug_left").innerWidth();        //slug_right滑出后获取slug_left的宽度
    })
    
    var add_myclass_student_w = $("#poi").innerWidth();
    $("#poi").animate({"right": -add_myclass_student_w - 15 + "px"}).css({"display":"none"}); */
   
}

function sele_homework_child2(){
	$(".slug_left").animate({"width":"90%"})
    $(".slug_right").css({"display":"none"})
}

function ksct(){
	plan_name = $("#plan_name").html();
	name = $("#task_package_name").val();
	alert(plan_name+"--"+name)
	
 	   if(plan_name =="选择计划"  ||  name == ""){
	 		/* $(".prompt-info-con").text("请选择资源并填写完整信息") */
	   	alert('请选择教学计划并填写完整信息')
	   	return;
   		 }  
   $(".slug_left").animate({"width":"82%"})
    $(".start_question").css({"display":"block"}).animate({"right":"0%"},function(){       //slug_right 滑出
    slug_left_w = $(".slug_left").innerWidth();
    })
}



function sele_homework_child2(){
	$(".slug_left").animate({"width":"90%"})
    $(".start_question").css({"display":"none"})
    $(".update_question").css({"display":"none"})
}

function qx(){
	sele_homework_child2()
}

function wzst(){
	$(".yyst").css("display","none"),
	$(".wzst").css("display","block")
	var v = $("#iwzst").val();
	$("#tj").attr("e",v)
}

function yyst(){
	$(".wzst").css("display","none"),
	$(".yyst").css("display","block")
	var v = $("#iyyst").val();
	$("#tj").attr("e",v)
}



function xz(plan_name,plan_id){
	alert(plan_id,plan_name)
	/* var plan_name = a.attr("lang")
	var plan_id = $(".plan_id").val() */
	$("#plan_name").html(plan_name)
	$("#plan_id").val(plan_id)
	$(".slug_left").animate({"width":"90%"})
    $(".slug_right").css({"display":"none"})
}


//------出题提交--------
var num = 0;
function tj(){
	num++;
	  $(".xinxi").css("display","none")
	var tmnr = $("#tmnr").val()
	var bdwj = $("#bdwj").val()
	var xxA = $("#xxA").val()
	var xxB = $("#xxB").val()
	var xxC = $("#xxC").val()
	var xxD = $("#xxD").val()
	var xxE = $("#xxE").val()	
	var zq = $("#zq").val()
	alert('题目='+tmnr+'--本地文件='+bdwj+'--A='+xxA+'--B='+xxB+'--C='+xxC+'--D='+xxD+'--E='+xxE+'--正确答案='+zq)
	
	
	var gt_type = $("#tj").attr("e")
	if(gt_type == null){
		gt_type = $("#iwzst").val()
	}
	alert( gt_type)
	
	var r=""
        r+="<div class='tm' style='margin-top:30px;'>"+
           		"<div>"+
              		 "<span>第"+num+"题</span>"+
               	"<div style='margin-top:-30px;margin-left:75%;'>"+
                		"<input type='button' name='cancel-btn' value='编辑' onclick='upd_task($(this))'>"+
                		"<input type='button' name='cancel-btn' value='删除' onclick='del_task($(this))'>"+
              		"</div>"+
          		"</div>"+
          "<div class='list-question-con'>";
           
        if(gt_type == 1){
            r+="<div><span><b>试题题干：</b></span><span class='task_name'>"+tmnr+"</span><i style='display:none;'>"+gt_type+"</i></div>"
          
            	r+="<div class='optionA'><span>A：</span><span class='xxa'>"+xxA+"</span></div>"
               r+="<div class='optionB'><span>B：</span><span>"+xxB+"</span></div>"
               r+="<div class='optionC'><span>C：</span><span>"+xxC+"</span></div>"
               r+="<div class='optionD'><span>D：</span><span>"+xxD+"</span></div>"
               r+="<div class='optionE'><span>E：</span><span>"+xxE+"</span></div>"
               r+="<div><span><b>正确答案：</b></span><span class='task_correct'>"+zq+"</span></div>"
           		
            
    		}else if(gt_type == 2){
    			r+="<div><span><b>试题题干：</b></span><span class='task_name'>"+bdwj+"</span><i>"+gt_type+"</i></div>"
    			
                	r+="<div class='optionA'><span>A：</span><span>"+xxA+"</span></div>"
                  r+="<div class='optionB'><span>B：</span><span>"+xxB+"</span></div>"
                  r+="<div class='optionC'><span>C：</span><span>"+xxC+"</span></div>"
                  r+="<div class='optionD'><span>D：</span><span>"+xxD+"</span></div>"
                  r+="<div class='optionE'><span>E：</span><span>"+xxE+"</span></div>"
                  r+="<div><span><b>正确答案：</b></span><span class='task_correct'>"+zq+"</span></div>"
 			   
    		}else{
    			r+="<div><span><b>试题题干：</b></span><span class='task_name'>"+tmnr+"</span><i>"+gt_type+"</i></div>"
    	          
            	r+="<div class='optionA'><span>A：</span><span class='xxa'>"+xxA+"</span></div>"
               r+="<div class='optionB'><span>B：</span><span>"+xxB+"</span></div>"
               r+="<div class='optionC'><span>C：</span><span>"+xxC+"</span></div>"
               r+="<div class='optionD'><span>D：</span><span>"+xxD+"</span></div>"
               r+="<div class='optionE'><span>E：</span><span>"+xxE+"</span></div>"
               r+="<div><span><b>正确答案：</b></span><span class='task_correct'>"+zq+"</span></div>"
    		}
       
        
         r+="</div></div><hr/>" 
        $("#question").append(r)
        
  			$("#tmnr").val("")
			$("#bdwj").val("")
			$("#xxA").val("")
			$("#xxB").val("")
			$("#xxC").val("")
			$("#xxD").val("")
			$("#xxE").val("")
			$("#zq").val("")
	
}


/*-------确认出题---------------*/
function qrct(){
	//保存作业包
	var task_package_name = $("#task_package_name").val()
	var plan_id = $("#plan_id").val()
	/* $.ajax({
		type:'post',
		url:'${pageContext.request.contextPath}/Taskp/insert123.action',
		data:'task_package_name='+task_package_name+'&plan_id='+plan_id,
		success:function(resultData){
			if(resultData == "success"){ */
		
	
	var tm = $(".tm")
	var tm_length = $(".tm").length;
	alert(tm_length)
	var task=[]
	if(tm.length > 0){
		for(var i=0;i<tm_length;i++){
			var arr=[]
			var a={}
			var ob={}
			/* var plan_name = $("#plan_name").html()
			var plan_id = $("#plan_id").val()
			var task_name = $("#task_name").val()
			var xxA = $(".optionA").text()
			var xxB = $(".optionB").text()
			var xxC = $(".optionC").text()
			var xxD = $(".optionD").text()
			var xxE = $(".optionE").text()
			var task_option = xxA+xxB+xxC+xxD+xxE
			var task_correct = $(".task_correct").html() */
			
			ob["task_name"] = tm[i].children[1].children[0].children[1].innerHTML
			ob["task_type"] = tm[i].children[1].children[0].children[2].innerHTML
			a["A"] = tm[i].children[1].children[1].children[1].innerHTML
			a["B"] = tm[i].children[1].children[2].children[1].innerHTML
			a["C"] = tm[i].children[1].children[3].children[1].innerHTML
			a["D"] = tm[i].children[1].children[4].children[1].innerHTML
			a["E"] = tm[i].children[1].children[5].children[1].innerHTML
			ob["task_option"] = JSON.stringify(a) 
			ob["task_correct"] = tm[i].children[1].children[6].children[1].innerHTML
            alert('task_name'+ob["task_name"]+'task_option'+ob["task_option"]+'task_correct'+ob["task_correct"]+'task_type'+ob["task_type"])
			
			arr.push(ob)
			task.push(arr)
			
		}
		 task = JSON.stringify(task); 
		alert("task"+task)
		console.log(task)
		
		 $.ajax({
	    	type:'post',
	    	/* url:'${pageContext.request.contextPath}/Task/insert.action', */
	    	url:'${pageContext.request.contextPath}/Taskp/insert123.action',
	    	data:'task='+task+'&task_package_name='+task_package_name+'&plan_id='+plan_id,
	    	success:function(){
	    		
	    	} 
		 
	    })
		
	     window.location.reload();
	}else{
		alert('请选择试题')
	}
	
}

/* 删除出题 */
function del_task(a){
	a.parent().parent().parent().remove()
	if( $(".tm").length == 0 ){
		(".xinxi").css("display","block")
	}
}

/* 修改出题 */
function upd_task(a){
	
	
	    
	var task_name = a.parent().parent().next().children().eq(0).children().eq(1).html()
	var optionA = a.parent().parent().next().children().eq(1).children().eq(1).html()
	var optionB = a.parent().parent().next().children().eq(2).children().eq(1).html()
	var optionC = a.parent().parent().next().children().eq(3).children().eq(1).html()
	var optionD = a.parent().parent().next().children().eq(4).children().eq(1).html()
	var optionE = a.parent().parent().next().children().eq(5).children().eq(1).html()
	var task_correct = a.parent().parent().next().children().eq(6).children().eq(1).html()
	
	$("#tmnr2").val(task_name)
	$("#bdwj2").val()
	$("#xxA2").val(optionA)
	$("#xxB2").val(optionB)
	$("#xxC2").val(optionC)
	$("#xxD2").val(optionD)
	$("#xxE2").val(optionE)	
	$("#zq2").val(task_correct)
	
	 $(".slug_left").animate({"width":"82%"})
	    $(".update_question").css({"display":"block"}).animate({"right":"0%"},function(){       
	    slug_left_w = $(".slug_left").innerWidth();
	    })
	    window.a = a;
} 

/* 保存修改 */
function tj2(){
	var tmnr = $("#tmnr2").val()
	var bdwj = $("#bdwj2").val()
	var xxA = $("#xxA2").val()
	var xxB = $("#xxB2").val()
	var xxC = $("#xxC2").val()
	var xxD = $("#xxD2").val()
	var xxE = $("#xxE2").val()	
	var zq = $("#zq2").val()
	alert('题目='+tmnr+'--本地文件='+bdwj+'--A='+xxA+'--B='+xxB+'--C='+xxC+'--D='+xxD+'--E='+xxE+'--正确答案='+zq)
	
	a.parent().parent().next().children().eq(0).children().eq(1).html(tmnr)
	a.parent().parent().next().children().eq(1).children().eq(1).html(xxA)
	a.parent().parent().next().children().eq(2).children().eq(1).html(xxB)
	a.parent().parent().next().children().eq(3).children().eq(1).html(xxC)
	a.parent().parent().next().children().eq(4).children().eq(1).html(xxD)
	a.parent().parent().next().children().eq(5).children().eq(1).html(xxE)
	a.parent().parent().next().children().eq(6).children().eq(1).html(zq)
	
	$(".slug_left").animate({"width":"90%"})
	    $(".update_question").css({"display":"none"})
}
</script>
</html>