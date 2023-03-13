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
  bool erro = false;

  do{
    erro = false;
    print("Digite o nome: ");
    input = stdin.readLineSync()!;
    if(temNumeros(input)){
      print("Não pode haver números em um nome");
      erro = true;
    }
    else if(temCaracteres(input) == false){
      print("Nome deve conter caracteres");
      erro = true;
    }
  }while(erro);
  return input;
}

String validarCPF(){
  String input;
  bool erro = false;
  do{
    erro = false;
    print("Digite o CPF: ");
    input = stdin.readLineSync()!;
    if(temCaracteres(input)){
      print("CPF com apenas números");
      erro = true;
    }
    if(input.length != 11){
      print("CPF deve ter 11 números");
      erro = true;
    }
    if(digitosVerificadores(input) == false){
      print("CPF Inválido");
      erro = true;
    }
  }while(erro);
  return input;
}

String validarSexo(){
  String input;
  bool erro = false;
  do{
    erro = false;
    print("Escolha o sexo:\n"
          "1. F\n"
          "2. M\n"
          "3. O\n");
    input = stdin.readLineSync()!;
    switch(input){
      case "1": input = "F"; break;
      case "2": input = "M"; break;
      case "3": input = "O"; break;
      default: print("Entrada Inválida"); erro = true; break;
    }
  }while(erro);
  return input;
}

String validarCodigo(){
  String input;
  bool erro = false;
  do{
    erro = false;
    print("Digite o código da disciplina (Formato: ABC123): ");
    input = stdin.readLineSync()!;
    if(input.length != 6){
      print("Formato Inválido");
      erro = true;
    }
    else{
      String parteCaracteres = input.substring(0,3);
      String parteNumeros = input.substring(3);
      if(temNumeros(parteCaracteres) || temCaracteres(parteNumeros)){
        print("Letras e Numeros em posições erradas");
        erro = true;
      }
    }
  }while(erro);
  return input;
}

String validarSemestre(){
  String input;
  bool erro = false;
  do{
    erro = false;
    print("Digite o semestre da disciplina (formato 1111.1): ");
    input = stdin.readLineSync()!;
    if(input.length != 6){
      print("Formato Inválido");
      erro = true;
    }
  }while(erro);
  return input;
}

String validarProfessor(){
  String input;
  do{
    print("Digite o CPF do professor da disciplina: ");
    input = stdin.readLineSync()!;
  }while(false); // false temporário, ainda não há parâmetro de validação
  return input;
}

bool temNumeros(String texto){
  return RegExp(r'\d').hasMatch(texto);
}

bool temCaracteres(String texto) {
  return RegExp(r'[a-zA-Z]').hasMatch(texto);
}

bool temCaracteresIguais(String texto) {
  for (int i = 1; i < texto.length; i++) {
    if (texto[i] != texto[0]) {
      return false;
    }
  }
  return true;
}

// Retorna true se o cpf for valido, usando a regra real dos dígitos verificadores
bool digitosVerificadores(String cpf){
  if(temCaracteresIguais(cpf)){
    return false;
  }
  // Calcula o primeiro dígito verificador
  int soma = 0;
  for (int i = 0; i < 9; i++) {
    soma += int.parse(cpf[i]) * (10 - i);
  }
  int primeiroDV = 11 - (soma % 11);
  if (primeiroDV >= 10) {
    primeiroDV = 0;
  }

  // Calcula o segundo dígito verificador
  soma = 0;
  for (int i = 0; i < 10; i++) {
    soma += int.parse(cpf[i]) * (11 - i);
  }
  int segundoDV = 11 - (soma % 11);
  if (segundoDV >= 10) {
    segundoDV = 0;
  }

  // Verifica se os dígitos verificadores calculados são iguais aos do CPF original
  return (int.parse(cpf[9]) == primeiroDV && int.parse(cpf[10]) == segundoDV);
}