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
                      fontSize: _getResponsiveFontSize(context, 40), // Responsive font size
                      color: Colors.white, // Ensure the color is set for visibility
                    ),
                  ),
                  TextSpan(
                    text: 'Church',
                    style: TextStyle(
                      fontFamily: 'FjallaOne',
                      fontWeight: FontWeight.bold, // Bold weight for "Church"
                      fontSize: _getResponsiveFontSize(context, 40), // Responsive font size
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
                size: _getResponsiveIconSize(context, 24), // Responsive icon size
              ),
              onPressed: () {
                // Add your onPressed functionality here
              },
            ),
          ],
        ),
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 255, 230, 0),
          size: _getResponsiveIconSize(context, 24), // Responsive icon size
        ),
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
            padding: EdgeInsets.symmetric(
              horizontal: _getResponsivePadding(context, 20), // Responsive horizontal padding
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: _getResponsivePadding(context, 100)), // Responsive spacing
                Padding(
                  padding: EdgeInsets.only(
                    bottom: _getResponsivePadding(context, 20), // Responsive spacing
                  ),
                  child: SelectableText(
                    'Thought of the Day',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: _getResponsiveFontSize(context, 24), // Responsive font size
                      color: Color.fromARGB(255, 255, 230, 0),
                    ),
                  ),
                ),
                SelectableText(
                  "At the end of the day, before close your eyes, be content with what you've done and proud of who you are.",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: _getResponsiveFontSize(context, 20), // Responsive font size
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: _getResponsivePadding(context, 20)), // Responsive spacing
                GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(), // Disable GridView scrolling
                  crossAxisCount: _getResponsiveCrossAxisCount(context), // Responsive grid columns
                  crossAxisSpacing: _getResponsivePadding(context, 20), // Responsive spacing
                  mainAxisSpacing: _getResponsivePadding(context, 20), // Responsive spacing
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

  // Helper method to build a card
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
          padding: EdgeInsets.all(_getResponsivePadding(context, 20)), // Responsive padding
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: _getResponsiveIconSize(context, 24), // Responsive icon size
                color: Color.fromARGB(255, 255, 230, 0), // Icon color
              ),
              SizedBox(width: _getResponsivePadding(context, 10)), // Responsive spacing
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectableText(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: _getResponsiveFontSize(context, 12), // Responsive font size
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: _getResponsivePadding(context, 5)), // Responsive spacing
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: _getResponsiveFontSize(context, 8), // Responsive font size
                        color: Colors.grey,
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

  // Helper method to get responsive font size
  double _getResponsiveFontSize(BuildContext context, double baseSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1200) {
      return baseSize * 1.5; // Larger font size for large screens
    } else if (screenWidth > 800) {
      return baseSize * 1.2; // Medium font size for tablets
    } else if (screenWidth > 600) {
      return baseSize; // Default font size for small tablets
    } else {
      return baseSize * 0.8; // Smaller font size for mobile phones
    }
  }

  // Helper method to get responsive icon size
  double _getResponsiveIconSize(BuildContext context, double baseSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1200) {
      return baseSize * 1.5; // Larger icon size for large screens
    } else if (screenWidth > 800) {
      return baseSize * 1.2; // Medium icon size for tablets
    } else if (screenWidth > 600) {
      return baseSize; // Default icon size for small tablets
    } else {
      return baseSize * 0.8; // Smaller icon size for mobile phones
    }
  }

  // Helper method to get responsive padding
  double _getResponsivePadding(BuildContext context, double basePadding) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1200) {
      return basePadding * 1.5; // Larger padding for large screens
    } else if (screenWidth > 800) {
      return basePadding * 1.2; // Medium padding for tablets
    } else if (screenWidth > 600) {
      return basePadding; // Default padding for small tablets
    } else {
      return basePadding * 0.8; // Smaller padding for mobile phones
    }
  }

  // Helper method to get responsive grid columns
  int _getResponsiveCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1200) {
      return 4; // 4 columns for large screens
    } else if (screenWidth > 800) {
      return 3; // 3 columns for tablets
    } else if (screenWidth > 600) {
      return 2; // 2 columns for small tablets
    } else {
      return 2; // 2 columns for mobile phones
    }
  }
}