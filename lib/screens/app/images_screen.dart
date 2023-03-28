import "package:flutter/material.dart";

class ImageScreen extends StatefulWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsetsDirectional.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 8,
      itemBuilder: (context, index) => Container(

        decoration: BoxDecoration(
          color: index % 2 == 0 ? Colors.blue.shade200 : Colors.pink.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
