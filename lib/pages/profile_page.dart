import 'package:cendikia/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:cendikia/pages/membership_page.dart';
import 'package:translator_plus/translator_plus.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final GoogleTranslator _translator = GoogleTranslator();
  String _selectedLanguage = 'id'; // Default language code, e.g., 'id' for Indonesian

  void _onItemTapped(BuildContext context, String title) {
    switch (title) {
      case 'Membership':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MembershipScreen()),
        );
        break;
      case 'Bahasa':
        // Implementasi pilihan bahasa (menggunakan showDialog)
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Center(
              child: AlertDialog(
                title: Text('Pilih Bahasa'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _changeLanguage('id');
                          Navigator.pop(context); // Tutup dialog setelah memilih bahasa
                        },
                        child: Text('Bahasa Indonesia'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          _changeLanguage('en');
                          Navigator.pop(context); // Tutup dialog setelah memilih bahasa
                        },
                        child: Text('Bahasa Inggris'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
        break;
      case 'Tentang Aplikasi':
        _showAboutAPKDialog(context);
        break;
      default:
        print('$title ditekan');
    }
  }

  Future<void> _translateText(BuildContext context, String text, String toLanguageCode) async {
    try {
      final Translation translation = await _translator.translate(text, to: toLanguageCode);
      print('Original: $text\nTranslated: ${translation.text}');

      // Contoh penggunaan hasil terjemahan:
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${translation.text}'),
        ),
      );

      // Simpan preferensi bahasa yang dipilih
      setState(() {
        _selectedLanguage = toLanguageCode;
      });

      // Tampilkan notifikasi pergantian bahasa
      _showLanguageChangedNotification(context);
    } catch (error) {
      print('Error terjemahkan teks: $error');
    }
  }

  void _changeLanguage(String languageCode) {
    // Lakukan terjemahan dan perubahan bahasa di sini
    _translateText(context, 'Hello, how are you?', languageCode);
    // Anda bisa menambahkan fungsi untuk merubah semua tampilan bahasa di aplikasi
    // Contoh: updateLanguageInApp(languageCode);
  }

  void _showLanguageChangedNotification(BuildContext context) {
    // Tampilkan notifikasi pergantian bahasa (misalnya, dengan SnackBar)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Bahasa diubah ke ${_selectedLanguage == 'id' ? 'Bahasa Indonesia' : 'Bahasa Inggris'}'),
      ),
    );
  }

  void _showAboutAPKDialog(BuildContext context) {
    // Show dialog with APK details
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/cendikia.png', width: 72, height: 72),
                SizedBox(height: 12),
                Text('Cendikia', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              ],
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Column(
                  children: [
                    Text(
                      'Versi Aplikasi : 2.0',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Developer : Team Rover',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.red,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Tutup'),
              ),
            ],
          ),
        );
      },
    );
  }

    void _handleSignOut(BuildContext context) {
    // Navigate back to LoginPage
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
      (route) => false, // Prevent going back to the previous page
    );
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
                SizedBox(height: 60), // Spasi untuk status bar
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
                GestureDetector(
                  onTap: () => _onItemTapped(context, 'Membership'),
                  child: ListTile(
                    leading: Icon(Icons.card_membership),
                    title: Text('Membership'),
                  ),
                ),
                GestureDetector(
                  onTap: () => _onItemTapped(context, 'Bahasa'),
                  child: ListTile(
                    leading: Icon(Icons.language),
                    title: Text('Bahasa'),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.contact_phone),
                  title: Text('Hubungi Kami'),
                ),
                ListTile(
                  leading: Icon(Icons.rate_review),
                  title: Text('Beri Ulasan'),
                ),
                ListTile(
                  leading: Icon(Icons.adb_outlined),
                  title: Text('Tentang Aplikasi'),
                  onTap: () => _onItemTapped(context, 'Tentang Aplikasi'),
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Log Out'),
                  onTap: () => _handleSignOut(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AccountScreen(),
  ));
}
