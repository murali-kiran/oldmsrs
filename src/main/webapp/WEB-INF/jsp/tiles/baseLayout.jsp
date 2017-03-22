<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>YMC</title>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<link rel="stylesheet" type="text/css" media="screen"
	href="<%=request.getContextPath()%>/resources/msrs/css/styles.css"/>
<link rel="stylesheet" type="text/css" media="screen"
	href="<%=request.getContextPath()%>/resources/msrs/css/bootstrap.min.css"/>
	
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js_new/paging.js"></script>
<!-- <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/> -->
</head>
<body onload="startTime()">
	<table style="width: 100%; border: 0; overflow: hidden;">
		<tr background="<%=request.getContextPath()%>/resources/msrs/images/header11.jpg">
			<td colspan="2" class="head_back"><tiles:insertAttribute name="header" /></td>
		</tr>
		<tr>
			<td width="14%" background="<%=request.getContextPath()%>/resources/msrs/images/back12.jpg"
				class="menu_back">
				<tiles:insertAttribute name="menu" />
			</td>
			<td width="86%">
				<tiles:insertAttribute name="body" />
			</td>
		</tr>
		<tr>
			<td height="20" colspan="2" class="footer_back"><tiles:insertAttribute name="footer" /></td>
		</tr>
	</table>

	<script src="<%=request.getContextPath()%>/resources/msrs/js/msrs.js"></script>
</body>
</html>
