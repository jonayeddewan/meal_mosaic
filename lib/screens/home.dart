import 'package:flutter/material.dart';
import 'package:meal_mosaic/widget/widget_support.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50.5, left: 20.0, right: 10.0),
        child: Column(
          children: [
            Row(
              children: [
                Text("Hello Junayed,", style: AppWidget.boldTextFeildStyle()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
