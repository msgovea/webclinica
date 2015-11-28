package bd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexaoMySQL {
	public static String status = "Não conectou...";

	public ConexaoMySQL() {
		
	}

	public static java.sql.Connection getConexaoMySQL() {
		Connection connection = null;
		// atributo do tipo Connection
		try {
			// Carregando o JDBC Driver padrão
			String driverName = "com.mysql.jdbc.Driver";
			Class.forName(driverName);
			// Configurando a nossa conexão com um banco de dados//

			String serverName = "ESPARTA"; // caminho do servidor do BD

			String mydatabase = "bdci27"; // nome do seu banco de dados

			String url = "jdbc:mysql://" + serverName + "/" + mydatabase;

			String username = "bdci27"; // nome de um usuário de seu BD

			String password = "xg45d41"; // sua senha de acesso

			connection = DriverManager.getConnection(url, username, password);

			if (connection != null) {
				status = ("STATUS--->Conectado com sucesso!");
			} else {
				status = ("STATUS--->Não foi possivel realizar conexão");
			}
			return connection;

		} catch (ClassNotFoundException e) {
			System.out.println("Nao achcou driver");
			return null;
		}

		catch (SQLException e) {
			System.out.println("Nao foi possivel conectar ao Banco de Dados.");

			return null;
		}
	}

	// retorna status da conexao

	public static String statusConection() {
		return status;

	}

	// metodo que fecha a conexao

	public static boolean FecharConexao() {
		try {
			ConexaoMySQL.getConexaoMySQL().close();
			return true;
		} catch (SQLException e) {
			return false;
		}
	}

	// reinicia conexao
	public static java.sql.Connection ReiniciarConexao() {
		FecharConexao();
		return ConexaoMySQL.getConexaoMySQL();
	}

}
