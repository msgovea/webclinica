package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conexao.Conexao;
import logicalView.Consulta;
import logicalView.Disponibilidade;

public class ListaConsultasDAO {
	private Connection conexao = null;
	private ResultSet rs = null;

	public ListaConsultasDAO() throws Exception {
		conexao = new Conexao().getConnection();

	}
	
	public Consulta selectConsultaIdConsulta(int id) throws Exception {
		String sql = "SELECT * FROM consultas WHERE Id = " + id;
		Consulta elemento = new Consulta();
		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			rs = stmt.executeQuery();
			if (rs.next()) {
				elemento.setId(rs.getInt("Id"));
				elemento.setData(rs.getDate("Data"));
				elemento.setInicio(rs.getTime("Inicio"));
				elemento.setFim(rs.getTime("Fim"));
				elemento.setIdPaciente(rs.getInt("idpaciente"));
				elemento.setIdDisponibilidade(rs.getInt("iddisponibilidade"));
				elemento.setObservacoes(rs.getString("observacoes"));
				elemento.setPedidosDeExame(rs.getString("pedidosdeexame"));
				elemento.setPrescricoes(rs.getString("prescricoes"));
				elemento.setRecomendacoes(rs.getString("recomendacoes"));
				elemento.setProxConsulta(rs.getDate("proxconsulta"));
				
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return elemento;
	}

	public ArrayList<Consulta> selectConsulta(int id) throws Exception {
		String sql = "SELECT * FROM consultas WHERE IdPaciente = " + id;
		ArrayList<Consulta> lista = new ArrayList<Consulta>();
		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Consulta elemento = new Consulta();
				elemento.setId(rs.getInt("Id"));
				elemento.setData(rs.getDate("Data"));
				elemento.setInicio(rs.getTime("Inicio"));
				elemento.setFim(rs.getTime("Fim"));
				elemento.setIdPaciente(rs.getInt("idpaciente"));
				elemento.setIdDisponibilidade(rs.getInt("iddisponibilidade"));
				elemento.setObservacoes(rs.getString("observacoes"));
				elemento.setPedidosDeExame(rs.getString("pedidosdeexame"));
				elemento.setPrescricoes(rs.getString("prescricoes"));
				elemento.setRecomendacoes(rs.getString("recomendacoes"));
				ListaDisponibilidadeDAO listaDis = new ListaDisponibilidadeDAO();
				Disponibilidade disp = listaDis.selectDisponibilidadebyId(elemento.getIdDisponibilidade());
				elemento.setNomeMedico(disp.getNome());
				elemento.setNomeEspecialidade(disp.getNomeEspecialidade());
				lista.add(elemento);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return lista;
	}

	public ArrayList<Consulta> listaConsultas(int id) throws Exception {
		ArrayList<Consulta> lista = selectConsulta(id);
/*
		for (Consulta acesso : lista) {
			selectDisponibilidadeProfissional(acesso);
		}*/
		return lista;

	}

	/*
	public Consulta selectDisponibilidadeProfissional(Consulta elemento) {

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
	}*/

	

}
