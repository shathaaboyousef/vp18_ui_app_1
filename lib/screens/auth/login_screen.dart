// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vp18_ui_app_1/utils/context_extentions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _obscureText = false;
  String? _emailErorr;
  String? _passwordErorr;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'Sign In',
                style: GoogleFonts.nunito(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Login to start using app,',
                style: GoogleFonts.roboto(
                  color: Colors.black26,
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: 37,
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
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
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
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
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

                    errorText: _emailErorr,
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 1,
                        )),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.red.shade500,
                          width: 1,
                        ))),
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
                  "Sign In",
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
                    "Don't have an account ?",
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextButton(
                      onPressed: () => Navigator.pushReplacementNamed(
                          context, '/sign_up_screen'),
                      child: Text(
                        "Sign up",
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
    _controlErrors();
    if (_cheackData()) _login();
  }

  bool _cheackData() {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      return true;
    }
    context.showSnackBar(massage: "Enter required   data ", error: true);
    return false;
  }

  void _controlErrors() {
    setState(() {
      _emailErorr =
          _emailController.text.isNotEmpty ? "Enter your email ,plz " : null;
      _passwordErorr = _passwordController.text.isNotEmpty
          ? "Enter your password ,plz "
          : null;
    });
  }

  void _login() {
    context.showSnackBar(
      massage: "Login  sccussfully ",
    );
    Navigator.pushReplacementNamed(context, '/users_screen');
  }
}
