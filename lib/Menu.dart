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
            "3. Remover Aluno\n"
            "4. Atualizar Aluno\n"
            "0. Voltar\n");
    }
    else if(tipo == "professor"){
      print("\n\nMenu de Professores");
      print("1. Cadastro de Professor\n"
            "2. Listar Professores\n"
            "3. Remover Professor\n"
            "4. Atualizar Professor\n"
            "0. Voltar\n");
    }
    else if(tipo == "disciplina"){
      print("\n\nMenu de Disciplinas");
      print("1. Adicionar Disciplina\n"
            "2. Listar Disciplinas\n"
            "3. Mudar o Professor da Disciplina\n"
            "4. Remover Disciplina\n"
            "5. Inserir Aluno em uma Disciplina\n"
            "6. Excluir Aluno de uma Disciplina\n"
            "7. Listar uma Disciplina\n"
            "0. Voltar\n");
    }
  }
}