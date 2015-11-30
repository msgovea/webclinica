package logicalView;

public class Acesso {

    protected int id;
    protected int status;
    protected int acesso;
    protected String numero;
	protected String login;
    protected String nome;
    protected String rg;
    protected String cpf;
    protected String cep;
    protected String complemento;
    protected String recsenha;
    protected String nascimento;
    protected String telefone;
    protected String ddd;
   	protected String senha;
    
   



   	
	public Acesso(int id, String login) throws Exception {
        this.id = id;
        this.login = login;
    }
    
	 public String getSenha() {
		 return senha;
	 }




	 public void setSenha(String senha) {
		 this.senha = senha;
	 }

	 public String getDdd() {
		return ddd;
	 }




	public void setDdd(String ddd) {
		this.ddd = ddd;
	}
 
    
    public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}
    
    public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public String getRecsenha() {
		return recsenha;
	}

	public void setRecsenha(String recsenha) {
		this.recsenha = recsenha;
	}

    
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

