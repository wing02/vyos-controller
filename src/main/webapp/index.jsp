<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<html>
<head>
<title>vyos controller</title>
<link
	href="http://cdn.bootcss.com/bootstrap/2.3.2/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="http://cdn.bootcss.com/bootstrap/2.3.2/css/bootstrap-responsive.min.css"
	rel="stylesheet">
<link href="mycss.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<form action="InputServlet" method="post">
			Input:<input type="text" name="info"> <input type="submit"
				value="提交"> <br>
			<%=request.getSession().getAttribute("result")%>
		</form>
	</div>
	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	<script
		src="http://cdn.bootcss.com/bootstrap/2.3.2/js/bootstrap.min.js"></script>

</body>
</html>
