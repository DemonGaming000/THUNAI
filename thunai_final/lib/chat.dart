import 'package:flutter/material.dart';
import 'material.dart'; // Import material.dart


void main() {
  runApp(TeachNowApp());
}

class TeachNowApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TeachNow',
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

  final List<String> subjects = [
    'Matemáticas',
    'Castellano',
    'Historia',
    'Inglés',
    'Programación'
  ];

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
            Text('TeachNow', style: TextStyle(color: Colors.black)),
          ],
        ),
        actions: [
          Row(
            children: [
              Icon(Icons.login, color: Colors.grey),
              SizedBox(width: 4),
              Text('Entrar', style: TextStyle(color: Colors.grey)),
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
                    'TeachNow',
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
              title: Text('Material'),
              selected: true, // Marking 'Material' as selected
              selectedTileColor: Colors.green.withOpacity(0.1),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()), // Navigate to MaterialPage
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Mi perfil'),
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
        return _buildSubjectContent('Matemáticas');
      case 2:
        return _buildSubjectContent('Castellano');
      case 3:
        return _buildSubjectContent('Historia');
      case 4:
        return _buildSubjectContent('Inglés');
      case 5:
        return _buildSubjectContent('Programación');
      case 6:
        return _buildChatPage(); // Display chat list
      case 7:
        return Center(child: Text('Calendario'));
      case 8:
        return Center(child: Text('Material'));
      case 9:
        return Center(child: Text('Mi perfil'));
      default:
        return _buildTeacherList();
    }
  }

  Widget _buildTeacherList() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Buscar clases',
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
            'Profesores',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Container(
            color: Color(0xFFC6CEFF),
            child: Flexible(
              child: ListView(
                shrinkWrap: true,
                children: [
                  _buildTeacherCard(
                    name: 'Clara Mentos',
                    subject: 'Matemáticas',
                    rate: '20€ / hr',
                    rating: 4.5,
                    imageUrl: 'https://via.placeholder.com/150',
                    badge: 'Math Bachelor',
                  ),
                  _buildTeacherCard(
                    name: 'Juan Fernández',
                    subject: 'Español',
                    rate: '25€ / hr',
                    rating: 4.0,
                    imageUrl: 'https://via.placeholder.com/150',
                    badge: null,
                  ),
                  _buildTeacherCard(
                    name: 'Oliver Smith',
                    subject: 'Historia - Inglés',
                    rate: '20€ / hr',
                    rating: 4.7,
                    imageUrl: 'https://via.placeholder.com/150',
                    badge: null,
                  ),
                  _buildTeacherCard(
                    name: 'Amanda Brown',
                    subject: 'Inglés',
                    rate: '20€ / hr',
                    rating: 4.9,
                    imageUrl: 'https://via.placeholder.com/150',
                    badge: 'Advance Certificate',
                  ),
                  _buildTeacherCard(
                    name: 'Jessica Filt',
                    subject: 'Música',
                    rate: '20€ / hr',
                    rating: 3.8,
                    imageUrl: 'https://via.placeholder.com/150',
                    badge: null,
                  ),
                ],
              ),
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
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
          radius: 30,
        ),
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subject),
            Text(rate),
          ],
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (badge != null)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  badge,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, color: Colors.amber, size: 16),
                SizedBox(width: 4),
                Text(rating.toString()),
              ],
            ),
          ],
        ),
        onTap: () {
          // Add code to navigate to the detailed teacher page
        },
      ),
    );
  }

  Widget _buildSubjectContent(String subject) {
    return Center(
      child: Text('Contenido para $subject'),
    );
  }

  // Method to build the chat page content
  Widget _buildChatPage() {
    final List<Map<String, String>> chatList = [
      {'name': 'Clara Mentos', 'lastMessage': 'Hey, how are you?'},
      {'name': 'Juan Fernández', 'lastMessage': 'Can we schedule a class?'},
      {'name': 'Oliver Smith', 'lastMessage': 'Let\'s discuss history.'},
      {'name': 'Amanda Brown', 'lastMessage': 'Great job on the last test!'},
    ];

    return ListView.builder(
      itemCount: chatList.length,
      itemBuilder: (context, index) {
        final chat = chatList[index];
        return ListTile(
          leading: CircleAvatar(
            child: Text(chat['name']![0]),
          ),
          title: Text(chat['name']!),
          subtitle: Text(chat['lastMessage']!),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatDetailPage(chat['name']!),
              ),
            );
          },
        );
      },
    );
  }
}

class ChatDetailPage extends StatefulWidget {
  final String chatName;

  ChatDetailPage(this.chatName);

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(_controller.text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chatName),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_messages[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
