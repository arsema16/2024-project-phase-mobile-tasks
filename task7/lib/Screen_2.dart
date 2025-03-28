import 'package:flutter/material.dart';
import 'package:task5/Screen_1.dart';
// ignore: unused_import
import 'package:task5/Screen_3.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Text(
              'facebook',
              style: TextStyle(
                color: const Color.fromARGB(255, 43, 50, 245),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            SizedBox(width: 15),
            Icon(
              Icons.messenger_rounded,
              color: const Color.fromARGB(255, 44, 88, 248),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Navigation icons
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Home Icon with Blue Dot
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.home_filled,
                        color: Color.fromARGB(255, 43, 71, 250),
                      ),
                      Positioned(
                        bottom: -2, // Position the dot slightly below the icon
                        child: Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(
                              255,
                              43,
                              71,
                              250,
                            ), // Blue dot color
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Icon(Icons.people, color: Colors.grey),

                  Icon(Icons.person, color: Colors.grey),

                  // Video Icon with Badge
                  Stack(
                    children: [
                      Icon(
                        Icons.video_call_outlined,
                        size: 30,
                        color: Colors.grey,
                      ),
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

                  // Notifications Icon with Badge
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Screen3()),
                          );
                        },
                        icon: Icon(Icons.notifications, color: Colors.grey),
                      ),
                      Positioned(
                        right: 2,
                        top: 2,
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          constraints: BoxConstraints(
                            minWidth: 10,
                            minHeight: 10,
                          ),
                          child: Text(
                            '3',
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

                  // Menu Icon
                  Icon(Icons.menu, color: Colors.grey),
                ],
              ),
            ),

            SizedBox(height: 5),
            // Profile and search bar
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    width: 50,
                    height: 30,
                    child: Image.asset(
                      'assets/images/profile.png',
                      width: 150,
                      height: 100,
                    ),
                  ),

                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "What's on your mind, Sanjay?",
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            // 🔥 Use onPressed instead of onTap
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Screen1(),
                              ),
                            );
                          },
                          icon: Icon(Icons.photo_album, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.search, color: Colors.grey),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 223, 220, 187),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 3,
                      children: [
                        SizedBox(height: 25, width: 5),

                        Icon(
                          Icons.movie_rounded,
                          color: const Color.fromARGB(255, 241, 223, 14),
                        ),
                        SizedBox(height: 5, width: 10),

                        Text(
                          "Reels",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 241, 231, 16),
                          ),
                        ),
                        SizedBox(height: 5, width: 5),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 180, 233, 182),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 3,

                      children: [
                        SizedBox(height: 25, width: 5),

                        Icon(
                          Icons.video_call,
                          color: const Color.fromARGB(255, 14, 248, 33),
                        ),
                        SizedBox(height: 5, width: 5),

                        Text(
                          "  Room ",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 42, 254, 53),
                          ),
                        ),
                        SizedBox(height: 5, width: 5),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 240, 170, 165),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 3,

                      children: [
                        Icon(
                          Icons.groups,
                          color: const Color.fromARGB(255, 253, 11, 11),
                        ),
                        SizedBox(height: 5, width: 5),

                        Text(
                          "  Group ",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 240, 52, 52),
                          ),
                        ),
                        SizedBox(height: 5, width: 5),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 171, 215, 250),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 3,

                      children: [
                        Icon(
                          Icons.live_tv,
                          color: const Color.fromARGB(255, 32, 88, 243),
                        ),
                        SizedBox(height: 5, width: 5),

                        Text(
                          "  Live ",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 25, 43, 238),
                          ),
                        ),
                        SizedBox(height: 5, width: 5),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Story section
            // Story Section
            SizedBox(),
            Container(
              height: 180,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  addStoryTile(),
                  storyTile("assets/images/story1.png", "Vish Patil"),
                  storyTile("assets/images/story2.png", "Rakesh Shetty"),
                  storyTile("assets/images/story3.png", "Akash Bolre"),
                ],
              ),
            ),
            SizedBox(height: 10),
            // Post
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          'assets/images/profile2.png',
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Deven mestry",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(" is with "),
                              Text(
                                "Mahesh Joshi",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "1 h • Mumbai, Maharastra .",

                                style: TextStyle(color: Colors.grey),
                              ),
                              Icon(
                                Icons.group,
                                weight: 30,
                                color: const Color.fromARGB(255, 87, 93, 96),
                              ),
                            ],
                          ),
                        ],
                      ),

                      Spacer(),
                      Icon(Icons.more_vert),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("Old is Gold..!! ❤️😍"),
                  SizedBox(height: 10),

                  Image.asset('assets/images/post.png'),
                ],
              ),
            ),
            // Like, Comment, Share Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  Icon(Icons.thumb_up, color: Colors.blue),
                  Icon(Icons.favorite, color: Colors.red),
                  SizedBox(width: 5),
                  Text("1.2K"),
                  Spacer(),
                  Text("4 comments"),
                ],
              ),
            ),

            // Liked by section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Liked by Sachin Kumar and 100 others",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            ),

            Divider(),

            // Bottom Navigation
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  bottomNavItem(Icons.thumb_up_alt_outlined, "Like"),
                  bottomNavItem(Icons.comment_outlined, "Comment"),
                  bottomNavItem(Icons.share_outlined, "Share"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomNavItem(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.black54),
        Text(label, style: TextStyle(color: Colors.black54)),
      ],
    );
  }
}

Widget storyWidget(String imagePath, String name) {
  return Container(
    margin: EdgeInsets.only(right: 10),
    width: 80,
    child: Column(
      children: [
        CircleAvatar(backgroundImage: AssetImage(imagePath), radius: 30),
        SizedBox(height: 5),
        Text(name, overflow: TextOverflow.ellipsis),
      ],
    ),
  );
}

Widget addStoryTile() {
  return Padding(
    padding: EdgeInsets.only(left: 10),
    child: Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: 100,
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage("assets/images/profile.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(Icons.add, color: Colors.white),
            ),
          ],
        ),
        SizedBox(height: 5),
        Text("Your Story"),
      ],
    ),
  );
}

Widget storyTile(String imagePath, String name) {
  return Padding(
    padding: EdgeInsets.only(left: 10),
    child: Column(
      children: [
        Container(
          width: 100,
          height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(name),
      ],
    ),
  );
}
