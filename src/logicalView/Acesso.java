package logicalView;

public class Acesso {

    protected int id;
    protected String login;
    protected int status;
    protected int acesso;
    protected String nome;
    protected String rg;
    protected String cpf;
    protected String nascimento;
    protected String telefone;
    
    public String getRg() {
		return rg;
	}

	public void setRg(String rg) {
		this.rg = rg;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getNascimento() {
		return nascimento;
	}

	public void setNascimento(String nascimento) {
		this.nascimento = nascimento;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getNome() {
		return nome;
	}

	public Acesso() {
        this.id = 0;
        this.login = "";
        this.status = 0;      
    }

    public int getAcesso() {
		return acesso;
	}

	public void setAcesso(int acesso) {
		this.acesso = acesso;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Acesso(int id, String login) throws Exception {
        this.id = id;
        this.login = login;
    }

    public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	@Override
    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (obj instanceof Acesso) {
            Acesso p = (Acesso) obj;
            if (this.id != id) {
                return false;
            }
            if (!this.login.equals(p.login)) {
                return false;
            } else {
                return true;
            }
        }
        return false;
    }

    public int hashcode() {
        int resultado = 1;
        
        resultado = 5 * resultado + this.id;
        resultado = 5 * resultado + this.login.hashCode();

        return resultado;
    }

	public void setNome(String nome) {
		this.nome = nome;
	}

}

