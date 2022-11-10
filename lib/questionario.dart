import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas'] as List
        : [];

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['pergunta'].toString()),
        ...respostas.map((resp) {
          return Resposta(resp['texto'].toString(),
              () => responder(int.parse(resp['pontuacao'].toString())));
        })
      ],
    );
  }
}
