// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vp18_ui_app_1/utils/context_extentions.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _phoneController;
  bool _obscureText = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _phoneController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Sign Up',
                    style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Create an account ',
                    style: GoogleFonts.roboto(
                      color: Colors.black26,
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 37,
              ),
              TextField(
                keyboardType: TextInputType.text,
                controller: _firstNameController,
                decoration: InputDecoration(
                  // fillColor: Colors.blue.shade100,
                  // filled: true,
                  hintText: "Enter first name ...",
                  prefixIcon: const Icon(
                    Icons.person,
                  ),
                  // label: Text(
                  //   "First name",
                  //   style: GoogleFonts.poppins(
                  //     color: Colors.blue,
                  //   ),
                  // ),
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(10),
                  // ),
                ),
                cursorColor: Colors.black,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.text,
                controller: _lastNameController,
                decoration: InputDecoration(
                  // fillColor: Colors.blue.shade100,
                  // filled: true,
                  hintText: "Enter last name ...",
                  prefixIcon: const Icon(
                    Icons.person,
                  ),
                  // label: Text(
                  //   "Last name",
                  //   style: GoogleFonts.poppins(
                  //     color: Colors.blue,
                  //   ),
                  // ),
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(10),
                  // ),
                ),
                cursorColor: Colors.black,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: InputDecoration(
                  // fillColor: Colors.blue.shade100,
                  // filled: true,
                  hintText: "Enter your email here ...",
                  prefixIcon: const Icon(
                    Icons.email,
                  ),
                  // label: Text(
                  //   "Email",
                  //   style: GoogleFonts.poppins(
                  //     color: Colors.blue,
                  //   ),
                  // ),
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(10),
                  // ),
                ),
                cursorColor: Colors.black,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.phone,
                controller: _phoneController,
                decoration: InputDecoration(
                  // fillColor: Colors.blue.shade100,
                  // filled: true,
                  hintText: "Enter your phone number ...",
                  prefixIcon: const Icon(
                    Icons.phone_android,
                  ),
                  // label: Text(
                  //   "Email",
                  //   style: GoogleFonts.poppins(
                  //     color: Colors.blue,
                  //   ),
                  // ),
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(10),
                  // ),
                ),
                cursorColor: Colors.black,
              ),
              TextField(
                // style: GoogleFonts.roboto(
                //   fontSize: 22,
                //   fontWeight: FontWeight.w300,
                // ),
                obscureText: _obscureText,
                keyboardType: TextInputType.visiblePassword,
                controller: _passwordController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: "Enter password here ...",
                  prefixIcon: Icon(Icons.lock),

                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      )),
                  // label: Text(
                  //   "Password",
                  //   style: GoogleFonts.poppins(
                  //     color: Colors.blue,
                  //   ),
                  // ),
                  // fillColor: Colors.blue.shade100,
                  // filled: true,
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(10),
                  // ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => _performLogin(),
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF6A90F2),
                    minimumSize: const Size(
                      double.infinity,
                      50,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: Text(
                  "Sign Up",
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    "Have an account ?",
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sign In",
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _performLogin() {
    if (_cheackData()) {
      _login();
    }
  }

  bool _cheackData() {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _firstNameController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty) {
      return true;
    }
    context.showSnackBar(massage: "Enter required   data ", error: true);
    return false;
  }

  void _login() {
    context.showSnackBar(
      massage: "Login  sccussfully ",
    );
  }
}
