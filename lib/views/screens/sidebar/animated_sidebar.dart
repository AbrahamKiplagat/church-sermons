import 'package:flutter/material.dart';
import 'package:app/views/screens/events/events_page.dart'; // Import EventsPage

class DrawerNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromARGB(255, 39, 39, 39),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
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
                      Text(
                        'City Church',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
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
            ),
            ListTile(
              leading: Icon(Icons.event, color: Colors.white),
              title: Text(
                'Events',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(EventsPage.routeName);
              },
            ),
            ListTile(
              leading: Icon(Icons.article, color: Colors.white), // Icon color
              title: Text(
                'Blogs',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                // Navigate to Blogs page or handle onTap event
                Navigator.of(context).pop(); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.chrome_reader_mode, color: Colors.white), // Icon color
              title: Text(
                'Prayers',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                // Navigate to Prayers page or handle onTap event
                Navigator.of(context).pop(); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.book, color: Colors.white), // Icon color
              title: Text(
                'Books',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                // Navigate to Books page or handle onTap event
                Navigator.of(context).pop(); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.image, color: Colors.white), // Icon color
              title: Text(
                'Gallery',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                // Navigate to Gallery page or handle onTap event
                Navigator.of(context).pop(); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.search, color: Colors.white), // Icon color
              title: Text(
                'Find Church',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                // Navigate to Find Church page or handle onTap event
                Navigator.of(context).pop(); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.business, color: Colors.white), // Icon color
              title: Text(
                'About',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                // Navigate to About page or handle onTap event
                Navigator.of(context).pop(); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail, color: Colors.white), // Icon color
              title: Text(
                'Contact',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                // Navigate to Contact page or handle onTap event
                Navigator.of(context).pop(); // Close the drawer
              },
            ),
            // Add other list tiles as needed
          ],
        ),
      ),
    );
  }
}
