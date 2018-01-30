<%-- 
    Document   : controller
    Created on : 09-ene-2018, 21:30:35
    Author     : alberto
--%>

<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="entities.Puntos"%>
<%@page import="java.util.Collections"%>
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
                String idJoke = request.getParameter("idJoke");
                String rating = request.getParameter("rating");

                Puntos p = new Puntos();
                p.setIdchiste(new Chiste(Short.valueOf(idJoke)));
                p.setPuntos(BigDecimal.valueOf(Long.parseLong(rating)));

                EntityTransaction trans = em.getTransaction();
                trans.begin();
                em.persist(p);
                trans.commit();

                Query q = em.createNamedQuery("Puntos.findByIdChiste");
                q.setParameter("idchiste", Short.valueOf(idJoke));
                List<Puntos> puntos = q.getResultList();

                request.setAttribute("puntos", puntos);
                %><jsp:forward page="rating.jsp"/><%
            }else if (get.equals("filter")){
                String[] filt = request.getParameter("filt").split(",");
                System.out.println(filt[0]);
                List<Chiste> chistes = new ArrayList<Chiste>();
                if (filt[0].equals("-1")){
                    chistes  = em.createNamedQuery("Chiste.findAll").getResultList();
                }else {
                    ArrayList<Categoria> categories = new ArrayList<Categoria>();
                    for(String s : filt){
                        Query q = em.createNamedQuery("Categoria.findById");
                        q.setParameter("id", Short.valueOf(s));
                        categories.add((Categoria) q.getSingleResult());
                    }
                    for (Categoria c : categories){
                        for (Chiste j : c.getChisteList()){
                        chistes.add(j);
                        }
                    }
                }
                request.setAttribute("jokes", chistes);
                %><jsp:forward page="filter.jsp"/><%
                    
            }else if (get.equals("bestJokes")){
                List<Chiste> chistes = em.createNamedQuery("Puntos.sortByPuntos").getResultList();
                request.setAttribute("jokes", chistes);
                
                for (Chiste c : chistes){
                   System.out.println(c.getId());
                }
                %><jsp:forward page="filter.jsp"/><%
            }
        %>
    </body>
</html>
