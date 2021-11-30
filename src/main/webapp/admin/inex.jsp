<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">   <%--  Ejecute el último modo de renderizado en IE --%>
        <meta name="viewport" content="width=device-width, initial-scale=1">   <%--  Inicializar la pantalla de navegación móvil --%>
        <meta name="Author" content="Dreamer-1.">
        
        <!--  Introducir varias hojas de estilo CSS -->
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/font-awesome.css">
        <link rel="stylesheet" href="css/index.css">    <!--  Modificado del Bootstrap Demon oficial, puede personalizar el estilo CSS de acuerdo con sus preferencias -->
        <link rel="stylesheet" href="css/font-change.css">    <!--  Cambie la fuente predeterminada de Times New Roman a Microsoft Yahei (personalmente, como Microsoft Yahei, el efecto de visualización del terminal móvil y el terminal de escritorio es similar) -->        
        
        <script type="text/javascript" src="js/jquery-1.12.3.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
    
        <title>-Sistema de gestión de backstage-</title>
    </head>
    
    <body>
    <!--  Menú superior (del Demon oficial de bootstrap) =================================== -->
        <nav class="navbar navbar-inverse navbar-fixed-top">
              <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" >
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                      <a class="navbar-brand" href="index.jsp">Hospital.com</a>
                </div>
                
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">                        
                        <li><a href="###" onclick="showAtRight('userList.jsp')"><i class="fa fa-users"></i>  Lista de usuarios</a></li>    
                        <li><a href="###" onclick="showAtRight('productList.jsp')"><i class="fa fa-list-alt"></i>  Lista de productos</a></li>
                        <li><a href="###" onclick="showAtRight('recordList.jsp')" ><i class="fa fa-list"></i>  Lista de orden</a></li>    
                    </ul>
                      
                </div>
              </div>
        </nav>

    <!--  Opciones de menú a la izquierda ======================================== -->
        <div class="container-fluid">
            <div class="row-fluie">
                <div class="col-sm-3 col-md-2 sidebar">        
                    <ul class="nav nav-sidebar">
                        <!--  Un menú  -->
                        <li class="active"><a href="#userMeun" class="nav-header menu-first collapsed" data-toggle="collapse">
                            <i class="fa fa-user"></i>&nbsp;  Gestión de usuarios  <span class="sr-only">(current)</span></a>
                        </li> 
                        <!--  Menú secundario  -->
                        <!--  Tenga en cuenta que el contenido de href = "# ……" en la etiqueta <a> en el menú de primer nivel debe ser coherente con el contenido de id = "..." en la etiqueta <ul> del menú de segundo nivel -->
                        <ul id="userMeun" class="nav nav-list collapse menu-second">
                            <li><a href="###" onclick="showAtRight('userList.jsp')"><i class="fa fa-users"></i>  Lista de usuarios</a></li>
                        </ul>
                         
                        <li><a href="#productMeun" class="nav-header menu-first collapsed" data-toggle="collapse">
                            <i class="fa fa-globe"></i>&nbsp;  Gestión de producto <span class="sr-only">(current)</span></a>
                        </li> 
                        <ul id="productMeun" class="nav nav-list collapse menu-second">
                            <li><a href="###" onclick="showAtRight('productList.jsp')"><i class="fa fa-list-alt"></i>  Lista de productos</a></li>
                        </ul>
                        
                        <li><a href="#recordMeun" class="nav-header menu-first collapsed" data-toggle="collapse">
                            <i class="fa fa-file-text"></i>&nbsp;  Gestión de pedidos <span class="sr-only">(current)</span></a>
                        </li> 
                        <ul id="recordMeun" class="nav nav-list collapse menu-second">
                            <li><a href="###" onclick="showAtRight('recordList.jsp')" ><i class="fa fa-list"></i>  Lista de orden</a></li>
                        </ul>
                            
                    </ul>
                    
                </div>
            </div>
        </div>

