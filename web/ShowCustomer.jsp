<%-- 
    Author     : FPT University - PRJ30X
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="show" method="post">
            <table>
                <tr>
                    <td>Customer name:</td>
                    <td><input type="text" name="name" value="${name}" id="txtName"></td>
                    <td><input type="submit" name="filter1" value="Filter by name" id="btnFilter"></td>
                    
                </tr>
            </table>
        </form>
        <br>List of Customers:
        <table border="1">
            <tr>
                <td>Code</td>
                <td>Name</td>
                <td>Date of birth</td>
                <td>Gender</td>
                <td>Address</td>
                <td></td>
            </tr>
            <c:forEach items="${data}" var="item">
                <tr>
                    <td id="td_code_${item.getId()}">${item.getId()}</td>
                    <td id="td_name_${item.getId()}">${item.getName()}</td>
                    <td id="td_dob_${item.getId()}">${item.getDob()}</td>
                    <td id="td_gender_${item.getId()}">${item.getGender()}</td>
                    <td id="td_address_${item.getId()}">${item.getAddress()}</td>
                    <td><a id="td_delete_${item.getId()}" href="show?id=${item.getId()}&mod=1">Delete</a></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
