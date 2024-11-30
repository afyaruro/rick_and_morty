import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/presentation/stores/favorite/storeFavorite.dart';

class FavoritesScreen extends StatelessWidget {
  final storeFavorite = GetIt.instance<StoreFavorite>();

  FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          if (storeFavorite.favorites.isEmpty) {
            return const Center(
              child: Text(
                "¡Aún no tienes favoritos!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            );
          }

          return ListView.builder(
            itemCount: storeFavorite.favorites.length,
            itemBuilder: (context, index) {
              final favorite = storeFavorite.favorites[index];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.network(
                      favorite.character.image,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    favorite.character.name,
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    favorite.character.species,
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      storeFavorite.deleteFavorite(favorite);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
     
    );
  }
}
