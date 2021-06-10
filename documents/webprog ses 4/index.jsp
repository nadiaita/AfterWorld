<%@ include file="database.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form method="get">
        <input type = "text" name="productName">
        <button>Search</button>
    </form>

    <%
        String productName = request.getParameter("productName");
        Integer totalData = 0;
        int totalPage = 0;
 
        if(productName == null || productName.isEmpty()){
            productName = "";
        }
        Integer currentPage = 0;
        String currentPageStr = request.getParameter("page");
        if(currentPage == null || currentPageStr.isEmpty()){
            currentPage = 1;
        }else{
            currentPage = Integer.parseInt(currentPageStr);
        }

        //out.print(productName);
    
        try{

            String countQuery = "SELECT count(id) AS 'data' FROM products";
            PreparedStatement totalDataStatement = connection.prepareStatement(countQuery);
            ResultSet rsTotalData = totalDataStatement.executeQuery();
            if(rsTotalData.next()){
                totalData = rsTotalData.getInt("data");
                //out.print(rsTotalData.getInt("data"));
            }

            int limit = 6;
            int offset = (currentPage - 1) * limit;
            totalPage = (totalData/limit) + 2;

            //id, name, qty
            //Menghindari SQL Injection
            String selectQuery = "SELECT * FROM products WHERE name LIKE ? LIMIT ? OFFSET ?";
            PreparedStatement getAllDataStatement =  connection.prepareStatement(selectQuery);
            getAllDataStatement.setString(1, "%" + productName + "%");
            getAllDataStatement.setInt(2, limit);
            getAllDataStatement.setInt(3, offset);
            ResultSet rs = getAllDataStatement.executeQuery();
            while(rs.next()){ //untuk check ada data atau tidak
                out.print(rs.getInt("id") + " | ");
                out.print(rs.getString("name") + " | ");
                out.print(rs.getInt("qty")+ "</br>");
            }
            //rsTotalData.getInt("data"); //untuk hitung total data
        }catch(Exception e){
        
        }
    %>

    <% for(int i = 1; i <= totalPage; i++){ %>
        <a href="?page=<%=i%>" style="margin=1em;">
            <% out.print(i); %>
        </a>

    <% } %>
</body>
</html>