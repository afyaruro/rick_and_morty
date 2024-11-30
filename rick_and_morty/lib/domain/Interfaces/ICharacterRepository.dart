import 'package:rick_and_morty/domain/domain.dart';

abstract class ICharacterRepository{

  Future<CharacterResponse> allCharacters(int page);

}