class GameModel {
  final String name;
  final String imageUrl;
  final String releaseDate;

  GameModel({
    required this.name,
    required this.imageUrl,
    required this.releaseDate,
  });

  // Construtor para criar um objeto a partir de um JSON
  factory GameModel.fromJson(Map<String, dynamic> json) {
    return GameModel(
      name: json['name'] as String, // Campo 'name' no JSON
      imageUrl: json['background_image'] as String? ?? '', // Imagem do jogo
      releaseDate: json['released'] as String? ?? 'Data não disponível', // Data de lançamento
    );
  }
}
