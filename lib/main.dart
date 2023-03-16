import 'Pessoa.dart';
import 'Aluno.dart';
import 'Disciplina.dart';
import 'Professor.dart';
import 'Menu.dart';
import 'Validar.dart';

// Declarando as listas de alunos, professores e disciplinas
List<Pessoa> alunos = [];
List<Pessoa> professores = [];
List<Disciplina> disciplinas = [];

void main(){
  Menu menu = new Menu();
  int opUsuario;
  do{
    menu.menuTela("principal");
    opUsuario = validarEntradaMenu();
    switch(opUsuario){
      case 1: menuAlunos(); break;
      case 2: menuProfessores(); break;
      case 3: menuDisciplina(); break;
      case 0: print("Fechando"); break;
      default: print("Opção Invalida");
    }
  }while(opUsuario != 0);
}