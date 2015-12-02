package logicalView;

public class Especialidades {

    protected int id;
    protected int idProfissao;
    protected String nome;

	public Especialidades(int id, String nome, int idProfissao) throws Exception {
        this.id = id;
        this.nome = nome;
        this.idProfissao = idProfissao;
    }
	
	public Especialidades() {
        this.id = 0;
        this.nome = "";
        this.idProfissao = 0;
    }
	
	public int getIdProfissao() {
		return idProfissao;
	}

	public void setIdProfissao(int idProfissao) {
		this.idProfissao = idProfissao;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getNome() {
		return nome;
	}

    public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}	

	@Override
    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (obj instanceof Especialidades) {
            Especialidades p = (Especialidades) obj;
            if (this.id != p.id) {
                return false;
            }
            if (!this.nome.equals(p.nome)) {
                return false;
            }if (this.idProfissao != p.idProfissao) {
                return false;
            } else {
                return true;
            }
        }
        return false;
    }

	

}

