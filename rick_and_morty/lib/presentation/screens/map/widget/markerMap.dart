import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/presentation/screens/screens.dart';

class MarkerMap extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const MarkerMap(
      {super.key,
      required this.title,
      required this.description,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showInfoModal(
            context: context,
            title: title,
            description: description,
            imagen: image);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: const Color.fromARGB(255, 12, 129, 238),
            width: 2.0,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  void _showInfoModal(
      {required BuildContext context,
      required String title,
      required String description,
      required String imagen}) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          width: fullWidth(context),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: GoogleFonts.krub(
                  color: const Color.fromARGB(255, 44, 44, 44),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: GoogleFonts.krub(
                  color: const Color.fromARGB(255, 44, 44, 44),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(imagen)),
            ],
          ),
        );
      },
    );
  }
}
