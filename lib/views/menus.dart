import 'package:flutter/material.dart';

import '../services/auth_services.dart';
import '../services/auth_services_impl.dart';
import 'auth/login_page.dart';
import 'home/menus/profile_page.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            // decoration: BoxDecoration(),
            accountName: Text(
              'Tech Pirates',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            accountEmail: Text(
              'techpirates@gmail.com',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                'DP',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('My Profile'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyProfile(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.bookmarks),
            title: const Text('Bookmarks'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.monetization_on),
            title: const Text('Funding History'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.payments_outlined),
            title: const Text('Payments'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              AuthServices imp = AuthServiceImpl();
              imp.signout();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
          ),
        ],
      ),
    );
  }
}
