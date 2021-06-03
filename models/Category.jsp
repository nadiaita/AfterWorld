<%@ include file="../connection/Connection.jsp" %>
<%@page import="java.util.*" %>
<%!
public class Category{
	private Connect connect;
    private Integer id;
    private String name;

	public Category() {
        this.connect = Connect.getConnection();
    }

    public Category(ResultSet resultSet) {
        this.connect = Connect.getConnection();
        try {
            this.id = resultSet.getInt("id");
            this.name = resultSet.getString("name");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // setter
    public void setCategoryId(Integer id) {this.id = id;}
    public void setName(String name) {this.name = name;}
    
    // getter
    public Integer getCategoryId(){return id;}
    public String getName(){return name;}
    
    // insert new category
    public void insertCategory(){
        try {
            String query = String.format("INSERT INTO category (name) VALUES ('"+name+"'");
            connect.executeUpdate(query);
        }catch(Exception err){
            err.printStackTrace();
        }
    }

    //Update single category berdasarkan id
    public void updateCategory(Integer id){
         try {
            String query = String.format("UPDATE category SET name = '"+name+"'");
            connect.executeUpdate(query);
        }catch(Exception err){
            err.printStackTrace();
        }
    }

    //delete single category berdasarkan id
    public void deleteCategory(Integer id){
        try {
            String query = "DELETE FROM category WHERE id = '"+id+"'";
            connect.executeUpdate(query);
        }
        catch(Exception err){
            err.printStackTrace();
        }
    } 
}
%>