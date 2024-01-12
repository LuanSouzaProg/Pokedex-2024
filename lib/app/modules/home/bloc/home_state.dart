part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<PokemonModel> pokemon;

  const HomeSuccessState({required this.pokemon});
}

class HomeErrorState extends HomeState {}
