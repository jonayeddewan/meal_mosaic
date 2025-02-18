import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:meal_mosaic/widget/navigation_bar.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imagePaths = [
      'assets/images/carosel1.jpg',
      'assets/images/carosel2.jpg',
      'assets/images/carosel3.jpg',
    ];

    // List of items for the Grid
    List<Map<String, dynamic>> gridItems = [
      {"icon": 'assets/images/meals.png', "text": "Meals", "route": "/meals"},
      {
        "icon": 'assets/images/wallet.png',
        "text": "Wallet",
        "route": "/wallet"
      },
      {
        "icon": 'assets/images/transaction.png',
        "text": "Transactions",
        "route": "/transactions"
      },
    ];
    return Scaffold(
      backgroundColor: const Color(0xffDCF6E6),
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: const Color(0xffDCF6E6),
        title: const Text('Meal Mosaic'),
      ),
      body: Container(
        color: const Color(0xffDCF6E6),
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
                items: imagePaths.map((imagePath) {
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset(
                            imagePath,
                            fit: BoxFit.cover,
                            width: double.infinity,
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
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 1.0,
                ),
                itemCount: gridItems.length, // Number of items in grid
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, gridItems[index]["route"]);
                    },
                    borderRadius: BorderRadius.circular(20.0),
                    child: Card(
                      color: const Color(0xff1E6F5C),
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            gridItems[index]["icon"],
                            width: 50,
                            height: 50,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            gridItems[index]["text"],
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: const CustomNavigationBarBottom(),
    );
  }
}
