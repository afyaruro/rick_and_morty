import 'package:rick_and_morty/domain/domain.dart';

class NewFavorites {
  final IFavoriteRepository repository;

  NewFavorites({required this.repository});

  Future<FavoriteResponse> newFavorite(FavoriteEntity favorite) async {
    return await repository.NewFavorites(favorite);
  }
}
