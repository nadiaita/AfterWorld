<%@ include file="../connection/Connection.jsp" %>
<%@page import="java.util.*" %>
<%!
public class User{
	private Connect connect;
    private Integer id;
    private Integer role_id;
    private String name;
    private String email;
    private String password;
    private String phone_number; 

	public User() {
        this.connect = Connect.getConnection();
    }

    public User(ResultSet resultSet) {
        this.connect = Connect.getConnection();
        try {
            this.id = resultSet.getInt("id");
            this.role_id = resultSet.getInt("role_id");
            this.name = resultSet.getString("name");
            this.email = resultSet.getString("email");
            this.password = resultSet.getString("password");
            this.phone_number = resultSet.getString("phone_number");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // setter
    public void setUserId(Integer id) {this.id = id;}
    public void setRoleId(Integer role_id) {this.role_id = role_id;}
    public void setName(String name) {this.name = name;}
    public void setEmail(String email) {this.email = email;}
    public void setPassword(String password) {this.password = password;}
    public void setPhoneNumber(String phone_number) {this.phone_number = phone_number;}

    // getter
    public Integer getUserId(){return id;}
    public Integer getRoleId(){return role_id;}
    public String getName(){return name;}
    public String getEmail(){return email;}
    public String getPassword(){return password;}
    public String getPhoneNumber(){return phone_number;}

    // get places di database dengan pagination
    public Vector<User> getAllUser(){
        //Integer place = currentPage;
        //if(currentPage == 1){
          //  place = 0;
        //}
        Vector<User> usersVector = new Vector<User>();
        try{
           // String query = "SELECT * FROM places ORDER BY id LIMIT 6 OFFSET '"+currentPage*6+"'";
            String query = "SELECT * FROM user";
            ResultSet resultSet = connect.executeQuery(query);
            while(resultSet.next()){
                usersVector.add(new User(resultSet));
            }
        }catch(Exception err){
            err.printStackTrace();
        }
        System.out.println(usersVector);
        return usersVector;
    }

   // get single user berdasarkan id
    public User getUser(Integer id){
        User user = new User();
        try {
            String query = "SELECT DISTINCT * FROM user WHERE id = '"+id+"'";
            ResultSet resultSet = connect.executeQuery(query);
            while(resultSet.next()){
                user = new User(resultSet);
            }
        }catch(Exception err){
            err.printStackTrace();
        }
        return user;
    }

    public String getRoleName(Integer id){
        String name = "";
        try {
            String query = "SELECT DISTINCT * FROM role WHERE id = '"+id+"'";
            ResultSet resultSet = connect.executeQuery(query);
            while(resultSet.next()){
                name = resultSet.getString("name");
            }
        }catch(Exception err){
            err.printStackTrace();
        }
        return name;
    }

    // insert user baru
    public void insertUser(){
        try {
            String query = String.format("INSERT INTO user (role_id, name, email, password, phone_number) VALUES ('"+role_id+"', '"+name+"', '"+email+"', '"+password+"', '"+phone_number+"')");
            connect.executeUpdate(query);
        }catch(Exception err){
            err.printStackTrace();
        }
    }

    //Update single user berdasarkan id
    public void updateUser(Integer id){
         try {
            String query = String.format("UPDATE user SET role_id = '"+role_id+"', name = '"+name+"', email = '"+email+"', password = "+password+"', phone_number = '"+phone_number+"' WHERE id = '"+id+"'");
            connect.executeUpdate(query);
        }catch(Exception err){
            err.printStackTrace();
        }
    }

    //delete single user berdasarkan id
    public void deletePlace(Integer id){
        try {
            String query = "DELETE FROM user WHERE id = '"+id+"'";
            connect.executeUpdate(query);
        }
        catch(Exception err){
            err.printStackTrace();
        }
    } 

    public Vector<String> getAllRoleNames(){
        Vector<String> roleNames = new Vector<String>();
         try {
            String query = "SELECT * FROM role";
            ResultSet resultSet = connect.executeQuery(query);
            while(resultSet.next()){
                roleNames.add(resultSet.getString("name"));
            }
        }catch(Exception err){
            err.printStackTrace();
        }
        return roleNames;
    }
    
}
%>