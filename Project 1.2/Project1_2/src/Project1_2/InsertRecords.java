package Project1_2;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

	public class InsertRecords {

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

	            //insert records
	            Statement stmt = connect.createStatement();
	            {
	                //insert records into students
	                stmt.executeUpdate("INSERT INTO students VALUES('1001', '654651234', 'Randy', 'M', '2000/12/01', '301 E Hall', '5152700988', '121 Main', '7083066321')");
	                stmt.executeUpdate("INSERT INTO students VALUES('1002', '123097834', 'Victor', 'M', '2000/05/06', '270 W Hall', '5151234578', '702 Walnut', '7080366333')");
	                stmt.executeUpdate("INSERT INTO students VALUES('1003', '978012431', 'John', 'M', '1999/07/08', '201 W Hall', '5154132805', '888 University',\t'5152012011')");
	                stmt.executeUpdate("INSERT INTO students VALUES('1004', '746897816', 'Seth', 'M', '1998/12/30', '199 N Hall', '5158891504', '21 Green', '5154132907')");
	                stmt.executeUpdate("INSERT INTO students VALUES('1005', '186032894', 'Nicole', 'F', '2001/04/01', '178 S Hall', '5158891155', '13 Gray', '5157162071')");
	                stmt.executeUpdate("INSERT INTO students VALUES('1006', '534218752', 'Becky', 'F', '2001/05/16', '12 N Hall', '5157083698', '189 Clark', '2034367632')");
	                stmt.executeUpdate("INSERT INTO students VALUES('1007', '432609519', 'Kevin', 'M', '2000/08/12', '75 E Hall', '5157082497', '89 National', '7182340772')");

	                //insert records into departments
	                stmt.executeUpdate("INSERT INTO departments VALUES('401', 'Computer Science', '5152982801', 'LAS')");
	                stmt.executeUpdate("INSERT INTO departments VALUES('402', 'Mathematics', '5152982802', 'LAS')");
	                stmt.executeUpdate("INSERT INTO departments VALUES('403', 'Chemical Engineering', '5152982803', 'Engineering')");
	                stmt.executeUpdate("INSERT INTO departments VALUES('404', 'Landscape Architect', '5152982804', 'Design')");

	                //insert records into degrees
	                stmt.executeUpdate("INSERT INTO degrees VALUES('Computer Science', 'BS', '401')");
	                stmt.executeUpdate("INSERT INTO degrees VALUES('Software Engineering', 'BS', '401')");
	                stmt.executeUpdate("INSERT INTO degrees VALUES('Computer Science',\t'MS', '401')");
	                stmt.executeUpdate("INSERT INTO degrees VALUES('Computer Science',\t'PhD', '401')");
	                stmt.executeUpdate("INSERT INTO degrees VALUES('Applied Mathematics', 'MS', '402')");
	                stmt.executeUpdate("INSERT INTO degrees VALUES('Chemical Engineering', 'BS', '403')");
	                stmt.executeUpdate("INSERT INTO degrees VALUES('Landscape Architect', 'BS', '404')");

	                //insert records into major
	                stmt.executeUpdate("INSERT INTO major VALUES('1001', 'Computer Science', 'BS')");
	                stmt.executeUpdate("INSERT INTO major VALUES('1002', 'Software Engineering', 'BS')");
	                stmt.executeUpdate("INSERT INTO major VALUES('1003', 'Chemical Engineering', 'BS')");
	                stmt.executeUpdate("INSERT INTO major VALUES('1004', 'Landscape Architect', 'BS')");
	                stmt.executeUpdate("INSERT INTO major VALUES('1005', 'Computer Science', 'MS')");
	                stmt.executeUpdate("INSERT INTO major VALUES('1006', 'Applied Mathematics', 'MS')");
	                stmt.executeUpdate("INSERT INTO major VALUES('1007', 'Computer Science', 'PhD')");

	                //insert records into minor
	                stmt.executeUpdate("INSERT INTO minor VALUES('1007', 'Applied Mathematics', 'MS')");
	                stmt.executeUpdate("INSERT INTO minor VALUES('1005', 'Applied Mathematics', 'MS')");
	                stmt.executeUpdate("INSERT INTO minor VALUES('1001', 'Software Engineering', 'BS')");

	                //insert records into courses
	                stmt.executeUpdate("INSERT INTO courses VALUES('113', 'Spreadsheet', 'Microsoft Excel and Access', '3', 'Undergraduate', '401')");
	                stmt.executeUpdate("INSERT INTO courses VALUES('311', 'Algorithm', 'Design and Analysis', '3', 'Undergraduate', '401')");
	                stmt.executeUpdate("INSERT INTO courses VALUES('531', 'Theory of Computation', 'Theorem and Probability', '3', 'Graduate', '401')");
	                stmt.executeUpdate("INSERT INTO courses VALUES('363', 'Database', 'Design Principle', '3', 'Undergraduate', '401')");
	                stmt.executeUpdate("INSERT INTO courses VALUES('412', 'Water Management', 'Water Management', '3', 'Undergraduate', '404')");
	                stmt.executeUpdate("INSERT INTO courses VALUES('228', 'Special Topics', 'Interesting Topics about CE', '3', 'Undergraduate', '403')");
	                stmt.executeUpdate("INSERT INTO courses VALUES('101', 'Calculus', 'Limit and Derivative', '4', 'Undergraduate', '402')");

	                //insert records into register
	                stmt.executeUpdate("INSERT INTO register VALUES('1001', '363', 'Fall2020', '3')");
	                stmt.executeUpdate("INSERT INTO register VALUES('1002', '311', 'Fall2020', '4')");
	                stmt.executeUpdate("INSERT INTO register VALUES('1003', '228', 'Fall2020', '4')");
	                stmt.executeUpdate("INSERT INTO register VALUES('1004', '363', 'Spring2021', '3')");
	                stmt.executeUpdate("INSERT INTO register VALUES('1005', '531', 'Spring2021', '4')");
	                stmt.executeUpdate("INSERT INTO register VALUES('1006', '363', 'Fall2020', '3')");
	                stmt.executeUpdate("INSERT INTO register VALUES('1007', '531', 'Spring2021', '4')");

	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        } //end catch

	    } //end main

	} //end class InsertRecords
