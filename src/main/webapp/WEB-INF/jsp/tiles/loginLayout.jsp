<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<title>Sumadga | <tiles:insertAttribute name="title" /> </title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Cache-Control" content="no-cache"/>
<style type="text/css">
.menu-title{
	padding: 0.5em; 
	background-color: #330033; 
	color: #fff; 
	border: 1px solid #596167; 
	border-radius: 10px 10px 0px 0px;
}

.menu-content{
	padding-bottom: 20px;
	background: #993399; 
	border: 1px solid #330033; 
	border-radius: 0px 0px 10px 10px;
}

	.error {
		color: #ff0000;
	}
	.success {
		color: #00662e;
	}
</style>
</head>
<body style="margin: 0px; padding: 0px; height: 100%;background-color: #CCCCCC;">
	<div style="width: 100%;height: auto;border: 0px;border-collapse: collapse;">
<div style="width: 100%;height: 150px;float: left;width: 100%;background-repeat: repeat-x;
   left:0px;
   top:0px;">
	<div style="width: 30%;height: 145px; width: 320px;background-repeat: no-repeat;float: left;border: 0px;border-collapse: collapse;border-spacing: 0px;"></div>
</div>
<div style="width: 100%;;float: left;background-color: #CCCCCC;padding-top: 0px;border-collapse: collapse;padding-bottom: 20px;">
	<tiles:insertAttribute name="body" />
</div>
<div style="width: 100%;height: 20px;float: left;width: 100%;background-repeat: repeat-x;position:fixed;background:maroon;
   left:0px;
   bottom:0px;font-family: verdana;font-style: italic;font-size: 12px;">
	<tiles:insertAttribute name="footer" />
</div>
</div>
</body>
</html>