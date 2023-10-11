import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmtrade_sms/src/config/blocs/providers.dart';
import 'package:tmtrade_sms/src/config/constants/app_constants.dart';
import 'package:tmtrade_sms/src/config/injector.dart';
import 'package:tmtrade_sms/src/config/localization/app_localizations_setup.dart';
import 'package:tmtrade_sms/src/config/router/app_router.dart';
import 'package:tmtrade_sms/src/config/themes/app_theme.dart';
import 'package:tmtrade_sms/src/presentation/views/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await AppPathProvider.initPath();
  await initializeDependencies();

  // await Hive.initFlutter();

  // await injector<StorageService>().openBoxes();

  // await initializeDateFormatting('ru');
  // locator<ApiService>().initBaseUrl();

  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  //   DeviceOrientation.landscapeLeft,
  //   DeviceOrientation.landscapeRight,
  // ]);
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor: Color(0xFF797F9E),
  //   statusBarBrightness: Brightness.light,
  //   statusBarIconBrightness: Brightness.light,
  // ));
  // await isStoragePermission();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: BlocProviders.providers,
        child: MaterialApp(
          navigatorKey: navigatorKey,
          scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
          debugShowCheckedModeBanner: false,
          title: kMaterialAppTitle,
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          // initialRoute: AppRoute.home,
          onUnknownRoute: AppRoutes.onUnkownRoute,
          supportedLocales: AppLocalizationsSetup.supportedLocales,
          localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
          localeResolutionCallback:
              AppLocalizationsSetup.localeResolutionCallBack,
          locale: Locale('ru'),
          theme: AppTheme.appTheme,
          builder: (BuildContext context, Widget? child) {
            final textScaleFactor =
                MediaQuery.of(context).textScaleFactor.clamp(1.0, 1.1);
            return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaleFactor: textScaleFactor),
                child: child ?? const HomePage());
          },
        ));
  }
}
