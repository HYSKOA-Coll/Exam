<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
           <!-- 头部 标题+查询 bg -->
   
    <div style="margin-top: 20px;">
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
                     		<td class="plan_name">${list2.plan_name}</td>
                     		<td>${list2.plan_apply}</td>
                     		<td>${list2.plan_time}</td>
                     		<td class="edit-td">
                     		<input type="hidden" class="plan_id" value="${list2.plan_id}">
                       			<a href="#" lang="${list2.plan_name}" onclick="xz('${list2.plan_name}',${list2.plan_id})">选择</a>
                     		</td>
						  		</tr>
						  		</c:forEach>
						   </tbody>
  			</table>
  				
    </div>
     <div class="pagin">
     <div class="message">共<i class="blue">${qqq.totalRows}</i>条记录，当前显示第&nbsp;<i class="blue">${qqq.pageNow}&nbsp;</i>页</div>
				<ul class="pagination">
				    <li><a href="javascript:;" onclick="getmedia(1)"><</a></li>
				    <c:forEach begin="1" end="${qqq.totalPages }" var="page"> 
				    <li><a href="javascript:;" onclick="getmedia(${page})">${page}</a></li>
				    </c:forEach>
				    <li><a href="javascript:;" onclick="getmedia(${pageBean.totalPages})">></a></li>
				</ul>
     </div>
<!-- 听力资源滑块end  -->


</body>
</html>