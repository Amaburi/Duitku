import 'package:duitkuproto/pages/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:duitkuproto/pages/SignIn.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUp(),
    );
  }
}

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool isLoading = false;
  String? errorText;

  Future<void> _registerUser() async {
    setState(() {
      isLoading = true;
      errorText = null;
    });

    try {
      if (passwordController.text == confirmPasswordController.text) {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignIn()));
      } else {
        setState(() {
          errorText = "Passwords do not match.";
        });
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        if (e.code == 'weak-password') {
          errorText = 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          errorText = 'The account already exists for that email.';
        } else {
          errorText = e.message; // Handle other errors
        }
      });
    } catch (e) {
      setState(() {
        errorText = e.toString();
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

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
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
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
                controller: emailController,
              ),
              SizedBox(height: 20),
              CustomInputField(
                label: 'Password',
                icon: Icons.lock,
                width: screenWidth * 0.8,
                obscureText: true,
                controller: passwordController,
              ),
              SizedBox(height: 20),
              CustomInputField(
                label: 'Confirm Password',
                icon: Icons.lock,
                width: screenWidth * 0.8,
                obscureText: true,
                controller: confirmPasswordController,
              ),
              if (errorText != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    errorText!,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _registerUser,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5774CD),
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.25, vertical: 15),
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
                child: RichText(
                  text: TextSpan(
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
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                          },
                      ),
                    ],
                  ),
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

class CustomInputField extends StatelessWidget {
  final String label;
  final IconData icon;
  final double width;
  final bool obscureText;
  final TextEditingController controller;

  const CustomInputField({
    required this.label,
    required this.icon,
    required this.width,
    this.obscureText = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Color(0xFF616161)),
          labelText: label,
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
      child: Image.network(imageUrl, fit: BoxFit.contain,),
    );
  }
}
