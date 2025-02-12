import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meal_mosaic/screens/onboarding_screen.dart';
import 'package:meal_mosaic/screens/meals.dart';
import 'package:meal_mosaic/screens/transaction.dart';
import 'package:meal_mosaic/screens/wallet.dart'; // Importing MealsScreen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MealMosaic',
      //theme: ThemeData.dark(),
      home: const OnboardingScreen(), // Initial screen

      routes: {
        "/meals": (context) => const MealsScreen(),
        "/wallet": (context) => WalletScreen(),
        "/transactions": (context) => TransactionsScreen(), // Existing route
      },
    );
  }
}
