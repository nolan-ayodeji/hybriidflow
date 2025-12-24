import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';


class WorldMap extends StatefulWidget {
  const WorldMap({super.key});

  @override
  State<WorldMap> createState() => _WorldMapState();
}

class _WorldMapState extends State<WorldMap> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0x51FFFFFF),
              borderRadius: BorderRadius.circular(32),
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color:Colors.black26,
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset:
                  Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: FlutterMap(
              options: MapOptions(
               // Center the map over London
                initialZoom: 9.2,
              ),
              children: [
                TileLayer( // Bring your own tiles
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // For demonstration only
                  userAgentPackageName: 'com.example.app', // Add your app identifier
                  // And many more recommended properties!
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
