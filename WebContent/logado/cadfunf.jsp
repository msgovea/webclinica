

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        
        <script type="text/javascript" src="ajax.js"></script>
        <script type="text/javascript" src="jquery-1.3.2.js"></script>        
        
    </head>
    <body>

            <div id="conteudo">
                <b>Estados:</b>
                <select id="txtEstado"
                        onchange="paginaAjax('buscaEspecialidade.jsp?tipo=estado&estado='+this.value, 'cidade')">
                    <option value="">Escolha um Estado</option>
                    <option value="">-----------------------</option>
                    <option value="1">São Paulo</option>
                    <option value="2">Paraná</option>
                    <option value="3">Rio de Janeiro</option>
                </select>
                <div id="cidade">
                    <b>Cidades:</b>
                    <select id='txtCid' name="txtCidade" 
                            disabled="true">
                        <option value="">-----------------</option>
                    </select>
                </div>
                <div id="descCid"></div>
                <div id="detalhes"></div>
            </div>
        
    </body>
</html>
