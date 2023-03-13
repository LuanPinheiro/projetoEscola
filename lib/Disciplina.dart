import 'Pessoa.dart';
import 'Menu.dart';
import 'Validar.dart';
import 'main.dart';
import 'dart:io';

class Disciplina{
  String? nome;
  String? codigo;
  String? semestre;
  String? cpfProfessor;
  List<Pessoa> alunosMatriculados = [];

  // Construtor da disciplina inicializando null
  Disciplina(){
    this.nome = null;
    this.codigo = null;
    this.semestre = null;
    this.cpfProfessor = null;
  }

  // Construtor com os dados finais sendo passados por parâmetro
  DisciplinaParams(
      String nome,
      String codigo,
      String semestre,
      String cpfProfessor,){
    this.nome = nome;
    this.codigo = codigo;
    this.semestre = semestre;
    this.cpfProfessor = cpfProfessor;
  }

  cadastrarDisciplina(){
    if(professores.length == 0){
      DisciplinaParams(validarNome(), validarCodigo(), validarSemestre(), "Sem Professor");
    }
    else{
      DisciplinaParams(validarNome(), validarCodigo(), validarSemestre(), validarProfessor());
    }
  }

  printDados(){
    print("Nome: ${this.nome}\n"
        "Código: ${this.codigo}\n"
        "Semestre: ${this.semestre}\n"
        "Professor: ${this.cpfProfessor}\n"
        "Alunos Cadastrados: ${this.alunosMatriculados.length}\n"
    );
  }

  listarAlunosDisciplina(){
   if(this.alunosMatriculados.length == 0){
     print("Não há alunos cadastrados nessa disciplina");
   }
   else{
     for(int i = 0; i < this.alunosMatriculados.length; i++){
       print("Aluno #${i+1}");
       this.alunosMatriculados[i].printDados();
     }
   }
  }

  addAluno(){
    print("Digite o CPF do aluno que quer inserir na disciplina");
    String cpfAlunoInserir = validarCPF();
    Pessoa alunoInserir = alunos.singleWhere(
          (pessoaBuscada) => pessoaBuscada.cpf == cpfAlunoInserir,
      orElse: () => Pessoa(),
    );
    if(alunoInserir.cpf == null){
      print("Aluno não encontrado");
    }
    else{
      print("Aluno adicionado a disciplina ${this.codigo}");
      alunosMatriculados.add(alunoInserir);
    }
  }

  removerAluno(){
    print("Digite o CPF do aluno que quer remover da disciplina");
    String cpfAlunoRemover = validarCPF();
    Pessoa alunoRemover = this.alunosMatriculados.singleWhere(
          (pessoaBuscada) => pessoaBuscada.cpf == cpfAlunoRemover,
      orElse: () => Pessoa(),
    );
    if(alunoRemover.cpf == null){
      print("Aluno não encontrado");
    }
    else{
      print("Aluno removido da disciplina ${this.codigo}");
      alunosMatriculados.remove(alunoRemover);
    }
  }
}

void menuDisciplina(){
  int? opUsuario;
  Menu menu = new Menu();
  String tipo = "Disciplina";
  do{
    menu.menuTela("disciplina");
    opUsuario = validarEntradaMenu();
    switch(opUsuario){
      case 1:
        Disciplina disciplina = new Disciplina();
        disciplina.cadastrarDisciplina();
        disciplinas.add(disciplina); break;
      case 2: listarDisciplinas(); break;
      case 3: mudarProfessorDisciplina(); break;
      case 4: removerDisciplina(); break;
      case 5: adicionarAlunoEmDisciplina(); break;
      case 6: removerAlunoEmDisciplina(); break;
      case 7: listar1Disciplina(); break;
      case 0: print("Voltando"); break;
      default: print("Opcao Invalida"); break;
    }
  }while(opUsuario != 0);
}

