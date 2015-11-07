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
		<h2>vyos controller</h2>
		<div class="tabbable">
			<h4>
				<ul class="nav nav-tabs">
					<li class="active"><a href="#type1" data-toggle="tab">zone-policy</a></li>
					<li><a href="#type2" data-toggle="tab">firewall</a></li>
				</ul>
			</h4>
			<div class="tab-content">
				<div class="tab-pane active" id="type1"></div>

				<table class="table table-striped">
					<thead>
						<tr>
							<th>zone</th>
							<th>interface</th>
							<th>from</th>
							<th>firewall</th>
						</tr>
					</thead>
					<tbody>
						<tr class="line1">
							<td class="zone"></td>
							<td class="interface"></td>
							<td class="from"></td>
							<td class="firewall"></td>
						</tr>
						<tr class="line2">
							<td class="zone"></td>
							<td class="interface"></td>
							<td class="from"></td>
							<td class="firewall"></td>
						</tr>
					</tbody>
				</table>
				<div class="tab-pane active" id="type2"></div>
			</div>
		</div>
	</div>




	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	<script
		src="http://cdn.bootcss.com/bootstrap/2.3.2/js/bootstrap.min.js"></script>
	<script>
		var xmlHttp;
		function createXMLHTTP() {
			if (window.XMLHttpRequest) {
				xmlHttp = new XMLHttpRequest();
			}
		}
	</script>


</body>
</html>
