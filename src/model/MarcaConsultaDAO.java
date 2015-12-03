package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conexao.Conexao;
import logicalView.Consulta;
import logicalView.Disponibilidade;

public class MarcaConsultaDAO {
	private Connection conexao = null;
	
	public MarcaConsultaDAO() throws Exception {
		conexao = new Conexao().getConnection();
	}

	public boolean marcaConsulta(int idPaciente, int idDisponibilidade) throws Exception {
		ListaDisponibilidadeDAO listDisp = new ListaDisponibilidadeDAO();
		Disponibilidade disp = listDisp.selectDisponibilidadebyId(idDisponibilidade);
		UpdateDAO update = new UpdateDAO();
		update.updateDisponibilidade(idDisponibilidade);
		
		System.err.println("erro");
		try {
			String sql = "INSERT INTO consultas (Data, Inicio, Fim, IdPaciente, idDisponibilidade) VALUES (?,?,?,?,?)";
			PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setDate(1, disp.getDiaDaSemana());
			stmt.setTime(2, disp.getInicio());
			stmt.setTime(3, disp.getFim());
			stmt.setInt(4, idPaciente);
			stmt.setInt(5, idDisponibilidade);
			stmt.execute();
			stmt.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
}
