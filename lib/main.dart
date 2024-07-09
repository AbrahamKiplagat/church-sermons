import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:app/views/screens/dashboard/home_page.dart';
import 'package:app/views/screens/blogs/blogs_page.dart'; // Import the EventsPage
import 'package:app/views/screens/events/events_page.dart'; // Import the EventsPage
import 'package:app/views/screens/sidebar/animated_sidebar.dart'; // Import the DrawerNavigation class

const firebaseConfig = FirebaseOptions(
  apiKey: "AIzaSyAgqhQOlqRslHrEYWGfCS65X-q8V2rNnhs",
  authDomain: "church-7c5aa.firebaseapp.com",
  projectId: "church-7c5aa",
  storageBucket: "church-7c5aa.appspot.com",
  messagingSenderId: "629630311867",
  appId: "1:629630311867:web:22450026f66a82dbcb789e",
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: firebaseConfig,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World App',
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
      },
    );
  }
}
