import 'package:flutter/material.dart';

void main() {
  runApp(const TeachNowApp());
}

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
      body: Container(
        color: const Color(0xFFFFF6ED), // Light pink background color
        child: Stack(
          children: [
            // Top bar with TeachNow and Entrar
            Positioned(
              top: 100, // Position the top bar slightly below the top of the screen
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '🔗 TeachNow',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    '🔒 Entrar',
                    style: TextStyle(fontSize: 28),
                  ),
                ],
              ),
            ),
            // Main content with text on the left and image on the right
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0), // Add padding to the left
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Alguien inteligente\naprende de la\nexperiencia de los\ndemás',

                            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Voltaire',
                            style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Empezar ahora',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16), // Spacing between text and image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50), // Circular border radius
                      child: Image.asset(
                        'assets/undraw_studying_s3l7 1.jpg', // Replace with your image asset
                        width: 200, // Increased width
                        height: 200, // Increased height
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Align content to the bottom with bottom padding
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 100.0), // Added bottom padding
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.person_add, size: 48, color: Colors.green[700]),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          'Invita a 5 amigos para conseguir un 50% de descuento!',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}