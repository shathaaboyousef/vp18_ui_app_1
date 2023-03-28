import 'package:flutter/material.dart';
import 'package:vp18_ui_app_1/models/faq.dart';

class FirstFaqsScreen extends StatefulWidget {
  const FirstFaqsScreen({Key? key}) : super(key: key);

  @override
  State<FirstFaqsScreen> createState() => _FirstFaqsScreenState();
}

class _FirstFaqsScreenState extends State<FirstFaqsScreen> {
  @override

  final List<Faq> _faqs =<Faq>[
    Faq('How to play this app ?', ' first add your id card  '),
    Faq('How much time do we need to wait  ?', ' Just 2 min'),
    Faq('How to play this app ?', ' first add your id card  '),
    Faq('How much time do we need to wait  ?', ' Just 2 min'),
    Faq('How to play this app ?', ' first add your id card  '),
    Faq('How much time do we need to wait  ?', ' Just 2 min'),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FAQS"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ExpansionPanelList(
              elevation: 6,
              dividerColor: Colors.purple,
              expansionCallback: (panelIndex, isExpanded) => setState(() {
                _faqs[panelIndex].expanded =! isExpanded;
              }),
              expandedHeaderPadding: EdgeInsets.symmetric(horizontal: 10),
              children: _faqs.map((faq) => ExpansionPanel(
                isExpanded: faq.expanded,
                  canTapOnHeader: true,
                  backgroundColor: Colors.blue.shade50,
                  headerBuilder: (context, isExpanded) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(faq.qustion),
                  ),
                  body: Text(faq.answer)) ).toList(),
            )
          ],
        ),
      ),
    );
  }
}
