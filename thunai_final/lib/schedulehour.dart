import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController menteeNameController = TextEditingController();

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
            PaymentButton(
              nameController: nameController,
              emailController: emailController,
              menteeNameController: menteeNameController,
            ),
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
            Text('USER NAME', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('Graduated in mathematics and physics'),
            Row(
              children: [
                Icon(Icons.email, color: Colors.green),
                SizedBox(width: 5),
                Text('eg@gmail.com'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class SelectDaysSection extends StatefulWidget {
  @override
  _SelectDaysSectionState createState() => _SelectDaysSectionState();
}

class _SelectDaysSectionState extends State<SelectDaysSection> {
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  String selectedMonth = 'January';
  String selectedDate = '1'; // Added for storing the selected date

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Choose a month and one or several days',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        // Dropdown for selecting a month
        DropdownButton<String>(
          value: selectedMonth,
          items: months.map((String month) {
            return DropdownMenuItem<String>(
              value: month,
              child: Text(month),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedMonth = newValue!;
            });
          },
        ),
        SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1.5,
          ),
          itemCount: 30, // Assuming 30 days in each month for simplicity
          itemBuilder: (context, index) {
            return ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedDate = '${index + 1}'; // Update selected date
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedDate == '${index + 1}' ? Colors.grey : Colors.white,
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

class SelectHoursSection extends StatefulWidget {
  @override
  _SelectHoursSectionState createState() => _SelectHoursSectionState();
}

class _SelectHoursSectionState extends State<SelectHoursSection> {
  String? selectedTimeSlot; // To track the selected time slot

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
            TimeSlotButton(
              timeSlot: '09:00 - 10:00',
              isSelected: selectedTimeSlot == '09:00 - 10:00',
              onSelect: (time) {
                setState(() {
                  selectedTimeSlot = time; // Update the selected time slot
                });
              },
            ),
            TimeSlotButton(
              timeSlot: '10:00 - 11:00',
              isSelected: selectedTimeSlot == '10:00 - 11:00',
              onSelect: (time) {
                setState(() {
                  selectedTimeSlot = time; // Update the selected time slot
                });
              },
            ),
            TimeSlotButton(
              timeSlot: '18:00 - 19:00',
              isSelected: selectedTimeSlot == '18:00 - 19:00',
              onSelect: (time) {
                setState(() {
                  selectedTimeSlot = time; // Update the selected time slot
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}

class TimeSlotButton extends StatelessWidget {
  final String timeSlot;
  final bool isSelected;
  final Function(String) onSelect;

  TimeSlotButton({
    required this.timeSlot,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onSelect(timeSlot); // Notify the parent widget of the selected time slot
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.green : Colors.white,
        side: BorderSide(color: Colors.green),
      ),
      child: Text(
        timeSlot,
        style: TextStyle(color: isSelected ? Colors.white : Colors.black),
      ),
    );
  }
}


class SelectSubjectsSection extends StatefulWidget {
  @override
  _SelectSubjectsSectionState createState() => _SelectSubjectsSectionState();
}

class _SelectSubjectsSectionState extends State<SelectSubjectsSection> {
  String? selectedSubject; // This will hold the currently selected subject.

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
            SubjectButton(
              subject: 'Math',
              isSelected: selectedSubject == 'Math',
              onSelect: (subject) {
                setState(() {
                  selectedSubject = subject; // Update the selected subject
                });
              },
            ),
            SubjectButton(
              subject: 'Physics',
              isSelected: selectedSubject == 'Physics',
              onSelect: (subject) {
                setState(() {
                  selectedSubject = subject; // Update the selected subject
                });
              },
            ),
            SubjectButton(
              subject: 'Chemistry',
              isSelected: selectedSubject == 'Chemistry',
              onSelect: (subject) {
                setState(() {
                  selectedSubject = subject; // Update the selected subject
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}

class SubjectButton extends StatelessWidget {
  final String subject;
  final bool isSelected;
  final Function(String) onSelect;

  SubjectButton({
    required this.subject,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onSelect(subject); // Call the onSelect function with the selected subject
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.green : Colors.white, // Change color based on selection
        side: BorderSide(color: Colors.green),
      ),
      child: Text(
        subject,
        style: TextStyle(color: isSelected ? Colors.white : Colors.black),
      ),
    );
  }
}
class PaymentButton extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController menteeNameController;

  PaymentButton({
    required this.nameController,
    required this.emailController,
    required this.menteeNameController,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          // Get data from text controllers and sections
          String userName = nameController.text.trim();
          String email = emailController.text.trim();
          String menteeName = menteeNameController.text.trim();
          String selectedMonth = 'January'; // replace with actual selected month
          String selectedDate = '1'; // replace with actual selected date
          String selectedTimeSlot = '09:00 - 10:00'; // replace with actual selected time slot

          if (userName.isNotEmpty && email.isNotEmpty && menteeName.isNotEmpty) {
            await FirebaseFirestore.instance.collection('Meetings').add({
              'userName': userName,
              'email': email,
              'menteeName': menteeName,
              'selectedMonth': selectedMonth,
              'selectedDate': selectedDate,
              'selectedTimeSlot': selectedTimeSlot,
            }).then((value) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Meeting booked successfully!')),
              );
            }).catchError((error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Failed to book meeting: $error')),
              );
            });
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Please fill in all fields')),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
        ),
        child: Text('Continue to Payment', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
