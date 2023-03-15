import 'dart:io';
import 'dart:core';

import 'Validar.dart';
import 'main.dart';
import 'Aluno.dart';
import 'Professor.dart';

abstract class Pessoa {
  String? nome;
  int? matricula;
  String? cpf;
  String? sexo;

  // Construtor para iniciar todas as variáveis como null
  Pessoa(){
    this.nome = null;
    this.matricula = null;
    this.cpf = null;
    this.sexo = null;
  }

  // Construtor com os dados finais sendo passados por parâmetro
  PessoasParams(
      String? nome,
      int? matricula,
      String? cpf,
      String? sexo,){
    this.nome = nome;
    this.matricula = matricula;
    this.cpf = cpf;
    this.sexo = sexo;
  }

  // Printa todos os dados de uma pessoa
  printDados(){
    print("Nome: ${this.nome}\n"
        "Matricula: ${this.matricula}\n"
        "CPF: ${this.cpf}\n"
        "Sexo: ${this.sexo}\n");
  }

  // Muda os atributos da classe novamente, não altera matrícula
  void atualizarDados(){
    PessoasParams(validarNome(), this.matricula!, validarCPF(), validarSexo());
  }
}

void listarPessoas(String tipo, List<dynamic> pessoas){
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

void removerPessoa(String tipo, List<dynamic> pessoas){
  if(pessoas.length == 0){
    print("Não há pessoas cadastradas");
  }
  else{
    print("Digite a matrícula de quem quer remover:");
    int matriculaRemover = validarMatricula();
    if(tipo == "Aluno"){
      Aluno alunoRemover = alunos.singleWhere(
            (pessoaBuscada) => pessoaBuscada.matricula == matriculaRemover,
        orElse: () => Aluno(),
      );
      if(alunoRemover.matricula == null){
        print("Aluno não encontrado");
      }
      else{
        print("${tipo} removido");
        alunoRemover.printDados();
        removePessoaDisciplinas(tipo, alunoRemover);
        pessoas.remove(alunoRemover);
      }
    }
    else{
      Professor professorRemover = professores.singleWhere(
            (pessoaBuscada) => pessoaBuscada.matricula == matriculaRemover,
        orElse: () => Professor(),
      );
      if(professorRemover.matricula == null){
        print("Professor não encontrado");
      }
      else{
        print("${tipo} removido");
        professorRemover.printDados();
        removePessoaDisciplinas(tipo, professorRemover);
        pessoas.remove(professorRemover);
      }
    }
  }
}

// Função que dado um objeto pessoa, a retira de todas as disciplinas em que ela estiver cadastrada
void removePessoaDisciplinas(String tipo, Pessoa pessoaRemover){
  if(tipo == "Aluno"){
    for(int i = 0; i < disciplinas.length; i++){
      for(int indexAlunos = 0;
      indexAlunos < disciplinas[i].alunosMatriculados.length;
      indexAlunos++){
        if(disciplinas[i].alunosMatriculados[indexAlunos] == pessoaRemover.matricula){
          int pessoaRemovida = disciplinas[i].alunosMatriculados[indexAlunos];
          disciplinas[i].alunosMatriculados.remove(pessoaRemovida);
          break;
        }
      }
    }
  }
  else{
    for(int i = 0; i < disciplinas.length; i++){
      if(disciplinas[i].matriculaProfessor == pessoaRemover.matricula){
        disciplinas[i].matriculaProfessor = 0;
      }
    }
  }
}

void atualizarPessoa(String tipo, List<dynamic> pessoas){
  if(pessoas.length == 0){
    print("Não existem ${tipo} cadastrados");
  }
  else{
    print("Digite a matrícula do ${tipo} que quer alterar:");
    int matriculaAlterar = validarMatricula();
    Pessoa pessoaAlterar = pessoas.singleWhere(
          (pessoaBuscada) => pessoaBuscada.matricula == matriculaAlterar,
      orElse: () => Aluno(),
    );
    if(pessoaAlterar.matricula == null){
      print("${tipo} não encontrado");
    }
    else{
      Pessoa pessoaAntigaAlterar = new Pessoa();
      pessoaAntigaAlterar.matricula = pessoaAlterar.matricula;
      // fazer função de copiar
      pessoaAlterar.atualizarDados();
      if(tipo == "Aluno"){
        for(int i = 0; i < disciplinas.length; i++){
          for(int indexAlunos = 0;
          indexAlunos < disciplinas[i].alunosMatriculados.length;
          indexAlunos++){
            if(disciplinas[i].alunosMatriculados[indexAlunos] == pessoaAntigaAlterar.matricula){
              disciplinas[i].alunosMatriculados[indexAlunos] = pessoaAlterar.matricula!;
              break;
            }
          }
        }
      }
      else{
        for(int i = 0; i < disciplinas.length; i++){
          if(disciplinas[i].matriculaProfessor == pessoaAntigaAlterar.matricula){
            disciplinas[i].matriculaProfessor = pessoaAlterar.matricula;
          }
        }
      }
      // Fazer uma função única de manter dados antigos individuais caso queira
    }
  }
}

bool pessoaExiste(List<Pessoa> pessoas, int matriculaBuscar){
  for(int i = 0; i < pessoas.length; i++){
    if(pessoas[i].matricula == matriculaBuscar){
      return true;
    }
  }
  return false;
}