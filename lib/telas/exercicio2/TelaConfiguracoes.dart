import 'package:flutter/material.dart';
import 'package:trabFinal/telas/exercicio2/TelaInicial.dart';
import 'package:dio/dio.dart';

class GameModel {
  final String name, imageUrl, releaseDate;

  GameModel(
      {required this.name, required this.imageUrl, required this.releaseDate});

  factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
        name: json['name'] ,
        imageUrl: json['background_image'] ,
        releaseDate: json['released'] ,
      );
}

Future<List<GameModel>> fetchGames() async {
  final response = await Dio().get(
    'https://api.rawg.io/api/games',
    queryParameters: {'key': 'e277af6897b6427ea22933079d8c06fd'},
  );
  return (response.data['results'] as List)
      .map((game) => GameModel.fromJson(game))
      .toList();
}

class telaConfiguracoes extends StatefulWidget {
  const telaConfiguracoes({super.key});

  @override
  State<telaConfiguracoes> createState() => telaConfiguracoesState();
}

class telaConfiguracoesState extends State<telaConfiguracoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configurações"),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(237, 167, 87, 0.878),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Text(
              'Lista de Jogos',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 30),
            Expanded(
              child: FutureBuilder<List<GameModel>>(
                future: fetchGames(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final games = snapshot.data!;
                    return ListView.builder(
                      itemCount: games.length,
                      itemBuilder: (context, index) {
                        final game = games[index];
                        return Card(
                          child: ListTile(
                            leading: game.imageUrl.isNotEmpty
                                ? Image.network(game.imageUrl,
                                    width: 50, fit: BoxFit.cover)
                                : const Icon(Icons.gamepad),
                            title: Text(game.name),
                            subtitle: Text('Lançado em: ${game.releaseDate}'),
                          ),
                        );
                      },
                    );
                  }
                  return const Center(child: Text('Carregando lista.'));
                },
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const TelaInicial()));
                },
                child: const Text("Voltar para Tela Inicial"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
