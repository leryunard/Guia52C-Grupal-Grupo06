<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,net.ucanaccess.jdbc.*" %>
 <html>
 <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Buscar Libros</title>
 <link href="style/estilo-ejercicio 6.css" rel="stylesheet" type="text/css">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
 </head>
 <body>

   <H1>Ejercicio 6</H1>
   <a href="libros.jsp"><H1>Regresar a la página principal.</H1></a>
<div class="cuerpo">
<form action="ejercicio 6-matto.jsp" method="post" name="Actualizar" class="formulario">
   <div class="form">
 <table>
 <tr>
 <td>ISBN<input type="text" name="isbn" value="" size="40" placeholder="Ingrese ISBN" class="form-control"/>
</td>
  </tr>
 <tr>
 <td>Titulo<input type="text" name="titulo" value="" size="50"placeholder="Ingrese titulo" id="Titulo" class="form-control"/></td>
 </tr>
 <tr>
   <td>Autor<input type="text" name="autor" value="" size="50" placeholder="Ingrese autor" id="Autor" class="form-control"/></td>
   </tr>
 <tr><td>Action 
 <input type="radio" name="Action" value="Buscar" checked /> Buscar
  </td>
 <td><input type="SUBMIT" value="ACEPTAR" disabled id="Aceptar"/>
</td>
 </tr>
 </form>
 </tr>
 </table>
</div>
 </form>
<br><br>
<script src="js/libro ejercicio 6.js"></script>
</div>
<%!
public Connection getConnection() throws SQLException {
String driver = "sun.jdbc.odbc.JdbcOdbcDriver";
String userName="usuario",password="contraseña";
String fullConnectionString = "jdbc:odbc:registro";

    Connection conn = null;
try{
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
 conn = DriverManager.getConnection(fullConnectionString,userName,password);

}
 catch (Exception e) {
System.out.println("Error: " + e);
 }
    return conn;
}
%>
<%
ServletContext context = request.getServletContext();
Connection conexion = getConnection();
   /*if (!conexion.isClosed()){
out.write("OK");
 
      Statement st = conexion.createStatement();
      ResultSet rs = st.executeQuery("select * from libros" );

      // Ponemos los resultados en un table de html
      out.println("<table border=\"1\"><tr><td>Num.</td><td>ISBN</td><td>Titulo</td>><td>Autor</td></tr>");
      int i=1;
      while (rs.next())
      {
         out.println("<tr>");
         out.println("<td>"+ i +"</td>");
         out.println("<td>"+rs.getString("isbn")+"</td>");
         out.println("<td>"+rs.getString("titulo")+"</td>");
         out.println("<td>"+rs.getString("autor")+"</td>");
         out.println("</tr>");
         i++;
      }
      out.println("</table>");

      // cierre de la conexion
      conexion.close();
}*/
%>
 </body>