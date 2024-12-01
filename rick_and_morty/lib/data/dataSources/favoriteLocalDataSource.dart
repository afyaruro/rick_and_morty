import 'package:hive/hive.dart';
import 'package:rick_and_morty/data/data.dart';
import 'package:rick_and_morty/domain/domain.dart';

abstract class IFavoriteLocalDataSource {
  Future<FavoriteResponse> allFavorite();
  Future<FavoriteResponse> newFavorite(FavoriteEntity favorite);
  Future<FavoriteResponse> deleteFavorite(int id);
}

class FavoriteLocalDataSource implements IFavoriteLocalDataSource {
  static const String _favoritesBox = 'favorite';

  Future<Box> _getFavoritesBox() async {
    var box = await Hive.openBox(_favoritesBox);
    return box;
  }

  @override
  Future<FavoriteResponse> allFavorite() async {
    try {
      List<FavoriteEntity> listFavorites = [];
      final box = await _getFavoritesBox();

      final List<dynamic> favorites = box.values.toList();

      for (Map<dynamic, dynamic> favorite in favorites) {
        FavoriteEntity favoriteEntity = FavoriteEntity(
            id: favorite['id'],
            character: CharacterEntity(
                type: favorite['character']['type'] ?? "",
                created: favorite['character']['created'] ?? DateTime.now(),
                gender: favorite['character']['gender'] ?? "",
                id: favorite['character']['id'] ?? 0,
                image: favorite['character']['image'] ?? "",
                name: favorite['character']['name'] ?? "",
                species: favorite['character']['species'] ?? "",
                status: favorite['character']['status'] ?? ""));
        listFavorites.add(favoriteEntity);
      }
      
      return FavoriteResponse.list(
        favorites: listFavorites,
        message: 'Favorites fetched successfully',
      );
    } catch (e) {
      return FavoriteResponse.error(message: e.toString());
    }
  }

  @override
  Future<FavoriteResponse> deleteFavorite(int id) async {
    try {
      final box = await _getFavoritesBox();
      await box.delete(id);
      return FavoriteResponse.successfully(
        message: 'Favorite deleted successfully',
      );
    } catch (e) {
      return FavoriteResponse.error(message: e.toString());
    }
  }

  @override
  Future<FavoriteResponse> newFavorite(FavoriteEntity favoriteEntity) async {
    try {
      final box = await _getFavoritesBox();

      final CharacterModel characterModel = CharacterModel(
        id: favoriteEntity.character.id,
        name: favoriteEntity.character.name,
        status: favoriteEntity.character.status,
        species: favoriteEntity.character.species,
        type: favoriteEntity.character.type,
        gender: favoriteEntity.character.gender,
        image: favoriteEntity.character.image,
        created: favoriteEntity.character.created,
      );

      final newFavorite = FavoriteModel(
        id: favoriteEntity.id,
        character: characterModel,
      );

      await box.put(newFavorite.id, newFavorite.toJson());

      return FavoriteResponse.successfully(
        message: 'Favorite add successfully',
      );
    } catch (e) {
      return FavoriteResponse.error(message: e.toString());
    }
  }
}
