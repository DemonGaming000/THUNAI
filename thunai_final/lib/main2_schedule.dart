import 'package:flutter/material.dart';

void main() {
  runApp(TeachNowApp());
}

class TeachNowApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thunai',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TeacherListScreen(),
    );
  }
}

class TeacherListScreen extends StatefulWidget {
  @override
  _TeacherListScreenState createState() => _TeacherListScreenState();
}

class _TeacherListScreenState extends State<TeacherListScreen> {
  int _selectedIndex = 0;
  String selectedCategory = '';

  final List<String> subjects = [
    'Mathematics',
    'Geography',
    'History',
    'English',
    'Programming'
  ];

  void updateCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Row(
          children: [
            Icon(Icons.lock_open, color: Colors.black),
            SizedBox(width: 8),
            Text('Thunai', style: TextStyle(color: Colors.black)),
          ],
        ),
        actions: [
          Row(
            children: [
              Icon(Icons.login, color: Colors.grey),
              SizedBox(width: 4),
              Text('Enter', style: TextStyle(color: Colors.grey)),
              SizedBox(width: 16),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green[100],
              ),
              child: Row(
                children: [
                  Icon(Icons.lock_open, color: Colors.black),
                  SizedBox(width: 8),
                  Text(
                    'Thunai',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
                Navigator.pop(context);
              },
              selected: _selectedIndex == 0,
              selectedTileColor: Colors.green[50],
              selectedColor: Colors.green,
            ),
            ExpansionTile(
              leading: Icon(
                Icons.book,
                color: _selectedIndex >= 1 && _selectedIndex <= 5
                    ? Colors.green
                    : null,
              ),
              title: Text('Subjects'),
              children: List.generate(subjects.length, (index) {
                return ListTile(
                  leading: Icon(
                    Icons.circle,
                    color: _selectedIndex == index + 1
                        ? Colors.green
                        : Colors.grey[600],
                    size: 12,
                  ),
                  title: Text(subjects[index]),
                  onTap: () {
                    setState(() {
                      _selectedIndex = index + 1;
                    });
                    Navigator.pop(context);
                  },
                  selected: _selectedIndex == index + 1,
                  selectedTileColor: Colors.green[50],
                  selectedColor: Colors.green,
                );
              }),
            ),
            ListTile(
              leading: Icon(Icons.chat),
              title: Text('Chats'),
              onTap: () {
                setState(() {
                  _selectedIndex = 6;
                });
                Navigator.pop(context);
              },
              selected: _selectedIndex == 6,
              selectedTileColor: Colors.green[50],
              selectedColor: Colors.green,
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Calendar'),
              onTap: () {
                setState(() {
                  _selectedIndex = 7;
                });
                Navigator.pop(context);
              },
              selected: _selectedIndex == 7,
              selectedTileColor: Colors.green[50],
              selectedColor: Colors.green,
            ),
            ListTile(
              leading: Icon(Icons.folder),
              title: Text('Materials'),
              onTap: () {
                setState(() {
                  _selectedIndex = 8;
                });
                Navigator.pop(context);
              },
              selected: _selectedIndex == 8,
              selectedTileColor: Colors.green[50],
              selectedColor: Colors.green,
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Mentors'),
              onTap: () {
                setState(() {
                  _selectedIndex = 9;
                });
                Navigator.pop(context);
              },
              selected: _selectedIndex == 9,
              selectedTileColor: Colors.green[50],
              selectedColor: Colors.green,
            ),
          ],
        ),
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    switch (_selectedIndex) {
      case 1:
        return _buildSubjectContent('Mathematics');
      case 2:
        return _buildSubjectContent('Geography');
      case 3:
        return _buildSubjectContent('History');
      case 4:
        return _buildSubjectContent('English');
      case 5:
        return _buildSubjectContent('Programming');
      case 6:
        return _buildChatPage();
      case 7:
        return Center(child: Text('Calendar'));
      case 8:
        return _buildMaterials();
      case 9:
        return Center(child: Text('Mentors'));
      default:
        return _buildTeacherList();
    }
  }

