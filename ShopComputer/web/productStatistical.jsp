<%-- 
    Document   : productStatistical
    Created on : Feb 5, 2026, 2:12:56 PM
    Author     : ADMIN
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin Product Statistics</title>
        <link rel="stylesheet" href="stylecss.css">
    </head>
    <body>

        <!-- Sidebar -->
        <aside class="sidebar">
            <h2>ADMIN</h2>
            <ul>
                <li><a href="adminInterface.jsp">Dashboard</a></li>
                <li class="active"><a href="ProductStatistical.jsp">Product Statistics</a></li>
                <li><a href="revenue.jsp">Revenue Statistics</a></li>
                <li>Orders</li>
                <li>Settings</li>
            </ul>
        </aside>

        <!-- Main -->
        <main class="main">

            <!-- Header -->
            <div class="header">
                <h1>Products</h1>
                <span>Welcome, Admin</span>
            </div>

            <!-- Cards -->
            <section class="cards">
                <div class="card">
                    <h3>PC</h3>
                    <p>120</p>
                </div>
                <div class="card">
                    <h3>Laptop</h3>
                    <p>85</p>
                </div>
                <div class="card">
                    <h3>Screen</h3>
                    <p>60</p>
                </div>
                <div class="card">
                    <h3>Keyboard</h3>
                    <p>150</p>
                </div>
            </section>

            <!-- Product table -->
            <section>
                <h2 style="margin-bottom: 15px">Products</h2>

                <div class="search">
                    <input type="text" name="search" placeholder="Search product...">
                    <button>Search</button>
                </div>

                <div class="table-wrapper">
                    <table>
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Category</th>
                                <th>Quantity</th>
                                <th>Revenue</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%-- Demo data, sau này thay bằng c:forEach --%>
                            <tr>
                                <td>Asus Vivobook</td>
                                <td>Laptop</td>
                                <td>100</td>
                                <td>$20,000</td>
                            </tr>
                            <tr>
                                <td>PC Gaming</td>
                                <td>PC</td>
                                <td>40</td>
                                <td>$30,000</td>
                            </tr>
                            <tr>
                                <td>LG UltraWide</td>
                                <td>Screen</td>
                                <td>70</td>
                                <td>$14,000</td>
                            </tr>

                        </tbody>
                    </table>
                </div>
            </section>

        </main>

    </body>
</html>

