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

<table>
    <c:forEach items="${requestScope['cart'].products}" var="product">
        <tr>
            <td>${product.name}</td>
            <td>${product.quantity}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
