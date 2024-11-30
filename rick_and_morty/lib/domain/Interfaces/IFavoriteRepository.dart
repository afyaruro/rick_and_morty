import 'package:rick_and_morty/domain/domain.dart';

abstract class IFavoriteRepository{

  Future<FavoriteResponse> AllFavorites();

  Future<FavoriteResponse> DeleteFavorite(int id);

  Future<FavoriteResponse> NewFavorites(FavoriteEntity favorite);

}