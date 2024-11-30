import 'package:dio/dio.dart';
import 'package:rick_and_morty/data/data.dart';
import 'package:rick_and_morty/domain/domain.dart';

abstract class ICharactersRemoteDataSource {
  Future<CharacterResponse> AllCharacters(int page);
}

class CharactersRemoteDataSources
    implements ICharactersRemoteDataSource {
  final Dio dio = Dio();

  @override
  Future<CharacterResponse> AllCharacters(int page) async {
    CharacterResponse characterResponse;
    try {
      final response =
          await dio.get("$URLBASE/api/character?page=$page");

      if (response.statusCode == 200) {
        final List<dynamic> results = response.data['results'];
        final characters =
            results.map((json) => CharacterModel.fromJson(json).toCharacterEntity()).toList();

        final Map<String, dynamic> info = response.data['info'];

        characterResponse = CharacterResponse.characterList(
            message: "Exito", listCharacters: characters, pages: int.tryParse(info['pages'].toString()) ?? 0, );
        return characterResponse;
      } else {
        characterResponse = CharacterResponse.error(
            message:
                "Error al obtener los personajes: ${response.statusMessage}");
        return characterResponse;
      }
    } catch (e) {
      characterResponse = CharacterResponse.error(
          message: "Error al obtener los personajes: ${e.toString()}");
      return characterResponse;
    }
  }
}
