import 'Menu.dart';
import 'Validar.dart';
import 'main.dart';

class Aluno {
  String? nome;
  int? matricula;
  static int matriculaNova = 1000;
  String? cpf;
  String? sexo;

  Aluno(){ // Construtor para iniciar todas as variáveis como null
    this.nome = null;
    this.matricula = null;
    this.cpf = null;
    this.sexo = null;
  }

  AlunoParams( // Construtor com os dados sendo passados corretamente
      String nome,
      int matricula,
      String cpf,
      String sexo,){
    this.nome = nome;
    this.matricula = matricula;
    this.cpf = cpf;
    this.sexo = sexo;
  }

  cadastrarAluno(){
    AlunoParams(validarNome(), addMatricula(), validarCPF(), validarSexo());
  }

  addMatricula(){
    matriculaNova++;
    return matriculaNova;
  }

  printDadosAluno(){
    print("Nome: ${this.nome}\n"
        "Matricula: ${this.matricula}\n"
        "CPF: ${this.cpf}\n"
        "Sexo: ${this.sexo}\n");
  }
}

void menuAlunos(){
  int? opUsuario;
  Menu menu = new Menu();
  do{
    menu.menuTela("aluno");
    opUsuario = validarEntradaMenu();
    switch(opUsuario){
      case 1:
        Aluno aluno = new Aluno();
        aluno.cadastrarAluno();
        alunos.add(aluno); break;
      case 2: listarAlunos(); break;
      case 0: print("Voltando"); break;
      default: print("Opcao Invalida"); break;
    }
  }while(opUsuario != 0);
}

void listarAlunos(){
  if(alunos.length == 0){
    print("Não há alunos cadastrados");
  }
  else{
    for(int i = 0; i < alunos.length; i++){
      print("\nAluno #${i+1}");
      alunos[i].printDadosAluno();
    }
  }
}