class Menu {
  String? opcoes; // Informacões no menu

  menuTela(String tipo){
    if(tipo == "principal"){
      print("\n\nBem Vindo ao Projeto Escola");
      print("1. Alunos\n"
            "2. Professores\n"
            "3. Disciplinas\n"
            "0. Fechar\n");
    }
    else if(tipo == "aluno"){
      print("\n\nMenu de Alunos");
      print("1. Cadastro de Aluno\n"
            "2. Listar Alunos\n"
            "0. Voltar\n");
    }
    else if(tipo == "professor"){
      print("\n\nMenu de Professores");
      print("1. Cadastro de Professor\n"
          "2. Listar Professores\n"
          "0. Fechar\n");
    }
  }
}