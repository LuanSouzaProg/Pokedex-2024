import 'dart:convert';
import 'package:dio/dio.dart';

import '../model/pokemon_model.dart';
import '../utils/constraints.dart';
import '../utils/state.dart';

class PokemonRepository {
  Dio dio = Dio();

  Future<ViewState> handleAllPokemon() async {
    final response = await dio.get(urlPokemon);

    final data = response.data;

    try {
      final json = jsonDecode(data) as Map<String, dynamic>;
      final list = json['pokemon'] as List<dynamic>;

      final pokemon =
          list.map((pokemon) => PokemonModel.fromMap(pokemon)).toList();

      return Success(pokemon);
    } catch (e) {
      return Failure(e.toString());
    }
  }
}
