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
<body onload="getZonePolicy()">
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
					<tbody id="zone-policy-tbody">
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
			} else {
				xmlHttp = new ActivaXObject("Microsoft.XMLHTTP");
			}
		}
		function getZonePolicy() {
			createXMLHttp();
			xmlHttp.open("POST", "ShowZonePolicyServlet");
			xmlHttp.onreadystatechange = getZonePolicyCallback;
			xmlHttp.send(null);
		}
		function getZonePolicyCallback() {
			if (xmlHttp.readyState == 4) {
				if (xmlHttp.status == 200) {
					var tbody = document.getElementById("zone-policy-tbody");
					var zones = xmlHttp.responseXML
							.getElementsByTagName("zone-policy")[0].childNodes;
					for (var i = 0; i < zones.length; i++) {
						var zone = zones[i];
						var rowNum = zone.getElementsByTagName("from").length;
						for (var j = 0; j < rowNum; j++) {
							var tr = document.createElement("tr");
							if (j == 0) {
								var td1 = document.createElement("td");
								td1.setAttribute("rowspan", rowNum);
								var zoneName = zone.firstChild.nodeValue;//??really?
								td1.appendChild(document
										.createTextNode(zoneName));

								var td2 = document.createElement("td");
								td2.setAttribute("rowspan", rowNum);
								var interfaces = zone
										.getElementsByTagName("interface");
								var interStr = "";
								for (var k = 0; k < interfaces.length; k++) {
									interStr = interStr
											+ interfaces[k].firstChild.nodeValue
											+ ";";
								}
								td2.appendChild(document
										.createTextNode(interStr));

								tr.appendChild(td1);
								tr.appendChild(td2);
							}
							var td3 = document.createElement("td");
							var from = zone.getElementsByTagName("from")[j];
							var fromStr = from.firstChild.nodeValue;
							td3.appendChild(document.createTextNode(fromStr));

							var td4 = document.createElement("td");
							var firwalls = from
									.getElementsByTagName("firewall");
							var firewallStr = "";
							for (var k = 0; k < firewalls.length; k++) {
								firewallStr += firewalls[k].firstChild.nodeValue
										+ ";";
							}
							td4.appendChild(document
									.createTextNode(firewallStr));
							tr.appendChild(td3);
							tr.appendChild(td4);

							tbody.appendChild(tr);
						}
					}

				}
			}
		}
	</script>


</body>
</html>
