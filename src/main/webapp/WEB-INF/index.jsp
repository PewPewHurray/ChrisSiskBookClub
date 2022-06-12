<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="js/app.js"></script>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<title>Welcome</title>
</head>
<body>
	<div class="m-5">
		<h1 class="darkviolet">Book Club</h1>
		<h5>A place for friends to share thoughts on books.</h5>
		<div class="d-flex">
		<form:form action="/register" method="post" modelAttribute="newUser" class="pt-2 me-5">
			<table class="formTable">
				<thead>
					<tr>
						<th colspan="2" class="fs-4">Register</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><form:label for="name" path="name">Name:</form:label></td>
						<td><form:input type="text" name="name" path="name" /></td>
					</tr>
					<tr><td colspan="2"><form:errors path="name" class="text-danger"></form:errors></td></tr>
					<tr>
						<td><form:label for="email" path="email">Email:</form:label></td>
						<td><form:input type="text" name="email" path="email" /></td>
					</tr>
					<tr><td colspan="2"><form:errors path="email" class="text-danger"></form:errors></td></tr>
					<tr>
						<td><form:label for="password" path="password">Password:</form:label></td>
						<td><form:input type="password" name="password" path="password" /></td>
					</tr>
					<tr><td colspan="2"><form:errors path="password" class="text-danger"></form:errors></td></tr>
					<tr>
						<td><form:label for="confirm" path="confirm" class="me-3">Confirm Password:</form:label></td>
						<td><form:input type="password" name="confirm" path="confirm"/></td>
					</tr>
					<tr><td colspan="2"><form:errors path="confirm" class="text-danger"></form:errors></td></tr>
					<tr>
						<td></td>
						<td><span class="d-flex justify-content-end"><input type="submit" class="btn btn-primary"/></span></td>
					</tr>
				</tbody>
			</table>
		</form:form>
		<form:form action="/login" method="post" modelAttribute="newLogin" class="pt-2">
			<table class="formTable">
				<thead>
					<tr>
						<th colspan="2" class="fs-4">Login</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><form:label for="email" path="email">Email:</form:label></td>
						<td><form:input type="text" name="email" path="email" /></td>
					</tr>
					<tr><td colspan="2"><form:errors path="email" class="text-danger"></form:errors></td></tr>
					<tr>
						<td><form:label for="password" path="password" class="formLabel">Password:</form:label></td>
						<td><form:input type="password" name="password" path="password"/></td>
					</tr>
					<tr><td colspan="2"><form:errors path="password" class="text-danger"></form:errors></td></tr>
					<tr>
						<td></td>
						<td><span class="d-flex justify-content-end"><input type="submit" class="btn btn-primary"/></span></td>
					</tr>
				</tbody>
			</table>
		</form:form>
		</div>
	</div>
</body>
</html>