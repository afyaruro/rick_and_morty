import 'dart:ffi';

import 'package:rick_and_morty/domain/domain.dart';

class CharacterResponse {
  final bool isError;
  late String message;
  late CharacterEntity? character;
  late List<CharacterEntity>? listCharacters;
  late int? pages;

  CharacterResponse._({
    required this.isError,
    required this.message,
    this.character,
    this.listCharacters,
    this.pages
  });

  CharacterResponse.error({required String message})
      : this._(
          isError: true,
          message: message,
        );

  CharacterResponse.singleCharacter({
    required String message,
    required CharacterEntity character,
  }) : this._(
          isError: false,
          message: message,
          character: character,
        );

  CharacterResponse.characterList({
    required String message,
    required List<CharacterEntity> listCharacters,
    required int pages
  }) : this._(
          isError: false,
          message: message,
          listCharacters: listCharacters,
          pages: pages
        );
}
