<%-- 
    Document   : controller
    Created on : 09-ene-2018, 21:30:35
    Author     : alberto
--%>

<%@page import="java.util.List"%>
<%@page import="entities.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.persistence.Query"%>
<%@page import="entities.Chiste"%>
<%@page import="jpautil.JPAUtil"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
          
            EntityManager em = JPAUtil.getEntityManagerFactory().createEntityManager();
            
            String get = request.getParameter("get");
            
            if (get.equals(null) || get.equals("index")){
                List<Categoria> categories = em.createNamedQuery("Categoria.findAll").getResultList();
                List<Chiste> chistes = em.createNamedQuery("Chiste.findAll").getResultList();
                session.setAttribute("chistes", chistes);
                session.setAttribute("categories", categories);
                %><jsp:forward page="index.jsp"/><%
                    
            }else if (get.equals("rating")){
                em.getTransaction().begin();
                
            }
        %>
    </body>
</html>
