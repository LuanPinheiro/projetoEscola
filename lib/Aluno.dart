import 'Menu.dart';
import 'Validar.dart';
import 'main.dart';
import 'Pessoa.dart';

void menuAlunos(){
  int? opUsuario;
  Menu menu = new Menu();
  String tipo = "Aluno";
  do{
    menu.menuTela("aluno");
    opUsuario = validarEntradaMenu();
    switch(opUsuario){
      case 1:
        Pessoa aluno = new Pessoa();
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