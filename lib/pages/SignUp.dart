import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF5774CD), Color(0xFFFCFCFC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.1),
              Text(
                'Create Account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Create an account so you can explore all the existing jobs',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: screenHeight * 0.1),
              CustomInputField(
                label: 'Email',
                icon: Icons.email,
                width: screenWidth * 0.8,
              ),
              SizedBox(height: 20),
              CustomInputField(
                label: 'Password',
                icon: Icons.lock,
                width: screenWidth * 0.8,
                obscureText: true,
              ),
              SizedBox(height: 20),
              CustomInputField(
                label: 'Confirm Password',
                icon: Icons.lock,
                width: screenWidth * 0.8,
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5774CD),
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.25, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 20,
                  shadowColor: Color(0xFFCAD6FF),
                ),
                child: Text(
                  'Sign up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'Sign In',
                        style: TextStyle(
                          color: Color(0xFF5774CD),
                          fontSize: 11,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Text(
                'Or continue with',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SocialButton(
                    imageUrl: 'https://tse2.mm.bing.net/th?id=OIP.mVfYLYPIF9w_J5nhVEO6fAHaHa&pid=Api&P=0&w=300&h=300',
                    padding: EdgeInsets.all(2.62),
                  ),
                  SocialButton(
                    imageUrl: 'https://tse2.mm.bing.net/th?id=OIP.CvL4m3FUEJ3P1Rv27khUVwHaHa&pid=Api&P=0&h=180',
                    padding: EdgeInsets.all(2),
                  ),
                  SocialButton(
                    imageUrl: 'https://s3.amazonaws.com/freebiesupply/large/2x/apple-logo-transparent.png',
                    padding: EdgeInsets.all(3),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomInputField extends StatefulWidget {
  final String label;
  final IconData icon;
  final double width;
  final bool obscureText;

  const CustomInputField({
    required this.label,
    required this.icon,
    required this.width,
    this.obscureText = false,
  });

  @override
  _CustomInputFieldState createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: TextField(
        focusNode: _focusNode,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon, color: Color(0xFF616161)),
          labelText: _isFocused ? null : widget.label,
          labelStyle: TextStyle(
            color: Color(0xFF616161),
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
          filled: true,
          fillColor: Color(0xFFF1F4FF),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Color(0xFF5774CD)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Color(0xFF5774CD)),
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final String imageUrl;
  final EdgeInsets padding;

  const SocialButton({required this.imageUrl, required this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: padding,
      decoration: ShapeDecoration(
        color: Color(0xFFEBEBEB),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Image.network(imageUrl, fit: BoxFit.contain),
    );
  }
}
