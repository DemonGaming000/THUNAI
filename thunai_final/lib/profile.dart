import 'package:flutter/material.dart';

void main() {
  runApp(TeachNowApp());
}

class TeachNowApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TeachNowHomePage(),
    );
  }
}

class TeachNowHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Row(
          children: [
            Icon(Icons.school),
            SizedBox(width: 8),
            Text("Teach Now"),
            Spacer(),
            Row(
              children: [
                Icon(Icons.login),
                SizedBox(width: 5),
                Text("Enter"),
              ],
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
              ProfileSection(),

              SizedBox(height: 20),

              // Chat List Section
              ChatListSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://randomuser.me/api/portraits/women/44.jpg'), // Replace with actual image URL
                  radius: 30,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Clara Montes",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "Student of mathematics and physics",
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: Text("Reserve now"),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              "Subjects",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                SubjectChip(subject: "Math"),
                SubjectChip(subject: "Physics"),
                SubjectChip(subject: "Chemistry"),
              ],
            ),
            SizedBox(height: 16),
            Text(
              "from",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Hello, good morning Clara, 5 years ago I discovered my passion for mathematics and decided to start working as a student teacher.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SubjectChip extends StatelessWidget {
  final String subject;

  SubjectChip({required this.subject});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Chip(
        label: Text(subject),
        backgroundColor: Colors.blueAccent.shade100,
      ),
    );
  }
}

class ChatListSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChatItem(
          name: "Ariadne Nichols",
          message: "He helped me with the quadratic equations and inclu...",
          avatarUrl: "https://randomuser.me/api/portraits/women/20.jpg", // Replace with actual image URL
          time: "1 hour ago",
        ),
        ChatItem(
          name: "Juan Fernández",
          message: "No te olvides que en 'Material' tienes los apuntes...",
          avatarUrl: "https://randomuser.me/api/portraits/men/1.jpg", // Replace with actual image URL
          time: "hace 1 hora",
        ),
        ChatItem(
          name: "Oliver Smith",
          message: "Entonces podríamos mirar qué temas entrarán...",
          avatarUrl: "https://randomuser.me/api/portraits/men/2.jpg", // Replace with actual image URL
          time: "hace 2 días",
          isNew: true,
        ),
      ],
    );
  }
}

class ChatItem extends StatelessWidget {
  final String name;
  final String message;
  final String avatarUrl;
  final String time;
  final bool isNew;

  ChatItem({
    required this.name,
    required this.message,
    required this.avatarUrl,
    required this.time,
    this.isNew = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(avatarUrl),
                  radius: 25,
                ),
                if (isNew)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    message,
                    style: TextStyle(color: Colors.grey[600]),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            Text(time),
          ],
        ),
      ),
    );
  }
}
