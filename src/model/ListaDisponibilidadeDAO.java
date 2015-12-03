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

	public Disponibilidade selectDisponibilidadebyId(int id) {
		String sql = "SELECT * FROM disponibilidades WHERE id = " + id;
		Disponibilidade elemento = new Disponibilidade();
		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			rs = stmt.executeQuery();
			if (rs.next()) {
				elemento.setId(rs.getInt("Id"));
				elemento.setDiaDaSemana(rs.getDate("DiaDaSemana"));
				elemento.setInicio(rs.getTime("Inicio"));
				elemento.setFim(rs.getTime("Fim"));
				elemento.setIdEspecialidade(rs.getInt("IdEspecialidade"));
				elemento.setIdProfissional(rs.getInt("idProfissional"));
				elemento.setLivre(rs.getInt("livre"));
				selectDisponibilidadeProfissional(elemento);
				selectEspecialidadeProfissional(elemento);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return elemento;
	}
	
	public ArrayList<Disponibilidade> selectDisponibilidade(String id) {
		String sql = "SELECT * FROM disponibilidades WHERE DiaDaSemana > sysdate() && IdEspecialidade = " + id;
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

	public ArrayList<Disponibilidade> listaContas(String id) {
		ArrayList<Disponibilidade> lista = selectDisponibilidade(id);

		for (Disponibilidade acesso : lista) {
			selectDisponibilidadeProfissional(acesso);
		}
		return lista;

	}

	public Disponibilidade selectDisponibilidadeProfissional(Disponibilidade elemento) {

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
	
	public Disponibilidade selectEspecialidadeProfissional(Disponibilidade elemento) {

		String sql = "SELECT * FROM especialidades WHERE id=" + elemento.getIdEspecialidade();

		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			rs = stmt.executeQuery();
			if (rs.next()) {
				elemento.setNomeEspecialidade(rs.getString("nome"));
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

		return elemento;
	}

	

}
