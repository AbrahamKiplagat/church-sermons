import 'package:app/views/screens/prayers/prayers_screen.dart';
import 'package:flutter/material.dart';
import 'package:app/views/screens/dashboard/home_page.dart';
import 'package:app/views/screens/blogs/blogs_page.dart'; // Import the EventsPage
import 'package:app/views/screens/events/events_page.dart'; // Import the EventsPage
import 'package:app/views/screens/sidebar/animated_sidebar.dart'; // Import the DrawerNavigation class
import 'package:app/views/screens/books/books_page.dart'; // Import the DrawerNavigation clas\\
//1. make a responsive screen 
// 2. 
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
      },
    );
  }
}
