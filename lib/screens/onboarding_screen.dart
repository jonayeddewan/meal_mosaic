import 'package:flutter/material.dart';
import 'package:meal_mosaic/screens/sign_in.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDCF6E6), // Set background color
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 25.0), // Adjust the top padding as needed
            child: Center(
              child: Image.asset(
                'assets/images/image1.png',
                width: 280, // Set a suitable small width
                height: 400, // Set a suitable small height
                fit: BoxFit.contain, // Adjust the fit as necessary
              ),
            ),
          ),
          const Text(
            "Welcome To MealMosaic",
            style: TextStyle(
              fontSize: 25,
              fontFamily: "Mulish",
              fontWeight: FontWeight.w600,
            ),
          ),
          const Text(
            "Seamlessly manage your meal tokens and dining experience at your Hall!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Mulish",
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20), // Add some space before the button
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignInScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black, // Background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0), // Rounded corners
              ),
              padding: const EdgeInsets.symmetric(
                  vertical: 20.0, horizontal: 60.0), // Increase padding
            ),
            child: const Text(
              "Start",
              style: TextStyle(
                color: Colors.white, // Text color
                fontSize: 20, // Increase font size
              ),
            ),
          ),
        ],
      ),
    );
  }
}
