<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import ="java.sql.*,
				bd.*,
				conexao.Conexao,
				logicalView.*,
				model.*,
				java.util.*"
%>

<%
	if(request.getParameter("deleta") != null){
			UpdateDAO deleta = new UpdateDAO();
			if (deleta.deletaConsulta(request.getParameter("deleta")))
				out.print("<script>alert(\"Consulta Desmarcada com sucesso !!\")</script>");
			else
				out.print("<script>alert(\"Erro ao desmarcar consulta, tente novamente ou nos ligue !!\")</script>");
	}
%>

<div class="right_col" role="main">
                <div class="">
                    <div class="page-title">
                   		<div class="animated flipInY col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="tile-stats">
                                <div class="icon"><i class="fa fa-caret-square-o-right"></i>
                                </div>
                                <div class="count">Observações e Informações</div>

                                <h3>Observações e informações sobre suas consultas já realizadas</h3>
                            </div>
                       	</div>
                    </div>
                    <div class="clearfix"></div>

                    <div class="row">

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                
                                <div class="x_content">
                                    <table id="example" class="table table-striped responsive-utilities jambo_table">
                                        <thead>
                                            <tr class="headings">
                                                <th># </th>
                                                <th>ID </th>
                                                <th>Data </th>
                                                <th>Inicio </th>
                                                <th>Fim </th>
                                                <th>Nome Doutor </th>
                                                <th>Especialidade </th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                        
                                        <%
                                        	ListaConsultasDAO listaConsultas2 = new ListaConsultasDAO();
                                        	for (Consulta acesso : listaConsultas2.listaConsultas(((Acesso)session.getAttribute("user")).getId())) {
                                        		String atual = new SimpleDateFormat("dd/MM/yyyy").format(Calendar.getInstance().getTime());
                                        		int ocorreu = Calendar.getInstance().getTime().compareTo(acesso.getData());
                                        		String desabilitado;
                                        		if (ocorreu < 0)
                                        		{
                                        			continue;
                                        		}

                                        		String dataFormatada = new SimpleDateFormat("dd/MM/yyyy").format(acesso.getData());
                                        		out.print(
                                        		"<tr class=\"even pointer\">\n" +
                                                	"<td class=\"a-center \">\n" +
	                                                    "<a href=\"?pagina=observacaoConsulta&consulta="+ acesso.getId() +"\" class=\"btn btn-info btn-xs\"><i class=\"fa fa-info\"></i> Informações</a>\n" +
	                                                "</td>\n" +
	                                                "<td>" + acesso.getId() + "</td>\n" +
	                                                "<td>" + dataFormatada + "</td>\n" +
	                                                "<td>" + acesso.getInicio() + "</td>\n" +
	                                                "<td>" + acesso.getFim() + "</td>\n" +
	                                                "<td>" + acesso.getNomeMedico() + "</td>\n" +
	                                                "<td>" + acesso.getNomeEspecialidade() + "</td>\n" +
                                            	"</tr>");
                                        		
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