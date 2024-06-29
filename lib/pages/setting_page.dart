import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  void _onItemTapped(String title) {
    // You can handle the navigation or actions here
    print('$title tapped');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SETTINGS'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.blue, // Background color
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Bahasa'),
              onTap: () => _onItemTapped('Bahasa'),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Tentang APK'),
              onTap: () => _onItemTapped('Tentang APK'),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Pemberitahuan'),
              onTap: () => _onItemTapped('Pemberitahuan'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Ganti Akun'),
              onTap: () => _onItemTapped('Ganti Akun'),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Keluar'),
              onTap: () => _onItemTapped('Keluar'),
            ),
          ],
        ),
      ),
    );
  }
}