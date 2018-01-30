<%-- 
    Document   : index
    Created on : 09-ene-2018, 19:47:13
    Author     : alberto
--%>

<%@page import="entities.Puntos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entities.Chiste"%>
<%@page import="java.util.List"%>
<%@page import="entities.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" /> 
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
        <link type="text/css" rel="stylesheet" href="css/style.css"/>
        
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        
        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
    </head>
    <body>
        <header>
            <!--Start index card profile-->
            <ul id="slide-out" class="side-nav">
                <li><div class="user-view">
                        <div class="background">
                            <img src="images/office.jpg">
                        </div>
                        <a href="#!user"><img class="circle" src="images/yuna.jpg"></a>
                        <a href="#!name"><span class="white-text name">John Doe</span></a>
                        <a href="#!email"><span class="white-text email">jdandturk@gmail.com</span></a>
                    </div></li>
                <li><a href="#!"><i class="material-icons">cloud</i>First Link With Icon</a></li>
                <li><a href="#!">Second Link</a></li>
                <li><div class="divider"></div></li>
                <li><a class="subheader">Subheader</a></li>
                <li><a class="waves-effect" href="#!">Third Link With Waves</a></li>
            </ul>
            <!--End index card profile-->
            <!--Start nav bar header-->
            <div class="navbar-fixed">
            <nav>
                <div class="nav-wrapper">
                    <a href="#!" class="brand-logo"><img width="120" height="120" src="uploads/imgs/logo.png" alt="logo"/></a>
                    <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
                    <ul class="right hide-on-med-and-down">
                        <li><a href="#">Mejores Chistes</a></li>
                        <li id="unlogged"><a class="waves-effect waves-light btn"><i class="material-icons left">local_library</i>Ingresar</a></li>
                        <li id="logged"><!--<a class="waves-effect waves-light btn"><i class="material-icons left">local_library</i>Perfil</a>--></li>
                    </ul>
                    
                </div>
            </nav>
            </div>
            <ul class="side-nav" id="mobile-demo">
                        <li><a href="#">Mejores Chistes</a></li>
                        <li id="unlogged"><a><i class="material-icons left">local_library</i>Ingresar</a></li>
                        <li id="logged"><!--<a><i class="material-icons left">local_library</i>Perfil</a>--></li>
                    </ul>
            <!--End nav bar header-->
        </header>
        <div class="container">
            <!--Filter-->
            <!-- Modal Trigger -->
            <a id="modal_button" class="btn-floating btn-large red modal-trigger" href="#modal1">
                <i id="filter_icon" class="large material-icons">filter_list</i>
            </a>
                
            <!-- Modal Structure -->
            <div id="modal1" class="modal bottom-sheet">
                <div class="modal-content">
                    <h4>Filtrar por categoría</h4>
                    <form id="categories_form" action="#">
                        <button class="btn waves-effect waves-light modal-close" type="submit" name="action">Aceptar
                            <i class="material-icons right">send</i>
                        </button>
                        <p>
                            <input type="checkbox" id="all"/>
                            <label for="all">Todas</label>
                        </p>
                        <%
                             List<Categoria> categories = (List<Categoria>) session.getAttribute("categories");
                             for (Categoria c : categories){
                             %>
                                 <p>
                                 <input type="checkbox" id="chkbx<%=c.getId()%>"/>
                                 <label for="chkbx<%=c.getId()%>"><%=c.getNombre()%></label>
                                 </p>
                             <%
                             }
                           %>
                    </form>
                </div>
            </div>
            <!--End Filter-->
            <div id="jokes_table">
            <!--Table Jokes-->
            <%
              List<Chiste> chistes = (List<Chiste>) session.getAttribute("chistes");
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
            <!--End Table Jokes-->
                  </div>
        </div>
        <script type="text/javascript">
            $(document).ready(function(){
                $(".button-collapse").sideNav();
                $(".dropdown-button").dropdown();
                $('select').material_select();
                $('.modal').modal();
                
                $(".navbar-fixed + ul a:first").click(function(e){
                    e.preventDefault();
                    
                    $.ajax({
                        type: 'POST',
                        url: 'controller.jsp?get=bestJokes',
                        success: function (result) {
                            $("#jokes_table").html(result);
                            $('.button-collapse').sideNav('hide');
                        }
                    })
                });
                
                $("nav ul:first a:first").click(function(e){
                    e.preventDefault();
                    
                    $.ajax({
                        type: 'POST',
                        url: 'controller.jsp?get=bestJokes',
                        success: function (result) {
                            $("#jokes_table").html(result);
                        }
                    })
                });
                
                $("#jokes_table").on("click",".rating a",function(){
                   let star = this.id.toString();
                   let id = star.substring(star.indexOf('_') + 1, star.length);
                   let rating = star.substring(6, 7);
                   
                   console.log(id);
                   console.log(rating);
                   
                   $.ajax({
                        type: 'POST',
                        url: 'controller.jsp?get=rating',
                        data: "idJoke="+id+"&rating="+rating,
                        success: function (result) {
                            $("form[id="+id+"]").html(result);
                            Materialize.toast('Votación realizada!', 3000, 'rounded')
                        },
                        error: function (error) {
                            console.log(error.toString());
                        }
                   });
                });
                
                $("#categories_form button").click(function(e){
                    e.preventDefault();
                    var checkboxs = getAllCheckboxCheked();
                    $.ajax({
                        type: "POST",
                        url: "controller.jsp?get=filter",
                        data: "filt="+checkboxs.toString(),
                        success: function (result) {
                            $("#jokes_table").html(result);
                        }
                    });
                });
                
                function getAllCheckboxCheked(){
                 var checkboxs = new Array();
                 
                 $("input[type='checkbox']:checked").each(function(){
                        if (this.id.toString() == "all"){
                            checkboxs = new Array();
                            checkboxs.push(-1);
                            return checkboxs;
                        }
                        checkboxs.push(this.id.toString().substring(5,this.id.toString().length));
                 });
                 
                 return checkboxs;
            }
            });
        </script>
    </body>
</html>
