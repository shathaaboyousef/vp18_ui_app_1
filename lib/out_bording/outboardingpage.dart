import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OutBoardingPage extends StatelessWidget {
  const OutBoardingPage({
    Key? key, required this.image, required this.title, required this.subTitle,
  }) : super(key: key);
final String image;
final String title ;
final String subTitle ;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/$image.png',
        ),
        Column(
          children: [
            Text(
              title,
              style: GoogleFonts.nunito(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF23203F),
              ),
            ),
            SizedBox(height : 20.8,),
            Text(
              subTitle,
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                fontSize: 17,
                color: Color(0xFF716F87),
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        )
      ],
    );
  }
}