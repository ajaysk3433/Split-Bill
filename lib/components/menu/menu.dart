import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:split_bill/components/menu/menu_header.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});
  final EdgeInsetsGeometry listTilePadding = const EdgeInsets.only(left: 30);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          MenuHeader(),
          ListTile(
            contentPadding: listTilePadding,

            title: Text('Group'),
            onTap: () {
              Navigator.pushNamed(context, '/group');
            },
          ),
          ListTile(
            contentPadding: listTilePadding,
            title: Text('Friends'),
            onTap: () {
              Navigator.pushNamed(context, '/friends');
            },
          ),
          ListTile(
            contentPadding: listTilePadding,
            title: Text('Activity'),
            onTap: () {
              Navigator.pushNamed(context, '/activity');
            },
          ),
          Spacer(),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 30, bottom: 40),
            title: Text('Logout'),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
