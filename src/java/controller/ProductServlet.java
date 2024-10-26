package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import model.Java_JDBC;
import model.Product;

@WebServlet("/product")
public class ProductServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("view".equals(action)) {
            viewProduct(request, response);
        } else if ("search".equals(action)) {
            searchProduct(request, response);
        } else {
            listProducts(request, response);
        }
    }

    private void listProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = Java_JDBC.getAllProducts(); // Updated the class name
        request.setAttribute("products", products);
        request.getRequestDispatcher("/productList.jsp").forward(request, response);
    }

    private void viewProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("id"));
        Product product = Java_JDBC.getProductById(productId); // Updated the class name
        request.setAttribute("product", product);
        request.getRequestDispatcher("/productDetails.jsp").forward(request, response);
    }

    private void searchProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("query"); // Changed from keyword to query for consistency
        List<Product> products = Java_JDBC.searchProducts(query); // Updated the class name
        request.setAttribute("products", products);
        request.getRequestDispatcher("/productList.jsp").forward(request, response);
    }
}
