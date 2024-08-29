import 'package:flutter/material.dart';
import 'material_mentor.dart'; // Import material.dart
import 'assignment.dart';
import 'student_calendar.dart';


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
            ListTile(
              leading: Icon(Icons.assessment),
              title: Text('Assignments'),
              selected: true, // Marking 'Material' as selected
              selectedTileColor: Colors.green.withOpacity(0.1),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AssignmentPage()), // Navigate to MaterialPage
                );
              },
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
              selected: true, // Marking 'Material' as selected
              selectedTileColor: Colors.green.withOpacity(0.1),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeCPage()), // Navigate to MaterialPage
                );
              },
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
              title: Text('Profile'),
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
        return _buildSubjectContent('Social Science');
      case 3:
        return _buildSubjectContent('Science');
      case 4:
        return _buildSubjectContent('English');
      case 5:
        return _buildSubjectContent('Programming');
      case 6:
        return _buildChatPage(); // Display chat list
      case 7:
        return Center(child: Text('Calendar'));
      case 8:
        return Center(child: Text('Material'));
      case 9:
        return Center(child: Text('Profile'));
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
            'Mentees',
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
                  _buildStudentCard(
                    name: 'Clara Mentos',
                    subject: 'Mathematics',

                  ),
                  _buildStudentCard(
                    name: 'Juan Fernández',
                    subject: 'English',

                  ),
                  _buildStudentCard(
                    name: 'Oliver Smith',
                    subject: 'Social Science',

                  ),
                  _buildStudentCard(
                    name: 'Amanda Brown',
                    subject: 'English',

                  ),
                  _buildStudentCard(
                    name: 'Jessica Filt',
                    subject: 'Music',

                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStudentCard({
    required String name,
    required String subject,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green,
          child: Text(name[0]), // Display the first letter of the name
        ),
        title: Text(name),
        subtitle: Text(subject),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          // Handle the tap event (e.g., navigate to the teacher's profile or details)
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
