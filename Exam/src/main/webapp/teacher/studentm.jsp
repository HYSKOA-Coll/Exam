<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生管理</title>
<style type="text/css">

#aaa {
	width: 100%;
	height: 80px;
	text-align: center;
	background-color: white;
}

#bbb {
	width: 100%;
	height: 80px;
	text-align: center;
	display: none;
	background-color: #e9eecc;
}
/* 表格统一宽度 */
td {
	width: 20%;
	selectclazzlist
}

#alertaddclazz {
	width: 300px;
	height: 350px;
	background-color: rgb(255, 255, 224);
	position: absolute;
	right: 10px;
	top: 50px;
	text-align: center;
	display: none;
}

#addclassstu {
	width: 200px;
	height: 150px;
	background-color: rgba(192, 192, 192, 0.1);
	position: absolute;
	right: 10px;
	top: 100px;
	text-align: center;
	display: none;
}
.cen li {
	float: left;
	line-height: 8px;
	margin-right: 2%;
	margin-top: 20px;
	background: rgb(220, 220, 220);
	width: 17%;
	height: 120px;
}
.cen ul {
	list-style: none;
}
</style>
</head>
<body>

<!-- 头部导航  -->
<div class="nav-box clearfix">
	<jsp:include page="title.jsp"/> 
</div>

<!-- 侧边栏  bg -->
<div  >
<div class="sidebar" style="float: left;">
      <div class="hide-sidebar"></div>
      <ul id="left_nav_ul" class="sidebar-list" data-toggle="collapse" data-target="#demo">
      	<li id="id">
	         <a href="javascript:void()">
              <img alt="" src="img/hide_sidebar_0.png">
	         </a>
        </li>
      </ul>

<div id="demo" class="collapse in">
    <ul id="left_nav_ul" class="sidebar-list">
       <li id="id1">
          <a href="javascript:void(0)">
            <img alt="查询" src="img/search_0.png">
            <p>查询</p>
          </a>
       </li>
        <li id="id2">
            <a href="javascript:void(0)">
               <img alt="新增" src="img/add_0.png">
               <p>新增</p>
            </a>
        </li>
     </ul>
</div>
</div>
<!-- 侧边栏  end -->

<script>
/*  导航 */
if(document.getElementById("tltkgl")){
$(".nav-list").children().eq(3).find("a").css({"fontSize":"21px", "color":"#60ac62"});
} 
function dis() {
	$("#bbb").css("display", "block")
}
function addstudis(clazz_id) {
	/*===================================根据班级的id查询学生列表================================================================  */
	/* $("#addclassstu").css("display","block") */

	$('#addclassstu').animate({
		width : 'toggle'
	}, 450);
	$.ajax({
				type : 'post',
				url : '${pageContext.request.contextPath}/selectstu.action',
				data : 'clazz_id=' + clazz_id,
				success : function(result) {
					alert(result)
					$("#addclassstu").html(result)
					$.ajax({
								type : 'post',
								url : '${pageContext.request.contextPath}/selectcount.action',
								data : 'clazz_id=' + clazz_id,
								success : function(result) {
									
									$(".count").html(result)
								}
							})

				}
			})

}
function qxstudis() {
	alert("取消添加studis")
	$("#addclassstu").css('display', 'none');
}
function qxtjbj() {
	$("#alertaddclazz").css('display', 'none');
}
/*&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&让添加班级的div谈出来 &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& */
function add() {
	/* $("#alertaddclazz").css("display","block"); */

	$('#alertaddclazz').animate({
		width : 'toggle'
	}, 450);
	/*       $('#alertaddclazz').css('display','block') */

	$.ajax({
		type : 'post',
		url : '${pageContext.request.contextPath}/selectcollege.action',
		success : function(resultData) {
			var data = resultData;
			for ( var o in data) {
				var t = $("<option></option>");
				t.text(data[o].college_name)
				t.val(data[o].college_id);
				$(".select-college").after(t)

			}
		}

	})
};
function selectcollege(obj) {

	var college_id = obj.selectedIndex;
	$.ajax({
		type : 'post',
		url : '${pageContext.request.contextPath}/selectmajor.action',
		data : 'college_id=' + college_id,
		success : function(resultData) {
			var data = resultData;
			for ( var o in data) {
				var t = $("<option></option>");
				t.text(data[o].major_name)
				t.val(data[o].major_id);
				$(".select-major").after(t)

			}
		}

	})
}
function selectclazz(obj) {
	var major_id = obj.selectedIndex;
	$.ajax({
		type : 'post',
		url : '${pageContext.request.contextPath}/selectclazz.action',
		data : 'major_id=' + major_id,
		success : function(resultData) {
			var data = resultData;
			for ( var o in data) {
				var t = $("<option></option>");
				t.text(data[o].clazz_name)
				t.val(data[o].clazz_id);
				$(".select-clazz").after(t)

			}
		}
	})

}
function addclasslist() {
	var college_name = $("#college option:selected").text();
	var college_id = $("#college option:selected").val();
	var major_name = $("#major option:selected").text();
	var major_id = $("#major option:selected").val();
	var class_name = $("#class option:selected").text();
	var class_id = $("#class option:selected").val();
	$
			.ajax({
				type : 'post',
				url : '${pageContext.request.contextPath}/addclasslist.action',
				data : 'college_name=' + college_name + '&college_id='
						+ college_id + '&major_name=' + major_name
						+ '&major_id=' + major_id + '&class_name='
						+ class_name + '&class_id=' + class_id,
				success : function(resultData) {
					/* 	var data = resultData */
					if (resultData == "success") {
						/* $("#cen").html(resultData); */
						window.location.href = "${pageContext.request.contextPath}/student/studentm.jsp"
					}
				}
			})
}
function selectclazzlist() {
	$.ajax({
		type : 'post',
		url : '${pageContext.request.contextPath}/selectclasslist.action',
		success : function(result) {
			$(".cen").append(result);
			/* window.location.href="${pageContext.request.contextPath}/student/studentm.jsp" */
			/* var data = result;
			alert(data) */

			/* 	for(var o in data){
					 alert("college_id:"+data[o].college_id+" college_name:"+data[o].college_name+"major_id"+data[o].major_id
							 	+"major_name"+data[o].major_name+"clazz_id"+data[o].clazz_id+"clazz_name"+data[o].clazz_name);   
					      	
							 }   */
		}
	})
}
function delecteclazzlist(clazz_id) {
	alert("删除版集列表")
	alert("根据班级id删除" + clazz_id)
	$
			.ajax({
				type : 'post',
				url : '${pageContext.request.contextPath}/deleteclasslist.action',
				data : 'clazz_id=' + clazz_id,
				success : function(resultData) {
					/* window.location.href = "${pageContext.request.contextPath}/student/studentm.jsp" */
				}
			})

}
function addstu() {
	alert("添加学生")
	$("#aaaa").css('display', 'block')

}
function selectall() {
	var all = document.getElementById("selectall").value
	$.ajax({
		type : 'post',
		url : '${pageContext.request.contextPath}/selectall.action',
		data : 'all=' + all,
		success : function(resultData) {
			$("#addclassstu").html(resultData);

		}

	})
}
/*@@@@@@@@@@@@@@@@@@@@@@@@@@@@        班级id     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  */

