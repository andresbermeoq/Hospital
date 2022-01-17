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
<c:forEach var="listarpersonas" items="${perosnaslist}">
<tr>
<td>${usuario.nombre} </td>
<td>${usuario.apellido} </td>
<td>${usuario.cedula} </td>
<td>${usuario.direccion} </td>
<td>${usuario.telefono} </td>
<td>${usuario.correo} </td>
<td>${usuario.rol} </td>
</tr>
</c:forEach>
</tbody>
</table>

</section>