import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciarQuestionario;

  Resultado(this.pontuacao, this.reiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 23) {
      return 'Parabéns!';
    } else if (pontuacao < 25) {
      return 'Você é bom!';
    } else if (pontuacao < 28) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          child: Text(
            'Reiniciar?',
            style: TextStyle(fontSize: 18),
          ),
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.cyan.shade600),
          ),
          onPressed: reiniciarQuestionario,
        ),
      ],
    );
  }
}
