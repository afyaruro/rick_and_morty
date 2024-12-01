
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/presentation/screens/screens.dart';
import 'package:rick_and_morty/presentation/screens/splahs/splahsScreen.dart';

final appRouter = GoRouter(initialLocation: "/", routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: "/home",
    builder: (context, state) => HomeScreen(),
  ),


]);
