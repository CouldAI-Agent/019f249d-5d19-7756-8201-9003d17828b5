import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/feed_screen.dart';
import 'screens/viewer_screen.dart';
import 'screens/studio_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppState()),
      ],
      child: const ChirokApp(),
    ),
  );
}

class AppState extends ChangeNotifier {
  // Global state logic can go here
}

class ChirokApp extends StatelessWidget {
  const ChirokApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chirok',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark(
          primary: Colors.purpleAccent,
          secondary: Colors.deepPurpleAccent,
          surface: Colors.black,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.purpleAccent,
          elevation: 0,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const FeedScreen(),
        '/viewer': (context) => const ViewerScreen(),
        '/studio': (context) => const StudioScreen(),
      },
    );
  }
}
