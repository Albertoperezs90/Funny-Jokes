<%-- 
    Document   : index
    Created on : 09-ene-2018, 19:47:13
    Author     : alberto
--%>

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
            <form id="joke1">
            <ul class="collection">
                <li class="collection-item avatar">
                    <img src="uploads/imgs/rating5.png" alt="" class="circle">
                    <span class="title">Hormigas</span>
                    <span class="title">Alberto</span>
                    <div class="cb"/>
                    <p>Animales<br>
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book
                    </p>
                    <span class="rating">
                    <a href="javascript: submitRating(1)"><i class="material-icons">grade</i></a>
                    <a href="javascript: submitRating(2)"><i class="material-icons">grade</i></a>
                    <a href="javascript: submitRating(3)"><i class="material-icons">grade</i></a>
                    <a href="javascript: submitRating(4)"><i class="material-icons">grade</i></a>
                    <a href="javascript: submitRating(5)"><i class="material-icons">grade</i></a>
                    </span>
                </li>
            </ul>
                </form>
            <!--End Table Jokes-->
        </div>
        <script type="text/javascript">
            $(document).ready(function(){
                $(".button-collapse").sideNav();
                $(".dropdown-button").dropdown();
                $('select').material_select();
                $('.modal').modal();
            });
        </script>
    </body>
</html>
