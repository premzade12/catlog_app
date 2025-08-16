import 'package:catlog_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changeBtn = false; // For animation
  final _formKey = GlobalKey<FormState>();

  final accentColor = Colors.deepPurple;

  Future<void> moveToHome(BuildContext context) async {
  if (_formKey.currentState?.validate() ?? false) {
    setState(() {
      changeBtn = true;
    });

    await Future.delayed(const Duration(seconds: 1));

    // Navigate to home
    Navigator.pushNamed(context, MyRoutes.homeRoute);

    setState(() {
      changeBtn = false;
    });
  }
}

moveToSignup(BuildContext context) async{
  Navigator.pushNamed(context, MyRoutes.signupRoute);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
          child: Form(
            key: _formKey,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Image
              // Center(
              //   child: Image.asset(
              //     "assets/images/login_image.png",
              //     height: 220,
              //   ),
              // ),
              // const SizedBox(height: 40),

              // Welcome Text
              Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Cartzy",
                      style: GoogleFonts.poppins(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: context.theme.secondaryHeaderColor,
                      ),
                    ),
                    const SizedBox(width: 8), // space between text and icon
                    const Icon(Icons.shopping_cart, color: Colors.deepPurple),
                  ],
                ),
              ),

              
              const SizedBox(height: 8),
              Text(
                "Sign in to access your Cartzy and explore the latest products.",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 40),

              // Username
              TextFormField(
                
                decoration: InputDecoration(
                  labelText: "Username",
                  labelStyle: GoogleFonts.poppins(color: context.theme.secondaryHeaderColor),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: context.theme.secondaryHeaderColor, width: 2),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your username";
                  }
                  if (value.length < 3) {
                    return "Username must be at least 3 characters";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25),

              // Password
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: GoogleFonts.poppins(color: context.theme.secondaryHeaderColor),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: context.theme.secondaryHeaderColor, width: 2),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  }
                  if (value.length < 6) {
                    return "Username must be at least 6 characters";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40),

              // Animated Login Button
              Center(
                child: Material(
                  color: context.theme.primaryColor,
                  borderRadius: BorderRadius.circular(changeBtn ? 60 : 100),
                  child: InkWell(
                    onTap: () => moveToHome(context),
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      width: changeBtn ? 50 : MediaQuery.of(context).size.width - 56,
                      height: 40,
                      alignment: Alignment.center,
                      child: changeBtn
                          ? const Icon(Icons.done, color: Colors.white)
                          : const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),

              // Signup Option (Inline with small clickable area)
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: GoogleFonts.poppins(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        moveToSignup(context);
                      },
                      child: Text(
                        "Sign up",
                        style: GoogleFonts.poppins(
                          color: accentColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
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
