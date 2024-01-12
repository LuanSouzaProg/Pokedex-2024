import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pokemon/app/shared/utils/pokemon_type_color.dart';

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
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is HomeErrorState) {
            return const Center(
              child: Text('Ocorreu um Erro'),
            );
          }

          if (state is HomeSuccessState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: AlignedGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                itemCount: state.pokemon.length,
                itemBuilder: (context, index) {
                  var e = state.pokemon[index];

                  return Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: PokemonTypeColor.color(
                        type: e.type!.first,
                      )?.withOpacity(0.6),
                    ),
                    child: Column(
                      children: [
                        Text(
                          e.name.toString(),
                        ),
                        Image.network(e.img.toString()),
                        SizedBox(
                          height: 20,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: e.type?.length,
                            itemBuilder: (context, index) {
                              var i = e.type?[index];

                              return Container(
                                decoration: BoxDecoration(
                                  color: PokemonTypeColor.colorWeaknesses(
                                          weaknesses: e.type ?? [])[index]
                                      .withOpacity(1),
                                ),
                                child: Text(
                                  i.toString(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
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
