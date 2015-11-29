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
                            <h3>Usuários Cadastrados</h3>
                        </div>

                        <div class="title_right">
                            <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Pesquise por...">
                                    <span class="input-group-btn">
                            <button class="btn btn-default" type="button">Pesquisar</button>
                        </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Usuários</h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">

                                    
                                    <!-- start project list -->
                                    <table class="table table-striped projects">
                                        <thead>
                                            <tr>
                                                <th style="width: 1%">#</th>
                                                <th style="width: 25%">Nome</th>
                                                <th>Login</th>
                                                <th>Acesso</th>
                                                <th>Status</th>
                                                <th style="width: 22%">Ações</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<%
                                        	ListaAcessoDAO lista = new ListaAcessoDAO();
                                        	for (Acesso acesso : lista.selectAcesso()) {
                                        		
                                        		out.print(
                                        		"<tr>\n" + 
                                                "<td>" + acesso.getId() + "</td>\n" +
                                                "<td>\n" +
                                                    "<a>Mateus Sauer Govêa</a>\n" +
                                                    "<br />\n" +
                                                    "<small>Criado em 01.01.2015</small>\n" +
                                                "</td>\n" +
                                                "<td>\n" +
                                                    "<a>" + acesso.getLogin() +"</a>\n" +
                                                "</td>\n" +
                                                "<td>\n" +
                                                    "<button type=\"button\" class=\"btn btn-success btn-xs\">Paciente</button>\n" +
                                                "</td>\n" +
                                                "<td>\n" +
                                                    "<button type=\"button\" class=\"btn btn-danger btn-xs\">Ativa</button>\n" +
                                                "</td>\n" +
                                                "<td>\n" +
                                                    "<a class=\"btn btn-primary btn-xs\"><i class=\"fa fa-folder\"></i> Ver </a>\n" +
                                                    "<a class=\"btn btn-info btn-xs\"><i class=\"fa fa-pencil\"></i> Editar </a>\n" +
                                                    "<a class=\"btn btn-danger btn-xs\"><i class=\"fa fa-trash-o\"></i> Deletar </a>\n" +
                                                "</td>\n" +
                                            "</tr>\n");
                                        	
                                        	}
                                        	%>                                            
                                        </tbody>
                                    </table>
                                    <!-- end project list -->

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
