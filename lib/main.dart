import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'pergunta': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 9},
        {'texto': 'Verde', 'pontuacao': 8},
        {'texto': 'Branco', 'pontuacao': 7},
      ],
    },
    {
      'pergunta': 'Qual é a sua animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 10},
        {'texto': 'Cobra', 'pontuacao': 9},
        {'texto': 'Elefante', 'pontuacao': 8},
        {'texto': 'Leão', 'pontuacao': 7},
      ],
    },
    {
      'pergunta': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'pontuacao': 10},
        {'texto': 'João', 'pontuacao': 9},
        {'texto': 'Leo', 'pontuacao': 8},
        {'texto': 'Pedro', 'pontuacao': 7},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Perguntas'),
          ),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  responder: _responder,
                )
              : Resultado(_pontuacaoTotal, _reiniciarQuestionario)),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
