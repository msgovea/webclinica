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
	int id2;
	if (request.getParameter("id") != null) {
		id2 = Integer.parseInt(request.getParameter("id"));
	} else {
		id2 = ((Acesso)session.getAttribute("user")).getId();
	}
		
	if(request.getParameter("deleta") != null){
		UpdateDAO deleta = new UpdateDAO();
		deleta.updateStatus(""+id2, false);
		response.sendRedirect("index.jsp?sair=logoff");
	}
	
		ListaAcessoDAO edit2 = new ListaAcessoDAO();
		Acesso esse2 = edit2.selecionaAcesso(edit2.selectAcesso(id2));

	%>
			<div class="right_col" role="main">
                <div class="">
                    <div class="page-title">
                        <div class="animated flipInY col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="tile-stats">
                                <div class="icon"><i class="fa fa-caret-square-o-right"></i>
                                </div>
                                <div class="count">Excluir Perfil</div>

                                <h3>Tem certeza que deseja excluir seu perfil?</h3>
                            </div>
                       	</div>
                    </div>
                    <div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
                			<div class="x_panel">
                    			<div class="x_content">
                        			<p align="center"> 
                       					<br><a href="?pagina=excluirPerfil&deleta=true"><button class="btn btn-success">Confirmar Exclusão</button></a>  
                            		</p>
								</div>
							</div>
						</div>
					</div>
                    <div class="clearfix"></div>

                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_content">

                                    <form method="post" action="#" class="form-horizontal form-label-left" novalidate>

                                      
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name" >ID <span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="name" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="1" name="id" value="<%= esse2.getId() %>" type="text" disabled>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name" >Nome <span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="name" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="1" name="nome" value="<%= esse2.getNome() %>" placeholder="Digite seu nome" required="required" type="text" disabled>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name" >CPF <span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="cpf" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="1" name="cpf" value="<%= esse2.getCpf() %>" placeholder="Digite seu CPF" required="required" type="text" disabled>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name" >RG <span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="rg" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="1" name="rg" value="<%= esse2.getRg() %>" placeholder="Digite seu RG" required="required" type="text" disabled>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name" >CEP <span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="cep" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="1" name="cep" value="<%= esse2.getCep() %>" placeholder="Digite seu CEP" required="required" type="text" disabled>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name" >Data Nascimento <span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="name" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="1" name="nascimento" value="<%= esse2.getNascimento() %>" required="required" type="date" disabled>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name" >Complemento <span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="name" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="1" name="complemento" value="<%= esse2.getComplemento() %>" placeholder="Digite o complemento" required="required" type="text" disabled>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">Numero <span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="number" id="number" name="numero" required="required" data-validate-minmax="0,9999"  value="<%= esse2.getNumero() %>" class="form-control col-md-7 col-xs-12" disabled>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name" >Telefone <span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="telefonemask" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="1" name="telefone" value="<%= "(" + esse2.getDdd() + ")" + esse2.getTelefone() %>" placeholder="Digite seu telefone" required="required" type="text" disabled>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name" >Recuperação de Senha <span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="name" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="1" name="recsenha" value="<%= esse2.getRecsenha() %>" placeholder="Digite uma nova recuperação de senha" required="required" type="text" disabled>
                                            </div>
                                        </div>
                                        
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- footer content -->
            