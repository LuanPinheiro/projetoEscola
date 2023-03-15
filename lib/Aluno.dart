import 'Menu.dart';
import 'Validar.dart';
import 'main.dart';
import 'Pessoa.dart';

class Aluno extends Pessoa{
  static int matriculaNova = 1000;

  cadastrar(){
    PessoasParams(validarNome(), addMatricula(), validarCPF(), validarSexo());
    print("Aluno Cadastrado com Sucesso");
  }

  addMatricula(){
    matriculaNova++;
    return matriculaNova;
  }
}

void menuAlunos(){
  int? opUsuario;
  Menu menu = new Menu();
  String tipo = "Aluno";
  do{
    menu.menuTela("aluno");
    opUsuario = validarEntradaMenu();
    switch(opUsuario){
      case 1:
        Aluno aluno = new Aluno();
        aluno.cadastrar();
        alunos.add(aluno); break;
      case 2: listarPessoas(tipo, alunos); break;
      case 3: removerPessoa(tipo, alunos); break;
      case 4: atualizarPessoa(tipo, alunos); break;
      case 0: print("Voltando"); break;
      default: print("Opcao Invalida"); break;
    }
  }while(opUsuario != 0);
}