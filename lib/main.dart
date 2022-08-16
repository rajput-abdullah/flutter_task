import 'package:flutter/material.dart';
import 'package:flutter_task/providers/multi_provider.dart';
import 'package:flutter_task/res/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: multiProviders,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/SplashScreen',
        routes: {
          '/SplashScreen': (context) => const SplashScreen(),
        },
        title: 'Splash Screen',
      ),
    );
  }
}

