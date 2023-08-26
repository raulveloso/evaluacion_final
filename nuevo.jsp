<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://kit.fontawesome.com/513bd683e0.js" crossorigin="anonymous"></script>
        <title>Formulario</title>
    </head>
    <body>
        
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form action="nuevo.jsp" method="post">
                        <div class="form-group">
                            <label>Nombre Producto</label>
                            <input name="nombre_producto" type="text" class="form-control" id="name"  placeholder="Nombre Producto" required="">
                        </div>
                        <div class="form-group">
                            <label>Precio</label>
                            <input name="precio_producto" type="text" class="form-control" id="price" placeholder="Precio USD" required="">
                        </div>
                        <div class="form-group">
                            <label>Descripcion Producto</label>
                            <input name="descripcion_producto"type="text" class="form-control" id="desc"  placeholder="Descripcion" required="">
                        </div>
                        <div class="form-group">
                            <label>Rotacion Producto</label>
                            <input name="rotacion_producto"type="text" class="form-control" id="rot"  placeholder="Ej: a,b,c" required="">
                        </div>
                        <input type="hidden" name="agregar" value="agregar">
                        <button type="submit" class="btn btn-success">AGREGAR</button>
                    </form>
                </div>
            </div>
        </div>

        <%
            if (request.getParameter("agregar") != null) {
                String strId = request.getParameter("id_producto");
                String strNombre = request.getParameter("nombre_producto");
                String strPrecio = request.getParameter("precio_producto");
                String strDescripcion = request.getParameter("descripcion_producto");
                String strRotacion = request.getParameter("rotacion_producto");

                try {
                    Connection con = null;
                    Statement st = null;

                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_eva2?user=root");
                    st = con.createStatement();
                    st.execute("INSERT INTO tb_uno (nombre_producto,precio_producto,descripcion_producto,rotacion_producto) VALUES ('" + strNombre + "','" + strPrecio + "','" + strDescripcion + "','" + strRotacion + "')");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>
        
    </body>
</html>
