package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conexao.Conexao;
import logicalView.Acesso;

public class ListaAcessoDAO {
	private Connection conexao = null;
	private ResultSet rs = null;
	private UsuarioDAO usrDao;

	public ListaAcessoDAO() throws Exception {
		conexao = new Conexao().getConnection();

	}

	public Acesso selectAcesso(int id) {

		String sql = "select * from acesso where id=" + id;
		Acesso elemento = new Acesso();
		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			rs = stmt.executeQuery();
			if (rs.next()) {
				elemento.setId(rs.getInt("Id"));
				elemento.setLogin(rs.getString("Login"));
				elemento.setStatus(rs.getInt("Status"));
				elemento.setAcesso(rs.getInt("Acesso"));
				elemento.setRecsenha(rs.getString("recsenha"));
				elemento.setSenha(rs.getString("senha"));
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

		return elemento;
	}

	public boolean validaIdFuncionario(int id) {
		String sql = "SELECT Id FROM funcionarios WHERE Id = ?";

		try {
			PreparedStatement stmt = conexao.prepareStatement(sql); // Processando
																	// a query
			stmt.setInt(1, id); // o número 1 é o ponto de interrogação que
								// indica a ordem do elemento buscado
			rs = stmt.executeQuery();
			if (rs.next())
				if (id == rs.getInt("Id")) {
					return true;
				}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return false;
	}

	public int selectCargo(int idFuncionario) {
		String sql = "SELECT Id,Cargo FROM funcionarios WHERE Id = ?";
		int valor = 0;
		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setInt(1, idFuncionario);
			rs = stmt.executeQuery();
			if (rs.next())
				if (idFuncionario == rs.getInt("Id")) {
					valor = rs.getInt("Cargo");
					return valor;
				}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return valor;
	}

	public ArrayList<Acesso> selectAcesso() {
		String sql = "SELECT * FROM acesso";
		ArrayList<Acesso> lista = new ArrayList<Acesso>();
		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);

			rs = stmt.executeQuery();
			while (rs.next()) {
				Acesso elemento = new Acesso();
				elemento.setId(rs.getInt("Id"));
				elemento.setLogin(rs.getString("Login"));
				elemento.setStatus(rs.getInt("Status"));
				elemento.setAcesso(rs.getInt("Acesso"));
				elemento.setRecsenha(rs.getString("recsenha"));
				elemento.setSenha(rs.getString("senha"));
				lista.add(elemento);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return lista;
	}

	public Acesso selecionaAcesso(Acesso acesso) {
		switch (acesso.getAcesso()) {
		case 0:
			acesso = selectAcesso(acesso, "pacientes");
			break;
		case 1:
			acesso = selectAcesso(acesso, "funcionarios");
			break;
		case 2:
			acesso = selectAcesso(acesso, "profissionaissaude");
			break;
		case 3:
			acesso = selectAcesso(acesso, "funcionarios");
			break;
		default:
			acesso = selectAcesso(acesso, "pacientes");
			break;
		}
		return acesso;
	}

	public ArrayList<Acesso> listaContas() {
		ArrayList<Acesso> lista = selectAcesso();

		for (Acesso acesso : lista) {
			selecionaAcesso(acesso);
		}
		return lista;

	}

	public Acesso selectAcesso(Acesso elemento, String selecao) {

		String sql = "SELECT * FROM " + selecao + " WHERE id=" + elemento.getId();

		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			rs = stmt.executeQuery();
			if (rs.next()) {
				elemento.setNome(rs.getString("Nome"));
				elemento.setCpf(rs.getString("cpf"));
				elemento.setRg(rs.getString("Rg"));
				elemento.setNumero(rs.getString("Numero"));
				elemento.setCep(rs.getString("cep"));
				elemento.setComplemento(rs.getString("complemento"));
				elemento.setNascimento(rs.getString("nascimento"));
				
				selectTelefone(elemento);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

		return elemento;
	}

	public String selectTelefone(Acesso elemento) {

		try {
			String sql = "SELECT * FROM telefones WHERE idPaciente=" + elemento.getId();
			PreparedStatement stmt = conexao.prepareStatement(sql);
			rs = stmt.executeQuery();
			if (rs.next()) {
				elemento.setDdd(rs.getString("area"));
				elemento.setTelefone(rs.getString("numero"));
			}
		} catch (SQLException e) {
			return e.getMessage();
		}
		return "";

	}

	

}
