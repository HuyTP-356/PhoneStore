package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Java_JDBC {

    public static Connection getConnectionWithSqlJdbc() throws Exception {
        Connection con = null;
        String dbUser = "sa";
        String dbPassword = "123";
        String port = "1433";
        String IP = "127.0.0.1";
        String ServerName = "DESKTOP-UKLNCAK";
        String DBName = "School";
        String driverClass = "com.microsoft.sqlserver.jdbc.SQLServerDriver";

        String dbURL = "jdbc:sqlserver://DESKTOP-UKLNCAK;databaseName=School;encrypt=false;trustServerCertificate=false;loginTimeout=30";

        try {
            Class.forName(driverClass);
            con = DriverManager.getConnection(dbURL, dbUser, dbPassword);
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return con;
    }

    public static List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM Products";

        try ( Connection con = Java_JDBC.getConnectionWithSqlJdbc();  Statement stmt = con.createStatement();  ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String brand = rs.getString("brand");
                double price = rs.getDouble("price");
                String description = rs.getString("description");
                String imageUrl = rs.getString("image_url");

                Product product = new Product(id, name, brand, price, description, imageUrl);
                products.add(product);
            }

        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return products;
    }

    // Phương thức tìm kiếm sản phẩm theo tên hoặc nhãn hiệu
    public static List<Product> searchProducts(String keyword) {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM Products WHERE name LIKE ? OR brand LIKE ?";

        try ( Connection con = Java_JDBC.getConnectionWithSqlJdbc();  PreparedStatement pstmt = con.prepareStatement(query)) {

            pstmt.setString(1, "%" + keyword + "%");
            pstmt.setString(2, "%" + keyword + "%");

            try ( ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String brand = rs.getString("brand");
                    double price = rs.getDouble("price");
                    String description = rs.getString("description");
                    String imageUrl = rs.getString("image_url");

                    Product product = new Product(id, name, brand, price, description, imageUrl);
                    products.add(product);
                }
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return products;
    }

    // Phương thức thêm sản phẩm mới vào cơ sở dữ liệu
    public static void insertProduct(Product product) {
        String query = "INSERT INTO Products (name, brand, price, description, image_url) VALUES (?, ?, ?, ?, ?)";

        try ( Connection con = Java_JDBC.getConnectionWithSqlJdbc();  PreparedStatement pstmt = con.prepareStatement(query)) {

            pstmt.setString(1, product.getName());
            pstmt.setString(2, product.getBrand());
            pstmt.setDouble(3, product.getPrice());
            pstmt.setString(4, product.getDescription());
            pstmt.setString(5, product.getImageUrl());

            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("A new product was inserted successfully!");
            }

        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    public static Product getProductById(int id) {
        String query = "SELECT * FROM Products WHERE id = ?";
        Product product = null;

        try ( Connection con = Java_JDBC.getConnectionWithSqlJdbc();  PreparedStatement pstmt = con.prepareStatement(query)) {

            pstmt.setInt(1, id);
            try ( ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    String name = rs.getString("name");
                    String brand = rs.getString("brand");
                    double price = rs.getDouble("price");
                    String description = rs.getString("description");
                    String imageUrl = rs.getString("image_url");

                    product = new Product(id, name, brand, price, description, imageUrl);
                }
            }

        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return product;
    }
}
