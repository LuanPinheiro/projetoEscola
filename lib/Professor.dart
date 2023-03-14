import 'Menu.dart';
import 'Validar.dart';
import 'main.dart';
import 'Pessoa.dart';

void menuProfessores(){
  int? opUsuario;
  Menu menu = new Menu();
  String tipo = "Professor";
  do{
    menu.menuTela("professor");
    opUsuario = validarEntradaMenu();
    switch(opUsuario){
      case 1:
        Pessoa professor = new Pessoa();
        professor.cadastrar();
        professores.add(professor); break;
      case 2: listarPessoas(tipo, professores); break;
      case 3: removerPessoa(tipo, professores); break;
      case 4: atualizarPessoa(tipo, professores); break;
      case 0: print("Voltando"); break;
      default: print("Opcao Invalida"); break;
    }
  }while(opUsuario != 0);
}