import 'package:flutter/material.dart';

class PokemonTypeColor {
  static Color? color({required String type}) {
    switch (type) {
      case 'Normal':
        return Colors.brown[400];
      case 'Fire':
        return Colors.red;
      case 'Water':
        return Colors.blue;
      case 'Grass':
        return Colors.green;
      case 'Electric':
        return Colors.amber;
      case 'Ice':
        return Colors.cyan[400];
      case 'Fighting':
        return Colors.orange;
      case 'Poison':
        return Colors.purple;
      case 'Ground':
        return Colors.orange[300];
      case 'Flying':
        return Colors.indigo[200];
      case 'Psychic':
        return Colors.pink;
      case 'Bug':
        return Colors.lightGreen[500];
      case 'Rock':
        return Colors.grey;
      case 'Ghost':
        return Colors.indigo[400];
      case 'Dark':
        return Colors.brown;
      case 'Dragon':
        return Colors.indigo[800];
      case 'Steel':
        return Colors.blueGrey;
      case 'Fairy':
        return Colors.pinkAccent[100];
      default:
        return Colors.grey;
    }
  }

  static List<Color> colorWeaknesses({required List<String> weaknesses}) {
    final List<Color?> list = [];
    for (var colorWeaknesse in weaknesses) {
      switch (colorWeaknesse) {
        case 'Normal':
          {
            list.add(Colors.brown[400]);
            break;
          }

        case 'Fire':
          {
            list.add(Colors.red);
            break;
          }
        case 'Water':
          {
            list.add(Colors.blue);
            break;
          }
        case 'Grass':
          {
            list.add(Colors.green);
            break;
          }
        case 'Electric':
          {
            list.add(Colors.amber);
            break;
          }
        case 'Ice':
          {
            list.add(Colors.cyan[400]);
            break;
          }
        case 'Fighting':
          {
            list.add(Colors.orange);
            break;
          }

        case 'Poison':
          {
            list.add(Colors.purple);
            break;
          }

        case 'Ground':
          {
            list.add(Colors.orange[300]);
            break;
          }

        case 'Flying':
          {
            list.add(Colors.indigo[200]);
            break;
          }
        case 'Psychic':
          {
            list.add(Colors.pink);
            break;
          }

        case 'Bug':
          {
            list.add(Colors.lightGreen[500]);
            break;
          }

        case 'Rock':
          {
            list.add(Colors.grey);
            break;
          }

        case 'Ghost':
          {
            list.add(Colors.indigo[400]);
            break;
          }

        case 'Dark':
          {
            list.add(Colors.brown);
            break;
          }

        case 'Dragon':
          {
            list.add(Colors.indigo[800]);
            break;
          }
        case 'Steel':
          {
            list.add(Colors.blueGrey);
            break;
          }
        case 'Fairy':
          {
            list.add(Colors.pinkAccent[100]);
            break;
          }
        default:
          {
            list.add(Colors.grey);
            break;
          }
      }
    }
    return list.cast<Color>();
  }
}
