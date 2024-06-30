import 'package:url_launcher/url_launcher.dart';
import 'package:cendikia/pages/login_page.dart';
import 'package:cendikia/pages/rate_page.dart';
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
      case 'Beri Ulasan':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RatingPage()),
        );
        break;
      case 'Hubungi Kami':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(
                title: Text('Hubungi Kami'),
              ),
              body: ListView(
                children: [
                  ContactListTile(name: 'Wahid Nurrohim', email: 'wahidnurrohim@students.amikom.ac.id'),
                  ContactListTile(name: 'Muhammad Fachri Agus M', email: 'fachriagus.m@students.amikom.ac.id'),
                  ContactListTile(name: 'Wahyu Adi Nugroho', email: 'wahyuadi@students.amikom.ac.id'),
                ],
              ),
            ),
          ),
        );
        break;
      default:
        print('$title ditekan');
    }
  }

  Future<void> _translateText(BuildContext context, String text, String toLanguageCode) async {
    try {
      final Translation translation = await _translator.translate(text, to: toLanguageCode);
      print('Original: $text\nTranslated: ${translation.text}');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${translation.text}'),
        ),
      );

      setState(() {
        _selectedLanguage = toLanguageCode;
      });

      _showLanguageChangedNotification(context);
    } catch (error) {
      print('Error terjemahkan teks: $error');
    }
  }

  void _changeLanguage(String languageCode) {
    _translateText(context, 'Hello, how are you?', languageCode);
  }

  void _showLanguageChangedNotification(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Bahasa diubah ke ${_selectedLanguage == 'id' ? 'Bahasa Indonesia' : 'Bahasa Inggris'}'),
      ),
    );
  }

  void _showAboutAPKDialog(BuildContext context) {
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
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
      (route) => false,
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
                ListTile(
                  leading: Icon(Icons.card_membership),
                  title: Text('Membership'),
                  onTap: () => _onItemTapped(context, 'Membership'),
                ),
                ListTile(
                  leading: Icon(Icons.language),
                  title: Text('Bahasa'),
                  onTap: () => _onItemTapped(context, 'Bahasa'),
                ),
                ListTile(
                  leading: Icon(Icons.contact_phone),
                  title: Text('Hubungi Kami'),
                  onTap: () => _onItemTapped(context, 'Hubungi Kami'),
                ),
                ListTile(
                  leading: Icon(Icons.rate_review),
                  title: Text('Beri Ulasan'),
                  onTap: () => _onItemTapped(context, 'Beri Ulasan'),
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

class ContactListTile extends StatefulWidget {
  final String name;
  final String email;

  ContactListTile({required this.name, required this.email});

  @override
  _ContactListTileState createState() => _ContactListTileState();
}

class _ContactListTileState extends State<ContactListTile> {
  bool _isTapped = false;

  void _handleTap() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: widget.email,
    );
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      print('Could not launch $emailLaunchUri');
    }

    setState(() {
      _isTapped = !_isTapped;
    });

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isTapped = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.name),
      subtitle: InkWell(
        child: Row(
          children: [
            Icon(
              Icons.email,
              color: _isTapped ? Colors.blue : Colors.black,
            ),
            SizedBox(width: 5),
            Flexible(
              child: Text(
                widget.email,
                style: TextStyle(
                  color: _isTapped ? Colors.blue : Colors.black,
                  decoration: TextDecoration.underline,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        onTap: _handleTap,
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AccountScreen(),
  ));
}
