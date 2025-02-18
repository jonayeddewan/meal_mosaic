import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:animate_do/animate_do.dart'; // For animations

class MealsScreen extends StatefulWidget {
  const MealsScreen({super.key});

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  String selectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String selectedFilter = 'All'; // Filter options: All, Vegetarian, Non-Vegetarian, Special

  final List<Map<String, String>> meals = [
    {'name': 'Grilled Chicken', 'type': 'Non-Vegetarian', 'time': 'Lunch'},
    {'name': 'Vegetable Curry', 'type': 'Vegetarian', 'time': 'Dinner'},
    {'name': 'Fish Fry', 'type': 'Non-Vegetarian', 'time': 'Dinner'},
    {'name': 'Special Kebab', 'type': 'Special', 'time': 'Lunch'},
    {'name': 'Mixed Salad', 'type': 'Vegetarian', 'time': 'Breakfast'},
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredMeals = selectedFilter == 'All'
        ? meals
        : meals.where((meal) => meal['type'] == selectedFilter).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals'),
        backgroundColor: const Color(0xffDCF6E6),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Date Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Date: $selectedDate',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: _selectDate,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                  ),
                  child: const Text('Select Date'),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Filter Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: ['All', 'Vegetarian', 'Non-Vegetarian', 'Special']
                  .map((filter) => ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedFilter = filter;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedFilter == filter
                      ? Colors.teal
                      : Colors.grey[300],
                ),
                child: Text(
                  filter,
                  style: TextStyle(
                    color: selectedFilter == filter
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ))
                  .toList(),
            ),
            const SizedBox(height: 20),

            // Meal List with Animation
            Expanded(
              child: filteredMeals.isEmpty
                  ? const Center(
                child: Text(
                  'No meals available for the selected filter.',
                  style: TextStyle(fontSize: 16),
                ),
              )
                  : ListView.builder(
                itemCount: filteredMeals.length,
                itemBuilder: (context, index) {
                  final meal = filteredMeals[index];
                  return FadeInUp(
                    duration: const Duration(milliseconds: 500),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      elevation: 5,
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16),
                        title: Text(
                          meal['name']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        subtitle: Text(
                          'Type: ${meal['type']}\nMeal Time: ${meal['time']}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        trailing: ElevatedButton(
                          onPressed: () {
                            _confirmOrder(meal['name']!);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                          ),
                          child: const Text('Order'),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Date Picker Method
  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  // Confirm Order Method
  void _confirmOrder(String mealName) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Order'),
        content: Text('Are you sure you want to order $mealName?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _showOrderSuccess(mealName);
            },
            child: const Text('Yes'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  // Order Success Method
  void _showOrderSuccess(String mealName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$mealName ordered successfully!'),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
