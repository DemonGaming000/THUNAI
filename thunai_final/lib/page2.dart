import 'package:flutter/material.dart';



class TeachNowApp extends StatelessWidget {
  const TeachNowApp({super.key});

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
      body: Center(
        child: Container(
          // Set the entire background to white
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
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
                      'Entra ahora',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10), // Added a little space
                    const Text(
                      'o usa un email para entrar',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.grey,
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
                        border: OutlineInputBorder(
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
                        border: OutlineInputBorder(
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
                        // Handle account creation here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Center(
                        child: const Text(
                          'Crear cuenta',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // "Forgot password?" text button
                    Center(
                      child: TextButton(
                        onPressed: () {
                          // Handle forgot password here
                        },
                        child: const Text(
                          '¿Olvidaste tu contraseña?',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              Center(
                child: Image.asset(
                  'assets/undraw_mobile_login_ikmv 1.png', // Replace with your image asset
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}