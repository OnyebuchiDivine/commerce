import 'package:commerce/model/cart_model.dart';
import 'package:commerce/splash_screen.dart';
import 'package:commerce/theme/dark_theme.dart';
import 'package:commerce/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:lightTheme,
      darkTheme: darkTheme,
      home: const SplashScreen(),
    )
    );
  }
}
