import 'Menu.dart';
import 'Validar.dart';
import 'main.dart';
import 'Pessoa.dart';

class Professor extends Pessoa{
  static int matriculaNova = 10000;

  cadastrar(){
    PessoasParams(validarNome(), addMatricula(), validarCPF(), validarSexo());
    print("Professor Cadastrado com Sucesso");
  }

  addMatricula(){
    matriculaNova++;
    return matriculaNova;
  }
}
void menuProfessores(){
  int? opUsuario;
  Menu menu = new Menu();
  String tipo = "Professor";
  do{
    menu.menuTela("professor");
    opUsuario = validarEntradaMenu();
    switch(opUsuario){
      case 1:
        Professor professor = new Professor();
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