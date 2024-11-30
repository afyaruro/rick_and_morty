
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/presentation/screens/menuBottom/menuBottom.dart';
import 'package:rick_and_morty/presentation/screens/screens.dart';

final appRouter = GoRouter(initialLocation: "/", routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => const MenuBottom(),
  ),
  GoRoute(
    path: "/home",
    builder: (context, state) => HomeScreen(),
  ),


]);
