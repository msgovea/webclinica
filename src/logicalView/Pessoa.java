package logicalView;

public abstract class Pessoa {

    protected int codigo;
    protected String nome;
    protected String dataNascimento;
    protected Endereco endereco;
    protected String rg;
    protected String cpf;
    protected String telefone;
    protected String celular;

    public Pessoa() {
        this.codigo = 0;
        this.nome = " ";
        this.dataNascimento = " ";
        this.rg = " ";
        this.cpf = " ";
  
        this.telefone = " ";
        this.celular = " ";
    }

    public Pessoa(int codigo, String nome, String dataNascimento, String rg, String cpf,
            String telefone, String celular) throws Exception {
        this.codigo = codigo;
        this.nome = nome;
        this.dataNascimento = dataNascimento;
        this.rg = rg;
        this.cpf = cpf;
        this.telefone = telefone;
        this.celular = celular;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setDataNasc(String dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public int getCodigo() {
        return this.codigo;
    }

    public String getNome() {
        return this.nome;
    }

    public String getDataNascimento() {
        return this.dataNascimento;
    }

    public String getRg() {
        return this.rg;
    }

    public String getCpf() {
        return this.cpf;
    }

    public String getTelefone() {
        return this.telefone;
    }

    public String getCelular() {
        return this.celular;
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
            Pessoa p = (Pessoa) obj;
            if (this.codigo != codigo) {
                return false;
            }
            if (!this.nome.equals(p.nome)) {
                return false;
            }
            if (!this.dataNascimento.equals(p.dataNascimento)) {
                return false;
            }
            if (!this.rg.equals(p.rg)) {
                return false;
            }
            if (!this.cpf.equals(p.cpf)) {
                return false;
            }
            if (!this.telefone.equals(p.telefone)) {
                return false;
            }
            if (!this.celular.equals(p.celular)) {
                return false;
            } else {
                return true;
            }
        }
        return false;
    }

    public int hashcode() {
        int resultado = 1;

        int auxNome = this.nome.hashCode();
        int auxDataNascimento = this.dataNascimento.hashCode();
        int auxRg = this.rg.hashCode();
        int auxCpf = this.cpf.hashCode();
        int auxTelefone = this.telefone.hashCode();
        int auxCelular = this.celular.hashCode();

        resultado = 5 * resultado + auxNome;
        resultado = 5 * resultado + auxDataNascimento;
        resultado = 5 * resultado + auxRg;
        resultado = 5 * resultado + auxCpf;
        resultado = 5 * resultado + auxTelefone;
        resultado = 5 * resultado + auxCelular;

        return resultado;
    }
}

