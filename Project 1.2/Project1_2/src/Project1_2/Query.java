package Project1_2;
import java.sql.*;

public class Query {

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

            // #1
            System.out.println("/////////////////////\n" +
                    "         #1            \n" +
                    "/////////////////////\n");

            String query = "SELECT  snum, ssn, name FROM students WHERE name = 'Becky'";
            PreparedStatement ps;
            ResultSet rs = null;
            ps = connect.prepareStatement(query);
            rs = ps.executeQuery();
            {
                while (rs.next()) {
                    int snum = rs.getInt("snum");
                    int ssn = rs.getInt("ssn");
                    String name = rs.getString("name");

                    System.out.println(snum + " " + ssn + " " + name + " ");
                } //end while loop
            } //end query

            // #2
            System.out.println("/////////////////////\n" +
                    "         #2            \n" +
                    "/////////////////////\n");

            query = "SELECT m.name, m.level FROM major m INNER JOIN students s ON m.snum = s.snum where ssn = '123097834'";
            ps = connect.prepareStatement(query);
            rs = ps.executeQuery();
            {
                while (rs.next()) {
                    String name = rs.getString("name");
                    String level = rs.getString("level");

                    System.out.println(name + " " + level + " ");
                } //end whole loop
            } //end query

            //#3
            System.out.println("/////////////////////\n" +
                    "         #3            \n" +
                    "/////////////////////\n");

            query = "SELECT c.name FROM courses c INNER JOIN departments d ON d.code = c.department_code where d.name = 'Computer Science'";
            ps = connect.prepareStatement(query);
            rs = ps.executeQuery();
            {
                while (rs.next()) {
                    String name = rs.getString("name");


                    System.out.println(name + " ");
                }
            }

            //#4
            System.out.println("/////////////////////\n" +
                    "         #4            \n" +
                    "/////////////////////\n");

            query = "SELECT dg.name, dg.level FROM degrees dg INNER JOIN departments d ON d.name = dg.name where dg.name = 'Computer Science'";
            ps = connect.prepareStatement(query);
            rs = ps.executeQuery();
            {
                while (rs.next()) {
                    String name = rs.getString("name");
                    String level = rs.getString("level");

                    System.out.println(name + " " + level + " ");
                }
            }

            //#5
            System.out.println("/////////////////////\n" +
                    "         #5            \n" +
                    "/////////////////////\n");

            query = "SELECT s.name FROM students s INNER JOIN minor mi ON s.snum = mi.snum";
            ps = connect.prepareStatement(query);
            rs = ps.executeQuery();
            {
                while (rs.next()) {
                    String name = rs.getString("name");

                    System.out.printf(name + " \n");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } //end catch


    } //end main

} //end class Query