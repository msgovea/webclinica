<%@page import="logicalView.Acesso"%>
<%@page import="model.ListaAcessoDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Exemplo: Populando selects de cidades e estados com AJAX (PHP e jQuery) | DaviFerreira blog!</title>
		<style type="text/css">
			*, html {
				font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
				margin: 0px;
				padding: 0px;
				font-size: 12px;
			}

			a {
				color: #0099CC;
			}

			body {
				margin: 10px;
			}
			.carregando{
				color:#666;
				display:none;
			}
		</style>
	</head>
	<body>
		
		<label for="cod_estados">Estado:</label>
		<select name="cod_estados" id="cod_estados">
			<option value=""></option>
			<% 
				ListaAcessoDAO listaACESSO = new ListaAcessoDAO();
				for (Acesso acesso : listaACESSO.listaContas()) {
					out.print("<option value=\"" + acesso.getId() + "\">" + acesso.getNome() + "</option>");
				}
			%>
		</select>

		<label for="cod_cidades">Cidade:</label>
		<span class="carregando">Aguarde, carregando...</span>
		<select name="cod_cidades" id="cod_cidades">
			<option value="">-- Escolha um estado --</option>
		</select>

		<script src="http://www.google.com/jsapi"></script>
		<script type="text/javascript">
		  google.load('jquery', '1.3');
		</script>		

		<script type="text/javascript">
		$(function(){
			$('#cod_estados').change(function(){
				if( $(this).val() ) {
					$('#cod_cidades').hide();
					$('.carregando').show();
					//$('#cod_cidades').html(options).show();
					$('.carregando').hide();
					var valor = $(this).val();
					valor = 30;
					<% 
					out.print("$('#cod_cidades').html('valor');");
					out.print("$('#cod_cidades').html('");
					for (Acesso acesso : listaACESSO.listaContas()) {
					out.print("<option value=\"" + acesso.getId() + "\">" + acesso.getLogin() + "</option>");
					}
					out.print("');");
					%>
					$('#cod_cidades').show();
					
				} else {
					$('#cod_cidades').html('<option value=""> Escolha um estado</option>');
				}
			});
		});
		</script>
	</body>
</html>