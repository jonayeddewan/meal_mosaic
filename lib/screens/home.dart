import 'package:flutter/material.dart';
import 'package:meal_mosaic/widget/widget_support.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
