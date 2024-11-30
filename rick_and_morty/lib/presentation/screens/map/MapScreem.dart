import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:rick_and_morty/presentation/screens/map/widget/markerMap.dart';


class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const String access_token =
        "pk.eyJ1IjoiYWZ5YXJ1cm8iLCJhIjoiY2x1eWp3dWx3MTIyNzJxbW1obWluaWY4YyJ9.M08Xda1btuJMkBlaZ9IRcA";

    return Scaffold(
      body: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(10.46314, -73.25322),
          initialZoom: 6.0,
        ),
        children: [
          TileLayer(
            urlTemplate:
                "https://api.mapbox.com/styles/v1/mapbox/streets-v11/tiles/{z}/{x}/{y}?access_token=$access_token",
            additionalOptions: const {
              'accessToken': access_token,
            },
          ),
          const MarkerLayer(
            markers: [
              Marker(
                child: MarkerMap(
                  description: "Capital mundial del vallenato",
                  image: "assets/valledupar.png",
                  title: "Valledupar",
                ),
                width: 50,
                height: 50,
                point: LatLng(10.46314, -73.25322), // Valledupar
              ),
              Marker(
                child: MarkerMap(
                  description: "Capital de colombia",
                  image: "assets/bogota.png",
                  title: "Bogota",
                ),
                width: 50,
                height: 50,
                point: LatLng(4.60971, -74.08175), // Bogotá
              ),
            ],
          ),
        ],
      ),
    );
  }
}
