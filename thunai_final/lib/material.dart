import 'package:flutter/material.dart';

void main() {
  runApp(TeachNowApp());
}

class TeachNowApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'Matemáticas';

  void updateCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('TeachNow', style: TextStyle(fontSize: 24)),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text('Asignaturas'),
              trailing: Icon(Icons.arrow_drop_down),
            ),
            ListTile(
              leading: Icon(Icons.chat),
              title: Text('Chats'),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Calendario'),
            ),
            ListTile(
              leading: Icon(Icons.folder),
              title: Text('Material'),
              selected: true, // Marking 'Material' as selected
              selectedTileColor: Colors.green.withOpacity(0.1),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Mi perfil'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Buscar material',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[200],
          ),
        ),
      ),
      body: Padding(
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
      ),
    );
  }
}

class MaterialListSection extends StatelessWidget {
  final String selectedCategory;

  MaterialListSection({required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    List<MaterialCard> materialList = _getMaterialForCategory(selectedCategory);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Material: $selectedCategory',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 20),
        ...materialList,
      ],
    );
  }

  List<MaterialCard> _getMaterialForCategory(String category) {
    switch (category) {
      case 'Matemáticas':
        return [
          MaterialCard(
            fileType: 'DOC',
            title: 'Ejercicios matemáticas - Ecuaciones 2ndo grado',
            author: 'Oliver Smith',
            timeAgo: 'hace 12 minutos',
          ),
          MaterialCard(
            fileType: 'PDF',
            title: 'Examen de repaso tema 1 (23-12-20)',
            author: 'Juan Fernández',
            timeAgo: 'hace 2 días',
          ),
        ];
      case 'Historia':
        return [
          MaterialCard(
            fileType: 'DOC',
            title: 'Historia del arte - Renacimiento',
            author: 'Maria Garcia',
            timeAgo: 'hace 1 día',
          ),
        ];
      case 'Programación':
        return [
          MaterialCard(
            fileType: 'ZIP',
            title: 'Ejercicios de programación en C++',
            author: 'John Doe',
            timeAgo: 'hace 3 días',
          ),
        ];
    // Add cases for other categories...
      default:
        return [];
    }
  }
}

class MaterialCard extends StatelessWidget {
  final String fileType;
  final String title;
  final String author;
  final String timeAgo;

  MaterialCard({
    required this.fileType,
    required this.title,
    required this.author,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(
          _getFileIcon(),
          color: Colors.green,
          size: 40,
        ),
        title: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(author),
            Text(timeAgo),
          ],
        ),
        trailing: Icon(Icons.download_rounded, color: Colors.green),
        onTap: () {},
      ),
    );
  }

  IconData _getFileIcon() {
    switch (fileType.toUpperCase()) {
      case 'DOC':
        return Icons.description;
      case 'PDF':
        return Icons.picture_as_pdf;
      case 'ZIP':
        return Icons.archive;
      default:
        return Icons.insert_drive_file;
    }
  }
}

class CategoriesSection extends StatelessWidget {
  final Function(String) onCategorySelected;

  CategoriesSection({required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Categorías', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            CategoryButton('Matemáticas', Icons.calculate, onCategorySelected),
            CategoryButton('Castellano', Icons.language, onCategorySelected),
            CategoryButton('Historia', Icons.book, onCategorySelected),
            CategoryButton('Inglés', Icons.language, onCategorySelected),
            CategoryButton('Programación', Icons.computer, onCategorySelected),
            CategoryButton('Deportes', Icons.sports, onCategorySelected),
          ],
        ),
      ],
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String categoryName;
  final IconData categoryIcon;
  final Function(String) onCategorySelected;

  CategoryButton(this.categoryName, this.categoryIcon, this.onCategorySelected);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        onCategorySelected(categoryName);
      },
      icon: Icon(categoryIcon, color: Colors.green),
      label: Text(categoryName),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        side: BorderSide(color: Colors.green),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
