import 'dart:io';

// Função que recebe um input do usuário e retorna a variável caso seja um inteiro
int validarEntradaMenu() {
  String input;
  int? opUsuario;

  do {
    input = stdin.readLineSync()!;
    opUsuario = int.tryParse(input);
    if (opUsuario == null) {
      print("Digite novamente");
    }
    else {
      return int.parse(input);
    }
  }while(opUsuario == null);
  return 0; // Não estava compilando sem essa linha, mas não vai ser executada nunca
}

// Retorna um nome validado
String validarNome(){
  String input;
  do{
    print("Digite o nome: ");
    input = stdin.readLineSync()!;
  }while(false); // false temporário, ainda não há parâmetro de validação
  return input;
}

String validarCPF(){
  String input;
  do{
    print("Digite o CPF: ");
    input = stdin.readLineSync()!;
  }while(false); // false temporário, ainda não há parâmetro de validação
  return input;
}

String validarSexo(){
  String input;
  do{
    print("Digite o sexo: ");
    input = stdin.readLineSync()!;
  }while(false); // false temporário, ainda não há parâmetro de validação
  return input;
}