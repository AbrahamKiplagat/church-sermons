import 'package:flutter/material.dart';
import 'package:app/views/screens/sidebar/animated_sidebar.dart'; // Import AnimatedSidebar// Import DrawerNavigation

class GalleryPage extends StatelessWidget {
  static const routeName = '/gallery';

  final List<String> imageUrls = [
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
  ];

  final List<String> videoUrls = [
    'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
    'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
  ];

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
                    text: 'Church ',
                    style: TextStyle(
                      fontFamily: 'FjallaOne',
                      fontWeight: FontWeight.normal,
                      fontSize: _getResponsiveFontSize(context, 40),
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: 'Gallery',
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: _getResponsivePadding(context, 100)), // Adjust for AppBar

                // Photos Section
                Text(
                  'Photos',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10), // Spacing
                Container(
                  height: 300, // Fixed height for the photos column
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imageUrls.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10), // Rounded corners
                          child: Image.network(
                            imageUrls[index],
                            width: 150, // Fixed width for each image
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: 20), // Spacing between sections

                // Videos Section
                Text(
                  'Videos',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10), // Spacing
                Container(
                  height: 300, // Fixed height for the videos column
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: videoUrls.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: VideoPlayerItem(videoUrl: videoUrls[index]),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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

class VideoPlayerItem extends StatelessWidget {
  final String videoUrl;

  const VideoPlayerItem({Key? key, required this.videoUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10), // Rounded corners
      child: Container(
        width: 150, // Fixed width for each video
        color: Colors.black.withOpacity(0.5), // Semi-transparent background
        child: Center(
          child: Icon(Icons.play_circle_fill, color: Colors.white, size: 50),
        ),
      ),
    );
  }
}