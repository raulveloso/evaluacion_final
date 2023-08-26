<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar</title>
    </head>
    <body>
        <%
        String strId = request.getParameter("id_producto");
        String strNombre = request.getParameter("nombre_producto");
        String strPrecio = request.getParameter("precio_producto");
        String strDescripcion = request.getParameter("descripcion_producto");
        String strRotacion = request.getParameter("rotacion_producto");
        %>


        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form action="editar.jsp" method="post">
                        <div class="form-group">
                            <label>Nombre Producto</label>
                            <input name="nombre_producto" value="<%= strNombre %>" type="text" class="form-control" placeholder="Nombre Producto" required="">
                        </div>
                        <div class="form-group">
                            <label>Precio Producto</label>
                            <input name="precio_producto" value="<%= strPrecio %>" type="text" class="form-control" placeholder="Precio Producto" required="">
                        </div>
                        <div class="form-group">
                            <label>Descripcion Producto</label>
                            <input name="descripcion_producto" value="<%= strDescripcion %>" type="text" class="form-control" placeholder="Descripcion Producto" required="">
                        </div>
                        <div class="form-group">
                            <label>Rotacion Producto</label>
                            <input name="rotacion_producto" value="<%= strRotacion %>" type="text" class="form-control" placeholder="Rotacion Producto" required="">
                        </div>
                        <input type="hidden" name="enviar" value="enviar">
                        <br>
                        <button type="submit" class="btn btn-success">ACTUALIZAR</button>
                        <a href="index.jsp" class="btn btn-danger">CANCELAR</a>
                        <input type="hidden" name="id_producto" value="<%= strId %>">
                    </form>
                </div>
            </div>
        </div>

        <%
            if (request.getParameter("enviar") != null) {
                try {
                    Connection con = null;
                    Statement st = null;

                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_eva2?user=root");
                    st = con.createStatement();
                    st.executeUpdate("UPDATE tb_uno SET nombre_producto = '" + strNombre + "', precio_producto = '" + strPrecio + "', descripcion_producto ='" + strDescripcion + "', rotacion_producto ='" + strRotacion + "' WHERE id_producto = '" + strId + "'");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>
    </body>
</html>
