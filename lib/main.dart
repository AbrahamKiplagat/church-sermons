import 'package:app/views/screens/contactchurch/contact_church.dart';
import 'package:app/views/screens/prayers/prayers_screen.dart';
import 'package:flutter/material.dart';
import 'package:app/views/screens/dashboard/home_page.dart';
import 'package:app/views/screens/blogs/blogs_page.dart'; // Import the EventsPage
import 'package:app/views/screens/events/events_page.dart'; // Import the EventsPage
import 'package:app/views/screens/sidebar/animated_sidebar.dart'; // Import the DrawerNavigation class
import 'package:app/views/screens/books/books_page.dart'; // Import the DrawerNavigation clas\\
import 'package:app/views/screens/gallery/gallery_page.dart'; // Import the DrawerNavigation clas\\
import 'package:app/views/screens/aboutchurch/about_church.dart';
//1. make a responsive screen 
// 2. make a livestream screen for user to view live and the speaker to create a livestream as an admin.
// a) find the packages to install.
// b) create a draft of how the two screens will look like.
// 3) create a new screen for log in and sign up for the speaker admin and user admin.

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Church Sermons',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        EventsPage.routeName: (context) => EventsPage(),
        BlogsPage.routeName: (context) => BlogsPage(),
        PrayersPage.routeName: (context) => PrayersPage(),
        BooksPage.routeName: (context) => BooksPage(),
        GalleryPage.routeName: (context) => GalleryPage(),
        AboutChurchScreen.routeName: (context) =>AboutChurchScreen(),
        ContactChurchScreen.routeName: (context) => ContactChurchScreen()
            
      },
    );
  }
}
