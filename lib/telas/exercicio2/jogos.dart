import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class GameModel {
  final String name, imageUrl, releaseDate;

  GameModel(
      {required this.name, required this.imageUrl, required this.releaseDate});

  factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
        name: json['name'] ?? 'Sem nome',
        imageUrl: json['background_image'] ?? 'sem imagem',
        releaseDate: json['released'] ?? 'Data não disponível',
      );
}

class TelaDetalhes extends StatelessWidget {
  const TelaDetalhes({super.key});

  Future<List<GameModel>> fetchGames() async {
    final response = await Dio().get(
      'https://api.rawg.io/api/games',
      queryParameters: {'key': 'e277af6897b6427ea22933079d8c06fd'},
    );
    return (response.data['results'] as List)
        .map((game) => GameModel.fromJson(game))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detalhes"), centerTitle: true),
      body: FutureBuilder<List<GameModel>>(
        future: fetchGames(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          }
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
          return const Center(child: Text('Nenhum dado disponível.'));
        },
      ),
    );
  }
}
