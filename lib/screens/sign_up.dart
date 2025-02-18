import 'package:flutter/material.dart';
import 'package:meal_mosaic/screens/home.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isChecked = false;
  bool isButtonEnabled = false;

  final Map<String, List<String>> universityData = {
    'BUET': ['Hall A1', 'Hall A2', 'Hall A3'],
    'CUET': ['Hall B1', 'Hall B2'],
    'KUET': ['Hall C1', 'Hall C2', 'Hall C3', 'Hall C4'],
    'RUET': [
      'Zia Hall',
      'Bangabandhu Hall',
      'Hamid Hall',
      'Shahidul Hall',
      'TinShed Hall',
      'Selim Hall'
    ],
  };

  String? selectedUniversity;
  List<String> residentialHalls = [];
  String? selectedHall;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _validateForm() {
    setState(() {
      isButtonEnabled = isChecked &&
          firstNameController.text.isNotEmpty &&
          lastNameController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty &&
          selectedUniversity != null &&
          selectedHall != null;
    });
  }

  @override
  void initState() {
    super.initState();
    firstNameController.addListener(_validateForm);
    lastNameController.addListener(_validateForm);
    emailController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDCF6E6),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Please Sign Up to MealMosaic',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: TextField(
                          controller: firstNameController,
                          decoration: InputDecoration(
                            hintText: 'First Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextField(
                          controller: lastNameController,
                          decoration: InputDecoration(
                            hintText: 'Last Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: selectedUniversity,
                  hint: const Text('Select University'),
                  items: universityData.keys.map((university) {
                    return DropdownMenuItem(
                      value: university,
                      child: Text(university),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedUniversity = value;
                      residentialHalls = universityData[value!]!;
                      selectedHall = null;
                    });
                    _validateForm();
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: selectedHall,
                  hint: const Text('Select Residential Hall'),
                  items: residentialHalls.map((hall) {
                    return DropdownMenuItem(
                      value: hall,
                      child: Text(hall),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedHall = value;
                    });
                    _validateForm();
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                          _validateForm();
                        });
                      },
                    ),
                    const Text('Agree to Terms and Conditions',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: isButtonEnabled
                      ? () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePageScreen()),
                    );
                  }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: isButtonEnabled ? Colors.black : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
