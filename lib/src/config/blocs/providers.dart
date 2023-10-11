import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmtrade_sms/src/config/injector.dart';
import 'package:tmtrade_sms/src/presentation/bloc/home_bloc/home_bloc.dart';

class BlocProviders {
  static final List<BlocProvider> providers = [
    ////////////////////////////////////////////////////////////////////////////
    /////////////////////            MAIN            ///////////////////////////
    BlocProvider<HomeBloc>(create: (context) => injector<HomeBloc>()),
  ];
}
