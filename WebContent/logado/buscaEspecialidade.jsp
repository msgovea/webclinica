<%@page import="logicalView.Disponibilidade"%>
<%@page import="model.ListaDisponibilidadeDAO"%>
<%@page import="logicalView.Acesso"%>
<%@page import="model.ListaAcessoDAO"%>
<%@page import="logicalView.Especialidades"%>
<%@page import="model.EspecialidadesDAO"%>
<%@page import="java.util.*"%>
<%@page import="model.ProfissoesDAO"%>
<%@page import="logicalView.Profissoes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<script type="text/javascript" src="ajax.js"></script>
<script type="text/javascript" src="jquery-1.3.2.js"></script>

<%            
            Thread.sleep(1);

            EspecialidadesDAO especialidadesDAO = new EspecialidadesDAO();
            List<Especialidades> especialidades = especialidadesDAO.selectProfissoes();

            if (request.getParameter("tipo").equals("estado")) {
                String estado = request.getParameter("estado") == null ? "" : request.getParameter("estado");                

%>
                
                <select class="form-control" id="txtCid" name="txtCidade" 
                onchange="paginaAjax('buscaEspecialidade.jsp?tipo=testeBotao&profissao=<%= estado %>&especialidade='+this.value, 'botao')" >
                        <option disabled selected>Escolha uma Especialidade</option>
                        <option disabled>---------------------</option>
 <%

                    for (Especialidades e : especialidades) {
                    	String idProf = String.valueOf(e.getIdProfissao());
                    	if (idProf.equals(estado)) { %>
                        <option value="<%= e.getId() %>"><%= e.getNome() %></option>
						<%}
                    }%>

								</select>

			<%} else if (request.getParameter("tipo").equals("testeBotao")) {
				String profissao = request.getParameter("profissao") == null ? "" : request.getParameter("profissao"); 
				String especialidade = request.getParameter("especialidade") == null ? "" : request.getParameter("especialidade"); 
			%>
            	<!--  início -->
                <div class="">
                    <div class="page-title">
                        <div class="animated flipInY col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="tile-stats">
                                <div class="icon"><i class="fa fa-caret-square-o-right"></i>
                                </div>
                                <div class="count">Profissionais Disponiveis</div>

                                <h3>Selecione o profissional e horario que lhe agrada</h3>
                            </div>
                       	</div>
                    </div>
                    <div class="row">

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                
                                <div class="x_content">
                                    <table id="example" class="table table-striped responsive-utilities jambo_table">
                                        <thead>
                                            <tr class="headings">
                                                <th># </th>
                                                <th>ID </th>
                                                <th>Nome </th>
                                                <th>RG </th>
                                                <th>CPF </th>
                                                <th>Nascimento </th>
                                                <th>Telefone </th>
                                                <th style="width: 3%">Conta</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                        
                                        <%
                                        	ListaDisponibilidadeDAO lista2 = new ListaDisponibilidadeDAO();
                                        	for (Disponibilidade disponibilidade : lista2.listaContas()) {
                                        		if (disponibilidade.getLivre() == 1) {
                                        			String tipo = "";
                                        			
                                        				tipo = "<button type=\"button\" class=\"btn btn-success btn-xs\">Paciente</button>";
                                        				tipo = "<button type=\"button\" class=\"btn btn-info btn-xs\">Funcionário</button>";
                                        				tipo = "<button type=\"button\" class=\"btn btn-warning btn-xs\">Saúde</button>";
                                        				tipo = "<button type=\"button\" class=\"btn btn-danger btn-xs\">DEVELOPER</button>";
                                        				tipo = "<button type=\"button\" class=\"btn btn-danger btn-xs\">ERRO</button>";
                                        			
	                                        		out.print(
	                                        		"<tr class=\"even pointer\">\n" +
	                                                	"<td class=\"a-center \">\n" +
		                                                    "<a href=\"?pagina=alterarDados&id=" + 1 + "\" class=\"btn btn-info btn-xs\"><i class=\"fa fa-pencil\"></i></a>\n" +
		                                                "</td>\n" +
		                                                "<td>" + disponibilidade.getId() + "</td>\n" +
		                                                "<td>" + disponibilidade.getNome() + "</td>\n" +
		                                                "<td>" + disponibilidade.getDiaDaSemana() + "</td>\n" +
		                                                "<td>" + disponibilidade.getInicio() + "</td>\n" +
		                                                "<td>" + disponibilidade.getFim() + "</td>\n" +
		                                                "<td>" + 123 + "</td>\n" +
		                                                "<td>" + tipo + " </td>\n" +
	                                            	"</tr>");
                                        		}
                                        	}
                                        	%>  
                                        </tbody>

                                    </table>
                                </div>
                            </div>
                        </div>

                        <br />
                        <br />
                        <br />

                    </div>
                </div>
            	<!--  fimm -->	 
                 <button id="send" type="submit" class="btn btn-success">Enviar</button>
			<%}%>

