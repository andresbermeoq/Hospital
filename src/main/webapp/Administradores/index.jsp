<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="es">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="Author" content="Dreamer-1.">


<link rel="stylesheet"
	href="/Hospital/Administradores/css/bootstrap.css">
<link rel="stylesheet"
	href="/Hospital/Administradores/css/font-awesome.css">
<link rel="stylesheet" href="/Hospital/Administradores/css/index.css">
<link rel="stylesheet"
	href="/Hospital/Administradores/css/font-change.css">

<script type="text/javascript" src="js/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<title>- Administrador Hospital -</title>
</head>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">Administrador</a>
		</div>

		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/Hospital/Administradores/pacientesList.jsp"
					onclick="showAtRight('/Hospital/Administradores/pacientesList.jsp')"><i
						class="fa fa-users"></i> Lista de Pacientes</a></li>
				<li><a href="/Hospital/Administradores/doctoresList.jsp"
					onclick="showAtRight('/Hospital/Administradores/doctoresList.jsp')"><i
						class="fa fa-list-alt"></i> Lista de Doctores</a></li>
				<li><a href="/Hospital/Administradores/pacientesList.jsp"
					onclick="showAtRight('/Hospital/Administradores/secretariasList.jsp')"><i
						class="fa fa-list"></i> Lista de Secretarias</a></li>
				<li><a href="/Hospital/CerrarSesion">Cerrar Sesion</a></li>
			</ul>

		</div>
	</div>
	</nav>

	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<h1 class="page-header">
			<i class="fa fa-cog fa-spin"></i>&nbsp;Consola<small>&nbsp;&nbsp;&nbsp;Bienvenido
				al Sistema de Gestión Hospitalaria</small>
		</h1>
		<div id="content">

			<h4>
				<strong>Usuario: <%=session.getAttribute("persona")%></strong><br>
				<br>
			</h4>

		</div>
	</div>


	<script type="text/javascript">
		$(document).ready(function() {
			$('ul.nav > li').click(function(e) {
				$('ul.nav > li').removeClass('active');
				$(this).addClass('active');
			});
		});

		function executeScript(html) {

			var reg = /<script[^>]*>([^\x00]+)$/i;
			var htmlBlock = html.split("<\/script>");
			for ( var i in htmlBlock) {
				var blocks;
				if (blocks = htmlBlock[i].match(reg)) {
					var code = blocks[1].replace(/<!--/, '');
					try {
						eval(code)
					} catch (e) {
					}
				}
			}
		}
		function showAtRight(url) {
			var xmlHttp;

			if (window.XMLHttpRequest) {
				xmlHttp = new XMLHttpRequest();
			} else {
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			}

			xmlHttp.onreadystatechange = function() {

				if (xmlHttp.readyState == 4) {

					if (xmlHttp.status == 200) {
						document.getElementById("content").innerHTML = xmlHttp.responseText;
						executeScript(xmlHttp.responseText);
					} else if (xmlHttp.status == 404) {
						alert("ERROR  （ERROR：404 Not Found），……！");
						return;
					} else if (xmlHttp.status == 403) {
						alert("ERROR  （ERROR：403 Forbidden），……");
						return;
					} else {
						alert("ERROR   （ERROR：" + request.status + "），……");
						return;
					}
				}

			}
			xmlHttp.open("GET", url, true);
			xmlHttp.send();
		}
	</script>
</body>
</html>