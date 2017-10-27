<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课堂试题</title>
<style type="text/css">
.stuquestion{
	margin-left: 30px;
	margin-top: 30px;
}
.stuquestion b{
	color: #575555;
	margin-right: 10px;
}
.stufrom{
	margin-top: 20px;
}
.stuquestion input[type="radio"]{
	margin-left: 40px;
	margin-top: 10px;
	margin-right: 10px;
}
.stuquestion input[name="search-btn"]{
	width: 60px;
	margin-left: 10px;
	margin-top: 30px;
	border-radius:4px;
}
.err{
	color: red;
	margin-left: 10px;
}
.name{
	display: none;
}
</style>
</head>
<body>
	<div class="stuquestion">
			<b>试题：</b><span id="packet_name">${stuqlist.params.packet_name }</span><br/>
			<b>题量：</b><span class="totalRows">${stuqlist.totalRows }</span><br/>
		<div class="stufrom">
			<from class="qfrom"> 
			<c:forEach items="${stuqlist.datas  }" var="list">
			<div class="tg">
				<font>${stuqlist.pageNow}、题干：&nbsp;&nbsp;</font>
				<span class="name" lang="${list.question_type }">${list.question_name }</span>
				<audio class="" src="http://localhost:8080/Exam/media/bbb.ogg" controls="controls"></audio>
				
				<%-- <span  lang="${list.question_type }">${list.question_name }</span> --%>
				<br/>
			</div>
			<div class="xx">
				<input name="Fruit" type="radio" value="A"/>
				A：<font></font><br/>
				<input name="Fruit" type="radio" value="B"/>
				B：<font></font><br/>
				<input name="Fruit" type="radio" value="C"/>
				C：<font></font><br/>
				<input name="Fruit" type="radio" value="D"/>
				D：<font></font><br/>
				<input name="Fruit" type="radio" value="E"/>
				E：<font></font><br/>
				<input type="hidden" value='${list.question_option }'>
			</div>
			<input type="button" id="price" name="search-btn" value="提交"  onclick="sub(${list.question_id },'${list.question_prompt }','${list.question_correct }')"><i class="err"></i>
		</c:forEach>
			</from>
		</div>
	</div>
	<input type="hidden" id="page" value="${stuqlist.pageNow}">
	<input type="hidden" id="totalpage" value="${stuqlist.totalPages }">
	<input type="hidden" id="datas" value="${stuqlist.datas }">
	<script type="text/javascript">

	</script>
</body>
</html>