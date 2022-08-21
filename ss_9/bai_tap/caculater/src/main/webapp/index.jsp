<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/21/2022
  Time: 1:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>\
<h1>
    Simple Caculator
</h1>
<form action="/hello" method="get">
    <fieldset>
        <legend>Caculator
        </legend>
        <label for="number">First operand:</label>
        <input type="number" id="number" name="number">
        <br><br>
        <label for="Operator">Operator:</label>
        <select id="Operator" name="operator">
            <option value="+" selected>
                Addition
            </option>
            <option value="-">
                Subtraction
            </option>
            <option value="*">
                Multiplication
            </option>
            <option value="/">
                Division
            </option>
        </select>
        <br><br>
        <label for="second">Second operand:</label>
        <input type="number" id="second" name="second">
        <br><br>
        <input type="submit" value="submit">
    </fieldset>
</form>
</body>
</html>
