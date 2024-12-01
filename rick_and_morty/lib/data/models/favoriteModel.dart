import 'package:rick_and_morty/data/data.dart';
import 'package:rick_and_morty/domain/domain.dart';

class FavoriteModel extends FavoriteEntity{


  FavoriteModel({required super.id, required super.character});

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
        id: json['id'] as int,
        character:
            CharacterModel.fromJson(json['character'] as Map<String, dynamic>));
  }

  FavoriteEntity toEntity() {
    return FavoriteEntity(id: id, character: character);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'character': (character as CharacterModel).toJson(),
    };
  }
}
