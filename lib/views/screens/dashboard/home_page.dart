import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove debug banner
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/h.png'), // Path to your background image
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              AppBar(
                title: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'City ',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.normal, // Normal weight for "City"
                              fontSize: 40, // Adjust the font size as needed
                              color: Colors.white, // Ensure the color is set for visibility
                            ),
                          ),
                          TextSpan(
                            text: 'Church',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold, // Bold weight for "Church"
                              fontSize: 40, // Adjust the font size as needed
                              color: Colors.white, // Ensure the color is set for visibility
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(), // Spacer to push the icon to the right
                    IconButton(
                      icon: Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 255, 230, 0), // Set the icon color
                      ),
                      onPressed: () {
                        // Add your onPressed functionality here
                      },
                    ),
                  ],
                ),
                backgroundColor: Colors.transparent, // Make AppBar transparent
                elevation: 0, // Remove AppBar shadow
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Hello World',
                    style: TextStyle(
                      color: Colors.white, // Ensure the color is set for visibility
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
