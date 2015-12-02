package logicalView;

public class Profissoes {

    protected int id;
    protected String nome;

   	
	public Profissoes(int id, String nome) throws Exception {
        this.id = id;
        this.nome = nome;
    }
	
	public Profissoes() {
        this.id = 0;
        this.nome = "";
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
        if (obj instanceof Profissoes) {
            Profissoes p = (Profissoes) obj;
            if (this.id != p.id) {
                return false;
            }
            if (!this.nome.equals(p.nome)) {
                return false;
            } else {
                return true;
            }
        }
        return false;
    }

	

}

