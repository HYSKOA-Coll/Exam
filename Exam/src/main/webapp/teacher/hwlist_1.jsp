<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
</head>
<body>
<div>
<table class="table table-bordered table-hover">
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
						 <c:forEach items="${hwlist}" var="list" varStatus="vas"> 
						   			<tr>
                      <td>${list.task_package_name}</td>                  
                      <td><fmt:formatDate value="${list.task_package_time}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
                      <td>心理</td>
                      <td>1</td>
                      <td class="edit-td">100</td>
                       <td><img src="${pageContext.request.contextPath}/teacher/img/see_0.png" width="20" height="20"></td>
						   			</tr>
						    	</c:forEach>
						   </tbody> 
  			</table>
  		</div>		
</body>
</html>