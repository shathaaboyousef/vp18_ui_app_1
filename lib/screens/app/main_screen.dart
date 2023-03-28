import 'package:flutter/material.dart';
import 'package:vp18_ui_app_1/screens/app/home_screen.dart';
import 'package:vp18_ui_app_1/screens/app/images_screen.dart';
import 'package:vp18_ui_app_1/screens/app/settings_screen.dart';
import 'package:vp18_ui_app_1/screens/app/user_screen.dart';

import '../../models/bn_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<BnItem> bnItem = const <BnItem>[
    BnItem('Home', HomeScreen()),
    BnItem('Image', ImageScreen()),
    BnItem('User', UserScreen()),
    BnItem('Setting', SettingsScreen()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bnItem[_currentIndex].title),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
              accountName: const Text("Flutter developer "),
              accountEmail: Text("Flutter@gmail.com"),
              otherAccountsPictures: [
                CircleAvatar(),
                CircleAvatar(),
                CircleAvatar(),
              ],
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.info),
              title: const Text("Info"),
              subtitle: const Text("More info about the app"),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 13,
              ),
            ),
            ListTile(
              onTap: () => Navigator.pushNamed(context, '/first_faqs_screen'),
              leading: const Icon(Icons.question_answer),
              title: const Text("FAQS"),
              subtitle: const Text("Most common FAQS (1)"),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 13,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(const Duration(milliseconds: 500),(){
                  Navigator.pushNamed(context, '/secound_faqs_screen');
                });
              },
              leading: const Icon(Icons.question_answer),
              title: const Text("FAQS"),
              subtitle: const Text("Most common FAQS (2)"),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 13,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(const Duration(milliseconds: 500),(){
                  Navigator.pushNamed(context, '/fav_screen');
                });
              },
              leading: const Icon(Icons.favorite),
              title: const Text("Fav"),
              subtitle: const Text("Fav Food"),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 13,
              ),
            ),      ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(const Duration(milliseconds: 500),(){
                  Navigator.pushNamed(context, '/second_faqs_screen');
                });
              },
              leading: const Icon(Icons.favorite),
              title: const Text("Fav"),
              subtitle: const Text("Fav Food(2)"),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 13,
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.logout_outlined),
              title: const Text("Log out"),
              subtitle: const Text("Return to login"),
            ),
          ],
        ),
      ),
      body: bnItem[_currentIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        onTap: (int currentIndex) {
          setState(() {
            _currentIndex = currentIndex;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.image_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: ''),
        ],
      ),
    );
  }
}