function addqx() {
	alert("取消添加")
	$("#aaaa").css('display', 'none');
}
function updatastu(info_num) {
	alert("修改学生=====只是弹框内容")
	alert(info_num)
	var num = info_num;
	$("#updatastu").css('display', 'block');
 $("#infonum").val(num)
}
function updatatab() {
	alert("修改调用后台方法")
	 var num = document.getElementById("infonum").value
 var name = document.getElementById("infoname").value
 var gender =  $("input[name='gender']:checked").val()
	 $.ajax({
		type : 'post',
		url : '${pageContext.request.contextPath}/updatestu.action',
		data : 'info_num=' + num + '&info_name=' + name
				+ '&info_gender=' + gender,
		success :

		function(resultData) {
			if (resultData == "success") {
				/* $("#cen").html(resultData); */
				window.location.href = "${pageContext.request.contextPath}/student/studentm.jsp"
			}
		}
	}) 

}
function updataqx() {
	alert("取消修改")
	$("#updatastu").css('display', 'none');
}

function selectstu() {
	alert("stuselect")
	$.ajax({
		type : 'post',
		url : '${pageContext.request.contextPath}/selectstu.action',
		success : function(resultData) {
			alert(resultData)
			var data = resultData;
			for ( var o in data) {
				alert("id:" + data[o].info_id + "num:" + data[o].info_num
						+ "name" + data[o].info_name + "gender"
						+ data[o].info_gender);
			}
		}
	})
}
/* ======================根据id删除=========================================== */
function deletestu(info_id) {
	alert(info_id)
	$.ajax({
		type : 'post',
		url : '${pageContext.request.contextPath}/deletestu.action',
		data : 'info_id=' + info_id,
		success : function(resultData) {
			if(resultData="success"){
				alert("删除成功")
				window.location.href = "${pageContext.request.contextPath}/student/studentm.jsp"
			}
		}
	})
}
window.onload = function() {
	 selectclazzlist()
}

</script>
<div style="width: 93%;height: 550px; float: right;" >
<br /><br /><br /><br />
<div style="background: white; width: 100%; height: 450px; margin-top: 3px; float: left;">
				<br />
				<div>
					<a
						style="font-size: 1.5em; width: 10%; float: left; text-align: center;">班级列表</a>
				</div>
				<div style="width: 10%; text-align: center; float: right;">
					<input type="button" value="添加班级" onclick="add()"
						style="background-color: rgb(46, 136, 87); width: 80px; height: 40px; color: white; border: 0px;">
				</div>
				<br>
				<br>
				<div style="width: 100%; height: 2px; float: left;">
					<hr
						style="height: 1px; border: none; border-top: 1px dashed #0066CC;" />
				</div>
				<br /><br />
				<div class="cen">
					<!-- 班级列表 -->
				</div>
			</div>
</div>
</div>
<!--添加学生  -->
	<div id="addclassstu" style="height: 300px; width: 35%; float: left;">

	</div>

	<div id="alertaddclazz">
		<a style="font-size: 2em; float: left;">添加班级</a><input type="button"
			value="添加" onclick="addclasslist(this)"
			style="background-color: rgb(46, 136, 87); width: 60px; height: 40px; color: white; border: 0px;">&nbsp;&nbsp;<input
			type="button" value="取消"
			style="background-color: width; width: 60px; height: 40px; color: GREEN; border: 0px;"
			onclick="qxtjbj()"> <br> <br> <br>
		<div>
			<p>学 院：</p>
			<div class="custom-select-box lg-element">
				<select class="custom-select" id="college"
					onchange="selectcollege(this)">
					<option id="college" class="select-college">请选择学院</option>
				</select>
			</div>
		</div>
		<div>
			<p>专 业：</p>
			<div class="custom-select-box lg-element">
				<select class="custom-select" id="major"
					onchange="selectclazz(this)">
					<option id="major" class="select-major">请选择专业</option>
				</select>
			</div>
		</div>
		<div>
			<p>班 级：</p>
			<div class="custom-select-box lg-element">
				<select class="custom-select" id="class">
					<option id="choose-de" class="select-clazz">请选择专业</option>
				</select>
			</div>
		</div>

	</div>
</body>
</html>