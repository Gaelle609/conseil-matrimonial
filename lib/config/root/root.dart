import 'package:christoude/pages/subpage/reader.dart';
import 'package:go_router/go_router.dart';

import '../../pages/subpage/home.dart';

GoRouter root = GoRouter(
    routes: [
      GoRoute(
          path: "/",
          builder: (context, state)=> const Home()
      ),
      GoRoute(
          path: "/reader/:index",
          builder: (context, state)=> ReaderPage(index: state.pathParameters['index'],)
      )
    ]);