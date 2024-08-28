import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(SignUpScreen());
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(1, 0, 1, 36.2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Header Section
                Container(
                  margin: EdgeInsets.only(bottom: 17.8),
                  color: Color(0xFFFFF6ED),
                  padding: EdgeInsets.fromLTRB(13, 38, 5.9, 86),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/vectors/vector_57_x2.svg',
                            width: 16.3,
                            height: 15.6,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Thunai',
                            style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.7,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 94.8),
                      Text(
                        'Create an Account',
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w600,
                          fontSize: 28,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 11),
                      Center(
                        child: Text(
                          'Enter your details',
                          style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.3,
                            color: Color(0xFF959595),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Input Fields
                buildInputField('Name', 'assets/vectors/user_128_x2.svg', false),
                buildInputField('Email', 'assets/vectors/at_sign_11_x2.svg', false),
                buildInputField('Password', 'assets/vectors/lock_12_x2.svg', true),
                // Create Account Button
                Container(
                  margin: EdgeInsets.only(left: 5.1, bottom: 12),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF09C08E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(33.9),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12.2),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Create Account',
                          style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w700,
                            fontSize: 12.2,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 8.7),
                        SvgPicture.asset(
                          'assets/vectors/arrow_right_1_x2.svg',
                          width: 16.3,
                          height: 16.3,
                        ),
                      ],
                    ),
                  ),
                ),
                // Illustration
                SvgPicture.asset(
                  'assets/vectors/undraw_mobile_login_ikmv_13_x2.svg',
                  width: 264,
                  height: 202.8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInputField(String label, String iconPath, bool isPassword) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.7),
      child: SizedBox(
        width: 264.2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.w500,
                fontSize: 16.3,
                color: Color(0xFF959595),
              ),
            ),
            SizedBox(height: 8),
            Container(
              height: 40.7,
              padding: EdgeInsets.symmetric(horizontal: 14.9, vertical: 12.2),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFC2F1E5)),
                borderRadius: BorderRadius.circular(6.8),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    iconPath,
                    width: 16.3,
                    height: 16.3,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      obscureText: isPassword,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: label,
                        hintStyle: GoogleFonts.raleway(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.5,
                          color: Color(0xFF959595),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