<!--  Se muestra el contenido del lado derecho =========================================== ====   -->           
                 <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                    <h1 class="page-header"><i class="fa fa-cog fa-spin"></i>&nbsp;Consola<small>&nbsp;&nbsp;&nbsp;Bienvenido a utilizar el sistema de gestión de antecedentes XXX</small></h1>
                        
                        <!--  Cargue el contenido de la página jsp (o html, etc.) señalada por el menú de la izquierda -->
                          <div id="content">
               
                               <h4>                    
                                   <strong>orientación del usuario:</strong><br>
                                   <br><br>Contenido de página predeterminado ...
                               </h4>                                 
                              
                          </div>  
                </div> 
        
        
        <script type="text/javascript">
        
        /*
                   * Activar el estado activo para la etiqueta seleccionada y cancelar el estado activo para la etiqueta que estaba previamente en el estado activo pero que no se seleccionó después
                   * (Date cuenta del efecto de cambiar de color después de hacer clic en la etiqueta en el menú de la izquierda)
         */
        $(document).ready(function () {
            $('ul.nav > li').click(function (e) {
                //e.preventDefault (); Agregue esta oración, la etiqueta <a> de la navegación no será válida
                $('ul.nav > li').removeClass('active');
                $(this).addClass('active');
            });
        });
        
        /*
                   * Solución al javascript en la página devuelta por ajax:
                   * Extraiga todos los scripts en xmlHttp.responseText, no importa cuántos bloques de script contenga el HTML cargado por AJAX, podemos llamar al método eval para ejecutarlo en el bloque de script encontrado
         */
        function executeScript(html)
        {
            
            var reg = /<script[^>]*>([^\x00]+)$/i;
            //Divida todo el fragmento HTML por <\ / script>
            var htmlBlock = html.split("<\/script>");
            for (var i in htmlBlock) 
            {
                var blocks;//La matriz de contenido que coincide con la expresión regular, blocks [1] es el contenido real del script, porque usamos paréntesis para capturar la agrupación en la definición de registro anterior.
                if (blocks = htmlBlock[i].match(reg)) 
                {
                    //Borre cualquier marca de comentario que pueda existir. Para el final del comentario -> puede ignorar el procesamiento, y eval puede funcionar normalmente.
                    var code = blocks[1].replace(/<!--/, '');
                    try 
                    {
                        eval(code) //Ejecutar script
                    } 
                    catch (e) 
                    {
                    }
                }
            }
        }
        
        /*
                   * Use div para lograr el clic izquierdoMostrar a la derechaEl efecto de (mostrar contenido con div con id = "content")
                   * Nota:
                   * ①: La dirección de la página web obtenida por js se obtiene en relación con la página web actual y no se reconoce el directorio raíz;
                   * ②: Si hay CSS en la página de visualización de contenido cargada a la derecha, debe colocarse en la página de inicio (index.jsp en el ejemplo) para que funcione.
                   * (Si simplemente incluye entre dos páginas, el css y js de la subpágina se pueden ejecutar en la subpágina. La página principal también puede llamar al js de la subpágina. Pero se debe considerar el orden de js y la representación en la página)
        */
        function showAtRight(url) {
            var xmlHttp;
            
            if (window.XMLHttpRequest) {
                // code for IE7+, Firefox, Chrome, Opera, Safari
                xmlHttp=new XMLHttpRequest();    //Crear objeto XMLHttpRequest
            }
            else {
                // code for IE6, IE5
                xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
            }
        
            xmlHttp.onreadystatechange=function() {        
                //onreadystatechange: llama al último método cuando cambia el estado listo
                
                if (xmlHttp.readyState == 4) {
                    //xmlHttp.readyState == 4    ——    finished downloading response
                    
                    if (xmlHttp.status == 200) {
                        //xmlHttp.status == La retroalimentación de 200 servidores es normal            
                        
                        document.getElementById("content").innerHTML=xmlHttp.responseText;    //Restablezca el contenido en el div con id = "content" en la página
                        executeScript(xmlHttp.responseText);    //Ejecute la función de JavaScript contenida en el contenido de la página devuelto por el servidor
                    }
                    //Manejo del estado de error
                    else if (xmlHttp.status == 404){
                        alert("Algo salió mal☹ (código de error: 404 No encontrado), ......!"); 
                        /*  Manejo de 404 */
                        return;
                    }
                    else if (xmlHttp.status == 403) {  
                        alert("Algo salió mal☹ (código de error: 403 Prohibido), ..."); 
                        /*  Tratamiento de 403  */ 
                        return;
                    }
                    else {
                        alert("Algo salió mal☹ (código de error:" + request.status + "），……"); 
                        /*  Manejo de errores indicados por otros códigos de error   */
                        return;
                    }   
                } 
                    
              }
            
            //Envíe la solicitud al archivo especificado en el servidor (el archivo al que apunta la URL) para su procesamiento.
            xmlHttp.open("GET", url, true);        //verdadero significa procesamiento asincrónico
            xmlHttp.send();
        }        
        </script>
    
    </body>
</html>