<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<html>
<head>
    <title>Book Data</title>

    <style>
        <%@include file="/WEB-INF/css/style.css"%>
    </style>

</head>
<body>
<a href="<c:url value="/books"/>">Back to Bookshelf</a>
<br/>
<br/>
<h1>Book Details</h1>

<table width="100%">
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th width="600px">Description</th>
        <th>Author</th>
        <th>ISBN</th>
        <th>Print year</th>
        <th>Read already</th>
    </tr>
    <tr>
        <td>${book.id}</td>
        <td>${book.title}</td>
        <td width="600px">${book.description}</td>
        <td>${book.author}</td>
        <td>${book.isbn}</td>
        <td>${book.printYear}</td>
        <td>${book.readAlready}</td>
    </tr>
</table>
</body>
</html>