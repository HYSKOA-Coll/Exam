<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="cen2">
<!-- 班级列表 -->
<c:forEach items="${clazzlist}" var="clazz">
<div class="class_list" onclick="addstudis(${clazz.clazz_id})">
<ul style="list-style: none;">
<li style="float: left;">
    <p style="text-align: right;"><a id="clazz_id" name="clazz_id" onclick="delecteclazzlist(${clazz.clazz_id})">&times;</a></p>
    <h3 style="text-align: center;">${clazz.major_name}</h3>
     <p>
     &nbsp;&nbsp;
         <small >${clazz.clazz_name}</small>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <small >查看详情</small>
     </p>
      <p>
      &nbsp;
      <small ><img src="../img/person_num_0.png" width="20" height="20">&nbsp;&nbsp;<b class="count">0</b>人</small>
      &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
        <small >${clazz.college_name}</small>
       </p></li>

</ul>

</div>
</c:forEach>

</div>
</body>
</html>