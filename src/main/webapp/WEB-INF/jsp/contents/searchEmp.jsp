<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<title>MRBGS</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<body>
	<div class="msrs-content">

		<!-- Services -->
		<div class="ymc-container" id="services" style="margin-top: 5px">
			<c:if test="${emp !=null}">
				<h1 class="ymc-xxxlarge ymc-text-red">
					<b>Search Employee</b>
				</h1>
				<form:form method="post" modelAttribute="emp" id="searchEmpform"
					name="searchEmpform" commandName="emp"
					action="${pageContext.servletContext.contextPath}/home/searchEmp">
					<table>
						<tr>
							<td>Employee Id:</td>
							<td><form:input path="empid" /></td>
						</tr>
						<tr>
							<td>First Name:</td>
							<td><form:input path="firstname" /></td>
						</tr>
						<tr>
							<td>Last Name:</td>
							<td><form:input path="lastname" /></td>
						</tr>
						<tr>
							<td>DOB:</td>
							<td><form:input path="dob" /></td>
						</tr>
						<tr>
							<td><input type="submit" value="Submit" /> <input
								type="reset" value="Reset" /></td>
						</tr>
					</table>
				</form:form>
			</c:if>

			<div style="margin-right: 100px;">
				<h1 class="ymc-xxxlarge ymc-text-red">
					<b>Employee List</b>
				</h1>
				<table id="results" style="border: 1px solid;"
					class="table table-bordered table-striped">
					<tr>
						<th>ID</th> 
						<th>Employee Name</th>
						<th>Gender</th>
						<th>DOB</th>
						<th>Email</th>
						<th>Phone</th>
						<th>View</th>
					</tr>

					<c:forEach items="${emps}" var="emp">
						<tr>
							<td><c:out value="${emp.empid}" /></td>
							<td><c:if test="${emp.title !=null}"><c:out value="${emp.title}" /> </c:if>
								<c:if test="${emp.firstname !=null}"><c:out value="${emp.firstname}" /> </c:if>
								<c:if test="${emp.lastname !=null}"><c:out value="${emp.lastname}" /> </c:if>
							</td>
							<td><c:out value="${emp.gender}" /></td>
							<td><c:out value="${emp.dob}" /></td>
							<td><c:out value="${emp.email}" /></td>
							<td><c:out value="${emp.phone}" /></td>
							<td><a href="viewEmp?empid=<c:out value="${emp.empid}" />">view</a></td>
						</tr>
					</c:forEach>
				</table>
				<div id="pageNavPosition"></div>

			</div>
		</div>
	</div>
	<script type="text/javascript">
        var pager = new Pager('results', 5); 
        pager.init(); 
        pager.showPageNav('pager', 'pageNavPosition'); 
        pager.showPage(1);
    </script>
</body>
</html>