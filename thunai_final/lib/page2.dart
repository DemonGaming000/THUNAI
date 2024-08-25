import 'package:flutter/material.dart';
import 'package:namer_app/main2.dart'; // Assuming TeacherListScreen is in page3.dart


class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const TeachNowHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TeachNowHomePage extends StatelessWidget {
  const TeachNowHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Automatically adjust layout when the keyboard appears
      body: Center(
        child: Container(
          color: Colors.white, // Set the entire background to white
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
          child: SingleChildScrollView( // Added this to enable scrolling when content overflows
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Colored container for the header text
                Container(
                  width: double.infinity, // Full width
                  color: const Color(0xFFFFF6ED), // Light pink background color
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  child: Column(
                    children: [
                      const Text(
                        '🔗 TeachNow',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Centered "Entra ahora" text
                      const Text(
                        'Enter Details',
                        style: TextStyle(
                          fontSize: 46,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                // Container for the input fields
                Container(
                  width: 400, // Set a specific width for the input area
                  padding: const EdgeInsets.all(16.0), // Padding for the input area
                  child: Column(
                    children: [
                      // Email TextField
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email),
                          hintText: 'Email',
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Password TextField
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          hintText: 'Password',
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Elevated button to create an account
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to the TeacherListScreen defined in main2.dart
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TeacherListScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // "Forgot password?" text button
                      TextButton(
                        onPressed: () {
                          // Handle forgot password here
                        },
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Expanded Image to fit the rest of the screen
                SizedBox(
                  height: 200, // Adjust this value based on your layout needs
                  child: Center(
                    child: Image.asset(
                      'assets/undraw_mobile_login_ikmv 1.png', // Ensure this path is correct
                      width: double.infinity,
                      fit: BoxFit.cover, // Adjust to cover the remaining space
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
