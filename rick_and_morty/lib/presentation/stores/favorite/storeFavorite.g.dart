// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storeFavorite.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StoreFavorite on _StoreFavorite, Store {
  late final _$favoritesAtom =
      Atom(name: '_StoreFavorite.favorites', context: context);

  @override
  ObservableList<FavoriteEntity> get favorites {
    _$favoritesAtom.reportRead();
    return super.favorites;
  }

  @override
  set favorites(ObservableList<FavoriteEntity> value) {
    _$favoritesAtom.reportWrite(value, super.favorites, () {
      super.favorites = value;
    });
  }

  late final _$getFavoritesAsyncAction =
      AsyncAction('_StoreFavorite.getFavorites', context: context);

  @override
  Future<void> getFavorites() {
    return _$getFavoritesAsyncAction.run(() => super.getFavorites());
  }

  late final _$addFavoriteAsyncAction =
      AsyncAction('_StoreFavorite.addFavorite', context: context);

  @override
  Future<void> addFavorite(FavoriteEntity favorite) {
    return _$addFavoriteAsyncAction.run(() => super.addFavorite(favorite));
  }

  late final _$deleteFavoriteAsyncAction =
      AsyncAction('_StoreFavorite.deleteFavorite', context: context);

  @override
  Future<void> deleteFavorite(FavoriteEntity favorite) {
    return _$deleteFavoriteAsyncAction
        .run(() => super.deleteFavorite(favorite));
  }

  @override
  String toString() {
    return '''
favorites: ${favorites}
    ''';
  }
}
