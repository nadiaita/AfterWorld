<%@ include file="../connection/Connection.jsp" %>
<%@page import="java.util.*" %>
<%!
public class Place{
	private Connect connect;
    private Integer id;
    private Integer category_id;
    private String name;
    private Integer price;
    private String location;
    private String description; 
    private Integer rating;

	public Place() {
        this.connect = Connect.getConnection();
    }

    public Place(ResultSet resultSet) {
        this.connect = Connect.getConnection();
        try {
            this.id = resultSet.getInt("id");
            this.category_id = resultSet.getInt("category_id");
            this.name = resultSet.getString("name");
            this.price = resultSet.getInt("price");
            this.location = resultSet.getString("location");
            this.description = resultSet.getString("description");
            this.rating = resultSet.getInt("rating");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // setter
    public void setPlacesId(Integer id) {this.id = id;}
    public void setCategoryId(Integer category_id) {this.category_id = category_id;}
    public void setName(String name) {this.name = name;}
    public void setPrice(Integer price) {this.price = price;}
    public void setLocation(String location) {this.location = location;}
    public void setDescription(String description) {this.description = description;}
    public void setRating(Integer rating) {this.rating = rating;}

    // getter
    public Integer getPlacesId(){return id;}
    public Integer getCategoryId(){return category_id;}
    public String getName(){return name;}
    public Integer getPrice(){return price;}
    public String getLocation(){return location;}
    public String getDescription(){return description;}
    public Integer getRating(){return rating;}

    // get places di database dengan pagination
    public Vector<Place> getAllPlaces(){
        //Integer place = currentPage;
        //if(currentPage == 1){
          //  place = 0;
        //}
        Vector<Place> placesVector = new Vector<Place>();
        try{
           // String query = "SELECT * FROM places ORDER BY id LIMIT 6 OFFSET '"+currentPage*6+"'";
            String query = "SELECT * FROM place";
            ResultSet resultSet = connect.executeQuery(query);
            while(resultSet.next()){
                placesVector.add(new Place(resultSet));
            }
        }catch(Exception err){
            err.printStackTrace();
        }
        //System.out.println('Places');
        System.out.println(placesVector);
        return placesVector;
    }

   // get single place berdasarkan id
    public Place getPlace(Integer id){
        Place place = new Place();
        try {
            String query = "SELECT DISTINCT * FROM place WHERE id = '"+id+"'";
            ResultSet resultSet = connect.executeQuery(query);
            while(resultSet.next()){
                place = new Place(resultSet);
            }
        }catch(Exception err){
            err.printStackTrace();
        }
        return place;
    }

    public String getCategoryName(Integer id){
        String name = "";
        try {
            String query = "SELECT DISTINCT * FROM category WHERE id = '"+id+"'";
            ResultSet resultSet = connect.executeQuery(query);
            while(resultSet.next()){
                name = resultSet.getString("name");
            }
        }catch(Exception err){
            err.printStackTrace();
        }
        return name;
    }

    // get all places berdasarkan category_id
    public Vector<Place> getPlaceByCategory(Integer id){
        Vector<Place> placesVector = new Vector<Place>();
        try{
            String query = "SELECT * FROM places WHERE category_id = '"+id+"'";
            ResultSet resultSet = connect.executeQuery(query);
            while(resultSet.next()){
                placesVector.add(new Place(resultSet));
            }
        }catch(Exception err){
            err.printStackTrace();
        }
        return placesVector;
    }
    
    // insert place baru
    public void insertPlace(){
        try {
            String query = String.format("INSERT INTO places (name, category_id, price, location, description, rating) VALUES ('"+name+"', '"+category_id+"', '"+price+"', '"+location+"', '"+description+"', '"+rating+"')");
            connect.executeUpdate(query);
        }catch(Exception err){
            err.printStackTrace();
        }
    }

    //Update single place berdasarkan id
    public void updatePlace(Integer id){
         try {
            String query = String.format("UPDATE places SET name = '"+name+"', category_id = '"+category_id+"',price = '"+price+"', location = "+location+"', description = '"+description+"', rating = '"+rating+"' WHERE id = '"+id+"'");
            connect.executeUpdate(query);
        }catch(Exception err){
            err.printStackTrace();
        }
    }

    //delete single place berdasarkan id
    public void deletePlace(Integer id){
        try {
            String query = "DELETE FROM places WHERE id = '"+id+"'";
            connect.executeUpdate(query);
        }
        catch(Exception err){
            err.printStackTrace();
        }
    } 

    public Vector<String> getAllCategoryNames(){
        Vector<String> categoryNames = new Vector<String>();
         try {
            String query = "SELECT * FROM category";
            ResultSet resultSet = connect.executeQuery(query);
            while(resultSet.next()){
                categoryNames.add(resultSet.getString("name"));
            }
        }catch(Exception err){
            err.printStackTrace();
        }
        return categoryNames;
    }
}
%>