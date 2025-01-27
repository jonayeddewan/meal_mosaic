import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:meal_mosaic/widget/navigation_bar.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Meal Mosaic'),
      ),
      body: Container(
        color: Colors
            .white, // Ensure the entire body has the same background color
        child: Column(
          children: [
            // Wrapping CarouselSlider with a Container to apply margin
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal:
                    5.0, // Adjust the margin here (smaller for a more seamless look)
                vertical:
                    0.0, // Remove vertical margin for no gap between carousel and grid
              ),
              child: CarouselSlider(
                items: [1, 2, 3].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26, // Shadow color
                              blurRadius: 10.0, // Shadow blur radius
                              offset: Offset(0, 4), // Shadow position
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'text $i',
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(height: 190.0),
              ),
            ),
            const SizedBox(
                height: 10), // Reducing the gap between carousel and grid
            // Wrap GridView in Expanded widget to allow it to take available space
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 columns in the grid
                  crossAxisSpacing: 10.0, // Space between columns
                  mainAxisSpacing: 10.0, // Space between rows
                  childAspectRatio: 1.0, // Aspect ratio of each grid item
                ),
                itemCount:
                    3, // Set this to the number of items you want in the grid
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20.0), // Rounded corners
                    ),
                    child: Center(
                      child: Text('Item $index'), // Replace with actual content
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavigationBarBottom(),
    );
  }
}
