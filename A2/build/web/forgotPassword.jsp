<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quên mật khẩu | PRJ Shop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/auth.css">
</head>
<body>

<div class="container">
    <div class="card">

        <div class="card-header">
            <div class="icon">
                <!-- Mail / Lock Icon -->
                <svg xmlns="http://www.w3.org/2000/svg" 
                     viewBox="0 0 24 24" 
                     fill="none" stroke="white" stroke-width="2" 
                     stroke-linecap="round" stroke-linejoin="round">
                    <rect x="3" y="11" width="18" height="11" rx="2"/>
                    <path d="M7 11V7a5 5 0 0 1 10 0v4"/>
                </svg>
            </div>

            <h2>Quên mật khẩu</h2>
            <p>Xác minh để đặt lại mật khẩu</p>
        </div>

        <div class="card-body">

            <c:if test="${empty sessionScope.forgotStep || sessionScope.forgotStep == 'email'}">
                <form action="${pageContext.request.contextPath}/forgotPassword" method="post">
                    <input type="hidden" name="step" value="sendOtp">

                    <div class="form-group">
                        <label>Email đăng ký</label>
                        <input type="email" name="email" required>
                    </div>

                    <button class="btn" type="submit">Gửi mã OTP</button>
                </form>
            </c:if>

            <c:if test="${sessionScope.forgotStep == 'otp'}">
                <form action="${pageContext.request.contextPath}/forgotPassword" method="post">
                    <input type="hidden" name="step" value="verifyOtp">

                    <div class="form-group">
                        <label>Nhập mã OTP</label>
                        <input type="text" name="otp" required>
                    </div>

                    <button class="btn" type="submit">Xác nhận OTP</button>
                </form>
            </c:if>

            <!-- Error -->
            <c:if test="${not empty error}">
                <div class="error-message">
                    ${error}
                </div>
            </c:if>

            <div class="footer-text">
                <a href="${pageContext.request.contextPath}/login">
                    ← Quay lại đăng nhập
                </a>
            </div>

        </div>
    </div>
</div>

</body>
</html>
