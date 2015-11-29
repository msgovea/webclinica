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

	public boolean validaIdFuncionario(int id) {
		String sql = "select Id from funcionarios where Id = ?";
		int valor = 0;

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
		String sql = "select Id,Cargo from funcionarios where Id = ?";
		int valor = 0;
		try {
			PreparedStatement stmt = conexao.prepareStatement(sql); // Processando
																	// a query
			stmt.setInt(1, idFuncionario); // o número 1 é o ponto de
											// interrogação que indica a ordem
											// do elemento buscado
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
		String sql = "select Id,Login,Status,Acesso from acesso";
		ArrayList<Acesso> lista = new ArrayList<Acesso>();
		try {
			PreparedStatement stmt = conexao.prepareStatement(sql); // Processando
																	// a query
			rs = stmt.executeQuery();
			while (rs.next()) {
				Acesso elemento = new Acesso();
				elemento.setId(rs.getInt("Id"));
				elemento.setLogin(rs.getString("Login"));
				elemento.setStatus(rs.getInt("Status"));
				elemento.setAcesso(rs.getInt("Acesso"));
				lista.add(elemento);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return lista;
	}

	public Acesso selecionaAcesso(Acesso acesso){
		switch (acesso.getAcesso()) {
			case 0:
				acesso = selectPaciente(acesso);
				break;
			case 1:
				acesso = selectFuncionario(acesso);
				break;
			case 2:
				acesso = selectProfissionaisSaude(acesso);
				break;
			case 3:
				acesso = selectFuncionario(acesso);
				break;
			case 4:
				acesso = selectProfissionaisSaude(acesso);
				break;
			default:
				acesso = selectPaciente(acesso);
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

	public Acesso selectPaciente(Acesso elemento) {

		String sql = "select Nome,RG,CPF,Nascimento from pacientes where id=" + elemento.getId();
		//String sql = "select Nome,CEP,Numero,Complemento from pacientes where id=" + elemento.getId();

		try {
			PreparedStatement stmt = conexao.prepareStatement(sql); 
			rs = stmt.executeQuery();
			if (rs.next()) {
				elemento.setNome(rs.getString("Nome"));
				elemento.setCpf(rs.getString("cpf"));
				elemento.setRg(rs.getString("Rg"));
				elemento.setNascimento(rs.getString("nascimento"));
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

		return elemento;
	}
	
	public Acesso selectFuncionario(Acesso elemento) {

		String sql = "select Nome,RG,CPF,Nascimento from funcionarios where id=" + elemento.getId();
		//String sql = "select Nome,CEP,Numero,Complemento from pacientes where id=" + elemento.getId();

		try {
			PreparedStatement stmt = conexao.prepareStatement(sql); 
			rs = stmt.executeQuery();
			if (rs.next()) {
				elemento.setNome(rs.getString("Nome"));
				elemento.setCpf(rs.getString("cpf"));
				elemento.setRg(rs.getString("Rg"));
				elemento.setNascimento(rs.getString("nascimento"));
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

		return elemento;
	}
	
	public Acesso selectProfissionaisSaude(Acesso elemento) {

		String sql = "select Nome,RG,CPF,Nascimento from profissionaissaude where id=" + elemento.getId();
		//String sql = "select Nome,CEP,Numero,Complemento from pacientes where id=" + elemento.getId();

		try {
			PreparedStatement stmt = conexao.prepareStatement(sql); 
			rs = stmt.executeQuery();
			if (rs.next()) {
				elemento.setNome(rs.getString("Nome"));
				elemento.setCpf(rs.getString("cpf"));
				elemento.setRg(rs.getString("Rg"));
				elemento.setNascimento(rs.getString("nascimento"));
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

		return elemento;
	}

	public Acesso selectAcesso(int id) {

		String sql = "select id,login,status,acesso from acesso where id=" + id;
		Acesso elemento = new Acesso();
		try {
			PreparedStatement stmt = conexao.prepareStatement(sql); 
			rs = stmt.executeQuery();
			if (rs.next()) {
				elemento.setId(rs.getInt("Id"));
				elemento.setLogin(rs.getString("Login"));
				elemento.setStatus(rs.getInt("Status"));
				elemento.setAcesso(rs.getInt("Acesso"));
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

		return elemento;
	}
	
}
