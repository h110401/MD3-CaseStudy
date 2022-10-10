<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Hung
  Date: 10/9/2022
  Time: 8:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Details</title>
</head>
<body>

Cart detail

<a href="cart?action=manager">
    <button>Back</button>
</a>
<%=((boolean) request.getAttribute("available") ? "<form method='post'>" : "")%>
<p>Created: ${requestScope['cart'].created}</p>
<table border="1" width="100%">
    <c:forEach items="${requestScope['cart'].products}" var="pr">
        <tr>
            <td>
                <img src="${pr.image}" alt="image" width="200" height="200">
            </td>
            <td>${pr.name}</td>
            <td>${pr.price}</td>
            <td>${pr.quantity}</td>
            <td>${pr.stock}</td>
        </tr>
    </c:forEach>
</table>

<%=((boolean) request.getAttribute("available") ? "<button>Confirm</button></form>" : "<button>Not available</button>")%>
<a href="cart?action=cancel&id=${requestScope['cart'].id}"><button>Cancel</button></a>
</body>
</html>
