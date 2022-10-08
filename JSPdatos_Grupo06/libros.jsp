<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,net.ucanaccess.jdbc.*" %>
 <html>

 <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>Guía 52c, grupo 06</title>
   <link href="style/estilo.css" rel="stylesheet" type="text/css">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">


</head>

 <body>
   <p>
      <a href="javascript:location.reload()"><H1>MANTENIMIENTO DE LIBROS</H1></a>
      
      <div class="content">
         <table>
             <tr>
                 <th scope="col">Carnet</th>
                 <th scope="col">Apellidos</th>
                 <th scope="col">Nombres</th>
             </tr>
 
             <tr>
                 <td>EL19004 (Coordinador)</td>
                 <td>Efigenio Landaverde</td>
                 <td>Leonardo Alfredo</td>
             </tr>
             <tr>
                 <td>VR16021</td>
                 <td>Vasquez Rodriguez</td>
                 <td>Carlos Alonso</td>
             </tr>
             <tr>
                 <td>MT20015</td>
                 <td>Mancia Tejada</td>
                 <td>Wilfredo José</td>
             </tr>
             <tr>
                 <td>MR20084</td>
                 <td>Mejía Rodríguez</td>
                 <td>Julio César</td>
             </tr>
             <tr>
                 <td>NM19012</td>
                 <td>Nieto Molina</td>
                 <td>Anderson Levi</td>
             </tr>
             <tr>
                 <td>CD15015</td>
                 <td>Cardoza Diaz</td>
                 <td>Oswaldo Isaias</td>
             </tr>
             <tr>
                 <td>GC20029</td>
                 <td>Grande Chávez</td>
                 <td>Kevin Armando</td>
             </tr>
             <tr>
                 <td>RS20002</td>
                 <td>Rafaelano Santos</td>
                 <td>Carlos Eduardo</td>
             </tr>
             <tr>
                 <td>GC18090</td>
                 <td>Galdámez Canales</td>
                 <td>Miguel Angel</td>
             </tr>
         </table>
     </div>

      <h4>Esta página contiene los ejercicios 1, 2 y 4, para visualizar los<br>demás por favor utilice el siguiente índice:</h4>    

      <section class="container">
         <div class="item"><a href="ejercicio 3.jsp"><h5>Ejercicio 3</h5></a></div>
         <div class="item"><a href="ejercicio 5.jsp"><h5>Ejercicio 5</h5></a></div>
         <div class="item"><a href="ejercicio 6.jsp"><h5>Ejercicio 6</h5></a></div>
         <div class="item"><a href="ejercicio 7.jsp"><h5>Ejercicio 7</h5></a></div>
         <div class="item"><a href="ejercicio 8.jsp"><h5>Ejercicio 8</h5></a></div>
         <div class="item"><a href="ejercicio 9.jsp"><h5>Ejercicio 9</h5></a></div>
       </section>

      
   </p>

   <div class="content">
   <form action="matto.jsp" method="post" name="Actualizar"  class="formulario">
   <div class="content">
   <table>
   <tr>
      <td>ISBN:<input type="text" name="isbn" id="isbn" value="" size="40" placeholder="Ingrese ISBN" />
      </td>
   </tr>
   <tr>
      <td>Título: <input type="text" name="titulo" id="titulo" value="" size="41"placeholder="Ingrese título" id="Titulo" /></td>
   </tr>
   <tr>
      <td> Seleccione una acción: <input type="radio" name="Action" id="actualizar"  value="Actualizar" /> Actualizar
      <input type="radio" name="Action" id="eliminar" value="Eliminar" /> Eliminar
      <input type="radio" name="Action"  value="Crear" checked /> Crear
      </td>
      <td>
         <input type="SUBMIT" value="ACEPTAR"/>
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
public Connection getConnection(String path) throws SQLException {
String driver = "sun.jdbc.odbc.JdbcOdbcDriver";
String filePath= path+ "\\datos.mdb";
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
ServletContext context = request.getServletContext();
String path = context.getRealPath("/data");
Connection conexion = getConnection(path);
   if (!conexion.isClosed()){
out.write("");
 
      Statement st = conexion.createStatement();
      ResultSet rs = st.executeQuery("select * from libros" );

      // Ponemos los resultados en un table de html
      out.println("<table id='tabla_id' border=\"1\"><tr><th>Número</th><th>ISBN</th>"+"<th onclick='sortTable(1);'>"+"<a href=\'#!\'>"+"Titulo"+"</a> </th>");
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

<script>
   // JavaScript program to illustrate
   // Table sort for both columns and both directions.
   function sortTable(n) {
       var table;
       table = document.getElementById("tabla_id");
       var rows, i, x, y, count = 0;
       var switching = true;

       // Order is set as ascending
       var direction = "ascending";

       // Run loop until no switching is needed
       while (switching) {
           switching = false;
           var rows = table.rows;

           //Loop to go through all rows
           for (i = 1; i < (rows.length - 1); i++) {
               var Switch = false;

               // Fetch 2 elements that need to be compared
               x = rows[i].getElementsByTagName("TD")[n];
               y = rows[i + 1].getElementsByTagName("TD")[n];

               // Check the direction of order
               if (direction == "ascending") {

                   // Check if 2 rows need to be switched
                   if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase())
                       {
                       // If yes, mark Switch as needed and break loop
                       Switch = true;
                       break;
                   }
               } else if (direction == "descending") {

                   // Check direction
                   if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase())
                       {
                       // If yes, mark Switch as needed and break loop
                       Switch = true;
                       break;
                   }
               }
           }
           if (Switch) {
               // Function to switch rows and mark switch as completed
               rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
               switching = true;

               // Increase count for each switch
               count++;
           } else {
               // Run while loop again for descending order
               if (count == 0 && direction == "ascending") {
                   direction = "descending";
                   switching = true;
               }
           }
       }
   }
</script>

 </body>

