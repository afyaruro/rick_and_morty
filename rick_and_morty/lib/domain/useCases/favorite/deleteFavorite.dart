import 'package:rick_and_morty/domain/domain.dart';

class DeleteFavorites {
  final IFavoriteRepository repository;

  DeleteFavorites({required this.repository});

  Future<FavoriteResponse> deleteFavorite(int id) async {
    return await repository.DeleteFavorite(id);
  }
}
