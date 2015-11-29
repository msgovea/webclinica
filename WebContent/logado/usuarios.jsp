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
                            <h3>Contas Inativas</h3>
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
                                        	for (Acesso acesso : lista2.selectAcesso()) {
                                        		if (acesso.getStatus() == 1) {
	                                        		out.print(
	                                        		"<tr class=\"even pointer\">\n" +
	                                                "<td class=\"a-center \">\n" +
	                                                    "<a class=\"btn btn-info btn-xs\"><i class=\"fa fa-pencil\"></i></a>\n" +
	                                                    "<a class=\"btn btn-success btn-xs\"><i class=\"fa fa-check-circle-o\"></i></a>\n" +
	                                                "</td>\n" +
	                                                "<td>" + acesso.getId() + "</td>\n" +
	                                                "<td>" + acesso.getLogin() + "</td>\n" +
	                                                "<td>37.266.454-4</td>\n" +
	                                                "<td>230.625.138-02</td>\n" +
	                                                "<td>14/11/1996</td>\n" +
	                                                "<td>(19)981407342</td>\n" +
	                                                "<td><button type=\"button\" class=\"btn btn-success btn-xs\">Paciente</button> </td>\n" +
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