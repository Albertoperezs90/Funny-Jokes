<%-- 
    Document   : index
    Created on : 09-ene-2018, 19:47:13
    Author     : alberto
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="entities.Chiste"%>
<%@page import="java.util.List"%>
<%@page import="entities.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
            <nav>
                <div class="nav-wrapper">
                    <a href="#!" class="brand-logo">Logo</a>
                    <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
                    <ul class="right hide-on-med-and-down">
                        <li><a href="badges.html">Mejores Chistes</a></li>
                        <li id="unlogged"><a class="waves-effect waves-light btn"><i class="material-icons left">local_library</i>Ingresar</a></li>
                        <li id="logged"><!--<a class="waves-effect waves-light btn"><i class="material-icons left">local_library</i>Perfil</a>--></li>
                    </ul>
                    <ul class="side-nav" id="mobile-demo">
                        <li><a href="badges.html">Mejores Chistes</a></li>
                        <li id="unlogged"><a><i class="material-icons left">local_library</i>Ingresar</a></li>
                        <li id="logged"><!--<a><i class="material-icons left">local_library</i>Perfil</a>--></li>
                    </ul>
                </div>
            </nav>
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
                    <form action="#">
                        
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
                <div class="modal-footer">
                    <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Aceptar</a>
                </div>
            </div>
            <!--End Filter-->
            <!--Table Jokes-->
            <%
              List<Chiste> chistes = (List<Chiste>) session.getAttribute("chistes");
              for (Chiste c : chistes) {
                  //TODO make this
                  c.getPuntosList().get(0).getPuntos();
                  %>
                  <form id="<%=c.getId()%>" name="joke<%=c.getId()%>">
                      <ul class="collection">
                          <li class="collection-item avatar">
                              <img src="uploads/imgs/rating5.png" alt="" class="circle">
                              <span class="title"><%=c.getTitulo()%></span>
                              <span class="title"><%=c.getAdopo()%></span>
                              <div class="cb"/>
                              <p><%=c.getTitulo()%><br/>
                                  <%=c.getDescripcion()%>
                              </p>
                              <span class="rating">
                                  <a id="rating5_<%=c.getId()%>"><i class="material-icons">grade</i></a>
                                  <a id="rating4_<%=c.getId()%>"><i class="material-icons">grade</i></a>
                                  <a id="rating3_<%=c.getId()%>"><i class="material-icons">grade</i></a>
                                  <a id="rating2_<%=c.getId()%>"><i class="material-icons">grade</i></a>
                                  <a id="rating1_<%=c.getId()%>"><i class="material-icons">grade</i></a>
                              </span>
                          </li>
                      </ul>
                  </form>
                  <%
              }    
            %>
            <!--End Table Jokes-->
        </div>
        <script type="text/javascript">
            $(document).ready(function(){
                $(".button-collapse").sideNav();
                $(".dropdown-button").dropdown();
                $('select').material_select();
                $('.modal').modal();
                
                $(".rating a").click(function(){
                   let idRating = this.id.toString();
                   let id = idRating.substring(idRating.indexOf('_') + 1, idRating.length);
                   let form = $('form[name="joke'+id+'"]');
                   let idJoke = form.attr("id");

                   $.ajax({
                        type: 'POST',
                        url: 'rating.jsp',
                        data: {"idJoke":idJoke,"idRating":id},
                        success: function (result) {
                            //TODO make this
                            console.log(result);
                        },
                        error: function () {
                            alert("error");
                        }
                   });
                });
                
                $("#modal1 input").click(function(){
                    let id = this.id;
                    
                    $.ajax({
                        type: 'POST',
                        url: "filter.jsp",
                        data: id,
                        success: function (result) {
                            //TODO make this
                        }
                    })
                })
            });
        </script>
    </body>
</html>
