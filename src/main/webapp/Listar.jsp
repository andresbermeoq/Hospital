<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="java.io.PrintWriter"%>
<%@page import="ec.edu.ups.model.Persona"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<c:set var="p" scope="request" value="${Persona}" />
	<% List<Persona> listapersona = (List<Persona>) request.getAttribute("Persona"); %>
	<% PrintWriter out2= response.getWriter();%>
	<table class='tg' style='width:25%'>
	    <tr>
	        <th class='tg-46ru'>IDPersona</th>
	        <th class='tg-46ru'>Nombre</th>
	        <th class='tg-46ru'>Apellido</th>
	        <th class='tg-46ru'>Cedula</th>
	        <th class='tg-46ru'>Direccion</th>
	        <th class='tg-46ru'>Telefono</th>
	        <th class='tg-46ru'>Correo</th>
	        <th class='tg-46ru'>rol</th>
	    </tr>
	
	    <% for (int i=0;i<listapersona.size();i++){
	    		Persona persona=listapersona.get(i);
	    		
		    		out.println("<tr><td class='tg-y698'>"+persona.getIDPersona()+"</td><td class='tg-y698'>"+persona.getNombres()+"</td><td" +
		    					" class='tg-y698'>"+persona.getApellidos()+"</td><td class='tg-y698'>"+persona.getCedula()+"</td><td class='tg-y698'>"+
		    					persona.getDireccion()+"</td><td class='tg-y698'>"+persona.getTelefono()+"</td><td class='tg-y698'>"
		    					+persona.getCorreo()+"</td><td class='tg-y698'>"+persona.getRol()+"</td>");
	    		
	    }
	    %>

	</table>
</body>
</html>