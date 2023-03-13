import 'Aluno.dart';
import 'Menu.dart';
import 'Validar.dart';

// Declarando as listas de alunos, professores e disciplinas
List<Aluno> alunos = [];

void main(){
  Menu menu = new Menu();
  int opUsuario;
  do{
    menu.menuTela("principal");
    opUsuario = validarEntradaMenu();
    switch(opUsuario){
      case 1: menuAlunos(); break;
      case 2: break;
      case 3: break;
      case 0: print("Fechando"); break;
      default: print("Opção Invalida");
    }
  }while(opUsuario != 0);
}