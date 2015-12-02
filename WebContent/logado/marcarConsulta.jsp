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
	int idSolicitante;
	idSolicitante = ((Acesso)session.getAttribute("user")).getId();
	
	ListaAcessoDAO selecionaSolicitante = new ListaAcessoDAO();
	Acesso solicitante = new Acesso();
	solicitante = selecionaSolicitante.selecionaAcesso(selecionaSolicitante.selectAcesso(idSolicitante));
	
	
	ProfissoesDAO profissoesDAO = new ProfissoesDAO();
    List<Profissoes> profissoes = profissoesDAO.selectProfissoes();
	
	if (request.getParameter("nome")		!= null &&
   		request.getParameter("rg")			!= null) 
   	{
   		if (	!request.getParameter("nome")		.equals("") &&
		   		!request.getParameter("rg")			.equals(""))
   		{
   			
   			
   			
	
   		%>
   			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
                	<div class="x_panel">
                    	<div class="x_content">
                        	<p align="center">
                        		<% 
                        			
                        				out.print("Alterações realizadas com sucesso !!" + 
                            			"<br><a href=\"index.jsp\">Clique aqui para voltar a tela inicial</a>");
                        			
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
	//dados do medico aqui

	%>

                <div class="">
                    <div class="page-title">
                        
                    		<div class="animated flipInY col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="tile-stats">
                                <div class="icon"><i class="fa fa-caret-square-o-right"></i>
                                </div>
                                <div class="count">Marcar Consulta</div>

                                <h3>Marque sua consulta aqui</h3>
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
                                                <input id="name" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="1" name="id" value="<%= solicitante.getId() %>" type="text" disabled>
                                            </div>
                                        </div>
                                        
                                        
                                        
                                        
                                        	<div class="item form-group">
				                                       
											                <label class="control-label col-md-3 col-sm-3 col-xs-12">Área</label>
											                <div class="col-md-6 col-sm-6 col-xs-12" >
											                <select id="txtEstado" class="form-control"
											                        onchange="paginaAjax('buscaEspecialidade.jsp?tipo=estado&estado='+this.value, 'cidade')">
											                    <option value="" disabled selected>Escolha uma área</option>
											                    <option value="" disabled>-----------------------</option>
											                    <% 
											                    	for (Profissoes profissao : profissoes) {
											                    		out.print("<option value=\"" + profissao.getId() + "\">" + profissao.getNome() + "</option>");
											                    	}
											                    %>
											                    
											                </select>
											                </div>
											</div>
											
											<div class="item form-group">
											                
											                <label class="control-label col-md-3 col-sm-3 col-xs-12">Especialidade</label>
											                <div id="cidade" class="col-md-6 col-sm-6 col-xs-12" >
											                    <select class="form-control" id='txtCid' name="txtCidade" 
											                            disabled="true">
											                        <option value="">-----------------</option>
											                    </select>
											                </div>
											                
											                <div id="descCid"></div>
											                <div id="detalhes"></div>
											           
											</div>
                                                                           
                                        
                                        
                                        <div class="ln_solid"></div>
                                        <div class="form-group">
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                            	<div id="botao">
                                                	
                                            	</div>
                                            </div>
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- footer content -->
            