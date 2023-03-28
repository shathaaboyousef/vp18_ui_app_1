import 'package:flutter/material.dart';

class SeceundFaqsScreen extends StatefulWidget {
  const SeceundFaqsScreen({Key? key}) : super(key: key);

  @override
  State<SeceundFaqsScreen> createState() => _SeceundFaqsScreenState();
}

class _SeceundFaqsScreenState extends State<SeceundFaqsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("2 ed Faqs Screen"),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => ExpansionTile(
          onExpansionChanged: (value) {},
          initiallyExpanded: false,
          title: const Text(
            "Title",
          ),
          subtitle: const Text(
            "Sub title",
          ),
          children: const[
             Text("Answer"),
          ],
        ),
      ),
    );
  }
}
