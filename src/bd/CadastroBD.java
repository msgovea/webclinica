package bd;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conexao.Conexao;
import metodosExternos.Criptografia;

public class CadastroBD {
	private Connection con;

	public CadastroBD() throws Exception {
		this.con = new Conexao().getConnection();
	}

	public String adiciona(String possivelLogin, String senha, String nome, String email, String rg, String cpf, String cep, String endereco, String numero, String ddd, String telefone, String datanascimento, String recsenha)
			throws SQLException {

		int cont = 0;
		String loginManipulado = possivelLogin;
		while (!isLoginValide(possivelLogin)) {
			cont++;
			possivelLogin = loginManipulado + cont;
		}

		String sql = "insert into acesso (login, senha, status) values (?,?,?)";
		try {
			// prepared statement para inserção
			PreparedStatement stmt = con.prepareStatement(sql);

			// seta os valores

			stmt.setString(1, "teste005");
			stmt.setString(2, "oi");
			stmt.setInt	  (3, 0);

		try{	// executa
			stmt.execute();
		} catch (SQLException e) {
			return "run 1" + possivelLogin + Criptografia.md5(senha);
		}
			// procura...
			sql = "select id from acesso where Login = ?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, possivelLogin);
			ResultSet rs = stmt.executeQuery();
			try{
			rs.next();
			} catch (SQLException e) {
				return "run2";
			}
			int id = rs.getInt("Id");

			// adiciona em pacientes
			sql = "insert into pacientes (id, nome, cep, numero, complemento) values (?,?,?,?,?)";
			stmt = con.prepareStatement(sql);

			stmt.setInt(1, id);
			stmt.setString(2, nome);
			stmt.setString(3, cep);
			stmt.setString(4, numero);
			stmt.setString(5, "Perto dalí");
			try{
			stmt.execute();
			} catch (SQLException e) {
				return "run3";
			}
			stmt.close();

			return possivelLogin;
		} catch (SQLException e) {
			return "desconhecido";
		}
	}

	private boolean isLoginValide(String possivelLogin) {
		try {
			String query = "SELECT * FROM acesso";

			PreparedStatement st = con.prepareStatement(query);
			
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				if (rs.getString("Login").equals(possivelLogin))
					return false;
			}
			st.close();
			return true;

		} catch (SQLException e) {
			System.err.println("Got an exception with SQL! ");
			// System.err.println(e.getMessage());
		} catch (Exception e) {
			System.err.println("Got an exception!");
			// System.err.println(e.getMessage());
		}
		return false;
	}

	public ArrayList<String> getCargos() {
		try {
			String query = "SELECT * FROM cargos";

			PreparedStatement st = con.prepareStatement(query);

			ResultSet rs = st.executeQuery();
			ArrayList<String> ar = new ArrayList<String>();
			while (rs.next()) {
				ar.add(rs.getString("Nome"));
			}
			st.close();
			return ar;

		} catch (SQLException e) {
			System.err.println("Got an exception with SQL! ");
			// System.err.println(e.getMessage());
		} catch (Exception e) {
			System.err.println("Got an exception!");
			// System.err.println(e.getMessage());
		}
		return null;
	}
}
