import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/presentation/screens/home/widgets/CustomButton.dart';
import 'package:rick_and_morty/presentation/screens/screens.dart';
import 'package:rick_and_morty/presentation/stores/character/storeCharacter.dart';

class HomeScreen extends StatelessWidget {
  final storeCharacter = GetIt.instance<StoreCharacter>();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Observer(
              builder: (_) {
                if (storeCharacter.characters.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ListView.builder(
                  itemCount: storeCharacter.characters.length,
                  itemBuilder: (context, index) {
                    final character = storeCharacter.characters[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CharacterDetailScreen(character: character),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(character.image),
                        ),
                        title: Text(character.name),
                        subtitle: Text(character.species),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Observer(
                    builder: (_) => Observer(
                          builder: (_) => CustomButton(
                            text: "Anterior",
                            onPressed: storeCharacter.page.value > 1
                                ? () async {
                                    try {
                                      await storeCharacter.getCharacters(
                                          storeCharacter.page.value - 1);
                                    } catch (e) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                "Error al cargar personajes: $e")),
                                      );
                                    }
                                  }
                                : null,
                            enable: storeCharacter.page.value > 1,
                          ),
                        )),
                Observer(
                  builder: (_) => Text(
                    "pagina ${storeCharacter.page.value} de ${storeCharacter.pages.value}",
                    style: GoogleFonts.krub(fontSize: 11),
                  ),
                ),
                Observer(
                  builder: (_) => CustomButton(
                      text: "Siguiente",
                      onPressed:
                          storeCharacter.page.value < storeCharacter.pages.value
                              ? () async {
                                  try {
                                    await storeCharacter.getCharacters(
                                        storeCharacter.page.value + 1);
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "Error al cargar personajes: $e")),
                                    );
                                  }
                                }
                              : null,
                      enable: storeCharacter.page.value <
                          storeCharacter.pages.value),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
