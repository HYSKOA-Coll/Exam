<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>作业批阅</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
</head>
<body>
<script type="text/javascript">
window.onload = function(){
	 selecthomeworkclazz()
	 selecthwlist()
}
function selecthwlist(){
	$.ajax({
		type : 'post',
		url : '${pageContext.request.contextPath}/selecthwlist.action',
		success : function(resultData) { 
			 var data = resultData
			$("#media_show").html(data)
		 }
	})
	
}
function selecthomeworkclazz(){
	$.ajax({
		type : 'post',
		url : '${pageContext.request.contextPath}/selectplayclazz.action',
		/* data : 'info_id=' + info_id, */
		success : function(resultData) { 
			 var data = resultData;
			
		for ( var o in data) {
				var t = $("<option></option>");
				t.text(data[o].clazz_name)
				t.val(data[o].clazz_id) 
				 $("#clazz").after(t)
		}
		 }
	})
	
}


function selectclazzwork(){
	 var clazz_name = $("#add_test1 option:selected").text();
	 var clazz_id = $("#add_test1 option:selected").val();
	 var inpu = $("#search_name").val()
 alert(clazz_name+"++++++"+clazz_id+"++++++"+inpu) 
$.ajax({
		type : 'post',
		url : '${pageContext.request.contextPath}/homeworklist.action',
		data : 'clazz_id=' + clazz_id + '&clazz_name='
		+ clazz_name + '&inpu=' + inpu,
		success : function(resultData) { 
			 var data = resultData;
			alert(data)
		 }
	})
}
</script>
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
        <li id="id2">
            <a href="${pageContext.request.contextPath}/teacher/homeworkplay.jsp">
               <img alt="批阅" src="${pageContext.request.contextPath}/teacher/img/see_0.png">
               <p>批阅</p>
            </a>
        </li>
     </ul>
</div>
</div>
<!-- 侧边栏  end -->
<div class="content-box clearfix">
    <div class="slug slug_left pull-left clearfix" id="slug_load_media">
          <!-- 头部 标题+查询 bg -->
    <div class="content-head clearfix">
    		<h3>学生作业列表</h3>
    		<div class="con-head-infoSearch pull-right clearfix">
    				<%-- <form action="<!-- ./getplan.action?pageNow=1 -->" method="post"> --%>
              <select id="add_test1" name="info_id" class="form-control a1" style="display:inline;margin-right: 10px;">
                     <option id ="clazz" class="clazz">全部班级</option>
              </select>
              
	   			 		<input type="text" id="search_name" placeholder="作业名称"  name="plan_name" style="margin-right:10px;">
	   			 		<input type="button" name="search-btn" value="查询" onclick="selectclazzwork()">
	   			 		<!-- <input id="aaaaa" type="submit" name="search-btn" value="查询"> -->
     	 		<!-- </form> -->
     	 </div> 
    </div>
    <div class="content-detail" id="media_show">
  			<%-- <table class="table table-bordered table-hover">
  					 <thead>
						    <tr class="table_thead">
						      <th>作业名称</th>
						      <th>布置时间</th>
						      <th>班级</th>
						      <th>提交人数</th>
						      <th>平均分</th>
						       <th>查看</th>
						    </tr>
						  </thead>
						    <tbody>						   
						   <c:forEach items="${qqq.datas}" var="list" varStatus="vas">
						   			<tr>
                      <td>1</td>                  
                      <td>2017-10-17</td>
                      <td>会计</td>
                      <td>1</td>
                      <td class="edit-td">100
                      </td>
                       <td><img src="${pageContext.request.contextPath}/teacher/img/see_0.png" width="20" height="20"></td>
						   			</tr>
						   	</c:forEach>		
						   </tbody> 
  			</table>
  				 --%>
    </div>
<%--      <div class="pagin">
        <div class="message">共<i class="blue">${tpb.totalRows }</i>条记录，当前显示第&nbsp;<i class="blue">${tpb.pageNow}&nbsp;</i>页</div>
         <ul class="paginList">
             <li class="paginItem"><a href="./getplan.action?pageNow=1" target="rightFrame"><span class="pagepre"><&nbsp;</span></a></li>
             <c:forEach begin="1" end="${tpb.totalPages}" var="page"> 
             <li class="paginItem"><a href="./getplan.action?pageNow=${page}" target="rightFrame">${page}</a></li>
             </c:forEach>	
             <li class="paginItem"><a href="./getplan.action?pageNow=${tpb.pageNow+1}" target="rightFrame"><span class="pagenxt" >&nbsp;></span></a></li>
         </ul>
         <br><br><br>
     </div>
 --%>     </div>
     </div>
</body>
</html>