<%@page import="model.MarcaConsultaDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
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
                                
                                        <%
                                        	ListaDisponibilidadeDAO lista2 = new ListaDisponibilidadeDAO();
                                        	ArrayList<Disponibilidade> listaDisponibilidades = lista2.listaContas(especialidade);
                                        	if (listaDisponibilidades.size() == 0) {
                                        		out.print("<h3>Nenhum profissional disponivel para essa especialidade nos próximos 90 dias</h3>");
                                        	}else {
                                        		%>
                                <div class="x_content">
                                    <table id="example" class="table table-striped responsive-utilities jambo_table">
                                        <thead>
                                            <tr class="headings">
                                                <th># </th>
                                                <th>ID </th>
                                                <th>Nome Doutor </th>
                                                <th>Data </th>
                                                <th>Hora Inicio </th>
                                                <th>Hora Fim </th>
                                                <th>IdClasse </th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                        <%
	                                        	for (Disponibilidade disponibilidade : listaDisponibilidades) {
	                                        		if (disponibilidade.getLivre() == 1) {
	                                        			String tipo = "";
	                                        			
	                                        				tipo = "<button type=\"button\" class=\"btn btn-success btn-xs\">Paciente</button>";
	                                        				tipo = "<button type=\"button\" class=\"btn btn-info btn-xs\">Funcionário</button>";
	                                        				tipo = "<button type=\"button\" class=\"btn btn-warning btn-xs\">Saúde</button>";
	                                        				tipo = "<button type=\"button\" class=\"btn btn-danger btn-xs\">DEVELOPER</button>";
	                                        				tipo = "<button type=\"button\" class=\"btn btn-danger btn-xs\">ERRO</button>";
	                                        			
	                                       				String dataFormatada = new SimpleDateFormat("dd/MM/yyyy").format(disponibilidade.getDiaDaSemana());
		                                        		out.print(
		                                        		"<tr class=\"even pointer\">\n" +
		                                                	"<td class=\"a-center \">\n" +
			                                                    "<a onclick=\"paginaAjax('buscaEspecialidade.jsp?tipo=marcar&paciente="+ ((Acesso)session.getAttribute("user")).getId() +"&disponibilidade="+ disponibilidade.getId() +"', 'marcar')\" class=\"btn btn-info btn-xs\"><i class=\"fa fa-pencil\"></i> Marcar</a>\n" +
			                                                "</td>\n" +
			                                                "<td>" + disponibilidade.getId() + "</td>\n" +
			                                                "<td>" + disponibilidade.getNome() + "</td>\n" +
			                                                "<td>" + dataFormatada + "</td>\n" +
			                                                "<td>" + disponibilidade.getInicio() + "</td>\n" +
			                                                "<td>" + disponibilidade.getFim() + "</td>\n" +
			                                                "<td>" + disponibilidade.getIdClasse() + "</td>\n" +
		                                            	"</tr>");
	                                        		}
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
           	<%} else if (request.getParameter("tipo").equals("marcar")) {
			String paciente = request.getParameter("paciente") == null ? "" : request.getParameter("paciente"); 
			String disponibilidade = request.getParameter("disponibilidade") == null ? "" : request.getParameter("disponibilidade"); 
			MarcaConsultaDAO marcaConsulta = new MarcaConsultaDAO();
			boolean sucesso = marcaConsulta.marcaConsulta(Integer.parseInt(paciente), Integer.parseInt(disponibilidade));
			%> 
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<% out.print(sucesso ? "Consulta marcada com sucesso !!" : "Erro ao marcar consulta, tente novamente ou entre em contato conosco!!"); %>
				</div>
			</div>
			<%}%>

