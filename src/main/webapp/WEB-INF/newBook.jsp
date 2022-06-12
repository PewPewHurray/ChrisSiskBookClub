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
<title>New Book</title>
</head>
<body>
	<div class="m-5">
		<div class="d-flex justify-content-between mb-3">
			<h1>Add a book to Your Shelf!</h1>
			<a href="/books">Back to the shelves</a>
		</div>
		<div class="formDiv">
			<form:form action="/books/add" method="post" modelAttribute="book">
				<form:input type="hidden" name="postedBy" path="postedBy" value="${userId}"/>
				<p class="d-flex justify-content-between">
					<form:label for="title" path="title">Title</form:label>
					<form:input type="text" name="title" path="title" class="bookFormInput"/>
				</p>
				<form:errors path="title" class="text-danger"></form:errors>
				<p class="d-flex justify-content-between">
					<form:label for="author" path="author">Author</form:label>
					<form:input type="text" name="author" path="author" class="bookFormInput"/>
				</p>
				<form:errors path="author" class="text-danger"></form:errors>
				<p class="d-flex justify-content-between">
					<form:label for="thoughts" path="thoughts">My thoughts</form:label>
					<form:textarea name="thoughts" path="thoughts" class="bookFormInput"/>
				</p>
				<form:errors path="thoughts" class="text-danger"></form:errors>
				<input type="submit" class="btn btn-primary alignEnd"/>
			</form:form>
		</div>
	</div>
</body>
</html>