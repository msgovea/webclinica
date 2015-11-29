<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import ="java.sql.*,
				bd.*,
				conexao.Conexao,
				logicalView.*,
				model.*,
				java.util.*"
%>
<div class="right_col" role="main">
                <div class="">
                    <div class="page-title">
                        <div class="title_left">
                            <h3>Contas ativas</h3>
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
                                        	ListaAcessoDAO lista = new ListaAcessoDAO();
                                        	for (Acesso acesso : lista.listaContas()) {
                                        		if (acesso.getStatus() == 0) {
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
                                        				tipo = "<button type=\"button\" class=\"btn btn-info btn-xs\">Funcionário</button>";
                                        				break;
                                        			case 4:
                                        				tipo = "<button type=\"button\" class=\"btn btn-warning btn-xs\">Saúde</button>";
                                        				break;
                                        			default :
                                        				tipo = "<button type=\"button\" class=\"btn btn-danger btn-xs\">ERRO</button>";
                                        			}
	                                        		out.print(
	                                        		"<tr class=\"even pointer\">\n" +
	                                                	"<td class=\"a-center \">\n" +
		                                                    "<a href=\"?pagina=alterarDados&id=" + acesso.getId() + "\" class=\"btn btn-info btn-xs\"><i class=\"fa fa-pencil\"></i></a>\n" +
		                                                    "<a class=\"btn btn-danger btn-xs\"><i class=\"fa fa-trash-o\"></i></a>\n" +
		                                                "</td>\n" +
		                                                "<td>" + acesso.getId() + "</td>\n" +
		                                                "<td>" + acesso.getNome() + "</td>\n" +
		                                                "<td>" + acesso.getRg() + "</td>\n" +
		                                                "<td>" + acesso.getCpf() + "</td>\n" +
		                                                "<td>" + acesso.getNascimento() + "</td>\n" +
		                                                "<td>(19)981407342</td>\n" +
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