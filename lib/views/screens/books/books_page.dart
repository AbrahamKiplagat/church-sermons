import 'package:app/views/screens/sidebar/animated_sidebar.dart';
import 'package:flutter/material.dart';

class BooksPage extends StatelessWidget {
  static const routeName = "/books";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Extend body behind the app bar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make app bar transparent
        title: Text(
          'Books', // Change the title for BooksPage
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
        child: Padding(
          padding: EdgeInsets.only(top: 100, left: 10, right: 10), // Adjust top padding for space below app bar
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Adjust this number to change the number of columns
              crossAxisSpacing: 10, // Spacing between columns
              mainAxisSpacing: 10, // Spacing between rows
            ),
            itemCount: 6, // Number of books
            itemBuilder: (ctx, index) {
              return _buildBookGridItem(
                title: _getRandomBookTitle(index),
                imagePath: _getBookImagePath(index), // Get unique image path for each book
                onTap: () {
                  // Handle book tap (navigate to book details page, for example)
                },
              );
            },
          ),
        ),
      ),
    );
  }

  String _getRandomBookTitle(int index) {
    List<String> bookTitles = [
      'The End times',
      'Thanks giving and worships',
      'Jesus Calling',
      'Gift of prophesying',
      'Knowing God',
      'The Purpose of christ driven life',
    ];

    return bookTitles[index];
  }

  String _getBookImagePath(int index) {
    // Unique image path for each book
    List<String> imagePaths = [
      'assets/images/a.png', // Image for "The Great Adventure"
      'assets/images/b.png', // Image for "Flutter for Beginners"
      'assets/images/c.png', // Image for "Mastering Dart"
      'assets/images/d.png', // Image for "Exploring the Universe"
      'assets/images/e.png', // Image for "Journey Through Time"
      'assets/images/f.png', // Image for "The Art of Programming"
    ];

    return imagePaths[index];
  }

  Widget _buildBookGridItem({
    required String title,
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: 150, // Adjust the height as needed
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
