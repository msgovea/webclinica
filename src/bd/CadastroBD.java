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
	private ResultSet rs;

	public CadastroBD() throws Exception {
		this.con = new Conexao().getConnection();
	}

	public String insertTelefone(int id, String ddd, String telefone) {
		
		try {
			String sql = "insert into telefones (area, numero, idtipo, idpaciente) values (?,?,?,?)";
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setString(1, ddd);
			stmt.setString(2, telefone);
			stmt.setInt(3, 1);
			stmt.setInt(4, id);
			
			stmt.execute();
			return "SUCESSO";
		} catch (SQLException e) {
			return e.getMessage();
		}
		

	}
	
	public String adiciona(String possivelLogin, String senha, String nome, String rg, String cpf, String cep, String complemento, String numero, String ddd, String telefone, String nascimento, String recsenha)
			throws SQLException {

		int cont = 0;
		String loginManipulado = possivelLogin;
		while (!isLoginValide(possivelLogin)) {
			cont++;
			possivelLogin = loginManipulado + cont;
		}

		String sql = "insert into acesso (login, senha, status, acesso,recsenha) values (?,?,?,?,?)";
		try {
			// prepared statement para inserção
			PreparedStatement stmt = con.prepareStatement(sql);

			// seta os valores

			stmt.setString(1, possivelLogin);
			stmt.setString(2, Criptografia.md5(senha));
			stmt.setInt	  (3, 0); //0 = ativo .. 1 = inativo
			stmt.setInt	  (4, 0); //0 = paciente
			stmt.setString(5, recsenha);

			stmt.execute();
			// procura...
			sql = "select id from acesso where Login = ?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, possivelLogin);
			rs = stmt.executeQuery();
			rs.next();
			
			int id = rs.getInt("Id");
			
			
			// adiciona em pacientes
			sql = "insert into pacientes (id,nome,cep,numero,complemento,rg,cpf,nascimento) values (?,?,?,?,?,?,?,?)";
			stmt = con.prepareStatement(sql);

			stmt.setInt(1, id);
			stmt.setString(2, nome);
			stmt.setString(3, cep);
			stmt.setString(4, numero);
			stmt.setString(5, complemento);
			stmt.setString(6, rg);
			stmt.setString(7, cpf);
			stmt.setString(8, nascimento);
			stmt.execute();
			
			stmt.close();
			
			insertTelefone(id, ddd, telefone);
			
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
