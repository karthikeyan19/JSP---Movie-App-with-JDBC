<%-- 
    Document   : add
    Created on : 15 Sep, 2017, 2:22:19 PM
    Author     : mca
--%>
<%@page import="java.util.*" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import=" java.io.*"%>
<%@page import="java.sql.*"%> 
<%@page import=" java.util.Scanner"%>
<%@page errorPage="error.jsp" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adding Details</title>
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/steveCinemas","root","");
            //st=conn.createStatement();
            String mprice;
            String mtitle;
            String mstar;
            
            mtitle=request.getParameter("mtitle");
            mstar=request.getParameter("mstar");
            mprice=request.getParameter("mprice");
            Part img = request.getPart("img");
            PreparedStatement ps= conn.prepareStatement("Insert into movie(title,star,price,img,img_data) values(?,?,?,?,?)");
            ps.setString(1, mtitle);
            ps.setString(2, mstar);
            ps.setDouble(3, Double.parseDouble(mprice));
            ps.setString(4, img.getSubmittedFileName());
            ps.setBlob(5, img.getInputStream());
            int i=ps.executeUpdate();
            if (i>0)
            out.println(i+" Your Details is successfully added ");
            else
            out.println("Your Details is not added");
            
                      
        %>
        <a href="HomeJsp.jsp" value="home"></a>
    </body>
</html>
