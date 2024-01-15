import 'package:flutter/material.dart';

import '../../../shared/utils/pokemon_type_color.dart';
import '../../../shared/model/pokemon_model.dart';
import 'list_types_pokemon_component.dart';
import 'name_pokemon_component.dart';

class CardPokemonComponent extends StatelessWidget {
  final PokemonModel pokemonModel;

  const CardPokemonComponent({super.key, required this.pokemonModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: PokemonTypeColor.color(
          type: pokemonModel.type!.first,
        )?.withOpacity(0.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NamePokemonComponent(
            pokemonModel: pokemonModel,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Image.network(
              pokemonModel.img.toString(),
            ),
          ),
          ListTypesPokemonComponent(
            types: pokemonModel.type ?? [],
          ),
        ],
      ),
    );
  }
}
