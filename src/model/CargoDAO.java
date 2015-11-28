package model;

import java.sql.*;
import conexao.Conexao;

public class CargoDAO {
    
    private Connection conexao = null;
    private ResultSet rs = null;

    public CargoDAO() throws Exception {
        conexao = new Conexao().getConnection();
    }

    public String selectNomeCargo(int codCargo)throws Exception {
        String sql = "select Id,Nome from cargos where Id = ?";
        String valor = "";
        try {
            PreparedStatement stmt = conexao.prepareStatement(sql); //Processando a query
            stmt.setInt(1, codCargo); // o número 1 é o ponto de interrogação que indica a ordem do elemento buscado
            rs = stmt.executeQuery();
            if(rs.next())
                if (codCargo == rs.getInt("Id")) {
                    return rs.getString("Nome");
                }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return valor;
    }
}
