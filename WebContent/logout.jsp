<%--
  Created by IntelliJ IDEA.
  User: 42519
  Date: 2018/1/3
  Time: 21:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
session.setAttribute("way_of_login",null);
session.setAttribute("login_manager_id",null);
session.setAttribute("login_receptionist_id",null);
response.sendRedirect("login.jsp");%>
</body>
</html>
