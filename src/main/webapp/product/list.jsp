<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/10/2022
  Time: 8:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="product?action=create">create product</a>
<form method="post">
    <input type="text" name="search" placeholder="Search Product and By Name">
    <button type="submit">Search</button>

    <a href="home">Back to home</a>
</form>
<table border="1" style="width: 75%">
    <tr>
        <th>id</th>
        <th>name</th>
        <th>category</th>
        <th>price</th>
        <th>image</th>
        <th>quantity</th>
        <th>edit</th>
        <th>delete</th>
    </tr>
    <c:forEach var="pr" items='${requestScope["productList"]}'>
        <tr>
            <td>${pr.id}</td>
            <td><a href="product?action=detail&id=${pr.id}">${pr.name}</a></td>
            <td>${pr.category.categoryName}</td>
            <td>${pr.price}</td>
            <td><img style="width: 200px" height="200px" src="${pr.image}" alt=""></td>
            <td>${pr.quantity}</td>
            <td><a href="product?action=edit&id=${pr.id}">edit</a></td>
            <td><a href="product?action=delete&id=${pr.id}">delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
