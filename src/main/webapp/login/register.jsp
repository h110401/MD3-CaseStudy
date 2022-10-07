<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Hung
  Date: 10/7/2022
  Time: 9:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>

    <%--bootstrap--%>
    <jsp:include page="/bootstrap/bootstrap.jsp"></jsp:include>
    <%--bootstrap--%>


</head>
<body>



<c:if test="${requestScope['message'] != null}">
    <span>${requestScope['message']}</span>
</c:if>

<form method="post">
    <p>Name:</p>
    <input type="text" name="name">
    <p>Username:</p>
    <input type="text" name="username">
    <p>Email:</p>
    <input type="text" name="email">
    <p>Password:</p>
    <input type="text" name="password">
    <br><br>
    <button>Submit</button>
</form>

</body>
</html>
