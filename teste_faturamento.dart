import 'dart:io';
import 'dart:convert';


/* QUESTÃO:
Dado um vetor que guarda o valor de faturamento diário de uma distribuidora, faça um programa, na linguagem que desejar, que calcule e retorne:
• O menor valor de faturamento ocorrido em um dia do mês;
• O maior valor de faturamento ocorrido em um dia do mês;
• Número de dias no mês em que o valor de faturamento diário foi superior à média mensal.

IMPORTANTE:
a) Usar o json ou xml disponível como fonte dos dados do faturamento mensal;
b) Podem existir dias sem faturamento, como nos finais de semana e feriados. Estes dias devem ser ignorados no cálculo da média;

*** Não recebi arquivo json então criei um aleatorio para usar.

*/




void main() async {
  await analisarFaturamento('faturamento.json');
}

Future<void> analisarFaturamento(String arquivoJson) async {
  List<int> bytes = await File(arquivoJson).readAsBytes();
  Map<String, dynamic> data = jsonDecode(utf8.decode(bytes));

  List<dynamic> faturamentoDiario = data["faturamento_diario"];
  int menorValor = faturamentoDiario[0]["valor"];
  int maiorValor = faturamentoDiario[0]["valor"];
  int totalDias = 0;
  int somaValores = 0;

  for (var dia in faturamentoDiario) {
    int valor = dia["valor"];

    if (valor != 0) {
      totalDias++;
      somaValores += valor;
      if (valor < menorValor) menorValor = valor;
      if (valor > maiorValor) maiorValor = valor;
    }
  }

  double mediaMensal = somaValores / totalDias;
  int diasAcimaMedia = faturamentoDiario.where((dia) => dia["valor"] > mediaMensal).length;

  print('Menor valor de faturamento: $menorValor');
  print('Maior valor de faturamento: $maiorValor');
  print('Número de dias com faturamento acima da média: $diasAcimaMedia');
}
