import 'package:app/views/screens/aboutchurch/about_church.dart';
import 'package:flutter/material.dart';
import 'package:app/views/screens/prayers/prayers_screen.dart';
import 'package:app/views/screens/events/events_page.dart'; // Import EventsPage
import 'package:app/views/screens/blogs/blogs_page.dart'; // Import BlogsPage
import 'package:app/views/screens/books/books_page.dart'; // Import BooksPage
import 'package:app/views/screens/gallery/gallery_page.dart'; 
class DrawerNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromARGB(255, 39, 39, 39),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _buildDrawerHeader(context),
            _buildListTile(
              context,
              icon: Icons.event,
              title: 'Events',
              routeName: EventsPage.routeName,
            ),
            _buildListTile(
              context,
              icon: Icons.article,
              title: 'Blogs',
              routeName: BlogsPage.routeName,
            ),
            _buildListTile(
              context,
              icon: Icons.chrome_reader_mode,
              title: 'Prayers',
              routeName: PrayersPage.routeName,
            ),
            _buildListTile(
              context,
              icon: Icons.book,
              title: 'Books',
              routeName: BooksPage.routeName,
            ),
            _buildListTile(
              context,
              icon: Icons.image,
              title: 'Gallery',
              routeName: GalleryPage.routeName,
            ),
            _buildListTile(
              context,
              icon: Icons.search,
              title: 'Find Church',              onTap: () {
                Navigator.of(context).pop(); // Close the drawer
              },
            ),
            _buildListTile(
              context,
              icon: Icons.business,
              title: 'About Chuch',
              
              routeName: AboutChurchScreen.routeName,
            ),
            _buildListTile(
              context,
              icon: Icons.contact_mail,
              title: 'Contact',
              onTap: () {
                Navigator.of(context).pop(); // Close the drawer
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build the DrawerHeader
  Widget _buildDrawerHeader(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 39, 39, 39),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Wrap the "City Church" text in a GestureDetector
              GestureDetector(
                onTap: () {
                  // Navigate to the homepage
                  Navigator.of(context).pop(); // Close the drawer
                  Navigator.of(context).pushReplacementNamed('/'); // Replace with your homepage route
                },
                child: Text(
                  'City Church',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.cancel, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }

  // Helper method to build ListTile with navigation
  Widget _buildListTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? routeName,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onTap: onTap ?? () {
        if (routeName != null) {
          Navigator.of(context).pushNamed(routeName);
        }
      },
    );
  }
}