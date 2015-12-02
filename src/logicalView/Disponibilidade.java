package logicalView;

import java.sql.Date;
import java.sql.Time;

public class Disponibilidade {

    protected int id;
    protected int idProfissional;
    protected int idEspecialidade;
    protected int idClasse;
    protected int Livre;
    protected String nome;
    protected Date DiaDaSemana;
    protected Time Inicio;
    protected Time Fim;
   	
	public Disponibilidade(int id, int idProfissional, int idEspecialidade, Date DiaDaSemana, Time  Inicio, Time Fim) throws Exception {
		this.id = id;
        this.idProfissional = idProfissional;
        this.idEspecialidade = idEspecialidade;
        this.DiaDaSemana = DiaDaSemana;
        this.Inicio = Inicio;
        this.Fim = Fim;
    }
    
	 
	public Disponibilidade() {
        this.id = 0;
        this.idProfissional = 0;
        this.idEspecialidade = 0;
        this.DiaDaSemana = null;
        this.Inicio = null;
        this.Fim = null;
    }
	
	public int getIdClasse() {
		return idClasse;
	}


	public void setIdClasse(int idClasse) {
		this.idClasse = idClasse;
	}


	public String getNome() {
		return nome;
	}


	public void setNome(String nome) {
		this.nome = nome;
	}


	public int getIdEspecialidade() {
		return idEspecialidade;
	}


	public void setIdEspecialidade(int idEspecialidade) {
		this.idEspecialidade = idEspecialidade;
	}


	public int getLivre() {
		return Livre;
	}


	public void setLivre(int livre) {
		Livre = livre;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getIdProfissional() {
		return idProfissional;
	}


	public void setIdProfissional(int idProfissional) {
		this.idProfissional = idProfissional;
	}

	public Date getDiaDaSemana() {
		return DiaDaSemana;
	}


	public void setDiaDaSemana(Date diaDaSemana) {
		DiaDaSemana = diaDaSemana;
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


	@Override
    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (obj instanceof Disponibilidade) {
            Disponibilidade p = (Disponibilidade) obj;
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

