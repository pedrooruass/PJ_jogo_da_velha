import 'dart:io';

List<List<dynamic>> matriz = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
];

String caracter1 = "";
String caracter2 = "";
String tabuleiro = '''
+-=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=+
|               +-------+-------+-------+                |
|               |       |       |       |                |
|               |   1   |   2   |   3   |                |
|               |       |       |       |                |
|               |-------|-------|-------|                |
|               |       |       |       |                |
|   Jogador1:$caracter1  |   4   |   5   |   6   |    Jogador2:$caracter2  |
|               |       |       |       |                |
|               |-------|-------|-------|                |
|               |       |       |       |                |
|               |   7   |   8   |   9   |                |
|               |       |       |       |                |
|               +-------+-------+-------+                |
+-=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=+
''';
  bool temosVencedor = false;
  bool temosVelha = false;

void main() {
// fazer a pergunta, mudar pra maiuscula a letra escolhida
print("+=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--+");
print("Jogador 1, Escolha o seu caracter:                      ");
print("-=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=");
  caracter1 = stdin.readLineSync().toUpperCase();

print("-=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=");
print("Jogador 2, Escolha o seu caracter:                      ");
print("-=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=");
  caracter2 = stdin.readLineSync().toUpperCase();
print("+-=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--+");
print("                                                          ");

  bool alternarJogador = false;

  print("+-=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=+");
  print("|-=--=--=--=--=Bem vindo ao Jogo da Velha!!-=--=--=--=--=|");
  // print("|-=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=|");


 String tabuleiroNovo = "";


  while (!temosVencedor && !temosVelha){

    // APRESENTAR TABULEIRO

    print(tabuleiro);


    String jogadorAtual = alternarJogador  ? caracter2 : caracter1;



    print("Usuario '$jogadorAtual', escolha sua posicao na tabela");
    String escolha = stdin.readLineSync();
    int escolhaConvertida = int.parse(escolha);

    print("O valor escolhido foi: $escolha");

// Atualizar na minha tabela

 
  jogada(jogador: jogadorAtual, numero: escolhaConvertida);

  // verificar se alguem ganhou
  // se nao ouve ganhador continua
 verificaGanhador(jogadorAgr: jogadorAtual);
 verificaVelha();
  alternarJogador = !alternarJogador;


  }



}

///DEFINE O VALOR DA JOGADA EM NOSSA MATRIZ E NA TABELA DE APRESENTACAO
void jogada({int numero, String jogador}) {
  switch (numero) {
    case 1:
      matriz[0][0] = jogador;
      tabuleiro = tabuleiro.replaceAll("1", jogador);
      break;

    case 2:
      matriz[0][1] = jogador;
      tabuleiro = tabuleiro.replaceAll("2", jogador);
      break;

    case 3:
      matriz[0][2] = jogador;
      tabuleiro = tabuleiro.replaceAll("3", jogador);
      break;

    case 4:
      matriz[1][0] = jogador;
      tabuleiro = tabuleiro.replaceAll("4", jogador);
      break;

    case 5:
      matriz[1][1] = jogador;
      tabuleiro = tabuleiro.replaceAll("5", jogador);
      break;

    case 6:
      matriz[1][2] = jogador;
      tabuleiro = tabuleiro.replaceAll("6", jogador);
      break;

    case 7:
      matriz[2][0] = jogador;
      tabuleiro = tabuleiro.replaceAll("7", jogador);
      break;

    case 8:
      matriz[2][1] = jogador;
      tabuleiro = tabuleiro.replaceAll("8", jogador);
      break;

    case 9:
      matriz[2][2] = jogador;
      tabuleiro = tabuleiro.replaceAll("9", jogador);
      break;


    default:
      print("Apresente um valor valido");
      break;
  }
}

/// VERIFICA SE OUVE GANHARDOR, SE POSITIVO PRINTA O GANHADOR MAS SE NEGATIVO NAO PRINTA NADA
void verificaGanhador({String jogadorAgr}){
// linha horizontal
if(matriz[0][0] == matriz[0][1] && matriz[0][1] == matriz[0][2]){
    print(tabuleiro);
    print("Parabens voce ganhou: $jogadorAgr");
    //  print("Voce Perdeu: ${!jogadorAtual}");
    temosVencedor = true;

  }else if(matriz[1][0] == matriz[1][1] && matriz[1][1] == matriz[1][2]){
    print(tabuleiro);
    print("Parabens voce ganhou: $jogadorAgr");
    //  print("Voce Perdeu: ${!jogadorAtual}");
    temosVencedor = true;

  }else if(matriz[2][0] == matriz[2][1] && matriz[2][1] == matriz[2][2]){
    print(tabuleiro);
    print("Parabens voce ganhou: $jogadorAgr");
    //  print("Voce Perdeu: ${!jogadorAtual}");
    temosVencedor = true;

  }
   // linha vertical
   else if(matriz[0][0] == matriz[1][0] && matriz[1][0] == matriz[2][0]){
    print(tabuleiro);
    print("Parabens voce ganhou: $jogadorAgr");
    //  print("Voce Perdeu: ${!jogadorAtual}");
    temosVencedor = true;
 
  }else if(matriz[0][1] == matriz[1][1] && matriz[1][1] == matriz[2][1]){
    print(tabuleiro);
    print("Parabens voce ganhou: $jogadorAgr");
    //  print("Voce Perdeu: ${!jogadorAtual}");
    temosVencedor = true;

  }else if(matriz[0][2] == matriz[1][2] && matriz[1][2] == matriz[2][2]){
    print(tabuleiro);
    print("Parabens voce ganhou: $jogadorAgr");
    //  print("Voce Perdeu: ${!jogadorAtual}");
    temosVencedor = true;

  }
    // diagonais
    else if(matriz[0][0] == matriz[1][1] && matriz[1][1] == matriz[2][2]){
    print(tabuleiro);
    print("Parabens voce ganhou: $jogadorAgr");
    //  print("Voce Perdeu: ${!jogadorAtual}");
    temosVencedor = true;

  }
  else if(matriz[0][2] == matriz[1][1] && matriz[1][1] == matriz[2][0]){
    print(tabuleiro);
    print("Parabens voce ganhou: $jogadorAgr");
    //  print("Voce Perdeu: ${!jogadorAtual}");
    temosVencedor = true;
    
   }
 
}

// se todas as posicoes foram modificadas e nao tivemos ganhador, temos uma VELHA
/// VERIFICA SE TODAS POSICOES FORAM MODIFICADAS E NAO TIVERAM GANHADOR SE POSITIVO TEMOS VELHA
void verificaVelha(){

  if(matriz[0][0] != 1 && matriz[0][1] != 2 && matriz[0][2] != 3 && matriz[1][0] != 4 && matriz[1][1] != 5 && matriz[1][2] != 6 && matriz[2][0] != 7 && matriz[2][1] != 8 && matriz[2][2] != 9 && temosVencedor == false){
    print(tabuleiro);
    print("Deu Velha");
    temosVelha = true;
    
  }


}