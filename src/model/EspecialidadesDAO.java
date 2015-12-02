package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conexao.Conexao;
import logicalView.Especialidades;

public class EspecialidadesDAO {
	
	private Connection conexao = null;
	private ResultSet rs = null;
	
	public EspecialidadesDAO() throws Exception {
		conexao = new Conexao().getConnection();

	}
	public ArrayList<Especialidades> selectProfissoes() {
		String sql = "SELECT * FROM especialidades";
		ArrayList<Especialidades> lista = new ArrayList<Especialidades>();
		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);

			rs = stmt.executeQuery();
			while (rs.next()) {
				Especialidades elemento = new Especialidades();
				elemento.setId(rs.getInt("Id"));
				elemento.setNome(rs.getString("Nome"));
				elemento.setIdProfissao(rs.getInt("idProfissao"));
				lista.add(elemento);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return lista;
	}

}
