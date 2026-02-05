
import dal.DBContext;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author FPT University - PRJ30X
 */
public class CustomerDAO extends DBContext{
    PreparedStatement stm;
    ResultSet rs;

    ArrayList<Customer> getCustomer() {
        ArrayList<Customer> data = new ArrayList<Customer>();
        try {
            String strSQL = "select * from Customers";
            stm = connection.prepareCall(strSQL);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt(1));
                String name = rs.getString(2);
                String dob = String.valueOf(rs.getDate(3));
                String gender = "Male";
                if (!rs.getBoolean(4)) {
                    gender = "Female";
                }
                String address = rs.getString(5);
                data.add(new Customer(id, name, dob, gender, address));
            }
        } catch (Exception e) {
            System.out.println("getCustomers:" + e.getMessage());
        }
        return data;
    }

    Customer getCustomerById(String code) {
        try {
            String strSQL = "select * from Customers where Customerid=?";
            stm = connection.prepareCall(strSQL);
            stm.setString(1, code);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = String.valueOf(rs.getInt(1));
                String name = rs.getString(2);
                String dob = String.valueOf(rs.getDate(3));
                String gender = rs.getString(4);
                String address = rs.getString(5);
                return new Customer(id, name, dob, gender, address);
            }
        } catch (Exception e) {
            System.out.println("getCustomerById:" + e.getMessage());
        }
        return null;
    }

    void deleteCustomerById(String id) {
        try {
            String strSQL = "delete from Customers where Code=?";
            stm = connection.prepareCall(strSQL);
            stm.setString(1, id);
            stm.execute();
        } catch (Exception e) {
            System.out.println("delete:" + e.getMessage());
        }
    }
}
