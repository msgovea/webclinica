<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page import="bd.ConexaoMySQL"%>
<%@page import ="conexao.Conexao"%>
<%@page import ="logicalView.Usuario"%>
<%@page import ="model.UsuarioDAO"%>

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
  
 	<%
 	//JSP CODE
 	Boolean valido = true;
 	String botao = "default";
    if (request.getParameter("botao") != null){
    	botao = request.getParameter("botao");
   	}
    
    Usuario usr = new Usuario(); 
    UsuarioDAO usrDAO = new UsuarioDAO();
    
    String login = request.getParameter("login");
    String password = request.getParameter("senha");

    if (login != null && password != null){
        session.setAttribute("login", login);
        session.setAttribute("senha", password);
        if (!usrDAO.validaLoginAcesso(login)) {
            valido = false;
        	//out.println("<br><center><p class=\"erro\">Usu�rio inv�lido!</p>");
        } else if (!usrDAO.validaSenhaAcesso(login, password)) {
            valido = false;
        	//out.println("<br><center><p class=\"erro\">Senha invalida!</p>");
        } else {
        	usr.setLogin(login);
        	usr.setSenha(password);
            response.sendRedirect("index.jsp");
        }
        
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
          <a href="#default" 	class="mdl-layout__tab <% if(botao.equals("default")) 	out.print("is-active");%>">Principal</a>
          <a href="#logar" 		class="mdl-layout__tab <% if(botao.equals("logar"))   	out.print("is-active");%>">Logar	</a>
          <a href="#cadastro" 	class="mdl-layout__tab <% if(botao.equals("cadastro"))	out.print("is-active");%>">Cadastro	</a>
          <a href="#recsenha" 	class="mdl-layout__tab <% if(botao.equals("recsenha"))	out.print("is-active");%>">Recuperar Senha</a>
        </div>
      </header>
      
      <main class="mdl-layout__content">
        <div class="mdl-layout__tab-panel <%if (botao.equals("default"))out.print("is-active");%>" id="default">
          <section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
            <header class="section__play-btn mdl-cell mdl-cell--3-col-desktop mdl-cell--2-col-tablet mdl-cell--4-col-phone mdl-color--teal-100 mdl-color-text--white">
              <i class="material-icons">play_circle_filled</i>
            </header>
            <div class="mdl-card mdl-cell mdl-cell--9-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone">
              <div class="mdl-card__supporting-text">
                <h4>Features</h4>
                Dolore ex deserunt aute fugiat aute nulla ea sunt aliqua nisi cupidatat eu. Nostrud in laboris labore nisi amet do dolor eu fugiat consectetur elit cillum esse.
              </div>
              <div class="mdl-card__actions">
                <a href="#" class="mdl-button">Read our features</a>
              </div>
            </div>
            <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" id="btn1b">
              <i class="material-icons">more_vert</i>
            </button>
            <ul class="mdl-menu mdl-js-menu mdl-menu--bottom-right" for="btn1b">
              <li class="mdl-menu__item">Lorem</li>
              <li class="mdl-menu__item" disabled>Ipsum</li>
              <li class="mdl-menu__item">Dolor</li>
            </ul>
          </section>
          <section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
            <div class="mdl-card mdl-cell mdl-cell--12-col">
              <div class="mdl-card__supporting-text mdl-grid mdl-grid--no-spacing">
                <h4 class="mdl-cell mdl-cell--12-col">Details</h4>
                <div class="section__circle-container mdl-cell mdl-cell--2-col mdl-cell--1-col-phone">
                  <div class="section__circle-container__circle mdl-color--primary"></div>
                </div>
                <div class="section__text mdl-cell mdl-cell--10-col-desktop mdl-cell--6-col-tablet mdl-cell--3-col-phone">
                  <h5>Lorem ipsum dolor sit amet</h5>
                  Dolore ex deserunt aute fugiat aute nulla ea sunt aliqua nisi cupidatat eu. Duis nulla tempor do aute et eiusmod velit exercitation nostrud quis <a href="#">proident minim</a>.
                </div>
                <div class="section__circle-container mdl-cell mdl-cell--2-col mdl-cell--1-col-phone">
                  <div class="section__circle-container__circle mdl-color--primary"></div>
                </div>
                <div class="section__text mdl-cell mdl-cell--10-col-desktop mdl-cell--6-col-tablet mdl-cell--3-col-phone">
                  <h5>Lorem ipsum dolor sit amet</h5>
                  Dolore ex deserunt aute fugiat aute nulla ea sunt aliqua nisi cupidatat eu. Duis nulla tempor do aute et eiusmod velit exercitation nostrud quis <a href="#">proident minim</a>.
                </div>
                <div class="section__circle-container mdl-cell mdl-cell--2-col mdl-cell--1-col-phone">
                  <div class="section__circle-container__circle mdl-color--primary"></div>
                </div>
                <div class="section__text mdl-cell mdl-cell--10-col-desktop mdl-cell--6-col-tablet mdl-cell--3-col-phone">
                  <h5>Lorem ipsum dolor sit amet</h5>
                  Dolore ex deserunt aute fugiat aute nulla ea sunt aliqua nisi cupidatat eu. Duis nulla tempor do aute et eiusmod velit exercitation nostrud quis <a href="#">proident minim</a>.
                </div>
              </div>
              <div class="mdl-card__actions">
                <a href="#" class="mdl-button">Read our features</a>
              </div>
            </div>
            <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" id="btn2b">
              <i class="material-icons">more_vert</i>
            </button>
            <ul class="mdl-menu mdl-js-menu mdl-menu--bottom-right" for="btn2b">
              <li class="mdl-menu__item">Lorem</li>
              <li class="mdl-menu__item" disabled>Ipsum</li>
              <li class="mdl-menu__item">Dolor</li>
            </ul>
          </section>
          <section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
            <div class="mdl-card mdl-cell mdl-cell--12-col">
              <div class="mdl-card__supporting-text">
                <h4>Technology</h4>
                Dolore ex deserunt aute fugiat aute nulla ea sunt aliqua nisi cupidatat eu. Nostrud in laboris labore nisi amet do dolor eu fugiat consectetur elit cillum esse. Pariatur occaecat nisi laboris tempor laboris eiusmod qui id Lorem esse commodo in. Exercitation aute dolore deserunt culpa consequat elit labore incididunt elit anim.
              </div>
              <div class="mdl-card__actions">
                <a href="#logar" class="mdl-button">Read our features</a>
              </div>
            </div>
            <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" id="btn3b">
              <i class="material-icons">more_vert</i>
            </button>
            <ul class="mdl-menu mdl-js-menu mdl-menu--bottom-right" for="btn3b">
              <li class="mdl-menu__item">Lorem</li>
              <li class="mdl-menu__item" disabled>Ipsum</li>
              <li class="mdl-menu__item">Dolor</li>
            </ul>
          </section>
          <section class="section--footer mdl-color--white mdl-grid">
            <div class="section__circle-container mdl-cell mdl-cell--2-col mdl-cell--1-col-phone">
              <div class="section__circle-container__circle mdl-color--accent section__circle--big"></div>
            </div>
            <div class="section__text mdl-cell mdl-cell--4-col-desktop mdl-cell--6-col-tablet mdl-cell--3-col-phone">
              <h5>Lorem ipsum dolor sit amet</h5>
              Qui sint ut et qui nisi cupidatat. Reprehenderit nostrud proident officia exercitation anim et pariatur ex.
            </div>
            <div class="section__circle-container mdl-cell mdl-cell--2-col mdl-cell--1-col-phone">
              <div class="section__circle-container__circle mdl-color--accent section__circle--big"></div>
            </div>
            <div class="section__text mdl-cell mdl-cell--4-col-desktop mdl-cell--6-col-tablet mdl-cell--3-col-phone">
              <h5>Lorem ipsum dolor sit amet</h5>
              Qui sint ut et qui nisi cupidatat. Reprehenderit nostrud proident officia exercitation anim et pariatur ex.
            </div>
          </section>
        </div>
        
        
        <div class="mdl-layout__tab-panel <%if (botao.equals("logar"))out.print("is-active");%>" id="logar">
        
        <% if (!valido) {%>
          <section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
            <div class="mdl-card mdl-cell mdl-cell--12-col">
              <div class="mdl-card__supporting-text">
                <h4><font color="red">Usu�rio ou senha inv�lido</font></h4>
                Por favor entre novamente, usu�rio ou senha inv�lido<br> Caso n�o lembre seus dados voc� pode tentar recuperar sua senha.
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
                <h4>HealthCare -- Logue para acessar o sistema</h4>
                <form method="post">
						<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type="text" pattern=".{1,}"
								id="sample4" name="login" value="um"> <label
								class="mdl-textfield__label" for="sample4">Usu�rio</label> <span
								class="mdl-textfield__error">Input is not a number!</span>
						</div>
						<br>
						<div
							class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
							<input class="mdl-textfield__input" type="password"
								pattern=".{5,}" id="sample4" name="senha">
							<!--  pattern de -numero a +numero -?[0-9]*(\.[0-9]+)? -->
							<label class="mdl-textfield__label" for="sample4">Senha</label>
							<span class="mdl-textfield__error">Seis ou mais digitos!</span>
						</div>
				
                </div>
              <div class="mdl-card__actions">
              <input class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect"
						type=submit name="botao" value="logar" />
						<a href="#logar" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-js-layout">oi</a>
              </div>
              </form>
            </div>
          </section>
         <section></section>
        </div>
        
        
        
        <div class="mdl-layout__tab-panel <%if (botao.equals("recsenha"))out.print("is-active");%>" id="recsenha">
          <section class="section--center mdl-grid mdl-grid--no-spacing">
            <div class="mdl-cell mdl-cell--12-col">
              <h4>Features</h4>
              Minim duis incididunt est cillum est ex occaecat consectetur. Qui sint ut et qui nisi cupidatat. Reprehenderit nostrud proident officia exercitation anim et pariatur ex.
              <ul class="toc">
                <h4>Contents</h4>
                <a href="#lorem1">Lorem ipsum</a>
                <a href="#lorem2">Lorem ipsum</a>
                <a href="#lorem3">Lorem ipsum</a>
                <a href="#lorem4">Lorem ipsum</a>
                <a href="#lorem5">Lorem ipsum</a>
              </ul>

              <h5 id="lorem1">Lorem ipsum dolor sit amet</h5>
              Excepteur et pariatur officia veniam anim culpa cupidatat consequat ad velit culpa est non.
              <ul>
                <li>Nisi qui nisi duis commodo duis reprehenderit consequat velit aliquip.</li>
                <li>Dolor consectetur incididunt in ipsum laborum non et irure pariatur excepteur anim occaecat officia sint.</li>
                <li>Lorem labore proident officia excepteur do.</li>
              </ul>

              <p>
                Sit qui est voluptate proident minim cillum in aliquip cupidatat labore pariatur id tempor id. Proident occaecat occaecat sint mollit tempor duis dolor cillum anim. Dolore sunt ea mollit fugiat in aliqua consequat nostrud aliqua ut irure in dolore. Proident aliqua culpa sint sint exercitation. Non proident occaecat reprehenderit veniam et proident dolor id culpa ea tempor do dolor. Nulla adipisicing qui fugiat id dolor. Nostrud magna voluptate irure veniam veniam labore ipsum deserunt adipisicing laboris amet eu irure. Sunt dolore nisi velit sit id. Nostrud voluptate labore proident cupidatat enim amet Lorem officia magna excepteur occaecat eu qui. Exercitation culpa deserunt non et tempor et non.
              </p>
              <p>
                Do dolor eiusmod eu mollit dolore nostrud deserunt cillum irure esse sint irure fugiat exercitation. Magna sit voluptate id in tempor elit veniam enim cupidatat ea labore elit. Aliqua pariatur eu nulla labore magna dolore mollit occaecat sint commodo culpa. Eu non minim duis pariatur Lorem quis exercitation. Sunt qui ex incididunt sit anim incididunt sit elit ad officia id.
              </p>
              <p id="lorem2">
                Tempor voluptate ex consequat fugiat aliqua. Do sit et reprehenderit culpa deserunt culpa. Excepteur quis minim mollit irure nulla excepteur enim quis in laborum. Aliqua elit voluptate ad deserunt nulla reprehenderit adipisicing sint. Est in eiusmod exercitation esse commodo. Ea reprehenderit exercitation veniam adipisicing minim nostrud. Veniam dolore ex ea occaecat non enim minim id ut aliqua adipisicing ad. Occaecat excepteur aliqua tempor cupidatat aute dolore deserunt ipsum qui incididunt aliqua occaecat sit quis. Culpa sint aliqua aliqua reprehenderit veniam irure fugiat ea ad.
              </p>
              <p>
                Eu minim fugiat laborum irure veniam Lorem aliqua enim. Aliqua veniam incididunt consequat irure consequat tempor do nisi deserunt. Elit dolore ad quis consectetur sint laborum anim magna do nostrud amet. Ea nulla sit consequat quis qui irure dolor. Sint deserunt excepteur consectetur magna irure. Dolor tempor exercitation dolore pariatur incididunt ut laboris fugiat ipsum sunt veniam aute sunt labore. Non dolore sit nostrud eu ad excepteur cillum eu ex Lorem duis.
              </p>
              <p>
                Id occaecat velit non ipsum occaecat aliqua quis ut. Eiusmod est magna non esse est ex incididunt aute ullamco. Cillum excepteur sint ipsum qui quis velit incididunt amet. Qui deserunt anim enim laborum cillum reprehenderit duis mollit amet ad officia enim. Minim sint et quis aliqua aliqua do minim officia dolor deserunt ipsum laboris. Nulla nisi voluptate consectetur est voluptate et amet. Occaecat ut quis adipisicing ad enim. Magna est magna sit duis proident veniam reprehenderit fugiat reprehenderit enim velit ex. Ullamco laboris culpa irure aliquip ad Lorem consequat veniam ad ipsum eu. Ipsum culpa dolore sunt officia laborum quis.
              </p>

              <h5 id="lorem3">Lorem ipsum dolor sit amet</h5>

              <p id="lorem4">
                Eiusmod nulla aliquip ipsum reprehenderit nostrud non excepteur mollit amet esse est est dolor. Dolore quis pariatur sit consectetur veniam esse ullamco duis Lorem qui enim ut veniam. Officia deserunt minim duis laborum dolor in velit pariatur commodo ullamco eu. Aute adipisicing ad duis labore laboris do mollit dolor cillum sunt aliqua ullamco. Esse tempor quis cillum consequat reprehenderit. Adipisicing proident anim eu sint elit aliqua anim dolore cupidatat fugiat aliquip qui.
              </p>
              <p id="lorem5">
                Nisi eiusmod esse cupidatat excepteur exercitation ipsum reprehenderit nostrud deserunt aliqua ullamco. Anim est irure commodo eiusmod pariatur officia. Est dolor ipsum excepteur magna aliqua ad veniam irure qui occaecat eiusmod aute fugiat commodo. Quis mollit incididunt amet sit minim velit eu fugiat voluptate excepteur. Sit minim id pariatur ex cupidatat cupidatat nostrud nostrud ipsum.
              </p>
              <p>
                Enim ea officia excepteur ad veniam id reprehenderit eiusmod esse mollit consequat. Esse non aute ullamco Lorem aliqua qui dolore irure eiusmod aute aliqua proident labore aliqua. Ipsum voluptate voluptate exercitation laborum deserunt nulla elit aliquip et minim ex veniam. Duis cupidatat aute sunt officia mollit dolor ad elit ad aute labore nostrud duis pariatur. In est sint voluptate consectetur velit ea non labore. Ut duis ea aliqua consequat nulla laboris fugiat aute id culpa proident. Minim eiusmod laboris enim Lorem nisi excepteur mollit voluptate enim labore reprehenderit officia mollit.
              </p>
              <p>
                Cupidatat labore nisi ut sunt voluptate quis sunt qui ad Lorem esse nisi. Ex esse velit ullamco incididunt occaecat dolore veniam tempor minim adipisicing amet. Consequat in exercitation est elit anim consequat cillum sint labore cillum. Aliquip mollit laboris ad labore anim.
              </p>
            </div>
          </section>
        </div>
        <footer class="mdl-mega-footer">
          <div class="mdl-mega-footer--middle-section">
            <div class="mdl-mega-footer--drop-down-section">
              <input class="mdl-mega-footer--heading-checkbox" type="checkbox" checked>
              <h1 class="mdl-mega-footer--heading">Features</h1>
              <ul class="mdl-mega-footer--link-list">
                <li><a href="#">About</a></li>
                <li><a href="#">Terms</a></li>
                <li><a href="#">Partners</a></li>
                <li><a href="#">Updates</a></li>
              </ul>
            </div>
            <div class="mdl-mega-footer--drop-down-section">
              <input class="mdl-mega-footer--heading-checkbox" type="checkbox" checked>
              <h1 class="mdl-mega-footer--heading">Details</h1>
              <ul class="mdl-mega-footer--link-list">
                <li><a href="#">Spec</a></li>
                <li><a href="#">Tools</a></li>
                <li><a href="#">Resources</a></li>
              </ul>
            </div>
            <div class="mdl-mega-footer--drop-down-section">
              <input class="mdl-mega-footer--heading-checkbox" type="checkbox" checked>
              <h1 class="mdl-mega-footer--heading">Technology</h1>
              <ul class="mdl-mega-footer--link-list">
                <li><a href="#">How it works</a></li>
                <li><a href="#">Patterns</a></li>
                <li><a href="#">Usage</a></li>
                <li><a href="#">Products</a></li>
                <li><a href="#">Contracts</a></li>
              </ul>
            </div>
            <div class="mdl-mega-footer--drop-down-section">
              <input class="mdl-mega-footer--heading-checkbox" type="checkbox" checked>
              <h1 class="mdl-mega-footer--heading">FAQ</h1>
              <ul class="mdl-mega-footer--link-list">
                <li><a href="#">Questions</a></li>
                <li><a href="#">Answers</a></li>
                <li><a href="#">Contact us</a></li>
              </ul>
            </div>
          </div>
          <div class="mdl-mega-footer--bottom-section">
            <div class="mdl-logo">
              More Information
            </div>
            <ul class="mdl-mega-footer--link-list">
              <li><a href="#">Web Starter Kit</a></li>
              <li><a href="#">Help</a></li>
              <li><a href="#">Privacy and Terms</a></li>
            </ul>
          </div>
        </footer>
      </main>
    </div>
    <script src="../../material.min.js"></script>
  </body>
</html>
