import 'package:app/views/screens/prayers/prayers_screen.dart';
import 'package:flutter/material.dart';
import 'package:app/views/screens/sidebar/animated_sidebar.dart'; // Import AnimatedSidebar class
import 'package:app/views/screens/events/events_page.dart'; // Import EventsPage
import 'package:app/views/screens/blogs/blogs_page.dart'; // Import EventsPage

class HomePage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Extend the body behind the app bar
      appBar: AppBar(
        title: Row(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'City ',
                    style: TextStyle(
                      fontFamily: 'FjallaOne',
                      fontWeight: FontWeight.normal, // Normal weight for "City"
                      fontSize: 40, // Adjust the font size as needed
                      color: Colors.white, // Ensure the color is set for visibility
                    ),
                  ),
                  TextSpan(
                    text: 'Church',
                    style: TextStyle(
                      fontFamily: 'FjallaOne',
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
        iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 230, 0)),
        backgroundColor: Colors.transparent, // Make AppBar transparent
        elevation: 0, // Remove AppBar shadow
      ),
      drawer: DrawerNavigation(), // Use Animated DrawerNavigation widget for the drawer
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/h.png'), // Path to your background image
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100), // Add padding above 'Thought of the Day'
                Padding(
                  padding: const EdgeInsets.only(bottom: 20), // Add spacing below 'Thought of the Day'
                  child: SelectableText( // Make 'Thought of the Day' selectable
                    'Thought of the Day',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color.fromARGB(255, 255, 230, 0),
                    ),
                  ),
                ),
                SelectableText( // Make the thought content selectable
                  "At the end of the day, before close your eyes, be content with what you've done and proud of who you are.",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20), // Add spacing below 'Thought of the Day'
                GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(), // Disable GridView scrolling
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [
                    _buildCard(context, Icons.event, 'Events', 'List of events', EventsPage.routeName),
                    _buildCard(context, Icons.article, 'Blogs', 'Read churches blogs', BlogsPage.routeName),
                    _buildCard(context, Icons.chrome_reader_mode, 'Prayers', 'Read Prayers', PrayersPage.routeName),
                    _buildCard(context, Icons.book, 'Books', 'List of church books', '/books'),
                    _buildCard(context, Icons.image, 'Gallery', 'Videos and books', '/gallery'),
                    _buildCard(context, Icons.search, 'Find Church', 'Find nearby churches', '/find-church'),
                    _buildCard(context, Icons.business, 'About', 'Read about church', '/about'),
                    _buildCard(context, Icons.contact_mail, 'Contact', 'Message to church', '/contact'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, IconData iconData, String title, String description, String routeName) {
    return Card(
      elevation: 5,
      color: Color.fromARGB(64, 0, 0, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(routeName);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent, // Set container background color to transparent
            borderRadius: BorderRadius.circular(15.0),
          ),
          padding: EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 24,
                color: Color.fromARGB(255, 255, 230, 0), // Icon color
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  color: Colors.transparent, // Set column background color to transparent
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SelectableText( // Make title selectable
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 8,
                          color: Colors.grey,
                        ),
                      ),
                    ],
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
