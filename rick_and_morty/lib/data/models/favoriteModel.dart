import 'package:rick_and_morty/data/data.dart';
import 'package:rick_and_morty/domain/domain.dart';

class FavoriteModel {
  final int id;
  final CharacterEntity character;

  FavoriteModel({required this.id, required this.character});

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
        id: json['id'] as int, character: json['character'] as CharacterModel);
  }

  FavoriteEntity toCharacterEntity() {
    return FavoriteEntity(id: id, character: character);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'character': character};
  }
}
