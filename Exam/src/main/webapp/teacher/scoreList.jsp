<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<p class="p1">题目正确率统计表</p>
    		<table class="table1 table-bordered">
    				<tr>
    						<td colspan="3">干预：</td>
    				</tr>
    				<tr>
    						<td>题目号</td>
    						<td>0次干预正确率</td>
    						<td>1次干预正确率</td>
    				</tr>
    				
    				<c:forEach items="${perList }" var="list3" varStatus="var">
    				<tr>
    						<td>题目${var.count }</td>
    						<td>${list3.c2 }%</td>
    						<td>${list3.c1 }%</td>
    				</tr>
    				</c:forEach>
    		</table>
    		<p class="p2">班级学生答案列表</p>
    		<table class="table2 table-bordered">
    				<tr>
    						<td class="infoName">学生姓名</td>
    						<td>总分</td>
    				</tr>
    				
    			<c:forEach items="${iaList1 }" var="list1" varStatus="var">
    				<tr class="scorelist">
    						<td>${list1.info_name }</td>
    						<c:forEach items="${iaList2 }" var="list2">
									<c:if test="${list1.info_id == list2.info_id }">
										<td class="score${var.count }">${list2.answer_score }</td>
									</c:if>
    						</c:forEach>
    						<td class="num${var.count }"></td>
    				</tr>
    			</c:forEach>
    				
    		</table>
</body>
</html>