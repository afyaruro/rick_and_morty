import 'package:rick_and_morty/domain/domain.dart';

class FavoriteResponse {
  final bool isError;
  late String message;
  late FavoriteEntity? favorite;
  late List<FavoriteEntity>? favorites;

  FavoriteResponse._({
    required this.isError,
    required this.message,
    this.favorite,
    this.favorites,
  });

  FavoriteResponse.error({required String message})
      : this._(
          isError: true,
          message: message,
        );

  FavoriteResponse.successfully({required String message})
      : this._(
          isError: true,
          message: message,
        );

  FavoriteResponse.singleCharacter({
    required String message,
    required FavoriteEntity favorite,
  }) : this._(
          isError: false,
          message: message,
          favorite: favorite,
        );

  FavoriteResponse.characterList({
    required String message,
    required List<FavoriteEntity> favorites,
  }) : this._(
          isError: false,
          message: message,
          favorites: favorites,
        );
}
