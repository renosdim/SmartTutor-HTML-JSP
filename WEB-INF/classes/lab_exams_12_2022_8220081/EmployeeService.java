package lab_exams_12_2022_8220081;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeService {

        /**
         * Search employee by keyword
         * 
         * @param keyword, String
         * @return List<Employee>
         * @throws Exception
         */
        public List<Employee> searchEmployees(String keyword) throws Exception {
                // ΘΕΜΑ 1Α
                        List<Employee> employees = new ArrayList<Employee>();
                        DB db = new DB();
                        Connection con = null;
                        try{
                        if(keyword==null){
                            String query= "SELECT * FROM employee_exam_12_2022_8220081 ORDER BY lastname;";
                            con = db.getConnection();
                
                            PreparedStatement stmt = con.prepareStatement(query);
                            ResultSet rs = stmt.executeQuery();
                            while (rs.next()) {
                
                                employees.add (new Employee(rs.getString("afm"),
                                 rs.getString("firstname"),
                                  rs.getString("lastname"),
                                  rs.getDouble("salary"),rs.getInt("external_partner")));
                                   
                
                            }
                            rs.close();
                            stmt.close();
                            db.close();
                        } else{
                            String query= "SELECT * FROM employee_exam_12_2022_8220081 WHERE firstname=? OR lastname=? OR afm=? ORDER BY lastname;";
                            con = db.getConnection();

                            PreparedStatement stmt = con.prepareStatement(query);

                            // setting values in parameters
                            stmt.setString(1, keyword);
                            stmt.setString(2, keyword);
                            stmt.setString(3, keyword);
                            
            
                            ResultSet rs = stmt.executeQuery();
                            while(rs.next()){   
                            employees.add (new Employee(rs.getString("afm"),
                            rs.getString("firstname"),
                            rs.getString("lastname"),
                            rs.getDouble("salary"),rs.getInt("external_partner")));         
                            }
                            rs.close();
                            stmt.close();
                            db.close();
                        }
                            
                            return employees;
                
               
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
         * @param employee, employee
         * @throws Exception, if encounter any error.
         */
        public void registerEmployee(Employee employee) throws Exception {
                // ΘΕΜΑ 1Β
                DB db = new DB();
                Connection con = null;
                String sql = "SELECT * FROM employee_exam_12_2022_8220081 WHERE afm=?;" ;
                String sql1= "INSERT INTO employee_exam_12_2022_8220081 (afm,firstname,lastname,salary,external_partner) VALUES (?,?,?,?,?);";

                try {
            
                    con = db.getConnection();
                    PreparedStatement stmt = con.prepareStatement(sql);
                    stmt.setString(1, employee.getAfm());
                    ResultSet rs = stmt.executeQuery();
                    if(rs.next()){
                        throw new Exception("employee with afm " +employee.getAfm() + " already registered");
                    }
                    else{
                        con = db.getConnection();
                        PreparedStatement stmt1 = con.prepareStatement(sql1);
                        stmt1.setString(1, employee.getAfm());
                        stmt1.setString(2, employee.getFirstname());
                        stmt1.setString(3, employee.getLastname());
                        stmt1.setDouble(4, employee.getSalary());
                        stmt1.setInt(5, employee.getisExternal());;
                        stmt1.executeUpdate();
                        
                    }
                    rs.close();
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
