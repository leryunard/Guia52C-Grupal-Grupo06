<%@page contentType="text/html" pageEncoding="iso-8859-1" import="java.sql.*,net.ucanaccess.jdbc.*" %>
 <html>
 <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Actualizar, Eliminar, Crear registros.</title>
 </head>
 <body>

   <H1>Ejercicio 3</H1>
   <a href="libros.jsp"><H3>Regresar a la página principal.</H3></a>


<form name="formbusca" action="ejercicio 3.jsp" method="aeleccion">
   ISBN a buscar:   <input type="text" name="busca-isbn" value="">
   Titulo a buscar: <input type="text" name="busca-titulo" value="">
   <input type="submit" name="uscar" value="BUSCAR">
</form>


<form action="ejercicio 3-matto.jsp" method="post" name="Actualizar">
 <table>
 <tr>
 <td>ISBN<input type="text" name="isbn" value="" size="40"/>
</td>
  </tr>
 <tr>
 <td>Titulo<input type="text" name="titulo" value="" size="50"/></td>
 
 </tr>
 <tr><td> Action <input type="radio" name="Action" value="Actualizar" /> Actualizar
 <input type="radio" name="Action" value="Eliminar" /> Eliminar
 <input type="radio" name="Action" value="Crear" checked /> Crear
  </td>
 <td><input type="SUBMIT" value="ACEPTAR" />
   </td>
 </tr>
</form>
 </tr>
 </table>
 </form>

<br><br>
<%!

public Connection getConnection(String path) throws SQLException {
String driver = "sun.jdbc.odbc.JdbcOdbcDriver";
String filePath= path+"\\datos.mdb";
String userName="",password="";
String fullConnectionString = "jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ=" + filePath;

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
ServletContext context =request.getServletContext();
String path= context.getRealPath("/data");
Connection conexion = getConnection(path);

String ls_buscaIsbn = request.getParameter("busca-isbn");
String ls_buscaTitulo = request.getParameter("busca-titulo");
String query = "select * from libros";

   if (!conexion.isClosed()){
out.write("OK");

if(ls_buscaIsbn != "")
         query = "select * from libros where isbn='" + ls_buscaIsbn + "'";
      else if(ls_buscaTitulo != "")
         query = "select * from libros where titulo='" + ls_buscaTitulo + "'";
  
         out.write("OK");
 
   Statement st = conexion.createStatement();
   
   ResultSet rs = st.executeQuery(query);
  

      // Ponemos los resultados en un table de html
      out.println("<table border=\"1\"><tr><td>Num.</td><td>ISBN</td><td>Titulo</td><td>Accion</td></tr>");
      int i=1;
      while (rs.next())
      {
         out.println("<tr>");
         out.println("<td>"+ i +"</td>");
         out.println("<td>"+rs.getString("isbn")+"</td>");
         out.println("<td>"+rs.getString("titulo")+"</td>");
         out.println("<td>"+"Actualizar<br>Eliminar"+"</td>");
         out.println("</tr>");
         i++;
      }
      out.println("</table>");


      // cierre de la conexion
      conexion.close();
      
}
%>
 </body>