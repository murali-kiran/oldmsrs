<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/jquery-ui.js"></script>
</head>
<body>

<form:form modelAttribute="claim" id="claimform"
					name="claimform" commandName="claim"  action="${pageContext.servletContext.contextPath}/home/createClaim" method="post"	>
					<table>
						<tr>
							<td>Claim Type:</td>
							<%-- <td><form:input path="benefitType" /></td> --%>
							<td>
								<c:if test="${claimid!=0}">
									<form:hidden path="claimid" />
									<form:hidden path="createdtime"/>
								</c:if>
								<form:select path="claimtypeid" items="${claimTypes}" itemValue="claimtypeid" itemLabel="claimtype" />
							</td>
						</tr>
						<tr>
							<td>Active Appointment:</td>
							<td><form:select path="activeappointment">
							    <form:option value="1" label="Yes" />
							    <form:option value="0" label="No" />
							</form:select></td>
						</tr>
						<tr>
							<td>Incident Date:</td>
							<td><form:input path="dateofoccurance" class="date-picker" /></td>
						</tr>
						<tr>
							<td>Audit By:</td>
							<td><form:input path="auditby" /></td>
						</tr>
						<tr>
							<td>Audit Comments:</td>
							<td><form:input path="auditcomments" /></td>
						</tr>
						<tr>
							<td>Description:</td>
							<td><form:textarea rows="4" cols="60" path="description" /></td>
						</tr>
						<tr>
							<td>Document:</td>
							<td><form:textarea rows="4" cols="60" path="document" /><form:hidden path="empid" value="${emp.empid}" /></td>
						</tr>
						<tr>
							<td>Prognosis:</td>
							<td><form:input path="prognosis" /></td>
						</tr>
						<tr>
							<td>Status:</td>
							<td><form:input path="status" /></td>
						</tr>
						<tr>
							<td>
								<input type="submit" value="Save Claim" /> 
								<input type="reset" value="Reset" />
							</td>
						</tr>
					</table>
				</form:form>
		<c:if test="${claimid == 0 }">		
				<h1 class="ymc-xxxlarge ymc-text-red"><b>Appointment List</b></h1>
				<table style="border: 1px solid;"
					class="table table-bordered table-striped" id="apptable">
					<tr>
						<!-- <th>ID</th> -->
						<th>Appointment Type </th>
						<th>Appointment Date </th>
						<th>Department</th>
						<th>Details </th>
						<th>Doctor Name</th>
						<th>Hospital Name</th>
						<th>Nature</th>
						<th>Phone</th>
						<th>View</th>
					</tr>
		
					<c:forEach items="${appointments}" var="app">
						<tr>
							<td><c:out value="${app.appointmenttypeid}" /></td>
							<td><c:out value="${app.appointmentdate}" /></td>
							<td><c:out value="${app.department}" /></td>
							<td><c:out value="${app.details}" /></td>
							<td><c:out value="${app.doctorname}" /></td>
							<td><c:out value="${app.hospitalname}" /></td>
							<td><c:out value="${app.nature}" /></td>
							<td><c:out value="${app.phone}" /></td>
							<%-- <td style="text-decoration: underline;cursor: pointer;" onclick="editclaim('${claim.incidentid}', '${claim.details}', '${claim.firstdayofincident}',
							 '${claim.ishomevisitrequired}', '${claim.benefitType.benefittypeid}', '${claim.officeLocation1.officelocationid}',
							  '${claim.officeLocation2.officelocationid}');"><c:out value="Edit" /></td> --%>
							<%-- <td><c:out value="${claim.email}" /></td>
							<td><c:out value="${claim.phone}" /></td> --%>
							<td><a href="viewclaim?claimid=<c:out value="${app.appointmentid}" />">view</a></td>
						</tr>
					</c:forEach>
				</table>
	</c:if>			
				<div id="appdiv" style="display:none;">
				<h1>Create Appointment</h1>
					<form:form modelAttribute="appointment" id="appointmentform"
									name="appointmentform" commandName="appointment"	>
									<table>
										<tr>
											<td>Appointment Type:</td>
											<td><form:input path="appointmenttypeid" /><input type="hidden" name="" id="" value="nomineeid" /> </td>
										</tr>
										<tr>
											<td>Appointment Date:</td>
											<td><form:input path="appointmentdate" class="date-picker"/></td>
										</tr>
										<tr>
											<td>Department:</td>
											<td><form:input path="department"  /></td>
										</tr>
										<tr>
											<td>Appointment Details:</td>
											<td><form:textarea rows="4" cols="60" path="details" /></td>
										</tr>
										<tr>
											<td>Appointment Nature:</td>
											<td>
												<form:select path="nature">
											    <form:option value="1" label="Yes" />
											    <form:option value="0" label="No" />
												</form:select>
											</td>
										</tr>
										<tr>
											<td>Doctor Name:</td>
											<td><form:input path="doctorname" /></td>
										</tr>
										<tr>
											<td>Hospital Name:</td>
											<td><form:input path="hospitalname" /></td>
										</tr>
										<tr>
											<td>Hospital Type:</td>
											<td><form:input path="hospitaltype" /></td>
										</tr>
										<tr>
											<td>Hospital Id:</td>
											<td><form:input path="hospitalid" /></td>
										</tr>
										<tr>
											<td><input type="submit" value="Save Dependent" /> </td>
										</tr>
									</table>
								</form:form>
					</div>
</body>
</html>