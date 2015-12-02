<%-- 
    Document   : cidade
    Created on : 10/02/2010, 22:11:05
    Author     : jabes
--%>


<%@page import="model.ProfissoesDAO"%>
<%@page import="logicalView.Profissoes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.*, conexao.Cidade" %>

<script type="text/javascript" src="ajax.js"></script>
<script type="text/javascript" src="jquery-1.3.2.js"></script>

<%            
            Thread.sleep(1000);
            response.setContentType("text/html");
            response.setHeader("Cache-Control", "no-cache");

            ProfissoesDAO profissoesDAO = new ProfissoesDAO();
            List<Profissoes> profissoes = profissoesDAO.selectProfissoes();

            if (request.getParameter("tipo").equals("estado")) {
                String estado = request.getParameter("estado") == null ? "" : request.getParameter("estado");                

%>
                <b>Cidades:</b> <select id="txtCid" name="txtCidade" >
                        <option>Escolha uma Cidade</option>
                        <option>---------------------</option>
 <%

                    for (Profissoes p : profissoes) {
                    	String idProf = String.valueOf(p.getId());
                        if (idProf.equals(estado)) {                            
 %>
                            <option value="<%= p.getId() %>"><%= p.getId() %></option>
 <%       
                        }
                    }
 %>

</select>

<%                
            } %>

