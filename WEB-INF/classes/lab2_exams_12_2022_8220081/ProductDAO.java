package lab2_exams_12_2022_8220081;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

        /**
         * Search product by keyword
         * 
         * @param keyword, String
         * @return List<Product>
         * @throws Exception
         */
        public List<Product> searchProduct(String keyword) throws Exception {
                // ΘΕΜΑ 1Α
            List<Product> products = new ArrayList<Product>();
        DB db = new DB();
        Connection con = null;
        try{
        if(keyword ==null){
            String query = "SELECT * FROM product_exam_12_2022_8220081 ORDER BY name;"; 
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {

                products.add (new Product(rs.getString("code"),
                 rs.getString("name"),
                  rs.getString("company"),
                  rs.getDouble("price"),rs.getInt("is_available")
                   ));

            }
            rs.close();
            stmt.close();
            db.close();
        }else {
            String query= "SELECT * FROM product_exam_12_2022_8220081 WHERE code=? OR name=? OR company=?;";
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, keyword);
            stmt.setString(2, keyword);
            stmt.setString(3, keyword);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {

                products.add (new Product(rs.getString("code"),
                 rs.getString("name"),
                  rs.getString("company"),
                  rs.getDouble("price"),rs.getInt("is_available")
                   ));

            }
            rs.close();
            stmt.close();
            db.close();

        }
        return products;
            
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();    
            } catch (Exception e) {
                
            }
            
        }   

        }

        /**
         * Register/create new Employee.
         * 
         * @param product, product
         * @throws Exception, if encounter any error.
         */
        public void registerProduct(Product product) throws Exception {
                // ΘΕΜΑ 1Β
                DB db = new DB();
        Connection con = null;
        String sql= "SELECT * FROM product_exam_12_2022_8220081 WHERE code=?; ";
        String sql1 = "INSERT INTO roduct_exam_12_2022_8220081 (code,name,company,price,is_available) VALUES (?,?,?,?,?);";

        try {
            
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);

            // setting parameters
            stmt.setString(1, product.getCode());
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                throw new Exception("Product with code "+ product.getCode()+ " already registered");
            }
            else{
                con = db.getConnection();
                PreparedStatement stmt1 = con.prepareStatement(sql1);
                stmt1.setString(1, product.getCode());
                stmt1.setString(2, product.getName());
                stmt1.setString(3, product.getCompany());
                stmt1.setDouble(4, product.getPrice());
                stmt1.setInt(5, product.isAvailable());
                stmt1.executeUpdate();
                
            }rs.close();
            stmt.close();
            db.close();

       
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
             db.close();   
            } catch (Exception e) {
                
            }           
            
        }

        }
}