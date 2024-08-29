import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

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
  String selectedCategory = 'Mathematics';
  List<MaterialCard> uploadedFiles = [];

  void updateCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'png'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        uploadedFiles.add(
          MaterialCard(
            fileType: file.extension ?? 'unknown',
            title: file.name,
            author: 'User',
            timeAgo: 'just now',
          ),
        );
      });
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Thunai', style: TextStyle(fontSize: 24)),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text('Subjects'),
              trailing: Icon(Icons.arrow_drop_down),
            ),
            ListTile(
              leading: Icon(Icons.chat),
              title: Text('Chats'),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Calendar'),
            ),
            ListTile(
              leading: Icon(Icons.folder),
              title: Text('Material'),
              selected: true, // Marking 'Material' as selected
              selectedTileColor: Colors.green.withOpacity(0.1),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
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
            hintText: 'Search Materials',
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
            ElevatedButton.icon(
              onPressed: pickFile,
              icon: Icon(Icons.upload_file),
              label: Text('Upload File'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: MaterialListSection(
                selectedCategory: selectedCategory,
                uploadedFiles: uploadedFiles,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MaterialListSection extends StatelessWidget {
  final String selectedCategory;
  final List<MaterialCard> uploadedFiles;

  MaterialListSection({required this.selectedCategory, required this.uploadedFiles});

  @override
  Widget build(BuildContext context) {
    List<MaterialCard> materialList = _getMaterialForCategory(selectedCategory);
    materialList.addAll(uploadedFiles);

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
      case 'Mathematics':
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
      case 'History':
        return [
          MaterialCard(
            fileType: 'DOC',
            title: 'Historia del arte - Renacimiento',
            author: 'Maria Garcia',
            timeAgo: 'hace 1 día',
          ),
        ];
      case 'Programming':
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
        Text('Categories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            CategoryButton('Mathematics', Icons.calculate, onCategorySelected),
            CategoryButton('Social Science', Icons.language, onCategorySelected),
            CategoryButton('Science', Icons.book, onCategorySelected),
            CategoryButton('English', Icons.language, onCategorySelected),
            CategoryButton('Programming', Icons.computer, onCategorySelected),
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
