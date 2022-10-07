<%--
  Created by IntelliJ IDEA.
  User: THINKPAD
  Date: 10/5/2022
  Time: 8:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="category?action=create">create category</a>
<form method="post">
    <input type="text" name="search">
    <button type="submit">Search</button>
    <a href="/">Back menu</a>
</form>
<table border="1", style="width: 100%">
    <tr>
        <th>stt</th>
        <th>name</th>
        <th>edit</th>
        <th>delete</th>
    </tr>
    <c:forEach var="cate" items='${requestScope["categoryList"]}'>
    <tr>
        <td>${cate.categoryId}</td>
        <td>${cate.categoryName}</td>
        <td><a href="category?action=edit&id=${cate.categoryId}">edit</a></td>
        <td>
            <a href="category?action=delete&id=${cate.categoryId}">Delete</a>
        </td>
    </tr>
    </c:forEach>
</body>
</html>
