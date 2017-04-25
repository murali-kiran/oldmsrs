<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE HTML>
<html>
<title>YMC INDIA</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins"/>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/jquery-ui.js"></script>
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/resources/msrs/js/app.js"></script>--%>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/msrs/js/msrs.js"></script> 
<script>
$(document).ready(function(){
	if($("#hospitalaccountid").val() != 0){
		$('#accountdiv').show();
	}
});

function SubmitForm(){
	if ($.trim($('#accountnumber').val()) == ''){
		alert("Account Number required");
		event.preventDefault();
		return false;
	}
	if ($.trim($('#bank').val()) == ''){
		alert("Bank Name required");
		return false;
	}
	if ($.trim($('#branch').val()) == ''){
		alert("Branch Name required");
		return false;
	}
	if ($.trim($('#ifsccode').val()) == ''){
		alert("Ifsc code required");
		return false;
	}
	
		
}
</script>
<body>
	
<div class="msrs-content">
  <!-- Services -->
  <div class="ymc-container" id="services" style="margin-top:5px">
	

<div><input style="margin-left:300px; float:right;" type="button" onclick="showCreateAccount();" value="Create Account" ></div>

<div id="accountdiv" style="display:none;">
<h1>Create/Edit Account</h1>
	<form:form modelAttribute="account" id="accountform" action="${pageContext.servletContext.contextPath}/home/createAccount"
			onsubmit="return SubmitForm();"	name="accountform" commandName="account" method="post"	>
					<table>
						<tr>
						<c:if test="${hospitalaccountid!=0}">
							<form:hidden path="createdtime"/>
						</c:if>
							<td>Account Number:</td>
							<td><form:input path="accountnumber" /><form:hidden path="hospitalaccountid" /><form:hidden path="hospitalid" value="${hospitalid}" /> </td>
						</tr>
						<tr>
							<td>Bank:</td>
							<td><form:input path="bank" /> </td>
						</tr>
						<%-- <tr>
							<td>Date Of Birth:</td>
							<td><form:input path="dob" class="date-picker"  onclick="opendate();"/></td>
						</tr> --%>
						<tr>
							<td>Branch:</td>
							<td><form:input path="branch" /></td>
						</tr>
						<tr>
							<td>IFSC:</td>
							<td><form:input path="ifsccode" /></td>
						</tr>
						
						
						<tr>
							<td><input type="submit" value="Save Account" /> </td>
						</tr>
					</table>
				</form:form>
				</div>
	<div style="padding-top:10px;"></div>			
		<h1 class="ymc-xxxlarge ymc-text-red"><b>Account List</b></h1>
		<table style="border: 1px solid;"
			class="table table-bordered table-striped" id="claimtable">
			<tr>
				<th>Account Number</th>
				<th>Bank</th>
				<th>Branch</th>
				<th>IFSC Code</th>
				<th>View</th>
			</tr>

			<c:forEach items="${hospitalaccounts}" var="account">
				<tr>
					<td><c:out value="${account.accountnumber}" /></td>
					<td><c:out value="${account.bank}" /></td>
					<td><c:out value="${account.bank}" /></td>
					<td><c:out value="${account.ifsccode}" /></td>
					<td><a href="viewAccounts?hospaccid=${account.hospitalaccountid}&hospitalid=${hospitalid}" >Edit</a></td>
				</tr>
			</c:forEach>
		</table>
		
	</div>
	</div>
	<script type="text/javascript">
	
	 function showCreateAccount(){
		 $('#accountdiv').show();
	 }
	</script>
</body>
</html> 
