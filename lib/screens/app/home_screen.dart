import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 10,
            bottom: 10,
          ),
          child: Text(
            "Categories ",
            style: GoogleFonts.roboto(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 100,
          ),
          child: GridView.builder(

            itemCount: 10,
            padding: const EdgeInsetsDirectional.only(
              start: 10,
              end: 10,
            ),
            scrollDirection: Axis.horizontal,
            gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, mainAxisSpacing: 10),
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(

                // boxShadow: const [
                //   BoxShadow(
                //       color: Colors.pink,
                //       blurRadius: 5,
                //       spreadRadius: 5,
                //       offset: Offset(0,-3)
                //   ),
                //   BoxShadow(
                //       color: Colors.green,
                //       blurRadius: 3,
                //       spreadRadius: 1,
                //       offset: Offset(-3,0)
                //   ),   BoxShadow(
                //       color: Colors.blue,
                //       blurRadius: 3,
                //       spreadRadius: 1,
                //       offset: Offset(3,0)
                //   ),   BoxShadow(
                //       color: Colors.yellow,
                //       blurRadius: 3,
                //       spreadRadius: 1,
                //       offset: Offset(0,3)
                //   ),
                // ],

                color: Colors.grey,
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: Align(
                  alignment: AlignmentDirectional.center,
                  child: Text("Item #$index")),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(
            top: 20,
            start: 10,
            bottom: 10,
          ),
          child: Text(
            "Products ",
            style: GoogleFonts.roboto(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        GridView.builder(
          padding: EdgeInsetsDirectional.only(start: 10,end: 10),
          itemCount: 6,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ), physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Card(
            elevation: 5,
            color: index %2==0 ? Colors.purpleAccent : Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10,),
            ),
          ),),
        Padding(
          padding: const EdgeInsetsDirectional.only(
            top: 20,
            start: 10,
            bottom: 10,
          ),
          child: Text(
            " Favorite Products ",
            style: GoogleFonts.roboto(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) =>const Card(
            child:  ListTile(
              trailing: Icon(Icons.shopping_cart,),
              title: Text("  SheIn bag "),
            ),
          ),)

      ],
    );
  }
}
