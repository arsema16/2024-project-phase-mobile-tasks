import 'package:flutter/material.dart';
import 'package:task5/Screen_2.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Screen3()));
}

class Screen3 extends StatelessWidget {
  final List<Map<String, dynamic>> newNotifications = [
    {"image": "assets/images/n1.png"},
    {"image": "assets/images/n2.png"},
    {"image": "assets/images/n3.png"},
    {"image": "assets/images/n4.png"},
    {"image": "assets/images/n5.png"},
    {"image": "assets/images/n6.png"},
  ];

  final List<Map<String, dynamic>> earlierNotifications = [
    {"image": "assets/images/n1.png"},
    {"image": "assets/images/n2.png"},
    {"image": "assets/images/n3.png"},
    {"image": "assets/images/n4.png"},
    {"image": "assets/images/n5.png"},
    {"image": "assets/images/n6.png"},
  ];

  Widget buildNotificationTile(String image, bool isBlueBackground) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color:
            isBlueBackground
                ? const Color.fromARGB(255, 191, 230, 254)
                : const Color.fromARGB(255, 228, 242, 250),
      ),
      child: Row(
        children: [
          CircleAvatar(backgroundImage: AssetImage(image), radius: 25),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 14),
                    children: [
                      TextSpan(
                        text: "Darrell Trivied ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: "has a new story up."),
                    ],
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  "What's your reaction?",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                SizedBox(height: 2),
                Text(
                  "2 hours ago",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                ),
              ],
            ),
          ),
          Icon(Icons.more_horiz, color: Colors.grey.shade700),
        ],
      ),
    );
  }

  Widget buildSection(
    String title,
    List<Map<String, dynamic>> notifications,
    List<bool> colorPattern,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        Column(
          children: List.generate(
            notifications.length,
            (index) => buildNotificationTile(
              notifications[index]["image"],
              colorPattern[index],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: SizedBox(), // Empty title to center icons
        centerTitle: true,
        flexibleSpace: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ), // Add padding on both sides
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Evenly distribute icons
            children: [
              IconButton(
                onPressed: () {
                  // 🔥 Use onPressed instead of onTap
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Screen2()),
                  );
                },
                icon: Icon(Icons.home_filled, color: Colors.grey),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.people, color: Colors.grey),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.person, color: Colors.grey),
              ),
              Stack(
        children: [
          Icon(Icons.video_call_outlined, size: 30,color: Colors.grey),
          Positioned(
            right: 2,
            top: 2,
            child: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              constraints: BoxConstraints(
                minWidth: 8,
                minHeight: 8,
              ),
              child: Text(
                '9', 
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.blue,
                ), // Active page
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.menu, color: Colors.black87),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),

      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Notifications Title and Search Bar
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Notifications",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Container(
                  width: 150, // Adjust width as needed
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                buildSection("New", newNotifications, [
                  true,
                  true,
                  true,
                  true,
                  true,
                  false,
                ]),
                buildSection("Earlier", earlierNotifications, [
                  false,
                  true,
                  true,
                  false,
                  false,
                  false,
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
