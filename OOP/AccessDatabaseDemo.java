import java.sql.*;

public class AccessDatabaseDemo {
    public static void main(String[] args) {
        // JDBC driver and database URL
        String driver = "net.ucanaccess.jdbc.UcanaccessDriver";
        String url = "jdbc:ucanaccess://E:/Workings/sampledb.accdb"; // Replace with your Access database file path

        // Database credentials (if required)
        String username = ""; // Leave empty if not required
        String password = ""; // Leave empty if not required

        // SQL query to select all records from a table
        String query = "SELECT * FROM TableName"; // Replace TableName with your table name

        try {
            // Register JDBC driver
            Class.forName(driver);

            // Open a connection
            Connection connection = DriverManager.getConnection(url, username, password);

            // Create a statement
            Statement statement = connection.createStatement();

            // Execute the query
            ResultSet resultSet = statement.executeQuery(query);

            // Process the result set
            while (resultSet.next()) {
                // Retrieve data from each row
                int id = resultSet.getInt("ID"); // Assuming 'ID' is a column name in the table
                String name = resultSet.getString("Name"); // Assuming 'Name' is a column name in the table

                // Display the data
                System.out.println("ID: " + id + ", Name: " + name);
            }

            // Close resources
            resultSet.close();
            statement.close();
            connection.close();
        } catch (ClassNotFoundException e) {
            System.err.println("Error loading JDBC driver: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("SQL exception: " + e.getMessage());
        }
    }
}
