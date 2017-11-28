<%-- 
    Document   : HomeJsp
    Created on : 25 Oct, 2017, 3:31:01 PM
    Author     : mca
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>
       <center>
        <h1>Steve Cinemas</h1>
       <h2> <a href="add.html"> Add new movie</a>
        <a href="update.html"> Update Moive</a>
       </h2>
          <%
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/steveCinemas","root","");
        Statement st=conn.createStatement();
        String q="select * from movie";
        ResultSet rs=st.executeQuery(q);
        %>
        <li>
       <% while(rs.next())
       {
        String id = rs.getInt("movie_id")+"";
        String title =rs.getString("title");
        String star = rs.getString("star");
        String price = rs.getDouble("price")+"";
        %>
        <h3><%=title%></h3>
        <img src="img.jsp?id=<%=id%>" width="200" height="200" /><br>
        <%=star%><br>
        <%=price%><br>
           
       <%}
       %>
       </li>

        
        
    </center>
    </body>
</html>
