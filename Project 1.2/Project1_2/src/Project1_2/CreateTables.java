package Project1_2;
	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.Statement;

	public class CreateTables {

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

	            //create tables
	            Statement stmt = connect.createStatement();
	            {
	                //create table students
	                String sql = "CREATE TABLE students" +
	                        "(snum integer UNIQUE, " +
	                        "ssn integer PRIMARY KEY, " +
	                        "name varchar(10), " +
	                        "gender varchar(1), " +
	                        "dob datetime, " +
	                        "c_addr varchar(20), " +
	                        "c_phone varchar(10), " +
	                        "p_addr varchar(20), " +
	                        "p_phone varchar(10))";

	                stmt.executeUpdate(sql);

	                //create table departments
	                sql = "CREATE TABLE departments" +
	                        "(code integer PRIMARY KEY, " +
	                        "name varchar(50) NOT NULL UNIQUE, " +
	                        "phone varchar(10), " +
	                        "college varchar(11))";

	                stmt.executeUpdate(sql);

	                //create table degrees
	                sql = "CREATE TABLE degrees" +
	                        "(name varchar(50), " +
	                        "level varchar(5), " +
	                        "PRIMARY KEY(name, level), " +
	                        "department_code integer, FOREIGN KEY (department_code) REFERENCES departments(code))";

	                stmt.executeUpdate(sql);

	                //create table courses
	                sql = "CREATE TABLE courses" +
	                        "(number integer PRIMARY KEY, " +
	                        "name varchar(50) UNIQUE, " +
	                        "description varchar(50), " +
	                        "credithours integer, " +
	                        "level varchar(20), " +
	                        "department_code integer, FOREIGN KEY (department_code) REFERENCES departments(code))";

	                stmt.executeUpdate(sql);

	                //create table register
	                sql = "CREATE TABLE register" +
	                        "(snum integer, FOREIGN KEY(snum) REFERENCES students(snum), " +
	                        "course_number integer, FOREIGN KEY(course_number) REFERENCES courses(number), " +
	                        "regtime varchar(20), " +
	                        "grade integer, " +
	                        "PRIMARY KEY(snum, course_number))";

	                stmt.executeUpdate(sql);

	                //create table major
	                sql = "CREATE  TABLE  major" +
	                        "(snum integer, " +
	                        "name varchar(50), " +
	                        "level varchar(5), " +
	                        "PRIMARY KEY(snum, name, level),  " +
	                        "FOREIGN KEY(snum) REFERENCES students(snum), " +
	                        "FOREIGN KEY(name, level) REFERENCES degrees(name, level))";

	                stmt.executeUpdate(sql);

	                //create table minor
	                sql = "CREATE TABLE minor " +
	                        "(snum integer, FOREIGN KEY(snum) REFERENCES students(snum), " +
	                        "name varchar(50), " +
	                        "level varchar(5), " +
	                        "PRIMARY KEY(snum, name, level), " +
	                        "FOREIGN KEY(name, level) REFERENCES degrees(name, level))";

	                stmt.executeUpdate(sql);

	            } //end

	        } // end try
	        catch (Exception e) {
	            e.printStackTrace();
	        } //end catch

	    } //end main//end class CreateTables

}
