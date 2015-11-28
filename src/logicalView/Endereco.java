package logicalView;

import java.util.InputMismatchException;

public class Endereco {

    protected String rua;
    protected int numero;
    protected String bairro;
    protected String cidade;
    protected String estado;
    protected String cep;
    protected String complemento;

    public Endereco() {
        this.rua = " ";
        this.numero = 0;
        this.bairro = " ";
        this.cidade = " ";
        this.estado = " ";
        this.cep = " ";
        this.complemento = " ";
    }

    public Endereco(String rua, int numero, String bairro, String cidade,
            String estado, String cep, String complemento) throws Exception {
        try {
            this.rua = rua;
            this.numero = numero;
            this.bairro = bairro;
            this.cidade = cidade;
            this.estado = estado;
            this.cep = cep;
            this.complemento = complemento;
        } catch (InputMismatchException e) {
            throw new Exception("Caracter Invalido");
        }
    }
    
    public Endereco (Endereco copia) throws Exception {
        if (copia == null) {
            throw new Exception("parametro nulo");
        }
        try {
            this.rua = copia.rua;
            this.numero = copia.numero;
            this.bairro = copia.bairro;
            this.cidade = copia.cidade;
            this.estado = copia.estado;
            this.complemento = copia.complemento;
            this.cep = copia.cep;
        } catch (Exception e) {
        }
    }

    public void setRua(String rua) throws Exception {
        try {
            this.rua = rua;
        } catch (NullPointerException e) {
            throw new Exception("Valor não pode ser nulo");
        }
    }

    public void setNumero(int numero) throws Exception {
        try {
            this.numero = numero;
        } catch (InputMismatchException e) {
            throw new Exception("Caracter Invalido");
        }
    }

    public void setBairro(String bairro) throws Exception {
        try {
            this.bairro = bairro;
        } catch (NullPointerException e) {
            throw new Exception("Valor não pode ser nulo");
        }
    }

    public void setCidade(String cidade) throws Exception {
        try {
            this.cidade = cidade;
        } catch (NullPointerException e) {
            throw new Exception("Valor não pode ser nulo");
        }
    }

    public void setEstado(String estado) throws Exception {
        try {
            this.estado = estado;
        } catch (NullPointerException e) {
            throw new Exception("Valor não pode ser nulo");
        }
    }

    public void setCep(String cep) throws Exception {
        try {
            this.cep = cep;
        } catch (NullPointerException e) {
            throw new Exception("Valor não pode ser nulo");
        }
    }

    public void setComplemento(String complemento) throws Exception {
        this.complemento = complemento;
    }

    public String getRua() {
        return this.rua;
    }

    public int getNumero() {
        return this.numero;
    }

    public String getBairro() {
        return this.bairro;
    }

    public String getCidade() {
        return this.cidade;
    }

    public String getEstado() {
        return this.estado;
    }

    public String getCep() {
        return this.cep;
    }

    public String getComplemento() {
        return this.complemento;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (obj instanceof Endereco) {
            Endereco e = (Endereco) obj;
            if (!this.rua.equals(e.rua)) {
                return false;
            }
            if (this.numero != numero) {
                return false;
            }
            if (!this.bairro.equals(e.bairro)) {
                return false;
            }
            if (!this.cidade.equals(e.cidade)) {
                return false;
            }
            if (!this.estado.equals(e.estado)) {
                return false;
            }
            if (!this.cep.equals(e.cep)) {
                return false;
            }
            if (!this.complemento.equals(e.complemento)) {
                return false;
            }
        }
        return true;
    }

    public int hashcode() {
        int resultado = 1;

        int auxRua = this.rua.hashCode();
        int auxBairro = this.bairro.hashCode();
        int auxCidade = this.cidade.hashCode();
        int auxEstado = this.estado.hashCode();
        int auxCep = this.cep.hashCode();
        int auxComplemento = this.complemento.hashCode();

        resultado = 5 * resultado + auxRua;
        resultado = 5 * resultado + auxBairro;
        resultado = 5 * resultado + auxCidade;
        resultado = 5 * resultado + auxEstado;
        resultado = 5 * resultado + auxCep;
        resultado = 5 * resultado + auxComplemento;
        resultado = 5 * resultado + this.numero;

        return resultado;
    }

    @Override
    public String toString() {
        return "Rua: " + rua
                + "\n Numero: " + numero
                + "\n Complemento: " + complemento
                + "\n Bairro: " + bairro
                + "\n Cidade: " + cidade
                + "\n Estado: " + estado
                + "\n Cep: " + cep;
    }
    
    @Override
    public Object clone() {
        Endereco obj = null;

        try {
            obj = new Endereco(this);
        } catch (Exception e) {
        }
        return obj;
    }

}
