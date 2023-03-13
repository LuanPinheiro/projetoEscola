import 'dart:io';

import 'Validar.dart';
import 'main.dart';

class Pessoa {
  String? nome;
  int? matricula;
  static int matriculaNova = 1000;
  String? cpf;
  String? sexo;

  Pessoa(){ // Construtor para iniciar todas as variáveis como null
    this.nome = null;
    this.matricula = null;
    this.cpf = null;
    this.sexo = null;
  }

  PessoasParams( // Construtor com os dados finais sendo passados por parâmetro
      String nome,
      int matricula,
      String cpf,
      String sexo,){
    this.nome = nome;
    this.matricula = matricula;
    this.cpf = cpf;
    this.sexo = sexo;
  }

  cadastrar(){
    PessoasParams(validarNome(), addMatricula(), validarCPF(), validarSexo());
  }

  addMatricula(){
    matriculaNova++;
    return matriculaNova;
  }

  printDados(){
    print("Nome: ${this.nome}\n"
        "Matricula: ${this.matricula}\n"
        "CPF: ${this.cpf}\n"
        "Sexo: ${this.sexo}\n");
  }
}

void listarPessoas(String tipo, List<Pessoa> pessoas){
  if(pessoas.length == 0){
    print("Não há ${tipo} cadastrado");
  }
  else{
    for(int i = 0; i < pessoas.length; i++){
      print("\n${tipo} #${i+1}");
      pessoas[i].printDados();
    }
  }
}

void removerPessoa(String tipo, List<Pessoa> pessoas){
  if(pessoas.length == 0){
    print("Não há pessoas cadastradas");
  }
  else{
    print("Digite o CPF de quem quer remover:");
    String cpfRemover = stdin.readLineSync()!;
    Pessoa pessoaRemover = pessoas.singleWhere(
          (pessoaBuscada) => pessoaBuscada.cpf == cpfRemover,
      orElse: () => Pessoa(),
    );
    if(pessoaRemover.cpf == null){
      print("${tipo} não encontrado");
    }
    else{
      print("${tipo} removido");
      pessoaRemover.printDados();
      removePessoaDisciplinas(tipo, pessoaRemover);
      pessoas.remove(pessoaRemover);
    }
  }
}

// Função que dado um objeto pessoa, a retira de todas as disciplinas em que ela estiver cadastrada
void removePessoaDisciplinas(String tipo, Pessoa pessoaRemover){
  if(tipo == "aluno"){
    for(int i = 0; i < disciplinas.length; i++){
      for(int indexAlunos = 0;
      indexAlunos < disciplinas[i].alunosMatriculados.length;
      indexAlunos++){
        if(disciplinas[i].alunosMatriculados[indexAlunos].cpf == pessoaRemover.cpf){
          Pessoa pessoaRemovida = disciplinas[i].alunosMatriculados[indexAlunos];
          disciplinas[i].alunosMatriculados.remove(pessoaRemovida);
          break;
        }
      }
    }
  }
  else{
    for(int i = 0; i < disciplinas.length; i++){
      if(disciplinas[i].cpfProfessor == pessoaRemover.cpf){
        disciplinas[i].cpfProfessor = "Sem Professor";
      }
    }
  }
}

bool pessoaExiste(List<Pessoa> pessoas, String cpfBuscar){
  for(int i = 0; i < pessoas.length; i++){
    if(pessoas[i].cpf == cpfBuscar){
      return true;
    }
  }
  return false;
}