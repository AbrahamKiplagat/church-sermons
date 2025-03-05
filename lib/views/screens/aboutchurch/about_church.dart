import 'package:flutter/material.dart';
import 'package:app/views/screens/sidebar/animated_sidebar.dart'; // Import AnimatedSidebar// Import DrawerNavigation

class AboutChurchScreen extends StatelessWidget {
  static const routeName = '/about-church';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Extend the body behind the AppBar
      drawer: DrawerNavigation(), // Use the DrawerNavigation widget
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu, // Menu icon
              color: Color.fromARGB(255, 255, 230, 0),
              size: _getResponsiveIconSize(context, 24),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Open the drawer
            },
          ),
        ),
        title: Row(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'City ',
                    style: TextStyle(
                      fontFamily: 'FjallaOne',
                      fontWeight: FontWeight.normal,
                      fontSize: _getResponsiveFontSize(context, 40),
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: 'Church',
                    style: TextStyle(
                      fontFamily: 'FjallaOne',
                      fontWeight: FontWeight.bold,
                      fontSize: _getResponsiveFontSize(context, 40),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.person,
                color: Color.fromARGB(255, 255, 230, 0),
                size: _getResponsiveIconSize(context, 24),
              ),
              onPressed: () {
                // User profile action
              },
            ),
          ],
        ),
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 255, 230, 0),
          size: _getResponsiveIconSize(context, 24),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/h.png'), // Background image
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: _getResponsivePadding(context, 100)), // Adjust for AppBar

              // About City Church Card
              _buildCard(
                context,
                title: 'About City Church',
                description:
                    'City Church is a vibrant community of believers dedicated to spreading the love of Christ. We are committed to fostering spiritual growth, building strong relationships, and serving our community. Our mission is to make disciples who make a difference in the world.',
                
              ),

              SizedBox(height: 20), // Spacing

              // Architecture Card
              _buildCard(
                context,
                title: 'Architecture',
                description:
                    'The architecture of City Church is a blend of modern and traditional design, reflecting our commitment to honoring the past while embracing the future. The building features stunning stained glass windows, a grand altar, and a spacious sanctuary that can accommodate thousands of worshippers.',
                
              ),

              SizedBox(height: 20), // Spacing

              // City Church History Card
              _buildCard(
                context,
                title: 'City Church History',
                description:
                    'City Church was founded in 1950 by a small group of believers who wanted to create a place of worship and community. Over the years, the church has grown into a thriving congregation, impacting countless lives through its ministries, outreach programs, and commitment to the Gospel.',
                
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build a card with title, description, and image
  Widget _buildCard(BuildContext context, {required String title, required String description}) {
    return Card(
      elevation: 5,
      color: Color.fromARGB(64, 0, 0, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to get responsive font size
  double _getResponsiveFontSize(BuildContext context, double baseSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1200) {
      return baseSize * 1.5;
    } else if (screenWidth > 800) {
      return baseSize * 1.2;
    } else if (screenWidth > 600) {
      return baseSize;
    } else {
      return baseSize * 0.8;
    }
  }

  // Helper method to get responsive icon size
  double _getResponsiveIconSize(BuildContext context, double baseSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1200) {
      return baseSize * 1.5;
    } else if (screenWidth > 800) {
      return baseSize * 1.2;
    } else if (screenWidth > 600) {
      return baseSize;
    } else {
      return baseSize * 0.8;
    }
  }

  // Helper method to get responsive padding
  double _getResponsivePadding(BuildContext context, double basePadding) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1200) {
      return basePadding * 1.5;
    } else if (screenWidth > 800) {
      return basePadding * 1.2;
    } else if (screenWidth > 600) {
      return basePadding;
    } else {
      return basePadding * 0.8;
    }
  }
}