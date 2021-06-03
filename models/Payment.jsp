<%@ include file="../connection/Connection.jsp" %>
<%@page import="java.util.*" %>
<%!
public class Payment{
	private Connect connect;
    private Integer id;
    private String name;

	public Payment() {
        this.connect = Connect.getConnection();
    }

    public Payment(ResultSet resultSet) {
        this.connect = Connect.getConnection();
        try {
            this.id = resultSet.getInt("id");
            this.name = resultSet.getString("name");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // setter
    public void setPaymentId(Integer id) {this.id = id;}
    public void setName(String name) {this.name = name;}
    
    // getter
    public Integer getPaymentId(){return id;}
    public String getName(){return name;}
    
    // insert new payment
    public void insertPayment(){
        try {
            String query = String.format("INSERT INTO payment (name) VALUES ('"+name+"'");
            connect.executeUpdate(query);
        }catch(Exception err){
            err.printStackTrace();
        }
    }

    //Update single payment berdasarkan id
    public void updatePayment(Integer id){
         try {
            String query = String.format("UPDATE payment SET name = '"+name+"'");
            connect.executeUpdate(query);
        }catch(Exception err){
            err.printStackTrace();
        }
    }

    //delete single payment berdasarkan id
    public void deletePayment(Integer id){
        try {
            String query = "DELETE FROM payment WHERE id = '"+id+"'";
            connect.executeUpdate(query);
        }
        catch(Exception err){
            err.printStackTrace();
        }
    } 
}
%>