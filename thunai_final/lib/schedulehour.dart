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

class HomePage extends StatelessWidget {
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.notifications),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ProfileSection(),
            SizedBox(height: 20),
            SelectDaysSection(),
            SizedBox(height: 20),
            SelectHoursSection(),
            SizedBox(height: 20),
            SelectSubjectsSection(),
            SizedBox(height: 20),
            PaymentButton(),
          ],
        ),
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage('https://example.com/clara-mentos.jpg'),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Clara Mentos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('Graduated in mathematics and physics'),
            Row(
              children: [
                Icon(Icons.email, color: Colors.green),
                SizedBox(width: 5),
                Text('camentos@mock.com'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class SelectDaysSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Choose one or several days', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1.5,
          ),
          itemCount: 30,
          itemBuilder: (context, index) {
            return ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: index == 4 ? Colors.grey : Colors.white,
                side: BorderSide(color: Colors.green),
              ),
              child: Text('${index + 1}', style: TextStyle(color: Colors.black)),
            );
          },
        ),
      ],
    );
  }
}

class SelectHoursSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Available hours', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            TimeSlotButton('09:00 - 10:00'),
            TimeSlotButton('10:00 - 11:00'),
            TimeSlotButton('18:00 - 19:00'),
          ],
        ),
      ],
    );
  }
}

class TimeSlotButton extends StatelessWidget {
  final String timeSlot;

  TimeSlotButton(this.timeSlot);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        side: BorderSide(color: Colors.green),
      ),
      child: Text(timeSlot, style: TextStyle(color: Colors.black)),
    );
  }
}

class SelectSubjectsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Subjects', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            SubjectButton('Math'),
            SubjectButton('Physics'),
            SubjectButton('Chemistry'),
          ],
        ),
      ],
    );
  }
}

class SubjectButton extends StatelessWidget {
  final String subject;

  SubjectButton(this.subject);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        side: BorderSide(color: Colors.green),
      ),
      child: Text(subject, style: TextStyle(color: Colors.black)),
    );
  }
}

class PaymentButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
        ),
        child: Text('Continuar con el pago', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
