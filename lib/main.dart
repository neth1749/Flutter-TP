import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Worktency UI',
      debugShowCheckedModeBanner: false, // Remove debug banner
      theme: ThemeData(
        primarySwatch: Colors.blue, // You'll customize your colors
        fontFamily: 'Roboto', // Example font, adjust as needed
      ),
      home: const WorktencyHomePage(),
    );
  }
}

class WorktencyHomePage extends StatelessWidget {
  const WorktencyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 50), // Adjust height
        child: _buildAppBar(), // Custom AppBar
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCategoriesSection(), // Section for 'All', 'Courses', 'Projects', etc.
            _buildRecommendedSection(), // Section for 'Recommended for you'
            _buildCourseList(), // The main list of computer network courses
            _buildFooter(), // The footer section
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(), // The Explore, My Stories, etc.
    );
  }

  // --- Helper Widgets (You'll implement these) ---

  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white, // Set background color to white
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/images.png', height: 300), // Replace with your logo
          Row(
            children: [
              IconButton(icon: Icon(Icons.search, color: Colors.grey[700]), onPressed: () {}),
              IconButton(icon: Icon(Icons.account_circle, color: Colors.grey[700]), onPressed: () {}),
            ],
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey[600]),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoriesSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildCategoryChip('All (10k)', true),
            _buildCategoryChip('Courses (2.2k)', false),
            _buildCategoryChip('Projects (2)', false),
            _buildCategoryChip('PRO sessions (24)', false),
            _buildCategoryChip('Live sessions (5)', false),
            _buildCategoryChip('Articles (120)', false),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String text, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Chip(
        label: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.blue[800],
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        backgroundColor: isSelected ? Colors.blue[800] : Colors.blue[50],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: isSelected ? Colors.blue[800]! : Colors.blue[100]!,
            width: 1,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }

  Widget _buildRecommendedSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Recommended for you',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
      ),
    );
  }

  Widget _buildCourseList() {
    return ListView.builder(
      shrinkWrap: true, // Important for ListView inside SingleChildScrollView
      physics: const NeverScrollableScrollPhysics(), // Important to disable inner scrolling
      itemCount: 8, // Adjust as per your actual course data
      itemBuilder: (context, index) {
        return _buildCourseCard(); // Your course card widget
      },
    );
  }

  Widget _buildCourseCard() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Placeholder for the "W" icon (replace with actual image/icon)
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue[700],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  'W',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Computer Network',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'A network is a collection of two or more computers that are connected together to share information and resources. In a network, data enables communication between…',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      const SizedBox(width: 4),
                      const Text('4.5', style: TextStyle(fontSize: 12, color: Colors.orange)),
                      const SizedBox(width: 16),
                      Icon(Icons.person, color: Colors.grey[600], size: 16),
                      const SizedBox(width: 4),
                      const Text('2.5k', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.blue[800],
      unselectedItemColor: Colors.grey[600],
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book), // Or a different icon for My Stories
          label: 'My Stories',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline), // Or a different icon for Create
          label: 'Create',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category), // Or a different icon for Category
          label: 'Category',
        ),
      ],
      currentIndex: 0, // Set the initial selected tab
      onTap: (index) {
        // Handle tab selection
      },
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(24.0),
      color: Colors.blue[900], // Adjust background color
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/images.png', height: 30), // White logo for dark background
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('About Us', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('Contact Us', style: TextStyle(color: Colors.white70)),
                  Text('FAQs', style: TextStyle(color: Colors.white70)),
                  Text('Community Forum', style: TextStyle(color: Colors.white70)),
                  Text('Terms of Service', style: TextStyle(color: Colors.white70)),
                  Text('Careers', style: TextStyle(color: Colors.white70)),
                  Text('Leadership', style: TextStyle(color: Colors.white70)),
                  Text('Blog', style: TextStyle(color: Colors.white70)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Social Impact', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('Cookies Setting', style: TextStyle(color: Colors.white70)),
                  Text('Terms', style: TextStyle(color: Colors.white70)),
                  Text('Accountability Statement', style: TextStyle(color: Colors.white70)),
                  Text('Investors', style: TextStyle(color: Colors.white70)),
                  Text('GO Pro Course', style: TextStyle(color: Colors.white70)),
                  Text('Affiliate', style: TextStyle(color: Colors.white70)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text('Certified', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Image.asset('assets/images/ITC.png', height: 80), // Replace with your certified badge
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(icon: Icon(Icons.facebook, color: Colors.white, size: 30), onPressed: () {}),
                    IconButton(icon: Icon(Icons.linked_camera, color: Colors.white, size: 30), onPressed: () {}), // Using a placeholder for LinkedIn
                    IconButton(icon: Icon(Icons.play_circle_outline, color: Colors.white, size: 30), onPressed: () {}), // Using a placeholder for YouTube
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  '© 2023-© Worktency, Inc. All rights reserved.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white54, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}