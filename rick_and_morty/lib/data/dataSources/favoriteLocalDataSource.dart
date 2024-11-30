import 'package:hive/hive.dart';
import 'package:rick_and_morty/data/data.dart';
import 'package:rick_and_morty/domain/domain.dart';

abstract class IFavoriteLocalDataSource {
  Future<FavoriteResponse> allFavorite();
  Future<FavoriteResponse> newFavorite(FavoriteEntity favorite);
  Future<FavoriteResponse> deleteFavorite(int id);
}

class FavoriteLocalDataSource implements IFavoriteLocalDataSource {
  static const String _favoritesBox = 'favorites';

  Future<Box<FavoriteModel>> _getFavoritesBox() async {
    var box = await Hive.openBox<FavoriteModel>(_favoritesBox);
    return box;
  }

  @override
  Future<FavoriteResponse> allFavorite() async {
    try {
      final box = await _getFavoritesBox();
      final List<FavoriteModel> favorites = box.values.toList();

      final List<FavoriteEntity> favoritesEntity = favorites
          .map((favoriteModel) => favoriteModel.toCharacterEntity())
          .toList();

      return FavoriteResponse.characterList(
        favorites: favoritesEntity,
        message: 'Favorites loaded successfully',
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

      final newFavorite = FavoriteModel(
        id: favoriteEntity.id,
        character: favoriteEntity.character,
      );

      await box.put(
          favoriteEntity.id, newFavorite); 

      return FavoriteResponse.successfully(
        message: 'Favorite added successfully',
      );
    } catch (e) {
      return FavoriteResponse.error(message: e.toString());
    }
  }
}
