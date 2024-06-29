import 'package:cendikia/pages/setting_page.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  void _onItemTapped(BuildContext context, String title) {
    switch (title) {
      case 'Settings':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsPage()),
        );
        break;
      default:
        print('$title tapped');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 60), // Space for the status bar
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/ic_profile.png'),
                ),
                SizedBox(height: 10),
                Text(
                  'NaoMilize',
                  style: TextStyle(fontSize: 24, color: Color.fromARGB(255, 19, 19, 224), fontWeight: FontWeight.bold),
                ),
                Text(
                  'NaoMilize@gmail.com',
                  style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 19, 19, 224)),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.book),
                  title: Text('Rak Buku'),
                ),
                ListTile(
                  leading: Icon(Icons.card_membership),
                  title: Text('Membership'),
                ),
                ListTile(
                  leading: Icon(Icons.contact_phone),
                  title: Text('Contact Us'),
                ),
                ListTile(
                  leading: Icon(Icons.rate_review),
                  title: Text('Beri Ulasan'),
                ),
                ListTile(
                  leading: Icon(Icons.store_mall_directory_outlined),
                  title: Text('Direktori'),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}