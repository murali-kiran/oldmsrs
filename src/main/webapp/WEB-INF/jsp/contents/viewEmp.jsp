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
<body>
	
<div class="msrs-content">
  <!-- Services -->
  <div class="ymc-container" id="services" style="margin-top:5px">
    <h1 class="ymc-xxxlarge ymc-text-red"><b>View Client</b></h1>
	<table>
		<tr><td>ID : </td><td><c:out value="${ emp.empid}"/></td></tr>
		<tr><td>First Name : </td><td><c:out value="${ emp.firstname}"/></td></tr>
		<tr><td>Middle Name : </td><td><c:out value="${ emp.middlename}"/></td></tr>
		<tr><td>Last Name : </td><td><c:out value="${ emp.lastname}"/></td></tr>
		<tr><td>Gender : </td><td><c:out value="${ emp.gender}"/></td></tr>
		<tr><td>Date Of Birthday : </td><td><c:out value="${ emp.dob}"/></td></tr>
		<tr><td>Phone: </td><td><c:out value="${ emp.phone}"/></td></tr>
		<tr><td>Email: </td><td><c:out value="${ emp.email}"/></td></tr>
		<tr><td>Address: </td><td><c:out value="${ emp.adress}"/></td></tr>
	</table>
	</div>
	
	
<div style="padding-top:10px;"></div>
<h1 class="ymc-xxxlarge ymc-text-red"><b>Dependent List</b></h1>


<table style="border: 1px solid;" id="dependenttable"
			class="table table-bordered table-striped">
			<tr>
				<!-- <th>ID</th> -->
				<th>First Name</th>
				<th>Last Name</th>
				<th>Date Of Birth</th>
				 <th>Relationship</th>
				 <th>Phone</th>
				<th>Title</th> 
				<th>View</th> 
			</tr>

			<c:forEach items="${dependents}" var="dependent">
				<tr>
					<td><c:out value="${dependent.firstname}" /></td>
					<td><c:out value="${dependent.lastname}" /></td>
					<td><c:out value="${dependent.dob}" /></td>
					<td><c:out value="${dependent.relationship}" /></td>
					<td><c:out value="${dependent.phone}" /></td>
					<td><c:out value="${dependent.title}" /></td> 
					<td style="text-decoration: underline;cursor: pointer;" onclick="editdependent('${dependent.dependentid}',
					 '${dependent.firstname}','${dependent.lastname}','${dependent.dob}', '${dependent.relationship}', 
					 '${dependent.phone}','${dependent.title}');"><c:out value="Edit" /></td>
</tr>
			</c:forEach>
		</table>


<div><input style="margin-left:300px; float:right;" type="button" onclick="showCreateDependent(${fn:length(requestScope.dependents)});" value="Create Dependent" ></div>

<div id="dependentdiv" style="display:none;">
<h1>Create Dependent</h1>
	<form:form modelAttribute="dependent" id="dependentform"
					name="dependentform" commandName="dependent"	>
					<table>
						<tr>
							<td>First Name:</td>
							<td><form:input path="firstname" /><form:hidden path="dependentid" /><form:hidden path="empid" value="${emp.empid }" /> </td>
						</tr>
						<tr>
							<td>First Name:</td>
							<td><form:input path="lastname" /> </td>
						</tr>
						<tr>
							<td>Date Of Birth:</td>
							<td><form:input path="dob" class="date-picker"  onclick="opendate();"/></td>
						</tr>
						<tr>
							<td>Relationship:</td>
							<td><form:input path="relationship" /></td>
						</tr>
						<tr>
							<td>Phone:</td>
							<td><form:input path="phone" /></td>
						</tr>
						<tr>
							<td>Title:</td>
							<td><form:input path="title" /></td>
						</tr>
						
						<tr>
							<td><input id="dependentbtn" type="button" value="Save Dependent" /> </td>
						</tr>
					</table>
				</form:form>
				</div>
	<div style="padding-top:10px;"></div>			
		<h1 class="ymc-xxxlarge ymc-text-red"><b>Claim List</b></h1>
		<table style="border: 1px solid;"
			class="table table-bordered table-striped" id="claimtable">
			<tr>
				<!-- <th>ID</th> -->
				<th>Claim Status</th>
				<th>Prognosis</th>
				<th>Audit Comments</th>
				<th>View</th>
				<!-- <th>Email</th>
				<th>Phone</th>
				<th>View</th> -->
			</tr>

			<c:forEach items="${claims}" var="claim">
				<tr>
					<td><c:out value="${claim.status}" /></td>
					<td><c:out value="${claim.prognosis}" /></td>
					<td><c:out value="${claim.auditcomments}" /></td>
					<td><a href="viewClaim?claimid=<c:out value="${claim.claimid}" />">view</a></td>
				</tr>
			</c:forEach>
		</table>
				
	<div ><input type="button" style="float:right;" onclick="showCreateClaim1();" value="Create Claim" > </div>
	</div>
	<script type="text/javascript">
	 $("#dependentbtn").click(function(e){
		 e.preventDefault();
		 var dependent = {}
		 dependent["dependentid"] = $("#dependentid").val();
		 dependent["firstname"] = $("#firstname").val();
		 dependent["lastname"] = $("#lastname").val();
		 dependent["relationship"] = $("#relationship").val();
		 dependent["dob"] = $("#dob").val();
		 dependent["title"] = $("#title").val();
		 dependent["phone"] = $("#phone").val();
		 dependent["empid"] = $("#empid").val();
		
		 //alert("iii:"+JSON.stringify(dependent));
		 var url = "/oldmsrs/rest/createDependent";
		 var jsonData = callAjaxPost1(dependent, url, 'dependent');
		 //alert("Details:"+jsonData.name);
	 });
	 
	 function callAjaxPost1(data, url, obj) {
			//alert("in ajax123");
			var jsondata = "";
			$.ajax({
				type : "POST",
				url : url,
				data : JSON.stringify(data),
				contentType : 'application/json',
				success : function(data) {
					jsondata = data;
					alert("Data Saved!");
					setTimeout(function(){// wait for 5 secs(2)
				           location.reload(); // then reload the page.(3)
				    }, 2000);
				},
				error : function(error) {
					alert("Data Not Saved Due To:"+error);
				}
			});
			//return jsondata;
		}

	 function editdependent(id, fname, lname, dob, relationship, phone, title) {
			// alert(id);
		 	$('#dependentid').val(id);
		 	$('#firstname').val(fname);
		 	$('#lastname').val(lname);
		 	$('#dob').val(dob);
		 	$('#relationship').val(relationship);
		 	$('#title').val(phone);
		 	$('#phone').val(title);
		 	
		 	$('#dependentdiv').show();
		 	showCreateDep = false;
		 }
	</script>
</body>
</html>