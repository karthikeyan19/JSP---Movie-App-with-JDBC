<%-- 
    Document   : update
    Created on : 15 Sep, 2017, 2:34:45 PM
    Author     : mca
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import=" java.io.*"%>
<%@page import="java.sql.*"%> 
<%@page import="java.util.*" %> 
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
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies","root","");
            Statement st=conn.createStatement();
            String mid;
            String mprice;
            String mtitle;
            String mstar;
            mid=request.getParameter("mid");
            mprice=request.getParameter("mprice");
            mtitle=request.getParameter("mtitle");
            mstar=request.getParameter("mstar");
            String q1="update movies set"; 
            if(!mid.equals("")){
              if(!mprice.equals("")){
                  q1+=" mprice="+mprice+",";
              }
              if(!mtitle.equals("")){
                  
              }
            int i=st.executeUpdate(q1);
            if (i>0)
            out.println(i+" Your Details are Updated");
            else
            out.println("Your Details are not Updated");
     
            
            }
            
        
            
        %>
            
    </body>
</html>
