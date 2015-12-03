package logicalView;

import java.sql.Date;
import java.sql.Time;

public class Consulta {

    protected int id;
    protected Date Data;
    protected Date ProxConsulta;
    protected Time Inicio;
    protected Time Fim;
    protected int idPaciente;
    protected int idDisponibilidade;
    
    protected String Observacoes;
    protected String PedidosDeExame;
    protected String Prescricoes;
    protected String Recomendacoes;
    
    protected String nomeMedico;
    protected String nomeEspecialidade;
   	
    
	    
    public Date getProxConsulta() {
		return ProxConsulta;
	}

	public void setProxConsulta(Date proxConsulta) {
		ProxConsulta = proxConsulta;
	}

	public String getNomeMedico() {
		return nomeMedico;
	}

	public void setNomeMedico(String nomeMedico) {
		this.nomeMedico = nomeMedico;
	}

	public String getNomeEspecialidade() {
		return nomeEspecialidade;
	}

	public void setNomeEspecialidade(String nomeEspecialidade) {
		this.nomeEspecialidade = nomeEspecialidade;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getData() {
		return Data;
	}

	public void setData(Date data) {
		Data = data;
	}

	public Time getInicio() {
		return Inicio;
	}

	public void setInicio(Time inicio) {
		Inicio = inicio;
	}

	public Time getFim() {
		return Fim;
	}

	public void setFim(Time fim) {
		Fim = fim;
	}

	public int getIdPaciente() {
		return idPaciente;
	}

	public void setIdPaciente(int idPaciente) {
		this.idPaciente = idPaciente;
	}

	public int getIdDisponibilidade() {
		return idDisponibilidade;
	}

	public void setIdDisponibilidade(int idDisponibilidade) {
		this.idDisponibilidade = idDisponibilidade;
	}

	public String getObservacoes() {
		return Observacoes;
	}

	public void setObservacoes(String observacoes) {
		Observacoes = observacoes;
	}

	public String getPedidosDeExame() {
		return PedidosDeExame;
	}

	public void setPedidosDeExame(String pedidosDeExame) {
		PedidosDeExame = pedidosDeExame;
	}

	public String getPrescricoes() {
		return Prescricoes;
	}

	public void setPrescricoes(String prescricoes) {
		Prescricoes = prescricoes;
	}

	public String getRecomendacoes() {
		return Recomendacoes;
	}

	public void setRecomendacoes(String recomendacoes) {
		Recomendacoes = recomendacoes;
	}

	public Consulta(int id, int idProfissional, int idEspecialidade, Date DiaDaSemana, Time  Inicio, Time Fim) throws Exception {
		this.id = id;
        this.Inicio = Inicio;
        this.Fim = Fim;
    }
   	 
	public Consulta() {

    }
	
	


	@Override
    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (obj instanceof Consulta) {
            Consulta p = (Consulta) obj;
            if (this.id != p.id) {
                return false;
            }
            if (this.id != (p.id)) {
                return false;
            } else {
                return true;
            }
        }
        return false;
    }

}

