<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="java.util.List" %>
        <%@ page import="model.Product" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Đăng nhập - Smart Phone Shop</title>
                    <link rel="stylesheet"
                        href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
                    <style>
                        body {
                            display: flex;
                            justify-content: center;
                            align-items: center;
                            height: 100vh;
                            background-color: #f8f9fa;
                        }

                        .login-container {
                            width: 400px;
                            padding: 20px;
                            border: 1px solid #dee2e6;
                            border-radius: 5px;
                            background-color: white;
                            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                        }

                        .login-header {
                            text-align: center;
                            margin-bottom: 20px;
                        }
                    </style>
                </head>

                <body>

                    <div class="login-container">
                        <h3 class="login-header">Đăng nhập</h3>
                        <form action="loginProcess.jsp" method="post">
                            <div class="form-group">
                                <label for="username">Tên người dùng</label>
                                <input type="text" class="form-control" id="username" name="username" required>
                            </div>
                            <div class="form-group">
                                <label for="password">Mật khẩu</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block">Đăng nhập</button>
                        </form>
                        <div class="text-center mt-3">
                            <a href="register.jsp">Chưa có tài khoản? Đăng ký ngay!</a>
                        </div>
                        <div class="text-center mt-3">
                            <a href="productList.jsp" class="btn btn-secondary btn-block">Quay lại Trang Chủ</a>
                        </div>
                    </div>

                    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
                </body>

                </html>