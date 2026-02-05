<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tài khoản của tôi</title>
    <link rel="stylesheet" href="css/profile.css">
</head>
<body>

    <div class="profile-header">
        <div class="header-inner">
            <img src="images/logo.jpeg" class="logo" alt="Logo">
            <span class="site-name">My Shop</span>
        </div>
    </div>

    <div class="profile-wrapper">

        <!-- MENU BÊN TRÁI -->
        <div class="profile-menu">
            <h3>Tài khoản</h3>

            <a href="profile?tab=profile"
               class="${empty activeTab || activeTab == 'profile' ? 'active' : ''}">
                Hồ sơ
            </a>

            <a href="profile?tab=address"
               class="${activeTab == 'address' ? 'active' : ''}">
                Địa chỉ
            </a>

            <a href="profile?tab=password"
               class="${activeTab == 'password' ? 'active' : ''}">
                Đổi mật khẩu
            </a>

            <a href="home">← Trang chủ</a>
        </div>

        <!-- NỘI DUNG BÊN PHẢI -->
        <div class="profile-content">

            <!-- ===== HỒ SƠ ===== -->
            <c:if test="${empty activeTab || activeTab == 'profile'}">
                <div class="tab-content active">
                    <h2>Hồ sơ của tôi</h2>

                    <div class="form-group">
                        <label>Tên tài khoản</label>
                        <input type="text" value="${sessionScope.account.username}" readonly>
                    </div>

                    <div class="form-group">
                        <label>Email</label>
                        <input type="email" value="${sessionScope.account.email}" readonly>
                    </div>
                </div>
            </c:if>

            <!-- ===== ĐỊA CHỈ ===== -->
            <c:if test="${activeTab == 'address'}">
                <div class="tab-content active">
                    <h2>Địa chỉ của tôi</h2>

                    <h3>Thêm địa chỉ mới</h3>
                    <form action="add-address" method="post" class="address-form">
                        <div class="form-group">
                            <label>Địa chỉ</label>
                            <input type="text" name="addressName" required>
                        </div>

                        <div class="form-group">
                            <label>Số điện thoại</label>
                            <input type="text" name="phone" required>
                        </div>

                        <button type="submit" class="btn-save">Thêm địa chỉ</button>
                    </form>

                    <hr>

                    <div class="address-list">
                        <c:if test="${empty addressList}">
                            <p>Bạn chưa có địa chỉ nào.</p>
                        </c:if>

                        <c:forEach var="a" items="${addressList}">
                            <div class="address-item">
                                <p><b>${sessionScope.account.username}</b> | ${a.phone}</p>
                                <p>${a.addressName}</p>

                                <div class="address-actions">
                                    <a href="edit-address?id=${a.addressId}">Sửa</a> |
                                    <a href="delete-address?id=${a.addressId}"
                                       onclick="return confirm('Bạn có chắc muốn xoá địa chỉ này?')">
                                        Xoá
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </c:if>

            <!-- ===== ĐỔI MẬT KHẨU ===== -->
            <c:if test="${activeTab == 'password'}">
                <div class="tab-content active">
                    <h2>Đổi mật khẩu</h2>

                    <form action="change-password" method="post" class="password-form">
                        <div class="form-group">
                            <label>Mật khẩu hiện tại</label>
                            <input type="password" name="oldPassword" required>
                        </div>

                        <div class="form-group">
                            <label>Mật khẩu mới</label>
                            <input type="password" name="newPassword" required>
                        </div>

                        <div class="form-group">
                            <label>Xác nhận mật khẩu mới</label>
                            <input type="password" name="confirmPassword" required>
                        </div>

                        <c:if test="${not empty passwordError}">
                            <p class="error">${passwordError}</p>
                        </c:if>

                        <c:if test="${not empty passwordSuccess}">
                            <p class="success">${passwordSuccess}</p>
                        </c:if>

                        <button type="submit" class="btn-save">Đổi mật khẩu</button>
                    </form>
                </div>
            </c:if>

        </div>
    </div>
</body>

</html>
