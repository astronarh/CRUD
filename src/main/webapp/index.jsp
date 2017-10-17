<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CRUD</title>
    <style>
        <%@include file="/WEB-INF/css/style.css"%>
    </style>
    <meta http-equiv="refresh" content="1;URL=books" />
</head>
<body>
<table align="center">
    <tr>
        <td>
            <br/>
            <h3>CRUD</h3>
        </td>
    </tr>
    <tr>
        <td>
            <br/>
            <h3><a href="<c:url value="/books"/>" target="_self">_Bookshelf_</a></h3>
            <br/>
        </td>
    </tr>
</table>
</body>
</html>
