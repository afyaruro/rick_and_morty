import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick_and_morty/data/data.dart';
import 'package:rick_and_morty/data/repositories/favoriteRepository.dart';
import 'package:rick_and_morty/domain/domain.dart';
import 'package:rick_and_morty/presentation/stores/character/storeCharacter.dart';
import 'package:rick_and_morty/presentation/stores/favorite/storeFavorite.dart';

class StartDependency {
  final di = GetIt.instance;

  Future<void> init() async {
    // uses cases
    di.registerLazySingleton(() => Allcharacters(repository: di()));
    di.registerLazySingleton(() => AllFavorites(repository: di()));
    di.registerLazySingleton(() => DeleteFavorites(repository: di()));
    di.registerLazySingleton(() => NewFavorites(repository: di()));

    di.registerLazySingleton(() => StoreCharacter());
    di.registerLazySingleton(() => StoreFavorite());

    // repositories
    di.registerLazySingleton<ICharacterRepository>(
        () => CharacterRepository(dataSource: di()));

    di.registerLazySingleton<IFavoriteRepository>(
        () => FavoriteRepository(dataSource: di()));

    // data source
    di.registerLazySingleton<ICharactersRemoteDataSource>(
        () => CharactersRemoteDataSources());

    di.registerLazySingleton<IFavoriteLocalDataSource>(
        () => FavoriteLocalDataSource());

    final storeCharacter = GetIt.instance<StoreCharacter>();
    final storeFavorite = GetIt.instance<StoreFavorite>();
    await storeFavorite.getFavorites();
    await storeCharacter.getCharacters(1);

    
  }
}
