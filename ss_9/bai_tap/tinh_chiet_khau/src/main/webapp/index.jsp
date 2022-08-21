<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/20/2022
  Time: 10:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
<form action="/discount" method="post">
  <input type="text" name="describe" placeholder="Describe Product">
  <input type="number" name="price" placeholder="List Price">
  <input type="number" name="percent" placeholder="Discount Percent">
  <button>Calculate Discount</button>
</form>
  </body>
</html>
