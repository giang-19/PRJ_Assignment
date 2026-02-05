<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Xác nhận đăng ký | PRJ Shop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/auth.css">
</head>
<body>

<div class="container">
    <div class="card">

        <div class="card-header">
            <div class="icon">
                <!-- Shield Check Icon -->
                <svg xmlns="http://www.w3.org/2000/svg" 
                     viewBox="0 0 24 24" 
                     fill="none" stroke="white" stroke-width="2" 
                     stroke-linecap="round" stroke-linejoin="round">
                    <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/>
                    <path d="M9 12l2 2 4-4"/>
                </svg>
            </div>

            <h2>Xác nhận đăng ký</h2>
            <p>Nhập mã OTP để kích hoạt tài khoản</p>
        </div>

        <div class="card-body">

            <form action="${pageContext.request.contextPath}/verify" method="post">

                <div class="form-group">
                    <label>Nhập mã OTP</label>
                    <input type="text" name="otp" required>
                </div>

                <button class="btn" type="submit">
                    Xác nhận
                </button>
            </form>

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
