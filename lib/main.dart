import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  void _play(String file) async {
    final player = AudioPlayer();

    var fileName =
        fileNames.firstWhere((element) => element['fileName'] == file);
    await player.play(AssetSource('${fileName['fileName']}.mp4'));
  }

  final fileNames = [
    {
      'color': Colors.red,
      'fileName': 'do',
    },
    {
      'color': Colors.deepOrange,
      'fileName': 're',
    },
    {'color': Colors.yellow, 'fileName': 'mi'},
    {'color': Colors.green, 'fileName': 'pa'},
    {'color': Colors.blue, 'fileName': 'sol'},
    {'color': Colors.purple, 'fileName': 'la'},
    {
      'color': Colors.redAccent,
      'fileName': 'si',
    },
    {
      'color': Colors.deepOrangeAccent,
      'fileName': 'h_do',
    },
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.from(
              fileNames.map(
                (element) => TextButton(
                  onPressed: () {
                    _play('${element['fileName']}');
                  },
                  child:
                      Container(height: 70, color: element['color'] as Color),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
