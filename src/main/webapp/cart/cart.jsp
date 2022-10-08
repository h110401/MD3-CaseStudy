<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Hung
  Date: 10/8/2022
  Time: 12:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cart</title>
</head>
<body>
<a href="home">Back</a>
<table border="1" width="100%">
    <tr>
        <th>Name</th>
        <th>Quantity</th>
        <th>Image</th>
    </tr>
    <c:forEach items="${requestScope['cart'].products}" var="pr">
        <tr>
            <td>${pr.name}</td>

            <td>${pr.quantity}</td>

            <td>
                <img src="${pr.image}" alt="img" width="200" height="200">
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
