import 'package:flutter_modular/flutter_modular.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

import '../../../shared/repositories/pokemon_repository.dart';
import '../../../shared/model/pokemon_model.dart';
import '../../../shared/utils/state.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  PokemonRepository pokemonRepository = Modular.get();

  HomeBloc() : super(HomeInitialState()) {
    on<GetAllPokemonsEvent>((event, emit) async {
      emit(HomeLoadingState());
      await getAllPokemons(event, emit);
    });
  }

  Future getAllPokemons(event, emit) async {
    var pokemons = await pokemonRepository.handleAllPokemon();

    if (pokemons is Success) {
      emit(HomeSuccessState(
        pokemon: pokemons.data,
      ));
    } else if (pokemons is Failure) {
      emit(HomeErrorState());
    }
  }
}
