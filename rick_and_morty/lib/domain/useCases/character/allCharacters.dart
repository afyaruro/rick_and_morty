
import 'package:rick_and_morty/domain/domain.dart';

class Allcharacters {
  final ICharacterRepository repository;

  Allcharacters({required this.repository});

  Future<CharacterResponse> allCharacters(int page) async {

    return await repository.allCharacters(page);
    
  }
}
