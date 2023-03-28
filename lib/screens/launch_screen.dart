import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  Future.delayed(const Duration(seconds: 5,), (){

    Navigator.pushReplacementNamed(context, '/out_boarding_screen' );
  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/launch_screen.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Positioned(
              top: 130,
              left: 50,
              right: 50,
              child: Image.asset(
                'assets/images/Group 3.png',

                width: 20,
                height: 30,
              ),),

            Positioned(
                top: 175,
                left: 150,
                right: 150,
                child: Text(
                  "FASHIONS",
                  style: GoogleFonts.poppins(color: Colors.black ,fontStyle: FontStyle.italic, fontSize: 15 ),
                ),),
          ],
        ),
      ),

      // body: Container(
      //   alignment: AlignmentDirectional.center,
      //   decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //       begin:AlignmentDirectional.topStart,
      //       end: AlignmentDirectional.bottomEnd,
      //       colors: [
      //         Colors.pink.shade100,
      //         Colors.blue.shade100,
      //       ]
      //     ),
      //   ),
      //   child: const Text("Ui App "),
      // ),
    );
  }
}
