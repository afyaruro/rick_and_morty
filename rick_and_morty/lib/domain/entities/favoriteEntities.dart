import 'package:rick_and_morty/domain/domain.dart';

class FavoriteEntity{
  final int id;
  final CharacterEntity character;

  FavoriteEntity({required this.id, required this.character});
}