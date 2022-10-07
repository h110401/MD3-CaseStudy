<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--implementation group: 'javax.servlet', name: 'jstl', version: '1.2'--%>
<%--implementation group: 'mysql', name: 'mysql-connector-java', version: '8.0.30'--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>

<%
    request.getRequestDispatcher("user?action=login").forward(request, response);

//    response.sendRedirect("user?action=login");

%>

</body>
</html>