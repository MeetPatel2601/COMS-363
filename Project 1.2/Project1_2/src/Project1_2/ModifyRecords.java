package Project1_2;

import java.sql.*;

public class ModifyRecords {

    private static Connection connect = null;

    public static void main(String[] args) {

        try {
            //Class.forName("com.mysql.jdbc.Driver");

            //setup connection parameters
        	String userName = "root";
            String password = "JPatel1$";
            String dbServer = "jdbc:mysql://127.0.0.1:3306/java";

            //setup connection
            connect = DriverManager.getConnection(dbServer, userName, password);

            Statement stmt = connect.createStatement();

            PreparedStatement ps;
            ResultSet rs = null;

            // #1
            String query = "UPDATE students SET name = 'Scott' WHERE ssn = '746897816'";
            ps = connect.prepareStatement(query);
            ps.executeUpdate();

            // #2
            query = "UPDATE major m INNER JOIN students s ON s.snum = m.snum SET m.name = 'Computer Science', level = 'MS' WHERE ssn = '746897816'";
            ps = connect.prepareStatement(query);
            ps.executeUpdate();

            // #3
            query = "DELETE FROM register WHERE regtime = 'Spring2021'";
            ps = connect.prepareStatement(query);
            ps.executeUpdate();


        } catch (Exception e) {
            e.printStackTrace();
        } //end catch

    } //end main

} //end class ModifyRecords