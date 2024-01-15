import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/home_page.dart';
import '../bloc/home_bloc.dart';

class HomeModule extends Module {
  @override
  void routes(r) {
    r.child('/home', child: (context) {
      HomeBloc homeBloc = Modular.get();

      return MultiBlocProvider(
        providers: [
          BlocProvider.value(value: homeBloc),
        ],
        child: const HomePage(),
      );
    });
  }
}
