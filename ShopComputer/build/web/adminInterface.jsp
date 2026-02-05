<%-- 
    Document   : adminInterface
    Created on : Feb 5, 2026, 1:53:38 PM
    Author     : ADMIN
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="stylecss.css">
    </head>
    <body>

        <!-- Sidebar -->
        <aside class="sidebar">
            <h2>ADMIN</h2>
            <ul>
                <li class="active">Dashboard</li>
                <li><a href="productStatistical.jsp">Product Statistics</a></li>
                <li><a href="revenue.jsp">Revenue Statistics</a></li>
                <li>Orders</li>
                <li>Settings</li>
            </ul>
        </aside>
        <!-- Main Content -->
        <main class="main">

            <!-- Header -->
            <div class="header">
                <h1>Dashboard Overview</h1>
                <span>Welcome, Admin</span>
            </div>

            <!-- Cards -->
            <section class="cards">
                <div class="card">
                    <h3>Total Products</h3>
                    <p>1,250</p>
                </div>
                <div class="card">
                    <h3>Total Orders</h3>
                    <p>860</p>
                </div>
                <div class="card">
                    <h3>Monthly Revenue</h3>
                    <p>$24,500</p>
                </div>
                <div class="card">
                    <h3>Out of Stock</h3>
                    <p>18</p>
                </div>
            </section>

            <!-- Charts -->
            <section class="charts">
                <div class="chart">
                    <h3>Revenue Over Time</h3>
                    <p style="margin-top:20px;color:#6b7280">(Chart placeholder)</p>
                </div>
                <div class="chart">
                    <h3>Product Distribution</h3>
                    <p style="margin-top:20px;color:#6b7280">(Chart placeholder)</p>
                </div>
            </section>

            <!-- Table -->
            <section>
                <h2 style="margin-bottom:15px">Top Selling Products</h2>
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

                            <%-- Demo data - sẽ thay bằng JSTL sau --%>
                            <tr>
                                <td>PC Gaming</td>
                                <td>PC</td>
                                <td>120</td>
                                <td>$120,000</td>
                            </tr>

                        </tbody>
                    </table>
                </div>
            </section>

        </main>

    </body>
</html>

