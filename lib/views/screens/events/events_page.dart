import 'package:flutter/material.dart';
import 'package:app/views/screens/sidebar/animated_sidebar.dart';

class EventsPage extends StatelessWidget {
  static const routeName = '/events';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Events',
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
        elevation: 0, // Remove AppBar shadow
        iconTheme: IconThemeData(color: Colors.white),
      ),
      extendBodyBehindAppBar: true, // Extend body behind the AppBar
      drawer: DrawerNavigation(), // Assuming you have the DrawerNavigation widget
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/f.png'), // Path to your background image
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 100), // Spacing below AppBar
            Expanded( // Use Expanded to fix height constraint issue
              child: DefaultTabController(
                length: 2, // Number of tabs (Upcoming and Past)
                child: Column(
                  children: [
                    TabBar(
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Color.fromARGB(255, 255, 230, 0),
                      tabs: [
                        Tab(text: 'Upcoming'),
                        Tab(text: 'Past'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          _buildEventList('Upcoming Events'),
                          _buildEventList('Past Events'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventList(String category) {
    // Replace with actual data retrieval logic based on category (Upcoming or Past)
    List<String> events = category == 'Upcoming Events'
        ? ['Event 1', 'Event 2', 'Event 3']
        : ['Past Event 1', 'Past Event 2', 'Past Event 3'];

    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            events[index],
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          onTap: () {
            // Handle event tap
          },
        );
      },
    );
  }
}
