import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:janken_app/core/app_router.dart';
import 'package:janken_app/main.config.dart';

// This is our global ServiceLocator
final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies() => $initGetIt(getIt);
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Janken App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      onGenerateRoute: (RouteSettings settings) =>
          AppRouter.generateRoute(settings),
      initialRoute: AppRouter.main,
    );
  }
}
