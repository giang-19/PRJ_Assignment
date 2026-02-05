<%-- 
    Document   : revenue
    Created on : Feb 5, 2026, 1:50:52 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="stylecss.css">
    </head>
    <body>
        <aside class="sidebar">
            <h2>ADMIN</h2>
            <ul>
                <li><a href="adminInterface.jsp">Dashboard</a></li>
                <li><a href="productStatistical.jsp">Product Statistics</a></li>
                <li class="active"><a href="revenue.jsp">Revenue Statistics</a></li>
                <li>Orders</li>
                <li>Settings</li>
            </ul>
        </aside>
        <main class="main">

            <!-- Header -->
            <div class="header">
                <h1>Revenue Statistics</h1>
                <span>Welcome, Admin</span>
            </div>

            <!-- Revenue cards -->
            <section class="cards">
                <div class="card revenue total">
                    <h3>Total Revenue</h3>
                    <p>$120,000</p>
                </div>

                <div class="card revenue month">
                    <h3>This Month</h3>
                    <p>$32,000</p>
                </div>

                <div class="card revenue week">
                    <h3>This Week</h3>
                    <p>$8,500</p>
                </div>

                <div class="card revenue today">
                    <h3>Today</h3>
                    <p>$1,200</p>
                </div>
            </section>

            <!-- Chart placeholder -->
            <section class="charts">
                <div class="chart">
                    <h3>Revenue Overview</h3>
                    <p style="margin-top:10px; color:#666;">
                        (Chart.js sẽ đặt ở đây)
                    </p>
                </div>
            </section>

            <!-- Revenue table -->
            <section>
                <h2 style="margin-bottom:15px;">Revenue By Product</h2>

                <div class="search">
                    <input type="text" placeholder="Search product...">
                    <button type="submit" onclick="searchTable()">Search</button>
                </div>

                <div class="table-wrapper">
                    <table>
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Category</th>
                                <th>Sold</th>
                                <th>Revenue</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Asus Vivobook 15</td>
                                <td>Laptop</td>
                                <td>100</td>
                                <td>$20,000</td>
                            </tr>
                            <tr>
                                <td>PC Gaming RTX</td>
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
