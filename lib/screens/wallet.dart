import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDCF6E6),
      appBar: AppBar(
        backgroundColor: const Color(0xff1E6F5C),
        title: const Text('Wallet'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Wallet Balance Card
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: const Color(0xff1E6F5C),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      'Wallet Balance',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '৳ 1250.00',  // Example balance amount
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Recharge Options Section
            const Text(
              'Recharge Options',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xff1E6F5C),
              ),
            ),
            const SizedBox(height: 20),

            // Bkash Payment Button
            ElevatedButton.icon(
              onPressed: () {
                // Handle Bkash Payment
                _showSnackBar(context, "Bkash Payment Selected");
              },
              icon: Image.asset('assets/images/bkash.png', height: 24),
              label: const Text('Recharge with Bkash',style:
                TextStyle(
                  color: Colors.white
                ),),
              style: _buttonStyle(),
            ),
            const SizedBox(height: 15),

            // Card Payment Button
            ElevatedButton.icon(
              onPressed: () {
                // Handle Card Payment
                _showSnackBar(context, "Card Payment Selected");
              },
              icon: const Icon(Icons.credit_card, color: Colors.white),
              label: const Text('Recharge with Card',
                style:
                TextStyle(
                    color: Colors.white
                ),
              ),
              style: _buttonStyle(),
            ),
            const SizedBox(height: 15),

            // Internet Payment Button
            ElevatedButton.icon(
              onPressed: () {
                // Handle Internet Payment
                _showSnackBar(context, "Internet Payment Selected");
              },
              icon: const Icon(Icons.language, color: Colors.white),
              label: const Text('Recharge with Internet Payment',
                style:
                TextStyle(
                    color: Colors.white
                ),
              ),
              style: _buttonStyle(),
            ),
          ],
        ),
      ),
    );
  }

  // Button style for consistency
  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: const Color(0xff1E6F5C),
      padding: const EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      textStyle: const TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Simple method to show a snack bar when a button is pressed
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
