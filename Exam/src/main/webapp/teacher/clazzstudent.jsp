<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>班级中的学生</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
<a style="font-size: 2em">学生列表</a><input id="selectall" name="selectall" type="text"placeholder="学号/姓名/性别"><input type="button"value="查询" onclick="selectall()" style="background-color:rgb(46,136,87); width: 70px;height: 40px;color: white;border: 0px;">&nbsp;<input type="button" value="完成" onclick="qxstudis()" style="background-color:rgb(46,136,87); width: 70px;height: 40px;color: white;border: 0px;">
<br><br>
<table border="1" cellspacing="0"style="width: 100%;height: 50px;text-align: center;">
<tr style="width: 50px">
<td >编号</td>
<td>学号</td> 
<td>姓名</td>
<td>性别</td>
<td>操作</td>
</tr>
<c:forEach items="${list}" var="stulist">
<tr>
<td id="updatacid" style="display: none;">${stulist.clazz_id}</td>
</tr><tr>
<td >111</td>
<td id="updatanum" name="num">${stulist.info_num}</td> 
<td id="updataname" name="name">${stulist.info_name}</td>
<td id="updatagender" name="gender">${stulist.info_gender}</td>
<td><a onclick="updatastu(${stulist.info_num})"><img src="../img/edit_1.png" width="30" height="30"></a>&nbsp;&nbsp;<a onclick="deletestu(${stulist.info_id})"><img src="../img/delete_1.png" width="30" height="30"></a></td>

</tr>
<!-- <tr>
<td>改</td>
<td><input id="infonum" name="infonum" type="text"size="10%" ></td> 
<td><input id="infoname" type="text"size="10%"></td>
<td>男<input class="infogender" type="radio"name="gender" value="男" />女<input class="infogender" type="radio" name="gender" value="女" /></td>
<td><a onclick="updatatab()">确定</a>/<a onclick="updataqx()">取消</a></td>
</tr> -->
</c:forEach>
</table>
<table id="aaaa" border="1" cellspacing="0"style="width: 100%;height: 50px;text-align: center;display:none">
<tr style="width: 50px">
<td>新增<input id="updatacid" name="updatacid" type="text" size="10%" style="display:none " value="${clazz_id}"></td>
<td><input id="addnum" name="addnum" type="text"size="10%" placeholder="数字"></td> 
<td><input id="addname" name="addname" type="text"size="10%"></td>
<td>男<input id="addgender"type="radio"name="gender" value="男" />女<input id="addgender" type="radio" name="gender" value="女" /></td>
<td><a onclick="addtab(${clazz_id})">确定</a>/<a onclick="addqx()">取消</a></td>
</tr>

</table>
<table id="updatastu" border="1" cellspacing="0"style="width: 100%;height: 50px;text-align: center;display:none">
<tr style="width: 30px">
<td>修改</td>
<td><input id="infonum" name="infonum" type="text"size="10%" ></td> 
<td><input id="infoname" type="text"size="10%"></td>
<td>男<input class="infogender" type="radio"name="gender" value="男" />女<input class="infogender" type="radio" name="gender" value="女" /></td>
<td><a onclick="updatatab(${stulist.info_num})">确定</a>/<a onclick="updataqx()">取消</a></td>
</tr>
</table>
<table border="1" cellspacing="0"style="width:100%;height: 50px;text-align: center;">
<tr>
<td colspan="5"><a onclick="addstu()">添加</a>
</td></tr>
</table> 
<script type="text/javascript">
function addtab(clazz_id) {
	alert(clazz_id)
	  var num = document.getElementById("addnum").value
	 var name = document.getElementById("addname").value
	 var gender =  $("input[name='gender']:checked").val();
	 var judge=1;
	   $.ajax({
		type:'post',
		url:'${pageContext.request.contextPath}/addstu.action',
		data:'info_num='+num+'&info_name='+name+'&info_gender='+gender+
		'&info_judge='+judge+'&clazz_id='+clazz_id,
		success:
		 function(resultData){
			if(resultData=="success"){
				 $.ajax({
						type : 'post',
						url : '${pageContext.request.contextPath}/selectstu.action',
						data : 'clazz_id=' + clazz_id,
						success : function(result) {
							
							$("#addclassstu").html(result)
						}
					})
			} 
		} 
	
	})     
	
	
}


</script>
</body>
</html>