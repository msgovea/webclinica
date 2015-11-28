package model;

import java.sql.*;
import conexao.Conexao;
import logicalView.Usuario;

public class UsuarioDAO {

    private Connection conexao = null;
    private ResultSet rs = null;

    public UsuarioDAO() throws Exception {
        conexao = new Conexao().getConnection();
    }

    public boolean verificaLogin(String login, String senha)throws Exception {
        String sql = "select * from acesso where Login = ?"; // Ponto de interrogação é uma variável para utilizar a classe PreparedStatement (trata o que pega do banco)

        try {
            PreparedStatement stmt = conexao.prepareStatement(sql); //Processando a query
            stmt.setString(1, login); // o número 1 é o ponto de interrogação que indica a ordem do elemento buscado
            rs = stmt.executeQuery();

            if (rs.next()) {
                if (login.equals(rs.getString("Login")) && senha.equals(rs.getString("Senha"))) {
                    return true;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    public boolean validaLoginAcesso(String login)throws Exception {
        String sql = "select Login from acesso where Login = ?";

        try {
            PreparedStatement stmt = conexao.prepareStatement(sql); //Processando a query
            stmt.setString(1, login); // o número 1 é o ponto de interrogação que indica a ordem do elemento buscado
            rs = stmt.executeQuery();
            
            if(rs.next()){
                if (login.equals(rs.getString("Login"))) {
                    return true;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    public boolean validaSenhaAcesso(String login, String senha)throws Exception {
        String sql = "select Login, Senha from acesso where Login = ?";
        try {
            PreparedStatement stmt = conexao.prepareStatement(sql); //Processando a query
            stmt.setString(1, login);// o número 1 é o ponto de interrogação que indica a ordem do elemento buscado
            rs = stmt.executeQuery();
            if(rs.next()){
                if (login.equals(rs.getString("Login"))&& senha.equals(rs.getString("Senha"))){
                    return true;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }
    
    //previous = , first =, last =, absolute(int numero linha) , retorno de todos boolean

    public int selectIdAcesso(String login)throws Exception {
        String sql = "select Id,Login from acesso where Login = ?";

        try {
            PreparedStatement stmt = conexao.prepareStatement(sql); //Processando a query
            stmt.setString(1, login); // o número 1 é o ponto de interrogação que indica a ordem do elemento buscado
            rs = stmt.executeQuery();
            if(rs.next())
                if (login.equals(rs.getString("Login"))) {
                    return rs.getInt("Id");
                }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return -1;
    }
    



}
