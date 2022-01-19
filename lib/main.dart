import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthy_body_app/pages/splash_page.dart';
import 'package:healthy_body_app/providers/bmi_provider.dart';
import 'package:healthy_body_app/providers/broca_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => BmiProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => BrocaProvider(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SplashPage(),
        ),
      ),
    );
  }
}
