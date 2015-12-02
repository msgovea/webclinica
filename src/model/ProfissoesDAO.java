package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conexao.Conexao;
import logicalView.Profissoes;

public class ProfissoesDAO {
	
	private Connection conexao = null;
	private ResultSet rs = null;
	
	public ProfissoesDAO() throws Exception {
		conexao = new Conexao().getConnection();

	}
	public ArrayList<Profissoes> selectProfissoes() {
		String sql = "SELECT * FROM profissoes";
		ArrayList<Profissoes> lista = new ArrayList<Profissoes>();
		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);

			rs = stmt.executeQuery();
			while (rs.next()) {
				Profissoes elemento = new Profissoes();
				elemento.setId(rs.getInt("Id"));
				elemento.setNome(rs.getString("Nome"));
				lista.add(elemento);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return lista;
	}

}