void listarDisciplinas(){
  if(disciplinas.length == 0){
    print("Não há Disciplina cadastrada");
  }
  else{
    for(int i = 0; i < disciplinas.length; i++){
      print("\nDisciplina #${i+1}");
      disciplinas[i].printDados();
    }
  }
}

void removerDisciplina(){
  if(disciplinas.length == 0){
    print("Não há disciplinas cadastradas");
  }
  else{
    print("Digite o Codigo da disciplina que quer remover:");
    String codigoRemover = stdin.readLineSync()!;
    Disciplina disciplinaRemover = disciplinas.singleWhere(
          (disciplinaBuscada) => disciplinaBuscada.codigo == codigoRemover,
      orElse: () => Disciplina(),
    );
    if(disciplinaRemover.codigo == null){
      print("Disciplina não encontrada");
    }
    else{
      print("Disciplina removida");
      disciplinaRemover.printDados();
      disciplinas.remove(disciplinaRemover);
    }
  }
}

void adicionarAlunoEmDisciplina(){
  if(alunos.length == 0){
    print("Não há alunos cadastrados");
  }
  else if(disciplinas.length == 0){
    print("Não há disciplinas cadastradas");
  }
  else{
    print("Digite o Codigo da disciplina que quer adicionar aluno:");
    String codigoAdd = stdin.readLineSync()!;
    Disciplina disciplinaAdd = disciplinas.singleWhere(
          (disciplinaBuscada) => disciplinaBuscada.codigo == codigoAdd,
      orElse: () => Disciplina(),
    );
    if(disciplinaAdd.codigo == null){
      print("Disciplina não encontrada");
    }
    else{
      disciplinaAdd.addAluno();
    }
  }
}

void removerAlunoEmDisciplina(){
  if(alunos.length == 0){
    print("Não há alunos cadastrados");
  }
  else if(disciplinas.length == 0){
    print("Não há disciplinas cadastradas");
  }
  else{
    print("Digite o Codigo da disciplina que quer remover um aluno:");
    String codigoRemover = stdin.readLineSync()!;
    Disciplina disciplinaRemover = disciplinas.singleWhere(
          (disciplinaBuscada) => disciplinaBuscada.codigo == codigoRemover,
      orElse: () => Disciplina(),
    );
    if(disciplinaRemover.codigo == null){
      print("Disciplina não encontrada");
    }
    else{
      if(disciplinaRemover.alunosMatriculados.length == 0){
        print("Não há alunos cadastrados nessa disciplina");
      }
      else {
        disciplinaRemover.removerAluno();
      }
    }
  }
}

void listar1Disciplina(){
  if(disciplinas.length == 0){
    print("Não há disciplinas cadastradas");
  }
  else{
    print("Digite o Codigo da disciplina que quer listar:");
    String codigoListar = stdin.readLineSync()!;
    Disciplina disciplinaListar = disciplinas.singleWhere(
          (disciplinaBuscada) => disciplinaBuscada.codigo == codigoListar,
      orElse: () => Disciplina(),
    );
    if(disciplinaListar.codigo == null){
      print("Disciplina não encontrada");
    }
    else{
      disciplinaListar.printDados();
      disciplinaListar.listarAlunosDisciplina();
    }
  }
}

void mudarProfessorDisciplina(){
  if(professores.length == 0){
    print("Não há professores cadastrados");
  }
  else{
    print("Digite o Codigo da disciplina que quer mudar o professor:");
    String codigoMudar = stdin.readLineSync()!;
    Disciplina disciplinaMudar = disciplinas.singleWhere(
          (disciplinaBuscada) => disciplinaBuscada.codigo == codigoMudar,
      orElse: () => Disciplina(),
    );
    if(disciplinaMudar.codigo == null){
      print("Disciplina não foi encontrada");
    }
    else{
      print("Digite o CPF do novo professor");
      String novoProfessor = validarCPF();
      if(pessoaExiste(professores, novoProfessor)){
        disciplinaMudar.cpfProfessor = novoProfessor;
      }
      else{
        print("CPF não encontrado");
      }
    }
  }
}