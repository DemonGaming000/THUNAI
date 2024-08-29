import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';  // Import Firestore package
import 'package:namer_app/main2.dart'; // Assuming TeacherListScreen is in main2.dart

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TeachNowHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TeachNowHomePage extends StatelessWidget {
  TeachNowHomePage({super.key});

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;  // Initialize Firestore instance

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  Future<void> _signIn(BuildContext context) async {
    Set<String> mails = {};
    try {
      // Get all documents from the 'Users' collection
      QuerySnapshot querySnapshot = await _firestore.collection('Users').get();

      // Iterate through each document in the collection
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        // Access the data for each document
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        String s=data['email'];
        mails.add(s);
        // Print the email field, assuming each document contains an 'email' field
        print('Email: ${data['email']}');
      }
    } catch (e) {
      print('Error: $e');
    }

    print("dfd");
    try {
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();
      String user_email=_emailController.text;
      String user_password=_passwordController.text;
      // Check if user exists in Firestore
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');
      print(_auth.currentUser?.uid);
// DocumentSnapshot userSnapshot = await _firestore.collection('Users').doc(email).get();

// print(userSnapshot);
//       if (!userSnapshot.exists) {
//         // User not found in Firestore
//         print('No user found for that email.');
//         return;
//       }

      // // Check password
      // String storedPassword = userSnapshot.get('password');
      // if (storedPassword != password) {
      //   // Password does not match
      //   print('Wrong password provided.');
      //   return;
      // }

      // Sign in with Firebase Auth if email and password match
      // UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      //   email: email,
      //   password: password,
      // );

      if (mails.contains(user_email)) {
        // // Successfully signed in
        // print('Signed in: ${userCredential.user?.email}');
        // Navigate to another screen, for example, TeacherListScreen()
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TeacherListScreen()),
        );
      }
    } on FirebaseAuthException catch (e) {
      print('Error: ${e.message}');
    } catch (e) {
      print('Unexpected error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  color: const Color(0xFFFFF6ED),
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
                Container(
                  width: 400,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: _emailController,
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
                      TextField(
                        controller: _passwordController,
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
                      ElevatedButton(
                        onPressed: () {
                          print("dfdhifd every obef");
                          _signIn(context); // Call the sign-in method
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
                SizedBox(
                  height: 200,
                  child: Center(
                    child: Image.asset(
                      'assets/undraw_mobile_login_ikmv 1.png', // Ensure this path is correct
                      width: double.infinity,
                      fit: BoxFit.cover,
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