import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:rick_and_morty/domain/domain.dart';

part 'storeCharacter.g.dart';

class StoreCharacter = _StoreCharacter with _$StoreCharacter;

abstract class _StoreCharacter with Store {
  // observables
  @observable
  ObservableList<CharacterEntity> characters =
      ObservableList<CharacterEntity>();

  @observable
  Observable<int> pages = Observable<int>(1);

  @observable
   Observable<int> page = Observable<int>(1);

  @observable
  String message = '';

  @observable
  bool isError = false;

  // Acciones
  @action
  Future<void> getCharacters(int index) async {
    try {

      characters.clear();
      page.value = index;
      final allCharacters = GetIt.instance<Allcharacters>();
      CharacterResponse response = await allCharacters.allCharacters(index);
      characters.addAll(response.listCharacters!);
      pages.value = response.pages!;
      message = response.message;
      isError = response.isError;

    } catch (e) {
      print("Error: $e");
    }
  }

}
