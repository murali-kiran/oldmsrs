<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<title>YMC INDIA</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins"/>
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
<script type="text/javascript" src="../js/app.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<!-- <link rel="stylesheet" href="/resources/msrs/css/style_new.css" /> -->

<body>
<div class="msrs-content">

  <!-- Services -->
  <div class="ymc-container" id="services" style="margin-top:5px">
    <h1 class="ymc-xxxlarge ymc-text-red"><b>Search Employee</b></h1>
	 <form:form method="post" modelAttribute="emp" id="searchEmpform" name="searchEmpform"  commandName="emp"
                           action="${pageContext.servletContext.contextPath}/home/searchEmp">
	 	<table>
	        <tr><td> First Name: </td><td><form:input path="firstname" /></td></tr>
	        <tr><td> Last Name: </td><td><form:input path="lastname" /></td></tr>
	        <tr><td> DOB: </td><td><form:input path="dob" /> </td></tr>
	        <tr><td> Email: </td><td><form:input path="email" /> </td></tr>
	        <tr><td> Aadhaar: </td><td><form:input path="aatharnumber" /> </td></tr>
	        <tr><td> PAN: </td><td><form:input path="pancard" /> </td></tr>
	        <tr><td><input type="submit" value="Submit" /> <input type="reset" value="Reset" /></td></tr>
        </table>
    </form:form>
	
<c:if test=${emps !=null}"">
<div style="margin-right:100px;">
	<h1 class="ymc-xxxlarge ymc-text-red"><b>Employee List</b></h1>
	<table style="border:1px solid;" id="tableData" class="table table-bordered table-striped">
	<tr>
		<!-- <th>ID</th> -->
		<th>First Name</th>
		<th>Last Name</th>
		<th>DOB</th>
		<th>Email</th>
		<th>Phone</th>
		<th>View</th>
	</tr>

<c:forEach items="${emps}" var="emp">
	<tr>
		<td><c:out value="${emp.firstname}"/></td>
		<td><c:out value="${emp.lastname}"/></td>
		<td><c:out value="${emp.dob}"/></td>
		<td><c:out value="${emp.email}"/></td>
		<td><c:out value="${emp.phone}"/></td>
		<td><a href="viewEmp?empid=<c:out value="${emp.empid}" />">view</a></td>
	</tr>
	</c:forEach>
	</table>
</c:if>	
	<!-- Pagination Bar -->
   <%--  <div th:fragment='paginationbar'>
        <div>
            <ul class='pagination pagination-centered'>
                <li th:class="${page.firstPage}?'disabled':''">
                <span th:if='${page.firstPage}'>&#8592; First</span>
                <a th:if='${not page.firstPage}' th:href='@{${page.url}(page=0,size=${page.size})}'>&#8592; First</a>
                </li>
                <li th:class="${page.hasPreviousPage}? '' : 'disabled'">
                <span th:if='${not page.hasPreviousPage}'>«</span>
                <a th:if='${page.hasPreviousPage}' th:href='@{${page.url}(page=${page.number-2},size=${page.size})}' title='Go to previous page'>«</a>
                </li>
                <li th:each='item : ${page.items}' th:class="${item.current}? 'active' : ''">
                <span th:if='${item.current}' th:text='${item.number}'>1</span>
                <a th:if='${not item.current}' th:href='@{${page.url}(page=${item.number-1},size=${page.size})}'><span th:text='${item.number}'>1</span></a>
                </li>
                <li th:class="${page.hasNextPage}? '' : 'disabled'">
                <span th:if='${not page.hasNextPage}'>»</span>
                <a th:if='${page.hasNextPage}' th:href='@{${page.url}(page=${page.number},size=${page.size})}' title='Go to next page'>»</a>
                </li>
                <li th:class="${page.lastPage}? 'disabled' : ''">
                <span th:if='${page.lastPage}'>Last &rarr;</span>
                <a th:if='${not page.lastPage}' th:href='@{${page.url}(page=${page.totalPages - 1},size=${page.size})}'>Last &rarr;</a>
                </li>
            </ul>
        </div>
    </div>
	 --%>
	</div>
	</div>
	</div>
</body>
</html>