package logicalView;

public class Usuario implements Cloneable {

    protected String login;
    protected String senha;
    protected String nome;
    protected boolean funcionario;

    public Usuario() {
        this.login = "";
        this.senha = "";
        this.nome = "";
        this.funcionario = false;
    }

    public Usuario(String login, String senha) throws Exception {
        try {
            if (login.length() > 10) {
                throw new Exception("login invalido");
            }
            if (senha.length() > 8) {
                throw new Exception("senha invalida");
            }

            this.login = login;
            this.senha = senha;
        } catch (Exception e) {
        };
    }

    public Usuario(Usuario copia) throws Exception {
        if (copia == null) {
            throw new Exception("parametro nulo");
        }
        try {
            this.login = copia.login;
            this.senha = copia.senha;
        } catch (Exception e) {
        }
    }

    public void setLogin(String login) throws Exception {
        try {
            if (login == null || login.length() > 10) {
                throw new Exception("Senha invalida");
            }
            this.login = login;
        } catch (Exception e) {
        };
    }

    public void setSenha(String senha) throws Exception {
        try {
            if (senha == null || senha.length() > 10) {
                throw new Exception("Senha invalida");
            }
            this.senha = senha;
        } catch (Exception e) {
        };
    }
    
    public boolean isFuncionario() {
    	return this.funcionario;
    }
    
    public void isFuncionario(boolean funcionario) {
    	this.funcionario = funcionario;
    }

    public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getLogin() {
        return this.login;
    }

    public String getSenha() {
        return this.senha;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (obj instanceof Pessoa) {
            Usuario usuario = (Usuario) obj;

            if (!this.senha.equals(usuario.senha)) {
                return false;
            }
            if (!this.login.equals(usuario.login)) {
                return false;
            }
            return true;
        }
        return false;
    }

    public int hashcode() {
        int resultado = 1;

        int auxLogin = this.login.hashCode();
        int auxSenha = this.senha.hashCode();

        resultado = 5 * resultado + auxLogin;
        resultado = 5 * resultado + auxSenha;

        return resultado;
    }

    @Override
    public String toString() {
        return "A senha é: " + senha
                + "/br O login é: " + login;
    }

    public Object clone() {
        Usuario obj = null;

        try {
            obj = new Usuario(this);
        } catch (Exception e) {
        }
        return obj;
    }

}
