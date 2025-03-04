import 'package:app/views/screens/sidebar/animated_sidebar.dart'; // Import the sidebar widget
import 'package:flutter/material.dart'; // Import Flutter material library

class BooksPage extends StatelessWidget {
  // Define a route name for navigation purposes
  static const routeName = "/books";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Extend the body behind the app bar to allow the background image to show through
      extendBodyBehindAppBar: true,
      // Define the app bar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make the app bar transparent
        title: Text(
          'Books', // Title of the app bar
          style: TextStyle(
            fontFamily: 'Poppins', // Custom font
            fontSize: 24, // Font size
            color: Colors.white, // Text color
          ),
        ),
        actions: [
          // Add a search icon button to the app bar
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            onPressed: () {
              // Handle search icon press (e.g., navigate to a search page)
            },
          ),
        ],
        elevation: 0, // Remove shadow from the app bar
        iconTheme: IconThemeData(color: Colors.white), // Set icon color to white
      ),
      // Add a sidebar (drawer) to the scaffold
      drawer: DrawerNavigation(),
      // Define the body of the scaffold
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Determine the screen width
          double screenWidth = constraints.maxWidth;

          // Adjust the number of columns based on screen width
          int crossAxisCount;
          if (screenWidth > 1200) {
            crossAxisCount = 4; // Large screens (e.g., desktops)
          } else if (screenWidth > 800) {
            crossAxisCount = 4; // Medium screens (e.g., tablets)
          } else if (screenWidth > 600) {
            crossAxisCount = 3; // Small tablets
          } else {
            crossAxisCount = 2; // Mobile phones
          }

          // Adjust font size and image height based on screen width
          double titleFontSize;
          double imageHeight;

          if (screenWidth > 1200) {
            titleFontSize = 38; // Larger font size for large screens
            imageHeight = 250; // Larger image height for large screens
          } else if (screenWidth > 800) {
            titleFontSize = 28; // Medium font size for medium screens
            imageHeight = 200; // Larger image height for medium screens
          } else if (screenWidth > 600) {
            titleFontSize = 20; // Smaller font size for small tablets
            imageHeight = 150; // Smaller image height for small tablets
          } else {
            titleFontSize = 16; // Smallest font size for mobile phones
            imageHeight = 120; // Smallest image height for mobile phones
          }

          return Container(
            decoration: BoxDecoration(
              // Set a background image for the body
              image: DecorationImage(
                image: AssetImage('assets/images/f.png'), // Path to the image asset
                fit: BoxFit.cover, // Ensure the image covers the entire container
              ),
            ),
            child: Padding(
              // Add padding to the body content
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 100, // Adjust top padding dynamically
                left: 10,
                right: 10,
              ),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount, // Dynamic number of columns
                  crossAxisSpacing: 10, // Spacing between columns
                  mainAxisSpacing: 10, // Spacing between rows
                  childAspectRatio: 0.7, // Adjust the aspect ratio of grid items
                ),
                itemCount: 6, // Total number of books to display
                itemBuilder: (ctx, index) {
                  // Build each grid item using a helper method
                  return _buildBookGridItem(
                    title: _getRandomBookTitle(index), // Get the title for the book
                    imagePath: _getBookImagePath(index), // Get the image path for the book
                    onTap: () {
                      // Handle tap on the book (e.g., navigate to book details)
                    },
                    titleFontSize: titleFontSize, // Pass the adjusted font size
                    imageHeight: imageHeight, // Pass the adjusted image height
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  // Helper method to get a book title based on the index
  String _getRandomBookTitle(int index) {
    List<String> bookTitles = [
      'The End times',
      'Thanks giving ',
      'Jesus Calling',
      'Gift of prophesying',
      'Knowing God',
      'The Purpose of christ',
    ];

    return bookTitles[index]; // Return the title at the specified index
  }

  // Helper method to get a unique image path for each book
  String _getBookImagePath(int index) {
    List<String> imagePaths = [
      'assets/images/a.png', // Image for "The End times"
      'assets/images/b.png', // Image for "Thanks giving and worships"
      'assets/images/c.png', // Image for "Jesus Calling"
      'assets/images/d.png', // Image for "Gift of prophesying"
      'assets/images/e.png', // Image for "Knowing God"
      'assets/images/f.png', // Image for "The Purpose of christ driven life"
    ];

    return imagePaths[index]; // Return the image path at the specified index
  }

  // Helper method to build a grid item for a book
  Widget _buildBookGridItem({
    required String title,
    required String imagePath,
    required VoidCallback onTap,
    required double titleFontSize,
    required double imageHeight,
  }) {
    return GestureDetector(
      onTap: onTap, // Handle tap on the book
      child: Card(
        elevation: 3, // Add a shadow to the card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Rounded corners
        ),
        child: Column(
          children: [
            // Display the book image
            ClipRRect(
              borderRadius: BorderRadius.circular(15), // Rounded corners for the image
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover, // Ensure the image covers the container
                height: imageHeight, // Set a dynamic height for the image
                width: double.infinity, // Make the image take up the full width
              ),
            ),
            // Display the book title
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: titleFontSize, // Use the dynamic font size
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center, // Center-align the text
              ),
            ),
          ],
        ),
      ),
    );
  }
}