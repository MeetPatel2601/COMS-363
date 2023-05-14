package Project1_2;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DropTables {
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

            //drop tables
            Statement stmt = connect.createStatement();
            {
                String sql = "DROP TABLE register";
                stmt.executeUpdate(sql);

                //drop table courses
                sql = "DROP TABLE courses";
                stmt.executeUpdate(sql);

                //drop table minor
                sql = "DROP TABLE minor";
                stmt.executeUpdate(sql);

                //drop table major
                sql = "DROP TABLE major";
                stmt.executeUpdate(sql);

                //drop table degrees
                sql = "DROP TABLE degrees";
                stmt.executeUpdate(sql);

                //drop table departments
                sql = "DROP TABLE departments";
                stmt.executeUpdate(sql);

                //drop table students
                sql = "DROP TABLE students";
                stmt.executeUpdate(sql);

            } //end
        } catch (Exception e) {
            e.printStackTrace();
        } //end catch

    } //end main

} //end DropTables class