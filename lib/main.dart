import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Worktency',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Inter',
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blue.shade800,
                    Colors.blue.shade600,
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Unlock Your Potential with Worktency',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Discover industry-leading courses designed to equip you with real-world skills. Join our community and start your journey to success today.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Explore Courses',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.white),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Join as an educator',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Why Choose Us Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Column(
                children: [
                  const Text(
                    'Why Choose Worktency?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildFeature('Expert Instructors', Icons.school),
                      _buildFeature('Flexible Learning', Icons.schedule),
                      _buildFeature('Hands-On Learning', Icons.handyman),
                    ],
                  ),
                ],
              ),
            ),

            // Featured Courses Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Featured Course',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Artificial Intelligence',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('Machine Learning • Self Development'),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        CourseCard(),
                        SizedBox(width: 15),
                        CourseCard(),
                        SizedBox(width: 15),
                        CourseCard(),
                        SizedBox(width: 15),
                        CourseCard(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildPriceButton('\$39.99'),
                      _buildPriceButton('\$39.99'),
                      _buildPriceButton('\$39.99'),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
            // Teachers Section
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              color: Colors.grey.shade100,
              child: Column(
                children: [
                  const Text(
                    'Meet Our Teachers',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const TeacherCard(
                    name: 'Dr. VALY Dona',
                    role: 'Researcher, AI Specialist',
                    imagePath: 'assets/placeholder1.png',
                  ),
                  const SizedBox(height: 20),
                  const TeacherCard(
                    name: 'HOK Tín',
                    role: 'Web Developer',
                    imagePath: 'assets/placeholder2.png',
                  ),
                  const SizedBox(height: 20),
                  const TeacherCard(
                    name: 'HENG Rathpisey',
                    role: 'Lecturer at ITC',
                    imagePath: 'assets/placeholder3.png',
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'To reach our only One goal, what we can share with you today',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Text(
                          '"Machine learning and AI are the engines driving the technological revolution of our time, transforming the way we work, live, and innovate"',
                          style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'Dr. Valy Dona | Professor @ITC, Cofounder @ Worktency',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildTag('Machine learning'),
                            const SizedBox(width: 10),
                            _buildTag('Artificial Intelligence'),
                          ],
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () {},
                          child: const Text('See more'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Footer Section
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              color: Colors.blue.shade900,
              child: Column(
                children: [
                  const Text(
                    'Worktency',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Wrap(
                    spacing: 30,
                    runSpacing: 20,
                    children: [
                      _buildFooterColumn([
                        'About Us',
                        'Contact Us',
                        'FAQs',
                        'Community Forum',
                      ]),
                      _buildFooterColumn([
                        'Term of Service',
                        'Careers',
                        'Leadership',
                        'Blog',
                      ]),
                      _buildFooterColumn([
                        'Social Impact',
                        'Cookies Setting',
                        'Terms',
                        'Accessibility Statement',
                      ]),
                      _buildFooterColumn([
                        'Investors',
                        'GO Pro Course',
                        'Affiliate',
                      ]),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Certified',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    '2023 © Worktency, Inc. All rights reserved.',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'My courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.laptop),
            label: 'Online course',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
        ],
      ),
    );
  }

  Widget _buildFeature(String text, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.blue),
        const SizedBox(height: 10),
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildPriceButton(String price) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      ),
      onPressed: () {},
      child: Row(
        children: [
          Text(
            price,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            'Start →',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text),
    );
  }

  Widget _buildFooterColumn(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            item,
            style: const TextStyle(
              color: Colors.white70,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class CourseCard extends StatelessWidget {
  const CourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Mindtub',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 5),
              Icon(Icons.star, color: Colors.amber, size: 16),
              Text('99'),
            ],
          ),
          const SizedBox(height: 5),
          const Text(
            'Microsoft Word',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Mr. Bunthorn Liv',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          const Text(
            'Professor @ITC',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: const Size(double.infinity, 40),
            ),
            onPressed: () {},
            child: const Text('Enroll Now'),
          ),
        ],
      ),
    );
  }
}

class TeacherCard extends StatelessWidget {
  final String name;
  final String role;
  final String imagePath;

  const TeacherCard({
    super.key,
    required this.name,
    required this.role,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            role,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}