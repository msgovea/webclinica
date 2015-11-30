package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conexao.Conexao;
import logicalView.Acesso;
import metodosExternos.Criptografia;

public class UpdateDAO {
	private Connection conexao = null;
	private ResultSet rs = null;
	private UsuarioDAO usrDao;
	private ListaAcessoDAO listaDAO;

	public UpdateDAO() throws Exception {
		conexao = new Conexao().getConnection();
		listaDAO = new ListaAcessoDAO();
	}

	public String atualizaUser(int id, Acesso novo) {
		Acesso antigo = listaDAO.selecionaAcesso(listaDAO.selectAcesso(id));

		if (novo.getRecsenha() != null && !novo.getRecsenha().equals(""))
			antigo.setRecsenha(novo.getRecsenha());
		if (novo.getSenha() != null && !novo.getSenha().equals(""))
			antigo.setSenha(novo.getSenha());
		if (novo.getNome() != null && !novo.getNome().equals(""))
			antigo.setNome(novo.getNome());
		if (novo.getCpf() != null && !novo.getCpf().equals(""))
			antigo.setCpf(novo.getCpf());
		if (novo.getRg() != null && !novo.getRg().equals(""))
			antigo.setRg(novo.getRg());
		if (novo.getCep() != null && !novo.getCep().equals(""))
			antigo.setCep(novo.getCep());
		if (novo.getNascimento() != null && !novo.getNascimento().equals(""))
			antigo.setNascimento(novo.getNascimento());
		if (novo.getComplemento() != null && !novo.getComplemento().equals(""))
			antigo.setComplemento(novo.getComplemento());
		if (novo.getNumero() != null && !novo.getNumero().equals(""))
			antigo.setNumero(novo.getNumero());
		if (novo.getTelefone() != null && !novo.getTelefone().equals(""))
			antigo.setTelefone(novo.getTelefone());
		if (novo.getDdd() != null && !novo.getDdd().equals(""))
			antigo.setDdd(novo.getDdd());

		return updateUser(id, antigo);
	}

	private String updateUser(int id, Acesso novo) {
		try {
			String sql = "UPDATE acesso SET Senha = ?, recsenha = ? WHERE Id = ?";
			PreparedStatement stmt = conexao.prepareStatement(sql);

			stmt.setString(1, novo.getSenha());
			stmt.setString(2, novo.getRecsenha());

			stmt.setInt(3, id);
			stmt.executeUpdate();

			return selecionaAcessoParaUpdate(novo);

		} catch (SQLException e) {
			return "Erro Update 1";
		}
	}

	public String selecionaAcessoParaUpdate(Acesso acesso) {
		switch (acesso.getAcesso()) {
		case 0:
			return updateAcesso(acesso, "pacientes");
		case 1:
			return updateAcesso(acesso, "funcionarios");
		case 2:
			return updateAcesso(acesso, "profissionaissaude");
		case 3:
			return updateAcesso(acesso, "funcionarios");
		default:
			return updateAcesso(acesso, "pacientes");
		}
	}

	public String updateAcesso(Acesso elemento, String selecao) {

		try {
			String sql = "UPDATE " + selecao
					+ " SET nome = ?, cpf = ?, rg = ?, cep = ?, nascimento = ?, complemento = ?, numero = ? WHERE Id = ?";
			PreparedStatement stmt = conexao.prepareStatement(sql);

			stmt.setString(1, elemento.getNome());
			stmt.setString(2, elemento.getCpf());
			stmt.setString(3, elemento.getRg());
			stmt.setString(4, elemento.getCep());
			stmt.setString(5, elemento.getNascimento());
			stmt.setString(6, elemento.getComplemento());
			stmt.setString(7, elemento.getNumero());

			stmt.setInt(8, elemento.getId());

			stmt.executeUpdate();
			
			
			return updateTelefone(elemento);
		} catch (SQLException e) {
			return e.getMessage();
		}
	}
	
	public String updateTelefone(Acesso elemento) {
		
		try {
			String sql = "UPDATE telefones SET area = ?, numero = ? WHERE IdPaciente = ?";
			PreparedStatement stmt = conexao.prepareStatement(sql);
			
			stmt.setString(1, elemento.getDdd());
			stmt.setString(2, elemento.getTelefone());
			stmt.setInt(3, elemento.getId());
			
			stmt.executeUpdate();
			return "Sucesso";
		} catch (SQLException e) {
			return e.getMessage();
		}

	}
	
	public String updateStatus(String id, boolean ativa) {

		String sql;
		if (ativa) sql = "UPDATE acesso SET status = '0' WHERE id =" + id;
		else sql = "UPDATE acesso SET status = '1' WHERE id =" + id;
		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			
			stmt.executeUpdate();
			return "sucesso";
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
