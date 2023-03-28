import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vp18_ui_app_1/out_bording/out_bording_screen.dart';
import 'package:vp18_ui_app_1/screens/app/drower/favourit_screen.dart';
import 'package:vp18_ui_app_1/screens/app/drower/first_faqs_screen.dart';
import 'package:vp18_ui_app_1/screens/app/drower/secound_faqs_screen.dart';
import 'package:vp18_ui_app_1/screens/app/images_screen.dart';
import 'package:vp18_ui_app_1/screens/app/main_screen.dart';
import 'package:vp18_ui_app_1/screens/app/user_screen.dart';
import 'package:vp18_ui_app_1/screens/auth/login_screen.dart';
import 'package:vp18_ui_app_1/screens/auth/sign_up_screen.dart';

import 'screens/app/drower/second_fav_screen.dart';
import 'screens/app/home_screen.dart';
import 'screens/launch_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

          // primaryColor: Colors.pink,

          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            iconTheme:const IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            centerTitle: true,
          )),
      debugShowCheckedModeBanner: false,
      initialRoute: '/launch_screen',
      routes: {
        '/launch_screen': (context) => const LaunchScreen(),
        '/out_boarding_screen': (context) => const OutBoardingScreen(),
        '/login_screen': (context) => const LoginScreen(),
        '/sign_up_screen': (context) => const SignUpScreen(),
        '/users_screen': (context) => const UserScreen(),
        '/image_screen': (context) => const ImageScreen(),
        '/home_screen': (context) => const HomeScreen(),
        '/main_screen': (context) => const MainScreen(),
        '/fav_screen': (context) => const favouritScreen(),
        '/first_faqs_screen': (context) => const FirstFaqsScreen(),
        '/secound_faqs_screen': (context) => const SeceundFaqsScreen(),
        '/second_faqs_screen': (context) => const SecondFavScreen(),
      },
    );
  }
}
