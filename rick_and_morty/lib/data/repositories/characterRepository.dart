import 'package:rick_and_morty/data/data.dart';
import 'package:rick_and_morty/domain/domain.dart';

class CharacterRepository implements ICharacterRepository {
  final ICharactersRemoteDataSource dataSource;

  CharacterRepository({required ICharactersRemoteDataSource this.dataSource});

  @override
  Future<CharacterResponse> allCharacters(int page) {
    return dataSource.AllCharacters(page);
  }
}
