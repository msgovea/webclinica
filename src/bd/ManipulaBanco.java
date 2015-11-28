package bd;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ManipulaBanco {
	private Connection con;
	
	public ManipulaBanco() {
	     new ConexaoMySQL();
		this.con = ConexaoMySQL.getConexaoMySQL();
	   }

	public void adiciona(String nome, String idade) {
	    String sql = "insert into dados " + "(nome, idade)" + " values (?,?)";

	    try {
	        // prepared statement para inserção
	        PreparedStatement stmt = con.prepareStatement(sql);

	        // seta os valores

	        stmt.setString(1, nome);
	        stmt.setString(2, idade);
	        
	        // executa
	        stmt.execute();
	        stmt.close();
	        System.out.println("Escrita em banco efetuada com sucesso!");
	    } catch (SQLException e) {
	        throw new RuntimeException(e);
	    }
	    ConexaoMySQL.FecharConexao();
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
