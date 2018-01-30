<%-- 
    Document   : filter
    Created on : 16-ene-2018, 10:58:53
    Author     : alberto
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="entities.Puntos"%>
<%@page import="entities.Chiste"%>
<%@page import="java.util.List"%>
<%@page import="entities.Categoria"%>

<%
    List<Chiste> chistes = (List<Chiste>) request.getAttribute("jokes");
   for (Chiste c : chistes) {
    int i = 0;
                  int sumPoints = 0;
                  for (Puntos p : c.getPuntosList()){
                      sumPoints += p.getPuntos().intValue();
                      i++;
                  }
                  if (i != 0){
                      sumPoints/=i;
                  }
                  %>
                  <form id="<%=c.getId()%>" name="joke<%=c.getId()%>">
                      <ul class="collection">
                          <li class="collection-item avatar">
                              <%
                              if (sumPoints == 5){
                                  %><img src="uploads/imgs/rating5.png" alt="" class="circle"><%
                              }else if (sumPoints == 4){
                                  %><img src="uploads/imgs/rating4.png" alt="" class="circle"><%
                              }else if (sumPoints == 3){
                                  %><img src="uploads/imgs/rating3.png" alt="" class="circle"><%
                              }else if (sumPoints == 2){
                                  %><img src="uploads/imgs/rating2.jpg" alt="" class="circle"><%
                              }else if (sumPoints <= 1){
                                  %><img src="uploads/imgs/rating1.png" alt="" class="circle"><%
                              }    
                              %>
                              <span class="title"><%=c.getTitulo()%></span>
                              <span class="title"><%=c.getAdopo()%></span>
                              <div class="cb"/>
                              <p><%=c.getTitulo()%><br/>
                                  <%=c.getDescripcion()%>
                              </p>
                              <span class="rating">
                                  <%
                                  if (sumPoints == 5){
                                      %><span class="rating_5"><%
                                        %><a id="rating5_<%=c.getId()%>"><i class="material-icons">grade</i></a><%
                                        %><a id="rating4_<%=c.getId()%>"><i class="material-icons">grade</i></a><%
                                        %><a id="rating3_<%=c.getId()%>"><i class="material-icons">grade</i></a><%
                                        %><a id="rating2_<%=c.getId()%>"><i class="material-icons">grade</i></a><%
                                        %><a id="rating1_<%=c.getId()%>"><i class="material-icons">grade</i></a><%
                                      %></span><%
                                  }else if (sumPoints == 4){
                                        %><a id="rating5_<%=c.getId()%>"><i class="material-icons">grade</i></a><%
                                      %><span class="rating_4"><%
                                        %><a id="rating4_<%=c.getId()%>"><i class="material-icons">grade</i></a><%
                                        %><a id="rating3_<%=c.getId()%>"><i class="material-icons">grade</i></a><%
                                        %><a id="rating2_<%=c.getId()%>"><i class="material-icons">grade</i></a><%
                                        %><a id="rating1_<%=c.getId()%>"><i class="material-icons">grade</i></a><%
                                      %></span><%
                                  }else if (sumPoints == 3){
                                        %><a id="rating5_<%=c.getId()%>"><i class="material-icons">grade</i></a><%
                                        %><a id="rating4_<%=c.getId()%>"><i class="material-icons">grade</i></a><%
                                      %><span class="rating_3"><%
                                        %><a id="rating3_<%=c.getId()%>"><i class="material-icons">grade</i></a><%
                                        %><a id="rating2_<%=c.getId()%>"><i class="material-icons">grade</i></a><%
                                        %><a id="rating1_<%=c.getId()%>"><i class="material-icons">grade</i></a><%
                                      %></span><%
                                  }else if (sumPoints == 2){
                                        %><a id="rating5_<%=c.getId()%>"><i class="material-icons">grade</i></a><%
                                        %><a id="rating4_<%=c.getId()%>"><i class="material-icons">grade</i></a><%
                                        %><a id="rating3_<%=c.getId()%>"><i class="material-icons">grade</i></a><%
                                      %><span class="rating_2"><%
                                        %><a id="rating2_<%=c.getId()%>"><i class="material-icons">grade</i></a><%
                                        %><a id="rating1_<%=c.getId()%>"><i class="material-icons">grade</i></a><%
                                      %></span><%
                                  }else if (sumPoints <= 1){
                                        %><a id="rating5_<%=c.getId()%>"><i class="material-icons">grade</i></a><%
                                        %><a id="rating4_<%=c.getId()%>"><i class="material-icons">grade</i></a><%
                                        %><a id="rating3_<%=c.getId()%>"><i class="material-icons">grade</i></a><%
                                        %><a id="rating2_<%=c.getId()%>"><i class="material-icons">grade</i></a><%
                                      %><span class="rating_1"><%
                                        %><a id="rating1_<%=c.getId()%>"><i class="material-icons">grade</i></a><%
                                      %></span><%
                                  }
                                  %>
                              </span>
                          </li>
                      </ul>
                  </form>
                  <%
}
%>