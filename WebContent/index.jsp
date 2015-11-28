<%@page import="logicalView.Teste"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import ="java.sql.*,
				bd.*,
				conexao.Conexao,
				logicalView.Usuario,
				model.UsuarioDAO,
				java.util.*"%>


<!doctype html>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="A front-end template that helps you build fast, modern mobile web apps.">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>HealthCare</title>

    <!-- Add to homescreen for Chrome on Android -->
    <meta name="mobile-web-app-capable" content="yes">
    <link rel="icon" sizes="192x192" href="images/android-desktop.png">

    <!-- Add to homescreen for Safari on iOS -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="HealthCare">
    <link rel="apple-touch-icon-precomposed" href="images/ios-desktop.png">

    <!-- Tile icon for Win8 (144x144 + tile color) -->
    <meta name="msapplication-TileImage" content="images/touch/ms-touch-icon-144x144-precomposed.png">
    <meta name="msapplication-TileColor" content="#3372DF">

    <link rel="shortcut icon" href="images/favicon.png">

    <link href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="material.min.css">
    <link rel="stylesheet" href="styles.css">

	

  </head>
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://digitalbush.com/wp-content/uploads/2014/10/jquery.maskedinput.js"></script>
	<script>
	jQuery("#sample8")
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
	
	function zera() {
	    if (document.getElementById("sample8").value == "(00) 0000-00000" || 
	    		document.getElementById("sample8").value == "(00) 00000-0000")
	    	document.getElementById("sample8").value = "";
	}
	
	function zeraCPF() {
	    if (document.getElementById("cpf").value == "000.000.000-00")
	    	document.getElementById("cpf").value = "";
	}
	
	function zeraRG() {
	    if (document.getElementById("rg").value == "00.000.000-0")
	    	document.getElementById("rg").value = "";
	}
	
	function zeraCEP() {
	    if (document.getElementById("cep").value == "00000-000")
	    	document.getElementById("cep").value = "";
	}
	
	$("#cpf").mask("999.999.999-99");
	$("#rg").mask("**.***.***-*");
	$("#cep").mask("99999-999");
	</script>
  
  
 	<%
 	//JSP CODE
 	Calendar cal = Calendar.getInstance();
 	Boolean valido = true;
 	String validoRec[] = new String[3];
 	String botao = "logar";
    if (request.getParameter("botao") != null){
    	botao = request.getParameter("botao");
   	}
    
    Usuario usr = new Usuario(); 
    try {
	    UsuarioDAO usrDAO = new UsuarioDAO();
	    
	    
		//RECSENHA
		String email = request.getParameter("emailRec");
		String recsenha = request.getParameter("recsenha");
		
		if (email != null && recsenha != null){
			if (!email.equalsIgnoreCase("mateus.sauer@gmail.com")) {
	            validoRec[0] = "email";
	        } else if (!recsenha.equalsIgnoreCase("123456")) {
	            validoRec[0] = "recchave";
	        } else {
	        	validoRec[0] = "valido";
	        	validoRec[1] = "login";
	        	validoRec[2] = "senha";
	        }
		}
	    
	    
	    
	    
	    //LOGIN
	    String login = request.getParameter("login");
	    String password = request.getParameter("senha");
	    
	    if (login != null && password != null){
	    	%><script>alert("<% out.print(login + password); %>")</script><%
	        if (!usrDAO.validaLoginAcesso(login)) {
	            valido = false;
	        } else if (!usrDAO.validaSenhaAcesso(login, password)) {
	            valido = false;
	        } else {
	        	usr.setLogin(login);
	        	usr.setSenha(password);
	        	usr.setNome("Mateus Sauer");
	        	Teste.user.setNome("Mateus Sauer Govêa");
	        	//out.println("<script>alert(\"" + Teste.user.getNome() + "\");</script>");
	        	session.setAttribute("login", login);
		        session.setAttribute("senha", password);
	            response.sendRedirect("logado/index.jsp");
	        }
	    }
	    
	    
	    try {
	    	//CADASTRO
		   	if (request.getParameter("nome")!= null &&
		   		request.getParameter("email")!= null &&
		   		request.getParameter("rg")!= null &&
		   		request.getParameter("cep")!= null &&
		   		request.getParameter("datanascimento")!= null &&
		   		request.getParameter("cpf")!= null &&
				request.getParameter("endereco")!= null &&
				request.getParameter("numero")!= null &&
				request.getParameter("telefone")!= null &&
				request.getParameter("recsenha")!= null) {
												
		    
			    String possivelLogin = request.getParameter("nome");
				String[] vetordeString = possivelLogin.split(" ");
				String nome = vetordeString[0];
				String sobrenome = vetordeString[vetordeString.length - 1];
		
				if (nome.equals(sobrenome))
					possivelLogin = nome;
				else
					possivelLogin = nome + "." + sobrenome;
				
				possivelLogin = possivelLogin.toLowerCase();
		
				String[] telefone = request.getParameter("telefone").split("\\)");
				String txtDDD = telefone[0].replaceAll("\\(", ""); //talvez "\\("
		 		String txtTelefone = telefone[1];
				CadastroBD cbd = new CadastroBD();
				int senha = new Random().nextInt(89999999) + 10000000;
				possivelLogin = cbd.adiciona(possivelLogin,
											String.valueOf(senha),
											request.getParameter("nome"),
											request.getParameter("email"),
											request.getParameter("rg"),
											request.getParameter("cpf"), 
											request.getParameter("cep"),
											request.getParameter("endereco"),
											request.getParameter("numero"),
											txtDDD,
											txtTelefone,
											request.getParameter("datanascimento"),
											request.getParameter("recsenha"));
		
				if (possivelLogin != null) {
					out.print("Funcionário cadastrado com sucesso\n\nSeu login é: " + possivelLogin + "\nSua senha é: " + senha);
				} else {
					out.print("Erro ao cadastrar, verifique os dados");
				}
			}
	    }catch (SQLException e) {
	    	out.print("ERRO NO CADASTRO");
	    }catch (Exception e) {
	    	out.print(e);
	    }
	    
	    
    }catch (Exception e) {
    	out.print("Contate o administrador, erro no banco de dados");
    }
 	%>
  
  <body class="mdl-demo mdl-color--grey-100 mdl-color-text--grey-700 mdl-base">
    <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
      <header class="mdl-layout__header mdl-layout__header--scroll mdl-color--primary">
        <div class="mdl-layout--large-screen-only mdl-layout__header-row">
        </div>
        <div class="mdl-layout--large-screen-only mdl-layout__header-row">
        	<img src="images/logo.png" class="demo-logo">
        </div>
        <div class="mdl-layout--large-screen-only mdl-layout__header-row">
        </div>
        <div class="mdl-layout__tab-bar mdl-js-ripple-effect mdl-color--primary-dark">
          <a href="#logar" 		class="mdl-layout__tab <% if(botao.equals("logar"))   	out.print("is-active");%>">Logar	</a>
          <a href="#cadastro" 	class="mdl-layout__tab <% if(botao.equals("cadastro"))	out.print("is-active");%>">Cadastro	</a>
          <a href="#recsenha" 	class="mdl-layout__tab <% if(botao.equals("recuperar senha"))	out.print("is-active");%>">Recuperar Senha</a>
        </div>
      </header>
      
      <main class="mdl-layout__content">
        
        <div class="mdl-layout__tab-panel <%if (botao.equals("logar"))out.print("is-active");%>" id="logar">
        
        <% if (!valido) {%>
          <section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
            <div class="mdl-card mdl-cell mdl-cell--12-col">
              <div class="mdl-card__supporting-text">
                <h4><font color="red">Usuário ou senha inválido</font></h4>
                Por favor entre novamente, usuário ou senha inválido<br> Caso não lembre seus dados você pode tentar recuperar sua senha.
              </div>
            </div>
          </section>
          <% } %>
          
          <section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
            <header class="section__play-btn mdl-cell mdl-cell--3-col-desktop mdl-cell--2-col-tablet mdl-cell--4-col-phone mdl-color--teal-100 mdl-color-text--white">
              <i class="material-icons">play_circle_filled</i>
            </header>
            <div class="mdl-card mdl-cell mdl-cell--9-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone">
              <div class="mdl-card__supporting-text">
                <h4>-- HealthCare --</h4>
                <form method="post">
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type="text" pattern=".{1,}"
								id="sample4" name="login"> <label
								class="mdl-textfield__label" for="sample4">Usuário</label> <span
								class="mdl-textfield__error">Input is not a number!</span>
						</div>
						<br>
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type="password" pattern=".{5,}" id="sample5" name="senha">
							<!--  pattern de -numero a +numero -?[0-9]*(\.[0-9]+)? -->
							<label class="mdl-textfield__label" for="sample5">Senha</label>
							<span class="mdl-textfield__error">Seis ou mais digitos!</span>
						</div>
				
                </div>
              <div class="mdl-card__actions">
              <input class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect"
						type=submit name="botao" value="logar" />
              </div>
              </form>
            </div>
          </section>
         <section></section>
        </div>
        
        
        
        
        <div class="mdl-layout__tab-panel <%if (botao.equals("cadastro"))out.print("is-active");%>" id="cadastro">
        
        <% if (!valido) {%>
          <section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
            <div class="mdl-card mdl-cell mdl-cell--12-col">
              <div class="mdl-card__supporting-text">
                <h4><font color="red">Usuário ou senha inválido</font></h4>
                Por favor entre novamente, usuário ou senha inválido<br> Caso não lembre seus dados você pode tentar recuperar sua senha.
              </div>
            </div>
          </section>
          <% } %>
          
          <section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
            
            <div class="mdl-card mdl-cell mdl-cell--12-col-desktop mdl-cell--8-col-tablet mdl-cell--4-col-phone">
              <div class="mdl-card__supporting-text">
                <h4>Cadastro</h4>
                <form method="post">
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type="text" pattern=".{3,}"
								id="sample4" name="nome"> <label
								class="mdl-textfield__label" for="sample4">Nome completo</label> <span
								class="mdl-textfield__error">Input is not a number!</span>	
						</div>
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type="email" id="sample4" name="email"> 
							<label class="mdl-textfield__label" for="sample4">E-mail</label> 
							<span class="mdl-textfield__error">Digite um e-mail válido</span>	
						</div>
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type="text" pattern=".{1,}" value="00.000.000-0" 
							onclick="zeraRG()" id="rg" name="rg"> 
							<label class="mdl-textfield__label" for="rg">RG</label> 
							<span class="mdl-textfield__error">Input is not a number!</span>
						</div>
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type="text" onclick="zeraCEP()" value="00000-000" pattern=".{1,}"
								id="cep" name="cep"> <label
								class="mdl-textfield__label" for="cep">CEP</label> <span
								class="mdl-textfield__error">Input is not a number!</span>
						</div>
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type="date"  
									min="1900-01-01" 
									max="<%out.print(cal.get(Calendar.YEAR) + "-" + (cal.get(Calendar.MONTH)+1) + "-" + cal.get(Calendar.DAY_OF_MONTH)); %>" 
									value="<%out.print(cal.get(Calendar.YEAR) + "-" + (cal.get(Calendar.MONTH)+1) + "-" + cal.get(Calendar.DAY_OF_MONTH)); %>" 
									pattern=".{1,}" id="sample5" name="datanascimento">
							<label class="mdl-textfield__label" for="sample5">Data de Nascimento</label>
							<span class="mdl-textfield__error">Digite um valor entre 01-01-1900 à <%out.print(cal.get(Calendar.DAY_OF_MONTH) + "-" + (cal.get(Calendar.MONTH)+1) + "- " + cal.get(Calendar.YEAR)); %></span>
						</div>
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type="text" id="cpf" name="cpf" onclick="zeraCPF()" value="000.000.000-00"> 
							<label
								class="mdl-textfield__label" for="cpf">CPF</label> <span
								class="mdl-textfield__error">Input is not a number!</span>
						</div>
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type="text" pattern=".{1,}"
								id="sample4" name="endereco"> <label
								class="mdl-textfield__label" for="sample4">Endereço</label> <span
								class="mdl-textfield__error">Input is not a number!</span>
						</div>
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type="text" pattern=".{1,}"
								id="sample4" name="numero"> <label
								class="mdl-textfield__label" for="sample4">Numero</label> <span
								class="mdl-textfield__error">Input is not a number!</span>
						</div>
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type="tel" pattern=".{14,15}" id="sample8" onclick="zera()" value="(00) 0000-00000" name="telefone">
							<!--  pattern de -numero a +numero -?[0-9]*(\.[0-9]+)? -->
							<label class="mdl-textfield__label" for="sample8">Telefone</label>
							<span class="mdl-textfield__error">Seis ou mais digitos!</span>
						</div>
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type="tel" pattern=".{6,}" id="sample9"  name="recsenha">
							<!--  pattern de -numero a +numero -?[0-9]*(\.[0-9]+)? -->
							<label class="mdl-textfield__label" for="sample9">Chave de Recuperação de Senha</label>
							<span class="mdl-textfield__error">Seis ou mais digitos!</span>
						</div>
						
						
						<script>
							jQuery("#sample8")
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
				
                </div>
              <div class="mdl-card__actions">
              <input class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect"
						type=submit name="botao" value="cadastro" />
              </div>
              </form>
            </div>
          </section>
         <section></section>
        </div>
        
        
        
        
        
        
        
        <div class="mdl-layout__tab-panel <%if (botao.equals("recuperar senha"))out.print("is-active");%>" id="recsenha">
        
        <% if (validoRec[0] != null) {%>
          <section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
            <div class="mdl-card mdl-cell mdl-cell--12-col">
              <div class="mdl-card__supporting-text">
                <% 
                switch(validoRec[0]) {
                	case "email" :
                		out.print("<h4><font color=\"red\">E-mail Inválido</font></h4> Por favor entre com os dados novamente, e-mail inválido");
                		break;
                	case "recchave" :
                		out.print("<h4><font color=\"red\">Chave de Recuperação Inválida</font></h4> Por favor entre com os dados novamente, chave de recuperação inválida");
                		break;
                	case "valido" :
                		out.print("<center><h4><font color=\"green\">Dados recuperados!</font></h4> <h5>Usuário: " + validoRec[1] + "<br>Senha: " + validoRec[2]+"</center></h5>");
                		break;
                	default: 
                		out.print("<h4><font color=\"yellow\">ERRO</font></h4> Tente novamente, caso não consiga contate o administrador do Sistema");
                		break;
                }
                %>

              </div>
            </div>
          </section>
          <% } %>
          
          <section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
            
            <div class="mdl-card mdl-cell mdl-cell--12-col-desktop mdl-cell--8-col-tablet mdl-cell--4-col-phone">
              <div class="mdl-card__supporting-text">
                <h4>Recupere sua Senha</h4>
                <form method="post">
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type="email" id="emailRec" pattern=".{5,}" name="emailRec"> 
							<label class="mdl-textfield__label" for="emailRec">E-mail</label> 
							<span class="mdl-textfield__error">Digite seu e-mail usado no cadastro</span>	
						</div><br>
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type="tel" pattern=".{6,}" id="recsenha" name="recsenha">
							<label class="mdl-textfield__label" for="recsenha">Chave de Recuperação de Senha</label>
							<span class="mdl-textfield__error">Seis ou mais digitos!</span>
						</div>

				
                </div>
              <div class="mdl-card__actions">
              <input class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect"
						type=submit name="botao" value="recuperar senha" />
              </div>
              </form>
            </div>
          </section>
         <section></section>
        </div>

        
        <!-- INICIO RODAPE -->
        
        <footer class="mdl-mega-footer">
          <div class="mdl-mega-footer--bottom-section">
            <div class="mdl-logo">
              HealthCare 2015 © Desenvolvido por Mateus Sauer Govêa e Wagner José da Luz
            </div>
            <ul class="mdl-mega-footer--link-list">
              <li><a href="#">HealthCare</a></li>
              <li><a href="#">PUC-Campinas</a></li>
              <li><a href="#">Privacidade e Termos de Uso</a></li>
            </ul>
          </div>
        </footer>
      </main>
    </div>
    <script src="material.min.js"></script>
  </body>
</html>
