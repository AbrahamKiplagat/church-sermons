import 'package:flutter/material.dart';
import 'package:app/views/screens/sidebar/animated_sidebar.dart'; // Import AnimatedSidebar// Import DrawerNavigation

class ContactChurchScreen extends StatelessWidget {
  static const routeName = '/contact-church';

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

              // Contact Information Card
              _buildCard(
                context,
                title: 'Contact Information',
                description:
                    'If you have any questions, prayer requests, or would like to get involved, please feel free to reach out to us. We would love to hear from you!',
                children: [
                  _buildContactItem(
                    icon: Icons.location_on,
                    text: '123 Church Street, Cityville, Country',
                  ),
                  _buildContactItem(
                    icon: Icons.phone,
                    text: '+1 (123) 456-7890',
                  ),
                  _buildContactItem(
                    icon: Icons.email,
                    text: 'info@citychurch.com',
                  ),
                  _buildContactItem(
                    icon: Icons.language,
                    text: 'www.citychurch.com',
                  ),
                ],
              ),

              SizedBox(height: 20), // Spacing

              // Office Hours Card
              _buildCard(
                context,
                title: 'Office Hours',
                description:
                    'Our office is open during the following hours for your convenience. Feel free to visit us or call during these times.',
                children: [
                  _buildContactItem(
                    icon: Icons.access_time,
                    text: 'Monday - Friday: 9:00 AM - 5:00 PM',
                  ),
                  _buildContactItem(
                    icon: Icons.access_time,
                    text: 'Saturday: 10:00 AM - 2:00 PM',
                  ),
                  _buildContactItem(
                    icon: Icons.access_time,
                    text: 'Sunday: Closed',
                  ),
                ],
              ),

              SizedBox(height: 20), // Spacing

              // Social Media Card
              _buildCard(
                context,
                title: 'Follow Us on Social Media',
                description:
                    'Stay connected with us on social media for the latest updates, events, and inspirational messages.',
                children: [
                  _buildContactItem(
                    icon: Icons.facebook,
                    text: 'Facebook: @CityChurch',
                  ),
                  _buildContactItem(
                    icon: Icons.camera_alt,
                    text: 'Instagram: @CityChurch',
                  ),
                  _buildContactItem(
                    icon: Icons.play_circle_filled,
                    text: 'YouTube: City Church Official',
                  ),
                  _buildContactItem(
                    icon: Icons.chat,
                    text: 'Twitter: @CityChurch',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build a card with title, description, and additional children
  Widget _buildCard(BuildContext context, {required String title, required String description, List<Widget>? children}) {
    return Card(
      elevation: 5,
      color: Color.fromARGB(64, 0, 0, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
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
            SizedBox(height: 10),
            if (children != null) ...children,
          ],
        ),
      ),
    );
  }

  // Helper method to build a contact item with an icon and text
  Widget _buildContactItem({required IconData icon, required String text}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Color.fromARGB(255, 255, 230, 0),
            size: 24,
          ),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
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