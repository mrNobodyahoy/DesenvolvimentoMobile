import 'package:trabFinal/telas/TelaNavegacao.dart';
import 'package:trabFinal/telas/exercicio2/TelaDetalhes.dart';
import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela Inicial"),
        centerTitle: true,
            backgroundColor: Color.fromRGBO(237, 167, 87, 0.878)
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, 
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TelaNavegacao())); 
              },
              child: const Text('Voltar para a Tela de Navegação'),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const telaDetalhes(),
                    ),
                  );
                },
                child: const Text("Avançar para Tela Detalhes"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
