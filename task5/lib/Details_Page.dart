import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 11, 249),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top Burger Image
              Container(
                padding: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/image3.png', // Ensure the image exists
                  width: 400,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),

              // White Curved Section
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Rating and Price Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade800,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '4.8',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          '\$20',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    // Burger Name
                    Text(
                      'Beef Burger',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),

                    // Description
                    Text(
                      'Big juicy burger with Cheese, Lettuce, Onions, Tomato and special sauce!',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    SizedBox(height: 20),

                    // Add-Ons
                    Text(
                      'Add Ons:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),

                    // Equal Spacing for Add-On Images
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AddOnItem(imagePath: 'assets/images/image4.png'),
                        AddOnItem(imagePath: 'assets/images/image5.png'),
                        AddOnItem(imagePath: 'assets/images/image6.png'),
                      ],
                    ),

                    SizedBox(height: 20),

                    // Add to Cart Button
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade800,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 60, vertical: 15),
                        ),
                        onPressed: () {Navigator.pushNamed(context, '/home'); // Navigate 
},
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget for Add-ons
class AddOnItem extends StatelessWidget {
  final String imagePath;
  AddOnItem({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80, // Slightly larger for better visibility
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
