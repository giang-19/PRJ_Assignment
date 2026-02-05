package dao;

import dal.DBContext;
import jakarta.servlet.ServletContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Address;

public class AddressDAO {

    private Connection connection;

    public AddressDAO(ServletContext context) {
        DBContext db = new DBContext(context);
        this.connection = db.getConnection();
    }

    public List<Address> getByAccountId(int accountId) {
        List<Address> list = new ArrayList<>();
        String sql = """
            SELECT addressId, addressName, phone
            FROM Address
            WHERE accountId = ?
        """;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, accountId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Address a = new Address();
                a.setAddressId(rs.getInt("addressId"));
                a.setAddressName(rs.getString("addressName"));
                a.setPhone(rs.getString("phone"));
                list.add(a);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void insert(int accountId, String addressName, String phone) {
        String sql = "INSERT INTO Address(accountId, addressName, phone) VALUES (?, ?, ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, accountId);
            ps.setString(2, addressName);
            ps.setString(3, phone);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
