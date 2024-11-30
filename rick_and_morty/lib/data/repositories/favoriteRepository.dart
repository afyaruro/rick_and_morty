import 'package:rick_and_morty/data/data.dart';
import 'package:rick_and_morty/domain/domain.dart';

class FavoriteRepository implements IFavoriteRepository {
  final IFavoriteLocalDataSource dataSource;

  FavoriteRepository({required IFavoriteLocalDataSource this.dataSource});
  
  @override
  Future<FavoriteResponse> AllFavorites() {
    return dataSource.allFavorite();
  }
  
  @override
  Future<FavoriteResponse> DeleteFavorite(int id) {
    return dataSource.deleteFavorite(id);
  }
  
  @override
  Future<FavoriteResponse> NewFavorites(FavoriteEntity favorite) {
    return dataSource.newFavorite(favorite);
  }
}
