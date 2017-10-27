<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>班级作业完成情况</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
</head>
<body>
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
    		<h3>作业名称/班级名称</h3>
    		<div class="con-head-infoSearch pull-right clearfix">
	   			 		<input type="button" name="search-btn" value="返回" >
     	 </div> 
    </div>
    <div class="content-detail" id="media_show">
  			<table class="table table-bordered table-hover" style="width: 50%;float: left;">
  					 <thead>
						    <tr class="table_thead">
						      <th>姓名</th>
						      <th>是否完成</th>
						      <th>提交时间</th>
						      <th>得分</th>
						      <th>批阅</th>
						    </tr>
						  </thead>
						    <tbody>						   
						   <%-- <c:forEach items="${qqq.datas}" var="list" varStatus="vas"> --%>
						   			<tr>
                      <td>www</td>                  
                      <td>已完成</td>
                      <td>2017-10-17</td>
                      <td>10</td>
                       <td><img src="${pageContext.request.contextPath}/teacher/img/see_0.png" width="20" height="20"></td>
						   			</tr>
						   <%-- 	</c:forEach>		 --%>
						   </tbody> 
						       <tbody>						   
						   <%-- <c:forEach items="${qqq.datas}" var="list" varStatus="vas"> --%>
						   			<tr>
                      <td>www</td>                  
                      <td>未完成</td>
                      <td>2017-10-17</td>
                      <td>10</td>
                       <td><img src="${pageContext.request.contextPath}/teacher/img/see_0.png" width="20" height="20"></td>
						   			</tr>
						   <%-- 	</c:forEach>		 --%>
						   </tbody> 
						   
						       <tbody>						   
						   <%-- <c:forEach items="${qqq.datas}" var="list" varStatus="vas"> --%>
						   			<tr>
                      <td>www</td>                  
                      <td>未完成</td>
                      <td>2017-10-17</td>
                      <td>10</td>
                       <td><img src="${pageContext.request.contextPath}/teacher/img/see_0.png" width="20" height="20"></td>
						   			</tr>
						   <%-- 	</c:forEach>		 --%>
						   </tbody> 
						       <tbody>						   
						   <%-- <c:forEach items="${qqq.datas}" var="list" varStatus="vas"> --%>
						   			<tr>
                      <td>www</td>                  
                      <td>未完成</td>
                      <td>2017-10-17</td>
                      <td>10</td>
                       <td><img src="${pageContext.request.contextPath}/teacher/img/see_0.png" width="20" height="20"></td>
						   			</tr>
						   <%-- 	</c:forEach>		 --%>
						   </tbody> 
  			</table>
  			 &nbsp;&nbsp;
  			<table class="table table-bordered table-hover" style="width: 45%; float: right;">
  					 <thead>
						    <tr class="table_thead">
						      <th>完成情况</th>
						    </tr>
						  </thead>
						    <tbody >						   
						   <%-- <c:forEach items="${qqq.datas}" var="list" varStatus="vas"> --%>
						   			<tr>
                       <td style="text-align: left;">
                       <p>1</p>
                       <p>dasdadad</p>
                         <p>dasdaddsaad</p>
                           <p>dasddsad adad</p>
                             <p>sd</p>
                             评分：<input type="text">
                              <p>2</p>
                       <p>dasdadad</p>
                         <p>dasdaddsaad</p>
                           <p>dasddsad adad</p>
                             <p>sd</p>
                         评分：<input type="text">
                             
                       
                       
                       </td>
						   			</tr>
						   <%-- 	</c:forEach>		 --%>
						   </tbody> 
  			</table>
  				
  				
    </div>
    </div>
</body>
</html>