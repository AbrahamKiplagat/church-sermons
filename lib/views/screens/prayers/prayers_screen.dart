import 'package:flutter/material.dart';
import 'package:app/views/screens/sidebar/animated_sidebar.dart';

class PrayersPage extends StatelessWidget {
  static const routeName = '/prayers';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Extend body behind the app bar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make app bar transparent
        title: Text(
          'Prayers',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            onPressed: () {
              // Handle search icon press
            },
          ),
        ],
        elevation: 0, // No shadow
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: DrawerNavigation(), // Add sidebar here
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/f.png'), // Replace with your image asset
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.only(top: 100, left: 10, right: 10), // Adjust top padding for space below app bar
          children: [
            _buildPrayerCard(
              title: 'Morning Prayer',
              content:
                  'Dear God, thank you for this new day. Please guide me and bless my endeavors today...',
              onTap: () {
                // Handle prayer tap
              },
            ),
            _buildPrayerCard(
              title: 'Evening Prayer',
              content:
                  'Lord, as the day ends, I reflect on your blessings. Grant me peace and restful sleep...',
              onTap: () {
                // Handle prayer tap
              },
            ),
            // Add more prayers here as needed
          ],
        ),
      ),
    );
  }

  Widget _buildPrayerCard({
    required String title,
    required String content,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                content,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
