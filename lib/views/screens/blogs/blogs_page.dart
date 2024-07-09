import 'package:flutter/material.dart';
import 'package:app/views/screens/sidebar/animated_sidebar.dart';

class BlogsPage extends StatelessWidget {
  static const routeName = '/blogs';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Extend body behind the app bar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make app bar transparent
        title: Text(
          'Blogs',
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
      drawer: DrawerNavigation(), // Add the sidebar drawer
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/f.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.only(top: 100, left: 10, right: 10), // Adjust top padding for space below app bar
          children: [
            _buildBlogCard(
              title: 'Sunday Sermon Recap: The Power of Forgiveness',
              author: 'Rev. John Doe',
              date: 'July 5, 2024',
              excerpt:
                  'In this Sunday’s sermon, we explored the profound impact of forgiveness...',
              onTap: () {
                // Navigate to full blog post
              },
            ),
            // Add more cards here as needed
          ],
        ),
      ),
    );
  }

  Widget _buildBlogCard({
    required String title,
    required String author,
    required String date,
    required String excerpt,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'By $author',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    date,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                excerpt,
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
