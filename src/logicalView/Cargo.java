/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logicalView;

/**
 *
 * @author 14541619
 */
public class Cargo {
    private int codCargo;
    private String nome;
    
    public Cargo(){
        this.codCargo = 0;
        this.nome = "";
        }
    
    public Cargo(int codCargo, String nome) {
        this.codCargo = codCargo;
        this.nome = nome;
    }
    
    public int getCodCargo(){
        return this.codCargo;
    }
    
    public String getNome(){
        return this.nome;
    }
    
    public void setCodCargo(int codCargo){
       this.codCargo = codCargo;
    }

    public void setNome(String nome){
        this.nome = nome;
    }
    
    @Override
    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (obj instanceof Cargo) {
            Cargo cargo = (Cargo) obj;
            if (this.codCargo != cargo.codCargo) {
                return false;
            }
            if (!this.nome.equals(cargo.nome)) {
                return false;
            }
            return true;
        }

        return false;
    }

    
    
}