  Widget _buildMaterials() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoriesSection(onCategorySelected: updateCategory),
          SizedBox(height: 20),
          Expanded(
            child: MaterialListSection(selectedCategory: selectedCategory),
          ),
        ],
      ),
    );
  }

  Widget _buildTeacherList() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search classes',
              prefixIcon: Icon(Icons.search, color: Colors.green),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Professors',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                _buildTeacherCard(
                  name: 'Clara Mentos',
                  subject: 'Mathematics',
                  rate: '200 / hr',
                  rating: 4.5,
                  imageUrl: 'https://via.placeholder.com/150',
                  badge: 'Math Bachelor',
                ),
                _buildTeacherCard(
                  name: 'Juan Fernández',
                  subject: 'Spanish',
                  rate: '250 / hr',
                  rating: 4.0,
                  imageUrl: 'https://via.placeholder.com/150',
                  badge: null,
                ),
                _buildTeacherCard(
                  name: 'Oliver Smith',
                  subject: 'History - English',
                  rate: '200/ hr',
                  rating: 4.7,
                  imageUrl: 'https://via.placeholder.com/150',
                  badge: null,
                ),
                _buildTeacherCard(
                  name: 'Amanda Brown',
                  subject: 'English',
                  rate: '200/ hr',
                  rating: 4.9,
                  imageUrl: 'https://via.placeholder.com/150',
                  badge: 'Advanced Certificate',
                ),
                _buildTeacherCard(
                  name: 'Jessica Filt',
                  subject: 'Music',
                  rate: '200 / hr',
                  rating: 3.8,
                  imageUrl: 'https://via.placeholder.com/150',
                  badge: null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeacherCard({
    required String name,
    required String subject,
    required String rate,
    required double rating,
    required String imageUrl,
    String? badge,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subject),
            Text(rate),
            if (badge != null)
              Text(
                badge,
                style: TextStyle(color: Colors.blue),
              ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.star, color: Colors.yellow),
            SizedBox(width: 4),
            Text(rating.toString()),
          ],
        ),
        onTap: () {
          // Add tap action for each teacher card
        },
      ),
    );
  }

  Widget _buildSubjectContent(String subject) {
    return Center(
      child: Text('Content for $subject'),
    );
  }

  Widget _buildChatPage() {
    return ListView(
      children: [
        ListTile(
          title: Text('Chat with Clara Mentos'),
          subtitle: Text('Mathematics - last message: Hi!'),
          leading: CircleAvatar(
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatDetailScreen(
                  chatTitle: 'Chat with Clara Mentos',
                  chatContent: 'Last message content here...',
                ),
              ),
            );
          },
        ),
        ListTile(
          title: Text('Chat with Juan Fernández'),
          subtitle: Text('Spanish - last message: Hola!'),
          leading: CircleAvatar(
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatDetailScreen(
                  chatTitle: 'Chat with Juan Fernández',
                  chatContent: 'Last message content here...',
                ),
              ),
            );
          },
        ),
        ListTile(
          title: Text('Chat with Oliver Smith'),
          subtitle: Text('History - last message: Hello!'),
          leading: CircleAvatar(
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatDetailScreen(
                  chatTitle: 'Chat with Oliver Smith',
                  chatContent: 'Last message content here...',
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class ChatDetailScreen extends StatelessWidget {
  final String chatTitle;
  final String chatContent;

  ChatDetailScreen({required this.chatTitle, required this.chatContent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chatTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              chatContent,
              style: TextStyle(fontSize: 16),
            ),
            // Add more chat details or messages here
          ],
        ),
      ),
    );
  }
}

class CategoriesSection extends StatelessWidget {
  final Function(String) onCategorySelected;

  CategoriesSection({required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    // Dummy implementation to show categories
    return Container();
  }
}

class MaterialListSection extends StatelessWidget {
  final String selectedCategory;

  MaterialListSection({required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    // Dummy implementation to show materials
    return Container();
  }
}
