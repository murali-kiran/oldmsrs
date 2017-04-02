<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <div align="left"><img style="height: 40px;width: 205px;" src="<%=request.getContextPath()%>/resources/images-msrs/MRBGS-logo.png"></img><span
		style="padding-left: 2px; padding-bottom: 35px; vertical-align: middle; border: 0px;">Welcome
		to Master_admin Time:
		<div style="display: inline;" id="txt"></div>
	</span><a style="float: right; padding-right: 20px; padding-top: 5px;"
		href="<%=request.getContextPath()%>/<c:url value="j_spring_security_logout" />">Logout</a>
</div> --%>

<html>
<head>
<title>Submenu Demo</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/msrs/js/jquery.min.js"></script>
<!-- <script type="text/javascript" src="js/jquery.min.js"></script> -->
<script type="text/javascript" >
$(document).ready(function()
{
$(".account").click(function()
{
var X=$(this).attr('id');

if(X==1)
{
$(".submenu").hide();
$(this).attr('id', '0');	
}
else
{

$(".submenu").show();
$(this).attr('id', '1');
}
	
});

//Mouseup textarea false
$(".submenu").mouseup(function()
{
return false
});
$(".account").mouseup(function()
{
return false
});


//Textarea without editing.
$(document).mouseup(function()
{
$(".submenu").hide();
$(".account").attr('id', '');
});
	
});
	
	</script>
<style>
body
{
background-color:#e4e8ec;
font-family:arial;
}

div.dropdown {
color: #555;
margin: 3px -22px 0 0;
width: 143px;
position: relative;
height: 17px;
text-align:left;
}
div.submenu
{
background: #fff;
position: absolute;
top: -12px;
left: -20px;
z-index: 100;
width: 135px;
display: none;
margin-left: 10px;
padding: 40px 0 5px;
border-radius: 6px;
box-shadow: 0 2px 8px rgba(0, 0, 0, 0.45);
}

.dropdown  li a {
   
    color: #555555;
    display: block;
    font-family: arial;
    font-weight: bold;
    padding: 6px 15px;
  cursor: pointer;
text-decoration:none;
}

.dropdown li a:hover{
    background:#155FB0;
    color: #FFFFFF;
    text-decoration: none;
    
}
a.account {
font-size: 11px;
line-height: 16px;
color: #555;
position: absolute;
z-index: 110;
display: block;
padding: 11px 0 0 20px;
height: 28px;
width: 121px;
margin: -11px 0 0 -10px;
text-decoration: none;
background: url(oldmsrs/resources/msrs/images/arrow.png) 116px 17px no-repeat;
cursor:pointer;
}
.root
{
list-style:none;
margin:0px;
padding:0px;
font-size: 11px;
padding: 11px 0 0 0px;
border-top:1px solid #dedede;
	
	
}

</style>
</head>
<body>
<div align="left"><img style="height: 50px;width: 205px;" src="<%=request.getContextPath()%>/resources/images-msrs/MRBGS-logo.png"></img><span
		style="padding-left: 2px; padding-bottom: 35px; vertical-align: middle; border: 0px;">Welcome
		to Master_admin Time:
		<div style="display: inline;" id="txt"></div>
	</span>

	<div style='text-align:right;float:right;margin-right:20px;margin-top:15px;'>
	
	<div class="dropdown">
	<a class="account" >
	<span>My Account</span>
	</a>
	<div class="submenu" style="display: none; ">

	  <ul class="root">
<li >
	      <a href="#Dashboard" >Dashboard</a>
	    </li>

	    
	    <li >
	      <a href="#Profile" >Profile</a>
	    </li>
	   <li >

	      <a href="#settings">Settings</a>
	    </li>
	   

	    <li>
	      <a href="#feedback">Send Feedback</a>
	    </li>



	    <li>
	      <a href="<%=request.getContextPath()%>/<c:url value="j_spring_security_logout" />">Logout</a>
	    </li>
	  </ul>
	</div>
	</div>
	
	</div>
	</div>
</body>
</html>

