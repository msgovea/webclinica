package bd;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conexao.Conexao;

public class ManipulaBanco {
	private Connection con;
	
	public ManipulaBanco() throws Exception {
	    Conexao conexao = new Conexao();
		this.con = conexao.getConnection();
	   }

	public void adiciona(String nome, String idade) throws SQLException {
		String sql = "insert into pacientes" +
                " (nome,cep,numero,complemento,rg,cpf,nascimento)" +
                " values (?,?,?,?,?,?,?)";
        PreparedStatement stmt = con.prepareStatement(sql);

        // preenche os valores
        stmt.setString(1, "Caelum");
        stmt.setInt(2, 230);
        stmt.setInt(3, 230);
        stmt.setString(4, "Caelum");
        stmt.setString(5, "Caelum");
        stmt.setString(6, "Caelum");
        stmt.setString(7, "Caelum");
        
        // executa
        stmt.execute();
        stmt.close();

        System.out.println("Gravado!");

        con.close();
	}
	
	public boolean seleciona(String idade)
	  {
		boolean achouAlgo = false;
	    try
	    {
	      String query = "SELECT * FROM dados WHERE idade = ?";

	      PreparedStatement st = con.prepareStatement(query);
	      st.setString(1,idade);
	         
	      ResultSet rs = st.executeQuery();
	       
	      while (rs.next())
	      {
	    	achouAlgo = true;
	        int id = rs.getInt("uint");
	        String firstName = rs.getString("nome");
	        String lastName = rs.getString("idade");
	         
	        // print the results
	        System.out.format("%s, %s, %s\n", id, firstName, lastName);
	        
	      }
	      st.close();
	      return achouAlgo;
	    }
	    catch (Exception e)
	    {
	      System.err.println("Got an exception! ");
	      System.err.println(e.getMessage());
	    }
	    ConexaoMySQL.FecharConexao();
		return achouAlgo;
	  }
}
