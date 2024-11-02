<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="java.util.List" %>
        <%@ page import="model.Product" %>
            <%@ page import="model.Java_JDBC" %>
                <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
                    <!DOCTYPE html>
                    <html lang="vi">

                    <head>
                        <meta charset="UTF-8">
                        <title>Smart Phone Shop</title>
                        <link rel="stylesheet"
                            href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
                        <style>
                            .sidebar {
                                width: 250px;
                            }

                            .sidebar h5 {
                                font-weight: bold;
                            }

                            .sidebar ul {
                                padding-left: 0;
                            }

                            .sidebar ul li {
                                list-style: none;
                                margin: 10px 0;
                            }

                            .card img {
                                height: 200px;
                                object-fit: cover;
                            }
                        </style>
                    </head>

                    <body>

                        <% String query=request.getParameter("query"); List<Product> products;

                            if (query != null && !query.isEmpty()) {
                            products = Java_JDBC.searchProducts(query);
                            } else {
                            products = Java_JDBC.getAllProducts();
                            }
                            request.setAttribute("products", products);
                            %>

                            <div class="container-fluid">
                                <header class="row bg-primary text-white py-3">
                                    <div class="col-md-3 d-flex align-items-center">
                                        <a href="index.jsp" class="text-white">
                                            <img src="https://png.pngtree.com/png-clipart/20200727/original/pngtree-smartphone-shop-sale-logo-design-png-image_5069958.jpg"
                                                width="30%">
                                        </a>
                                    </div>
                                    <div class="col-md-6 d-flex align-items-center justify-content-center">
                                        <form class="form-inline my-2 my-lg-0 w-100" action="product" method="get">
                                            <div class="input-group w-100">
                                                <input class="form-control" type="search" name="query"
                                                    placeholder="Tìm kiếm sản phẩm" aria-label="Search">
                                                <div class="input-group-append">
                                                    <button class="btn btn-outline-light" type="submit">
                                                        <i class="fas fa-search"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="col-md-3 d-flex align-items-center justify-content-end">
                                        <a href="cart.jsp" class="btn btn-outline-light mr-2">
                                            <i class="fas fa-shopping-cart"></i> Giỏ hàng
                                        </a>
                                        <a href="login.jsp" class="btn btn-outline-light">
                                            <i class="fas fa-user"></i> Đăng Nhập
                                        </a>
                                    </div>
                                </header>

                                <div class="row mt-4">
                                    <nav class="col-md-3 sidebar bg-light p-3">
                                        <h5>Danh mục sản phẩm</h5>
                                        <ul class="list-unstyled">
                                            <li>
                                                <a href="productList.jsp?category=Apple"
                                                    class="d-flex align-items-center">
                                                    <img src="https://static.vecteezy.com/system/resources/thumbnails/007/167/605/small/smartphone-black-icon-on-white-background-free-vector.jpg"
                                                        alt="Apple Icon" class="icon"
                                                        style="width: 20px; margin-right: 8px;"> <!-- Icon cho Apple -->
                                                    Apple
                                                </a>
                                            </li>
                                            <li>
                                                <a href="productList.jsp?category=Samsung"
                                                    class="d-flex align-items-center">
                                                    <img src="https://static.vecteezy.com/system/resources/thumbnails/007/167/605/small/smartphone-black-icon-on-white-background-free-vector.jpg"
                                                        alt="Samsung Icon" class="icon"
                                                        style="width: 20px; margin-right: 8px;">
                                                    <!-- Icon cho Samsung -->
                                                    Samsung
                                                </a>
                                            </li>
                                            <li>
                                                <a href="productList.jsp?category=OPPO"
                                                    class="d-flex align-items-center">
                                                    <img src="https://static.vecteezy.com/system/resources/thumbnails/007/167/605/small/smartphone-black-icon-on-white-background-free-vector.jpg"
                                                        alt="OPPO Icon" class="icon"
                                                        style="width: 20px; margin-right: 8px;"> <!-- Icon cho OPPO -->
                                                    OPPO
                                                </a>
                                            </li>
                                            <li>
                                                <a href="productList.jsp?category=Vivo"
                                                    class="d-flex align-items-center">
                                                    <img src="https://static.vecteezy.com/system/resources/thumbnails/007/167/605/small/smartphone-black-icon-on-white-background-free-vector.jpg"
                                                        alt="Vivo Icon" class="icon"
                                                        style="width: 20px; margin-right: 8px;"> <!-- Icon cho Vivo -->
                                                    Vivo
                                                </a>
                                            </li>
                                            <li>
                                                <a href="productList.jsp?category=Tecno"
                                                    class="d-flex align-items-center">
                                                    <img src="https://static.vecteezy.com/system/resources/thumbnails/007/167/605/small/smartphone-black-icon-on-white-background-free-vector.jpg"
                                                        alt="Tecno Icon" class="icon"
                                                        style="width: 20px; margin-right: 8px;"> <!-- Icon cho Tecno -->
                                                    Tecno
                                                </a>
                                            </li>
                                            <li>
                                                <a href="productList.jsp?category=Realme"
                                                    class="d-flex align-items-center">
                                                    <img src="https://static.vecteezy.com/system/resources/thumbnails/007/167/605/small/smartphone-black-icon-on-white-background-free-vector.jpg"
                                                        alt="Realme Icon" class="icon"
                                                        style="width: 20px; margin-right: 8px;">
                                                    <!-- Icon cho Realme -->
                                                    Realme
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>

                                    <main class="col-md-9">
                                        <div class="row">
                                            <div class="col-12 mb-3 text-center"> <!-- Thêm text-center để căn giữa -->
                                                <img src="https://www.xtsmart.vn/vnt_upload/news/11_2020/xtm-tt-sale-samsung-19-11.jpg"
                                                    alt="Promotion Banner" class="img-fluid" style="width: 90%;">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <c:forEach var="product" items="${products}">
                                                <div class="col-md-3 mb-4">
                                                    <div class="card">
                                                        <img src="${product.imageUrl}" class="card-img-top"
                                                            alt="${product.name}">
                                                        <div class="card-body">
                                                            <h5 class="card-title">${product.name}</h5>
                                                            <p class="card-text">${product.price} VND</p>
                                                            <a href="product?id=${product.id}"
                                                                class="btn btn-primary">Xem chi tiết</a>
                                                            <a href="cart.jsp" class="btn btn-warning">Thêm vào giỏ</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </main>
                                </div>

                                <footer class="text-center py-3 bg-light">
                                    <p>&copy; 2024 Phone Store - Mua sắm an toàn, ưu đãi tuyệt đỉnh</p>
                                </footer>
                            </div>

                            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                            <script
                                src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
                            <script
                                src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
                    </body>

                    </html>