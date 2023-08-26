<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://kit.fontawesome.com/513bd683e0.js" crossorigin="anonymous"></script>
        <title>Evaluacion 2</title>
    </head>
    <body>
        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
        %>
         <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <table class="table table-striped">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col" colspan="5" class="text-center">Productos</th>
                                <th scope="col">
                                    <a href="nuevo.jsp"><i class="fa-solid fa-square-plus"></i></a>
                                    <a><i class="fa-solid fa-gamepad"></i></a>
                                </th>
                            </tr>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Precio</th>
                                <th scope="col">Descripcion</th>
                                <th scope="col">Rotacion</th>
                                <th scope="col">Editar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_eva2?user=root");
                                st = con.createStatement();
                                rs = st.executeQuery("SELECT * FROM tb_uno;");
                                while (rs.next()) {
                            %>                     
                            <tr>
                                <th scope="row"><%= rs.getString(1)%></th>
                                <td><%= rs.getString(2)%></td>
                                <td><%= rs.getString(3)%></td>
                                <td><%= rs.getString(4)%></td>
                                <td><%= rs.getString(5)%></td>
                                <td>
                                    <a href="editar.jsp?id_producto=<%= rs.getString(1)%>&nombre_producto=<%= rs.getString(2)%>&precio_producto=<%= rs.getString(3)%>&descripcion_producto=<%= rs.getString(4)%>&rotacion_producto=<%= rs.getString(5)%>"<i class="fa fa-pencil-alt"></i></a>
                                    &nbsp;
                                    <a href="borrar.jsp?id_producto=<%= rs.getString(1)%>"><i class="fa fa-trash-alt"></i></a>
                                </td>
                            </tr>
                            <%
                                }
                            %>                
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        
        
    </body>
</html>
