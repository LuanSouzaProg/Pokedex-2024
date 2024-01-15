import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../shared/components/loading_component.dart';
import '../../../shared/components/error_component.dart';
import '../components/card_pokemon_component.dart';
import '../bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc homeBloc = Modular.get();

  @override
  void initState() {
    homeBloc.add(GetAllPokemonsEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('bem vindo'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: homeBloc,
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const LoadingComponent();
          }

          if (state is HomeErrorState) {
            return const ErrorComponent(
              errorMessage: 'Ocorreu um erro',
            );
          }

          if (state is HomeSuccessState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: AlignedGridView.count(
                physics: const ScrollPhysics(
                  parent: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                ),
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                itemCount: state.pokemon.length,
                itemBuilder: (context, index) {
                  var e = state.pokemon[index];

                  return CardPokemonComponent(pokemonModel: e);
                },
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
