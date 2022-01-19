<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<section id="listar">

<div>
<div>
<div>
<div>
<div>
<div>
<div></div>

<h4> Lista de Personas</h4>
</div>
<table>
<thead>
<tr>
<th>Nombre</th>
<th>Apellido</th>
<th>Cedula</th>
<th>Direccion</th>
<th>Telefono</th>
<th>Correo</th>
<th>rol</th>
</tr>
<tbody>
<form action="/Hospital/ListarPersona"method="get">
<c:forEach var="listarpersonas" items="${Persona}">
<tr>
<td>${persona.nombre} </td>
<td>${persona.apellido} </td>
<td>${persona.cedula} </td>
<td>${persona.direccion} </td>
<td>${persona.telefono} </td>
<td>${persona.correo} </td>
<td>${persona.rol} </td>
</tr>
</c:forEach>
</form>

</tbody>
</table>

</section>