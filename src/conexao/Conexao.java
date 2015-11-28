package conexao;

import java.sql.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Conexao {
    public Connection getConnection()throws Exception{
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance(); // Descobrindo o driver
                    
            String conectionURL = "jdbc:mysql://ESPARTA/bdci27"; //caminho do banco de  dados
            String user = "bdci27";//usuario de conexao
            String pass = "xg45d41";//senha de conexao
        
            return DriverManager.getConnection(conectionURL, user, pass); // conectando ao banco de  dados
        }
        catch(SQLException e){
             throw new RuntimeException(e);//erro de  execução quando não consegue conectar com o banco
	     } catch (ClassNotFoundException ex) {
                 Logger.getLogger(Conexao.class.getName()).log(Level.SEVERE, null, ex);
             } catch (InstantiationException ex) {
                 Logger.getLogger(Conexao.class.getName()).log(Level.SEVERE, null, ex);
             } catch (IllegalAccessException ex) {
                 Logger.getLogger(Conexao.class.getName()).log(Level.SEVERE, null, ex);
             }
             return null;
        }
        
    }
    

