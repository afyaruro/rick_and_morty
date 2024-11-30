
import 'package:rick_and_morty/domain/domain.dart';

class AllFavorites {
  final IFavoriteRepository repository;

  AllFavorites({required this.repository});

  Future<FavoriteResponse> allFavorites() async {

    return await repository.AllFavorites();
    
  }
}
