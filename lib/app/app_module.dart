import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/modules/home/bloc/home_bloc.dart';
import 'package:pokemon/app/shared/repositories/pokemon_repository.dart';

import 'modules/home/module/home_module.dart';
import 'modules/splash/module/splash_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(HomeBloc.new);
    i.addSingleton(PokemonRepository.new);
  }

  @override
  void routes(r) {
    r.module('/', module: SplashModule());
    r.module('/home_module', module: HomeModule());
  }
}
