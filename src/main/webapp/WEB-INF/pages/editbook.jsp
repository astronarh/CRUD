<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<html>
<head>
    <title>Edit User</title>

    <style>
        <%@include file="/WEB-INF/css/style.css"%>
    </style>

</head>
<body>
<a href="<c:url value="/books"/>">Back to Bookshelf</a>
<br/>
<br/>
<h1>Edit Book</h1>

<c:url var="addAction" value="/books/edit"/>

<form:form action="${addAction}" commandName="book">
    <table>
        <tr>
            <td>
                <form:label path="id">
                    <spring:message text="id"/>
                </form:label>
            </td>
            <td>
                <form:input path="id" readonly="true" value="${book.id}" />
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="title">
                    <spring:message text="title"/>
                </form:label>
            </td>
            <td>
                <form:input path="title" value="${book.title}" />
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="description">
                    <spring:message text="description"/>
                </form:label>
            </td>
            <td>
                <form:textarea path="description" cols="100%" rows="3" value="${book.description}" />
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="author">
                    <spring:message text="author"/>
                </form:label>
            </td>
            <td>
                <form:input type="author" readonly="true" path="author" value="${book.author}" />
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="isbn">
                    <spring:message text="isbn"/>
                </form:label>
            </td>
            <td>
                <form:input path="isbn" value="${book.isbn}"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="printYear">
                    <spring:message text="printYear"/>
                </form:label>
            </td>
            <td>
                <form:input path="printYear" value="${book.printYear}"/>
            </td>
        </tr>
        <tr>
            <td><form:label path="readAlready"><spring:message text="readAlready"/></form:label></td>
            <td>
                <spring:message text="${book.readAlready}"/>
                <%--<form:checkbox path="readAlready" value="${book.readAlready}"/>--%>
                <form:hidden path="readAlready" value="false"/>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <input type="submit" value="<spring:message text="Edit User"/>"/>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>