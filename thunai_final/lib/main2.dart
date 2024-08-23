import 'package:flutter/material.dart';

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
  int _selectedIndex = 0; // Index to track the selected item

  // A list of subjects
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
              title: Text('Inicio'),
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
                Navigator.pop(context); // Close the drawer
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
              title: Text('Asignaturas'),
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
                    Navigator.pop(context); // Close the drawer
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
                Navigator.pop(context); // Close the drawer
              },
              selected: _selectedIndex == 6,
              selectedTileColor: Colors.green[50],
              selectedColor: Colors.green,
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Calendario'),
              onTap: () {
                setState(() {
                  _selectedIndex = 7;
                });
                Navigator.pop(context); // Close the drawer
              },
              selected: _selectedIndex == 7,
              selectedTileColor: Colors.green[50],
              selectedColor: Colors.green,
            ),
            ListTile(
              leading: Icon(Icons.folder),
              title: Text('Material'),
              onTap: () {
                setState(() {
                  _selectedIndex = 8;
                });
                Navigator.pop(context); // Close the drawer
              },
              selected: _selectedIndex == 8,
              selectedTileColor: Colors.green[50],
              selectedColor: Colors.green,
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Mi perfil'),
              onTap: () {
                setState(() {
                  _selectedIndex = 9;
                });
                Navigator.pop(context); // Close the drawer
              },
              selected: _selectedIndex == 9,
              selectedTileColor: Colors.green[50],
              selectedColor: Colors.green,
            ),
          ],
        ),
      ),
      body: _buildContent(), // Display content based on selected item
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
        return Center(child: Text('Chats'));
      case 7:
        return Center(child: Text('Calendario'));
      case 8:
        return Center(child: Text('Material'));
      case 9:
        return Center(child: Text('Mi perfil'));
      default:
        return _buildTeacherList(); // Default is the teacher list screen
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
            color: Color(0xFFC6CEFF), // Background color
            child: Flexible(
              child: ListView(
                shrinkWrap: true, // Ensure the ListView fits within its parent
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
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  badge,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 12,
                  ),
                ),
              ),
            Spacer(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(rating.toString(), style: TextStyle(fontSize: 16)),
                Icon(Icons.star, color: Colors.amber, size: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubjectContent(String subject) {
    return Center(
      child: Text('Contenido para $subject'),
    );
  }
}
