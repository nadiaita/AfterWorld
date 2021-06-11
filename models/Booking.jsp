<%@ include file="../connection/Connection.jsp" %>
<%@page import="java.util.*" %>
<%!
public class Booking{
	private Connect connect;
    private Integer id;
    private Integer user_id;
    private Integer place_id;
    private Integer payment_id;
    private java.sql.Date start_date;
    private java.sql.Date end_date;

	public Booking() {
        this.connect = Connect.getConnection();
    }

    public Booking(ResultSet resultSet) {
        this.connect = Connect.getConnection();
        try {
            this.id = resultSet.getInt("id");
            this.user_id = resultSet.getInt("user_id");
            this.place_id = resultSet.getInt("place_id");
            this.payment_id = resultSet.getInt("payment_id");
            this.start_date = resultSet.getDate("start_date");
            this.end_date = resultSet.getDate("end_date");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // setter
    public void setBookingId(Integer id) {this.id = id;}
    public void setUserId(Integer user_id) {this.user_id = user_id;}
    public void setPlacesId(Integer place_id) {this.place_id = place_id;}
    public void setPaymentId(Integer payment_id) {this.payment_id = payment_id;}
    public void setStartDate(java.sql.Date start_date) {this.start_date = start_date;}
    public void setEndDate(java.sql.Date end_date) {this.end_date = end_date;}

    // getter
    public Integer getBookingId() {return id;}
    public Integer getUserId(){return user_id;}
    public Integer getPlacesId(){return place_id;}
    public Integer getPaymentId(){return payment_id;}
    public java.sql.Date getStartDate(){return start_date;}
    public java.sql.Date getEndDate(){return end_date;}

    // get booking di database dengan pagination
    public Vector<Booking> getAllBookingsByUserId(Integer user_id){
        Vector<Booking> bookingsVector = new Vector<Booking>();
        try{
            String query = "SELECT * FROM booking WHERE user_id = '"+user_id+"'";
            ResultSet resultSet = connect.executeQuery(query);
            while(resultSet.next()){
                bookingsVector.add(new Booking(resultSet));
            }
        }catch(Exception err){
            err.printStackTrace();
        }
        System.out.println(bookingsVector);
        return bookingsVector;
    }

   // get single booking berdasarkan id
   public void createBooking(Integer user_id){
       try{ 
           String query = String.format("INSERT INTO booking (id, user_id, place_id, payment_id, start_date, end_date) VALUES (NULL, '"+user_id+"', '"+place_id+"', '"+payment_id+"', '"+start_date+"', '"+end_date+"');");
           connect.executeUpdate(query);
       }catch(Exception err){
           err.printStackTrace();
       }
   }

   public String getPlaceName(Integer id){
        String name = "";
        try {
            String query = "SELECT DISTINCT * FROM place WHERE id = '"+id+"'";
            ResultSet resultSet = connect.executeQuery(query);
            while(resultSet.next()){
                name = resultSet.getString("name");
            }
        }catch(Exception err){
            err.printStackTrace();
        }
        return name;
    }

    public String getPaymentName(Integer id){
        String name = "";
        try {
            String query = "SELECT DISTINCT * FROM payment WHERE id = '"+id+"'";
            ResultSet resultSet = connect.executeQuery(query);
            while(resultSet.next()){
                name = resultSet.getString("name");
            }
        }catch(Exception err){
            err.printStackTrace();
        }
        return name;
    }
}
%>