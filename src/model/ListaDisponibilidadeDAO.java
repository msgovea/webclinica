package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conexao.Conexao;
import logicalView.Disponibilidade;

public class ListaDisponibilidadeDAO {
	private Connection conexao = null;
	private ResultSet rs = null;

	public ListaDisponibilidadeDAO() throws Exception {
		conexao = new Conexao().getConnection();

	}

	public ArrayList<Disponibilidade> selectDisponibilidade() {
		//String sql = "SELECT * FROM disponibilidades";
		String sql = "SELECT * FROM disponibilidades WHERE DiaDaSemana > sysdate()";
		ArrayList<Disponibilidade> lista = new ArrayList<Disponibilidade>();
		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			//stmt.setDate(parameterIndex, x);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Disponibilidade elemento = new Disponibilidade();
				elemento.setId(rs.getInt("Id"));
				elemento.setDiaDaSemana(rs.getDate("DiaDaSemana"));
				elemento.setInicio(rs.getTime("Inicio"));
				elemento.setFim(rs.getTime("Fim"));
				elemento.setIdEspecialidade(rs.getInt("IdEspecialidade"));
				elemento.setIdProfissional(rs.getInt("idProfissional"));
				elemento.setLivre(rs.getInt("livre"));
				lista.add(elemento);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return lista;
	}

	public ArrayList<Disponibilidade> listaContas() {
		ArrayList<Disponibilidade> lista = selectDisponibilidade();

		for (Disponibilidade acesso : lista) {
			selectDisponibilidade(acesso);
		}
		return lista;

	}

	public Disponibilidade selectDisponibilidade(Disponibilidade elemento) {

		String sql = "SELECT * FROM profissionaissaude WHERE id=" + elemento.getIdProfissional();

		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			rs = stmt.executeQuery();
			if (rs.next()) {
				elemento.setNome(rs.getString("nome"));
				elemento.setIdClasse(rs.getInt("IdClasse"));
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

		return elemento;
	}

	

}
