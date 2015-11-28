<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	if (session.getAttribute("login") == null && session.getAttribute("senha") == null) {
		//out.print("<script>confirm(\"Acesso não autorizado, realize o Login \");</script>");
		response.sendRedirect("../index.jsp");
	}
%>