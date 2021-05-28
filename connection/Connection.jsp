<%-- <%@ page import="java.sql.*" %> --%>

<%-- <%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jbdc:mysql://localhost/afterworld","root","");
 
	//Statement st = con.createStatement(1004,1008);
%> --%>

<%@page import="java.sql.*" %>

<%!
public static final class Connect {
	private final String USERNAME = "root"; 
	private final String PASSWORD = ""; 

	//Nama database kamu disini
	private final String DATABASE = "afterworld"; 
	
	private final String HOST = "localhost:3306";
	private final String CONECTION = String.format("jdbc:mysql://%s/%s", HOST, DATABASE);
	private Connection con;
	private Statement st;
	/**
	* Constructor for Connect class
	*/
    private Connect() {
    	try {  
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(CONECTION, USERNAME, PASSWORD);  
            st = con.createStatement(); 
        } catch(Exception e) {
        	e.printStackTrace();
        }  
    }
	private static Connect instance;
	/**
	* This method is used to get instance from this class. The class implement singleton design pattern.
	* @return instace from this class
	*/
	public static Connect getConnection() {

		if (instance == null) {
			instance = new Connect();
		}
		return instance;
	}
    /**
	* This method is used for SELECT SQL statements.
	* @param String This is the query statement
	* @return ResultSet This returns result data from the database
	*/
    public ResultSet executeQuery(String query) {
        ResultSet rs = null;
    	try {
            rs = st.executeQuery(query);
        } catch(Exception e) {
        	e.printStackTrace();
        }
        return rs;
    }

	/**
	* This method is used for INSERT, UPDATE, or DELETE SQL statements.
	* @param String This is the query statement
	* @return Integer This returns of number affected row
	*/
    public Integer executeUpdate(String query) {
    	Integer affected = 0;
		try {
			affected = st.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return affected;
    }
}
%>
