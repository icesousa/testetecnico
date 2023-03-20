/*

Dado a sequência de Fibonacci, onde se inicia por 0 e 1 e o próximo valor sempre será a soma dos 2 valores anteriores 
(exemplo: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34...), escreva um programa na linguagem que desejar onde, informado um número, 
ele calcule a sequência de Fibonacci e retorne uma mensagem avisando se o número informado pertence ou não a sequência.



IMPORTANTE:

Esse número pode ser informado através de qualquer entrada de sua preferência ou pode ser previamente definido no código;
*/

import 'dart:io';

bool isFibonacci(int n) {
  int a = 0;
  int b = 1;

  if (n == 0 || n == 1) {
    return true;
  }

  while (a + b < n) {
    int c = a + b;
    a = b;
    b = c;
  }

  if (a + b == n) {
    return true;
  }

  return false;
}

void main() {
  print("Digite um número: ");
  int num = int.parse(stdin.readLineSync()!);

  bool result = isFibonacci(num);

  if (result) {
    print("$num pertence à sequência de Fibonacci.");
  } else {
    print("$num não pertence à sequência de Fibonacci.");
  }
}
