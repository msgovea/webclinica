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
public class Funcionario {
    private int codFuncionario;
    private int cargo;
    private String Nome;
    
    public Funcionario(){
        this.codFuncionario = 0;
        this.cargo = 0;
        this.Nome = "";
    }
    
    public Funcionario(int codFuncionario, int cargo, String nome) {
        this.codFuncionario = codFuncionario;
        this.cargo = cargo;
        this.Nome = nome;
    }
    
   
    
}
