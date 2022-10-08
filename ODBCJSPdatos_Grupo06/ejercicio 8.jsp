<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,net.ucanaccess.jdbc.*" %>
 <html>

 <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>Actualizar, Eliminar, Crear registros.</title>
   <link href="style/ejercicio 8-estilo.css" rel="stylesheet" type="text/css">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
 </head>


 <body>
   <p>
      <H1>Ejercicio 8</H1>
   <a href="libros.jsp"><H3>Regresar a la página principal.</H3></a>   
      
   </p>
   <div class="cuerpo">
   <form action="ejercicio 8-matto.jsp" method="post" name="Actualizar"  class="formulario">
   <div class="form">
   <table>
   <tr>
      <td>ISBN<input type="text" name="isbn" id="isbn" value="" size="40" placeholder="Ingrese ISBN" class="form-control"/>
      </td>
   </tr>
   <tr>
      <td>Título<input type="text" name="titulo" id="titulo" value="" size="50"placeholder="Ingrese título" id="Titulo" class="form-control"/></td>
   </tr>
   <tr>
      <td>Autor<input type="text" name="autor" value="" size="50" placeholder="Ingrese autor" id="Autor" class="form-control"/></td>
   </tr>
   <tr>
      <a href=”listado-csv.jsp” download=”listado.csv”>Descargar Listado</a>
   </tr>
   <tr>
      <td> Seleccione una acción: <input type="radio" name="Action" id="actualizar"  value="Actualizar" /> Actualizar
      <input type="radio" name="Action" id="eliminar" value="Eliminar" /> Eliminar
      <input type="radio" name="Action"  value="Crear" checked /> Crear
      </td>
      <td><input type="SUBMIT" value="ACEPTAR"/>
      </td>
   </tr>
   </form>
   </tr>
   </table>
   </div>
   </form>
   <br><br>
<script src="js/libro.js"></script>
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
   if (!conexion.isClosed()){
out.write("");
 
      Statement st = conexion.createStatement();
      ResultSet rs = st.executeQuery("select * from libros" );

      // Ponemos los resultados en un table de html
      out.println("<table border=\"1\"><tr><td>Núm.</td><td>ISBN</td><td>Título</td><td>Acción</td></tr>");
      int i=1;
      while (rs.next())
      {
         String opcion = rs.getString("isbn");
         String tituloC = rs.getString("titulo");
         %>
      <tr>
         <td><%=i%></td>
         <td><%=opcion%></td>
         <td><%=tituloC%></td>
         <td> 
           
               <input type='text' name="isbn-<%=i%>" id="isbn-<%=i%>" size='40' value="<%=opcion%>" hidden/>
               <input type='text' name="titulo-<%=i%>" id="titulo-<%=i%>" size='40' value="<%=tituloC%>" hidden/>
               <input type='button' value='Actualizar' onclick='validateFormOnSubmit("<%=i%>")'>
               <input type='button' value='Eliminar' onclick='validateFormOnSubmit2("<%=i%>")'>
         </td>
         
      </tr>
   
         <%
         i++;
      }
      out.println("</table>");

      // cierre de la conexion
      conexion.close();
   
}

%>
<script type="text/javascript">
   MyFunction = function(isbn){
      alert(isbn)
   }
   function validateFormOnSubmit(theForm) {
      var str = document.getElementById("isbn-"+theForm).value;
      var str2 = document.getElementById("titulo-"+theForm).value;
      document.getElementById('isbn').value = str;
      document.getElementById('titulo').value = str2;
      document.getElementById('actualizar').checked = true;
}
</script>

<script type="text/javascript">
   MyFunction = function(isbn){
      alert(isbn)
   }
   function validateFormOnSubmit2(theForm) {
      var str = document.getElementById("isbn-"+theForm).value;
      var str2 = document.getElementById("titulo-"+theForm).value;
      document.getElementById('isbn').value = str;
      document.getElementById('titulo').value = str2;
      document.getElementById('eliminar').checked = true;
}
</script>

 </body>
