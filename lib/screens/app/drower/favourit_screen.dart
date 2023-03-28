import 'package:flutter/material.dart';

class favouritScreen extends StatefulWidget {
  const favouritScreen({Key? key}) : super(key: key);

  @override
  State<favouritScreen> createState() => _favouritScreenState();
}

class _favouritScreenState extends State<favouritScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.red,
          title: const Text('Fav Food'),
          bottom: TabBar(
              controller: _tabController,
              labelColor: Colors.blue,
              indicatorColor: Colors.pink,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsetsDirectional.all(5),
              indicatorWeight: 1,
              // isScrollable: true,
              indicator: BoxDecoration(
                  color: Colors.greenAccent,
                  border: Border.all(
                    color: Colors.yellow,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              physics: const NeverScrollableScrollPhysics(),
              onTap: (int index) => print(index),
              tabs: const [
                Tab(text: 'Tab 1'),
                Tab(text: 'Tab 2'), Tab(text: 'Tab 3'),
                // Tab(text: 'Tab 1'),
                // Tab(text: 'Tab 2'),
                // Tab(text: 'Tab 1'),
                // Tab(text: 'Tab 2'),
                // Tab(text: 'Tab 1'),
                // Tab(text: 'Tab 2'),
                // Tab(text: 'Tab 1'),
                // Tab(text: 'Tab 10'),
              ]),
        ),
        body: TabBarView(controller: _tabController, children: [
          ListView.builder(
            itemBuilder: (context, index) => const ListTile(
              title: Text("Title"),
            ),
          ),
          GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                );
              },),
          ListView.builder(
            itemBuilder: (context, index) => const ListTile(
              title: Text("Title"),
            ),
          ),
        ]));
  }
}
