<%--
    Document   : list
    Created on : 15 Sep, 2017, 2:34:33 PM
    Author     : mca
--%>
<%@page import="java.util.*" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import=" java.io.*"%>
<%@page import="java.sql.*"%> 
<%@page errorPage="error.jsp" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/steveCinemas","root","");
            Statement st=conn.createStatement();
            String id;
            id=request.getParameter("mid");
            String q="select * from movie where movie_id="+id+"";
            ResultSet rs=st.executeQuery(q);
            Blob img=rs.getBlob("img_data");
            byte[] data=img.getBytes(1,(int)img.length());
            response.setContentType("image/jpg");
            OutputStream ot=response.getOutputStream();
            ot.write(data);
            
            ot.flush();
            ot.close();    
            conn.close();
           %>
            
    </body>
</html>
