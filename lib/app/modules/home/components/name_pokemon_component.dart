import 'package:flutter/material.dart';

import '../../../shared/model/pokemon_model.dart';

class NamePokemonComponent extends StatelessWidget {
  final PokemonModel pokemonModel;

  const NamePokemonComponent({super.key, required this.pokemonModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Text(
            '${pokemonModel.id.toString()}.',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          Expanded(
            child: Text(
              pokemonModel.name.toString(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
