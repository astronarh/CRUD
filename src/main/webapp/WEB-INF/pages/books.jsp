<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>_Bookshelf_</title>
    <style>
        <%@include file="/WEB-INF/css/style.css"%>
    </style>
</head>
<body>
    <h1 align="center">_Bookshelf_</h1>

    <table width="100%">
        <tr>
            <td align="left" width="33%">
                <br/>
                <c:url var="searchbook" value="/searchresults"/>
                <form:form action="${searchbook}" commandName="searchedbook">
                    <table width="20%">
                        <tr>
                            <td><input type="submit" name="action" value="<spring:message text="Search"/>"/></td>
                            <td><form:input path="title"/><spring:message text="Title"/></td>
                        </tr>
                    </table>
                </form:form>
            </td>
            <td align="center" width="33%">
                <br/>
                <div>
                    <ul>
                        <c:if test="${page > 1}">
                            <a href="<c:url value="/books"/>">Back</a>
                            <a href="<c:url value="/books"><c:param name="page" value="${page - 1}"/>${page - 1}</c:url>">Previous</a>
                        </c:if>
                        <spring:message text="${page}"/>
                        <c:if test="${!empty listBooks}">
                            <a href="<c:url value="/books"><c:param name="page" value="${page + 1}"/>${page + 1}</c:url>">Next</a>
                        </c:if>
                    </ul>
                </div>
            </td>
            <td align="right" width="33%">
                <br/>
                <form>
                    <a href="/addbook" target="_self">Add Book</a>
                </form>

            </td>
        </tr>
    </table>

    <br/>

    <c:if test="${!empty listBooks}">
        <table width="100%">
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th width="600px">Description</th>
                <th>Author</th>
                <th>ISBN</th>
                <th>Print year</th>
                <th>Read already</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            <c:forEach items="${listBooks}" var="book">
                <tr>
                    <td>${book.id}</td>
                    <td><a href="/bookdata/${book.id}" target="_self">${book.title}</a></td>
                    <td width="600px">${book.description}</td>
                    <td>${book.author}</td>
                    <td>${book.isbn}</td>
                    <td>${book.printYear}</td>
                    <td><a href="<c:url value='/isread/${book.id}'/>">${book.readAlready}</a></td>
                    <td><a href="<c:url value='/edit/${book.id}'/>" target="_self">Edit</a></td>
                    <td><a href="<c:url value='/remove/${book.id}'/>">Delete</a> </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <br/>

    <table width="100%">
        <tr>
            <td align="left" width="33%">
                <br/>
                <c:url var="searchbook" value="/searchresults"/>
                <form:form action="${searchbook}" commandName="searchedbook">
                    <table width="20%">
                        <tr>
                            <td><input type="submit" name="action" value="<spring:message text="Search"/>"/></td>
                            <td><form:input path="title"/><spring:message text="Title"/></td>
                        </tr>
                    </table>
                </form:form>
            </td>
            <td align="center" width="33%">
                <br/>
                <div>
                    <ul>
                        <c:if test="${page > 1}">
                            <a href="<c:url value="/books"/>">Back</a>
                            <a href="<c:url value="/books"><c:param name="page" value="${page - 1}"/>${page - 1}</c:url>">Previous</a>
                        </c:if>
                        <spring:message text="${page}"/>
                        <c:if test="${!empty listBooks}">
                            <a href="<c:url value="/books"><c:param name="page" value="${page + 1}"/>${page + 1}</c:url>">Next</a>
                        </c:if>
                    </ul>
                </div>
            </td>
            <td align="right" width="33%">
                <br/>
                <form>
                    <a href="/addbook" target="_self">Add Book</a>
                </form>

            </td>
        </tr>
    </table>

</body>
</html>
