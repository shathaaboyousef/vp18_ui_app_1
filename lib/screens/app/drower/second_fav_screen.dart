import 'package:flutter/material.dart';

import '../../../models/bn_item.dart';
import '../home_screen.dart';
import '../images_screen.dart';
import '../settings_screen.dart';
import '../user_screen.dart';

class SecondFavScreen extends StatefulWidget {
  const SecondFavScreen({Key? key}) : super(key: key);

  @override
  State<SecondFavScreen> createState() => _SecondFavScreenState();
}

class _SecondFavScreenState extends State<SecondFavScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<BnItem> bnItem = const <BnItem>[
    BnItem('Home', HomeScreen()),
    BnItem('Image', ImageScreen()),
    BnItem('User', UserScreen()),
    BnItem('Setting', SettingsScreen()),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
        title: const Text("Second Fav Screen"),
      ),
      body: ListView(

        children: [
          const CircleAvatar(
            radius: 20,
          ),
          const Text("data"),
          const Divider(
            thickness: 1,
          ),
          TabBar(
            onTap: (int index)=>setState(() {
              _tabController.index = index;
            }),
              labelColor: Colors.black,
              controller: _tabController, tabs:const  [
             Tab(
              text: "First ",
            ),
            Tab(
              text: "Second",
            ),
          ]),
          IndexedStack(
            index: _tabController.index,
            sizing: StackFit.expand,

            children: [
              Visibility(
                visible: _tabController.index ==0,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => const ListTile(
                    title: Text("Title"),
                  ),
                ),
              ),
              Visibility(
                visible: _tabController.index ==1,

                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  },
                ),
              ),
            ],
          )
          // SizedBox(
          //   height: MediaQuery.of(context).size.height,
          //   child: TabBarView(
          //     controller: _tabController,
          //     children: [
          //       ListView.builder(
          //         shrinkWrap: true,
          //         physics: NeverScrollableScrollPhysics(),
          //         itemBuilder: (context, index) => const ListTile(
          //           title: Text("Title"),
          //         ),
          //       ),
          //       GridView.builder(
          //         shrinkWrap: true,
          //         physics: NeverScrollableScrollPhysics(),
          //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //             crossAxisCount: 2,
          //             crossAxisSpacing: 10,
          //             mainAxisSpacing: 10),
          //         itemBuilder: (context, index) {
          //           return Card(
          //             elevation: 5,
          //             shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(10),
          //             ),
          //           );
          //         },
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
