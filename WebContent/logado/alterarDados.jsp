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

<%
	int id;
	if (request.getParameter("id") != null) {
		id = Integer.parseInt(request.getParameter("id"));
	} else {
		id = ((Acesso)session.getAttribute("user")).getId();
	}
		
	if (request.getParameter("nome")		!= null &&
   		request.getParameter("rg")			!= null &&
   		request.getParameter("cep")			!= null &&
   		request.getParameter("nascimento")	!= null &&
   		request.getParameter("cpf")			!= null &&
		request.getParameter("complemento")	!= null &&
		request.getParameter("numero")		!= null &&
		request.getParameter("telefone")	!= null &&
		request.getParameter("recsenha")	!= null) 
   	{
   		if (	!request.getParameter("nome")		.equals("") &&
		   		!request.getParameter("rg")			.equals("") &&
		   		!request.getParameter("cep")		.equals("") &&
		   		!request.getParameter("nascimento")	.equals("") &&
		   		!request.getParameter("cpf")		.equals("") &&
				!request.getParameter("complemento").equals("") &&
				!request.getParameter("numero")		.equals("") &&
				!request.getParameter("telefone")	.equals("") &&
				!request.getParameter("recsenha")	.equals(""))
   		{
   			
   			UpdateDAO update = new UpdateDAO();
   			Acesso acces = new Acesso();
   			acces.setRecsenha(request.getParameter("recsenha"));
   			acces.setSenha(request.getParameter("senha"));
   			acces.setNome(request.getParameter("nome"));
   			acces.setCpf(request.getParameter("cpf"));
   			acces.setRg(request.getParameter("rg"));
   			acces.setCep(request.getParameter("cep"));
   			acces.setNascimento(request.getParameter("nascimento"));
   			acces.setComplemento(request.getParameter("complemento"));
   			acces.setNumero(request.getParameter("numero"));
   			String[] telefone = request.getParameter("telefone").split("\\)");
			String txtDDD = telefone[0].replaceAll("\\(", ""); //talvez "\\("
	 		String txtTelefone = telefone[1];
			
			acces.setDdd(txtDDD);
			acces.setTelefone(txtTelefone);
	
   		%>
   			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
                	<div class="x_panel">
                    	<div class="x_content">
                        	<p align="center">
                        		<% 
                        			if (update.atualizaUser(id, acces).equals("Sucesso"))
                        				out.print("Alterações realizadas com sucesso !!" + 
                            			"<br><a href=\"index.jsp\">Clique aqui para voltar a tela inicial</a>");
                        			else
                        				out.print("Erro na alteração<br>Tente novamente ou contate o administrador do Sistema");
                            	%>
                            </p>
						</div>
					</div>
				</div>
			</div>
   		<%	
   		}
   	}
	
		ListaAcessoDAO edit = new ListaAcessoDAO();
		Acesso esse = edit.selecionaAcesso(edit.selectAcesso(id));

	%>

                <div class="">
                    <div class="page-title">
                        
                    		<div class="animated flipInY col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="tile-stats">
                                <div class="icon"><i class="fa fa-caret-square-o-right"></i>
                                </div>
                                <div class="count">Editar Dados</div>

                                <h3>Edite suas informações aqui</h3>
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
                                                <input id="name" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="1" name="id" value="<%= esse.getId() %>" type="text" disabled>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name" >Nome <span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="name" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="1" name="nome" value="<%= esse.getNome() %>" placeholder="Digite seu nome" required="required" type="text">
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name" >CPF <span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="cpf" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="1" name="cpf" value="<%= esse.getCpf() %>" placeholder="Digite seu CPF" required="required" type="text">
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name" >RG <span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="rg" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="1" name="rg" value="<%= esse.getRg() %>" placeholder="Digite seu RG" required="required" type="text">
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name" >CEP <span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="cep" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="1" name="cep" value="<%= esse.getCep() %>" placeholder="Digite seu CEP" required="required" type="text">
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name" >Data Nascimento <span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="name" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="1" name="nascimento" value="<%= esse.getNascimento() %>" required="required" type="date">
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name" >Complemento <span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="name" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="1" name="complemento" value="<%= esse.getComplemento() %>" placeholder="Digite o complemento" required="required" type="text">
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">Numero <span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="number" id="number" name="numero" required="required" data-validate-minmax="0,9999"  value="<%= esse.getNumero() %>" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name" >Telefone <span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="telefonemask" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="1" name="telefone" value="<%= "(" + esse.getDdd() + ")" + esse.getTelefone() %>" placeholder="Digite seu telefone" required="required" type="text">
                                            </div>
                                        </div>
                                          <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
											<script src="http://digitalbush.com/wp-content/uploads/2014/10/jquery.maskedinput.js"></script>
                                        <script>
											jQuery("#telefonemask")
										       .mask("(99) 9999-9999?9")
										       .focusout(function (event) {  
										           var target, phone, element;  
										           target = (event.currentTarget) ? event.currentTarget : event.srcElement;  
										           phone = target.value.replace(/\D/g, '');
										           element = $(target);  
										           element.unmask();  
										           if(phone.length > 10) {  
										               element.mask("(99) 99999-999?9");  
										           } else {  
										               element.mask("(99) 9999-9999?9");  
										           }  
										       });
											
											$("#cpf").mask("999.999.999-99");
											$("#rg").mask("**.***.***-*");
											$("#cep").mask("99999-999");
										</script>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name" >Recuperação de Senha <span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="name" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="1" name="recsenha" value="<%= esse.getRecsenha() %>" placeholder="Digite uma nova recuperação de senha" required="required" type="text">
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label for="password" class="control-label col-md-3">Nova Senha</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="password" type="password" name="senha" data-validate-length="6,8" placeholder="Caso não deseje mudar, deixe em branco" class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="ln_solid"></div>
                                        <div class="form-group">
                                            <div class="col-md-6 col-md-offset-3">
                                                <button id="send" type="submit" class="btn btn-success">Enviar</button>
                                            </div>
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- footer content -->
            