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
      ),
      home: HomeCPage(),
    );
  }
}

class HomeCPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Today', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Row(
        children: [
          // Left section for Calendar
          Expanded(
            flex: 3,
            child: Column(
              children: [
                CalendarHeader(),
                Expanded(
                  child: Container(
                    color: Color(0xFFFFF8E1), // Light beige color for calendar background
                    child: ListView(
                      children: [
                        CalendarEventTile(
                          time: '10:00',
                          title: 'Clara Mentos',
                          subtitle: 'Mathematics',
                        ),
                        CalendarEventTile(
                          time: '18:00',
                          title: 'Juan Fernández',
                          subtitle: 'English',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Right section for Upcoming Classes
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(16),
              color: Color(0xFFE3F2FD), // Light blue background for upcoming classes
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TimeIntervalSelection(),
                  SizedBox(height: 20),
                  Text(
                    'Upcoming Classes',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  UpcomingClassTile(
                    name: 'Benjamin Firl',
                    date: 'Monday, 09:00-10:00',
                    subject: 'English',
                  ),
                  UpcomingClassTile(
                    name: 'Oliver Smith',
                    date: 'Tuesday, 17:00-19:00',
                    subject: 'Sports',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CalendarHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'December, 24',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CalendarEventTile extends StatelessWidget {
  final String time;
  final String title;
  final String subtitle;

  CalendarEventTile({required this.time, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/images/user.png'), // Placeholder image for user
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Icon(Icons.edit, color: Colors.green),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onTap: () {
        // Action on tap, if any
      },
    );
  }
}

class TimeIntervalSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: [
        ChoiceChip(
          label: Text('Today'),
          selected: true,
          onSelected: (bool selected) {},
          selectedColor: Colors.green,
          backgroundColor: Colors.white,
        ),
        ChoiceChip(
          label: Text('Week'),
          selected: false,
          onSelected: (bool selected) {},
          backgroundColor: Colors.white,
        ),
        ChoiceChip(
          label: Text('Month'),
          selected: false,
          onSelected: (bool selected) {},
          backgroundColor: Colors.white,
        ),
        ChoiceChip(
          label: Text('Year'),
          selected: false,
          onSelected: (bool selected) {},
          backgroundColor: Colors.white,
        ),
      ],
    );
  }
}

class UpcomingClassTile extends StatelessWidget {
  final String name;
  final String date;
  final String subject;

  UpcomingClassTile({required this.name, required this.date, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/user.png'), // Placeholder for user image
            radius: 25,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(date),
              Text(subject),
            ],
          ),
        ],
      ),
    );
  }
}
