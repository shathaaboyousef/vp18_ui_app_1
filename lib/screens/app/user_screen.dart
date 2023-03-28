import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => ListTile(
          title: Text(" Person 1"),
          subtitle: Text("Shatha Nadir "),
          leading: Icon(Icons.person),
        ),
        separatorBuilder: (context, index) => Divider(),
        itemCount: 5);
  }
}
