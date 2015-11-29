package model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conexao.Conexao;
import logicalView.Acesso;

public class AcessoDAO {
    private Connection conexao = null;
    private ResultSet rs = null;
    private UsuarioDAO usrDao;
    
    public AcessoDAO()throws Exception{
        conexao = new Conexao().getConnection();
        
    }          
    
    public boolean validaIdFuncionario(int id) {
        String sql = "select Id from funcionarios where Id = ?";
        int valor = 0;

        try {
            PreparedStatement stmt = conexao.prepareStatement(sql); //Processando a query
            stmt.setInt(1, id); // o número 1 é o ponto de interrogação que indica a ordem do elemento buscado
            rs = stmt.executeQuery();
            if(rs.next())
                if (id == rs.getInt("Id")) {
                    return true;
                }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }
    
    public int selectCargo(int idFuncionario) {
        String sql = "select Id,Cargo from funcionarios where Id = ?";
        int valor = 0;  
        try {
            PreparedStatement stmt = conexao.prepareStatement(sql); //Processando a query
            stmt.setInt(1, idFuncionario); // o número 1 é o ponto de interrogação que indica a ordem do elemento buscado
            rs = stmt.executeQuery();
            if(rs.next())
                if (idFuncionario == rs.getInt("Id")) {
                    valor = rs.getInt("Cargo");
                    return valor;
                }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return valor;
    }
    

          
    
}
