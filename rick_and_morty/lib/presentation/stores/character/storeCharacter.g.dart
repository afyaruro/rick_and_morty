// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storeCharacter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StoreCharacter on _StoreCharacter, Store {
  late final _$charactersAtom =
      Atom(name: '_StoreCharacter.characters', context: context);

  @override
  ObservableList<CharacterEntity> get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(ObservableList<CharacterEntity> value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  late final _$pagesAtom =
      Atom(name: '_StoreCharacter.pages', context: context);

  @override
  Observable<int> get pages {
    _$pagesAtom.reportRead();
    return super.pages;
  }

  @override
  set pages(Observable<int> value) {
    _$pagesAtom.reportWrite(value, super.pages, () {
      super.pages = value;
    });
  }

  late final _$pageAtom = Atom(name: '_StoreCharacter.page', context: context);

  @override
  Observable<int> get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(Observable<int> value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  late final _$messageAtom =
      Atom(name: '_StoreCharacter.message', context: context);

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  late final _$isErrorAtom =
      Atom(name: '_StoreCharacter.isError', context: context);

  @override
  bool get isError {
    _$isErrorAtom.reportRead();
    return super.isError;
  }

  @override
  set isError(bool value) {
    _$isErrorAtom.reportWrite(value, super.isError, () {
      super.isError = value;
    });
  }

  late final _$getCharactersAsyncAction =
      AsyncAction('_StoreCharacter.getCharacters', context: context);

  @override
  Future<void> getCharacters(int index) {
    return _$getCharactersAsyncAction.run(() => super.getCharacters(index));
  }

  @override
  String toString() {
    return '''
characters: ${characters},
pages: ${pages},
page: ${page},
message: ${message},
isError: ${isError}
    ''';
  }
}
