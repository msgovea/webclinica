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
			deleta.updateStatus(request.getParameter("deleta"), true);
	}
%>

<div class="right_col" role="main">
                <div class="">
                    <div class="page-title">
                        <div class="animated flipInY col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="tile-stats">
                                <div class="icon"><i class="fa fa-caret-square-o-right"></i>
                                </div>
                                <div class="count">Usuários Inativos</div>

                                <h3>Veja e edite usuários aqui</h3>
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
                                        	ListaAcessoDAO lista2 = new ListaAcessoDAO();
                                        	for (Acesso acesso : lista2.listaContas()) {
                                        		if (acesso.getStatus() == 1) {
                                        			String tipo = "";
                                        			switch (acesso.getAcesso()){
                                        			case 0:
                                        				tipo = "<button type=\"button\" class=\"btn btn-success btn-xs\">Paciente</button>";
                                        				break;
                                        			case 1:
                                        				tipo = "<button type=\"button\" class=\"btn btn-info btn-xs\">Funcionário</button>";
                                        				break;
                                        			case 2:
                                        				tipo = "<button type=\"button\" class=\"btn btn-warning btn-xs\">Saúde</button>";
                                        				break;
                                        			case 3:
                                        				tipo = "<button type=\"button\" class=\"btn btn-danger btn-xs\">DEVELOPER</button>";
                                        				break;
                                        			default :
                                        				tipo = "<button type=\"button\" class=\"btn btn-danger btn-xs\">ERRO</button>";
                                        			}
	                                        		out.print(
	                                        		"<tr class=\"even pointer\">\n" +
	                                                	"<td class=\"a-center \">\n" +
		                                                    "<a href=\"?pagina=alterarDados&id=" + acesso.getId() + "\" class=\"btn btn-info btn-xs\"><i class=\"fa fa-pencil\"></i></a>\n" +
		                                                    "<a href=\"?pagina=usuariosInativos&deleta="+ acesso.getId() +"\" class=\"btn btn-success btn-xs\"><i class=\"fa fa-check-circle-o\"></i></a>\n" +
		                                                "</td>\n" +
		                                                "<td>" + acesso.getId() + "</td>\n" +
		                                                "<td>" + acesso.getNome() + "</td>\n" +
		                                                "<td>" + acesso.getRg() + "</td>\n" +
		                                                "<td>" + acesso.getCpf() + "</td>\n" +
		                                                "<td>" + acesso.getNascimento() + "</td>\n" +
		                                                "<td>(" + acesso.getDdd() + ")" + acesso.getTelefone() + "</td>\n" +
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