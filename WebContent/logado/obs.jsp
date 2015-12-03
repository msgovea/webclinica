<%@page import="logicalView.Consulta"%>
<%@page import="model.ListaConsultasDAO"%>
<%@page import="logicalView.Acesso"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
	int id4 = ((Acesso)session.getAttribute("user")).getId();

	
	String consulta = (request.getParameter("consulta") != null) ? request.getParameter("consulta") : "";
	
	ListaConsultasDAO consults = new ListaConsultasDAO();
	Consulta consu = consults.selectConsultaIdConsulta(Integer.parseInt(consulta));


	%>
<div class="right_col" role="main">

                <div class="">

                    
                    <div class="clearfix"></div>
                    

                    <div class="col-md-12 col-sm-12 col-xs-12">
                    	
                    	<div class="x_panel">
                            
                            <div class="x_content">

                               <form method="post" action="#" class="form-horizontal form-label-left" novalidate> 
	                               <div class="form-group">
	                                    <div class="item form-group">
	                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name" >ID Paciente <span class="required"></span>
	                                        </label>
	                                        <div class="col-md-6 col-sm-6 col-xs-12">
	                                            <input id="name" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="1" name="id" value="<%=id4 %>" type="text" disabled>
	                                        </div>
										</div>
	                                </div>
	                                <div class="form-group">
	                                    <div class="item form-group">
	                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name" >ID Consulta <span class="required"></span>
	                                        </label>
	                                        <div class="col-md-6 col-sm-6 col-xs-12">
	                                            <input id="name" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="1" name="id" value="<%=consu.getId() %>" type="text" disabled>
	                                        </div>
										</div>
	                                </div>
	                                <div class="form-group">
	                                    <div class="item form-group">
	                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name" >Próxima Consulta <span class="required"></span>
	                                        </label>
	                                        <div class="col-md-6 col-sm-6 col-xs-12">
	                                            <input id="name" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="1" name="id" value="<%=consu.getProxConsulta() %>" type="date" disabled>
	                                        </div>
										</div>
	                                </div>
                                </form>
                            </div>
                    	</div>
                      
						<div class="x_panel">
                            <div class="x_title">
                                <h2>Prescrições</h2>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content"> 
                                <div class="form-group">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <textarea class="resizable_textarea form-control" disabled style="width: 100%; overflow: hidden; word-wrap: break-word; resize: horizontal; height: 87px;"><%=consu.getPrescricoes() %>
                                        </textarea>
                                    </div>
                                </div>
                            </div>
                    	</div>
                    	
                    	<div class="x_panel">
                            <div class="x_title">
                                <h2>Pedido de Exame</h2>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content"> 
                                <div class="form-group">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <textarea class="resizable_textarea form-control" disabled style="width: 100%; overflow: hidden; word-wrap: break-word; resize: horizontal; height: 87px;"><%=consu.getPedidosDeExame() %>
                                        </textarea>
                                    </div>
                                </div>
                            </div>
                    	</div>
                    	
                    	<div class="x_panel">
                            <div class="x_title">
                                <h2>Observações de Saúde</h2>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content"> 
                                <div class="form-group">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <textarea class="resizable_textarea form-control" disabled style="width: 100%; overflow: hidden; word-wrap: break-word; resize: horizontal; height: 87px;"><%=consu.getObservacoes() %>
                                        </textarea>
                                    </div>
                                </div>
                            </div>
                    	</div>
                    	
                    	<div class="x_panel">
                            <div class="x_title">
                                <h2>Recomendações</h2>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content"> 
                                <div class="form-group">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <textarea class="resizable_textarea form-control"  style="width: 100%; overflow: hidden; word-wrap: break-word; resize: horizontal; height: 87px;"><%=consu.getRecomendacoes() %>
                                        </textarea>
                                    </div>
                                </div>
                            </div>
                    	</div>
                       
   
  		<!-- textarea resize -->
        <script src="js/bootstrap.min.js"></script>
        <!-- textarea resize -->
        <script src="js/textarea/autosize.min.js"></script>
        <script>
            autosize($('.resizable_textarea'));
        </script>