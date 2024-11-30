import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:rick_and_morty/domain/domain.dart';

part 'storeFavorite.g.dart';

class StoreFavorite = _StoreFavorite with _$StoreFavorite;

abstract class _StoreFavorite with Store {
  // observables
  @observable
  ObservableList<FavoriteEntity> favorites = ObservableList<FavoriteEntity>();

  // Acciones
  @action
  Future<void> getFavorites() async {
    try {
      favorites.clear();
      final allFavorites = GetIt.instance<AllFavorites>();
      FavoriteResponse response = await allFavorites.allFavorites();
      favorites.addAll(response.favorites!);
    } catch (e) {
      print("Error: $e");
    }
  }

  @action
  Future<void> addFavorite(FavoriteEntity favorite) async {
    try {
      favorites.add(favorite);
      final newFavorites = GetIt.instance<NewFavorites>();
      await newFavorites.newFavorite(favorite);
    } catch (e) {
      print("Error: $e");
    }
  }

  @action
  Future<void> deleteFavorite(FavoriteEntity favorite) async {
    try {
      favorites.remove(favorite);
      final deleteFavorite = GetIt.instance<DeleteFavorites>();
      await deleteFavorite.deleteFavorite(favorite.id);
    } catch (e) {
      print("Error: $e");
    }
  }
}
