import 'package:cendikia/pages/rak_buku_page.dart';
import 'package:cendikia/pages/komunitas_page.dart';
import 'package:cendikia/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cendikia/pages/riwayat_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RakBukuPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatScreen()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Riwayat()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AccountScreen()), 
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Cendikia'),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                searchProvider.toggleSearchBar();
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Visibility(
              visible: searchProvider.showSearchBar,
              child: SearchBarWidget(),
            ),
            CategorySection(title: 'Recommended', books: [
              {'title': 'Bintang', 'image': 'assets/cover-novel-bintang-karya-tere-liye.jpg'},
              {'title': 'Hamlet', 'image': 'assets/hamlet.jpg'},
              {'title': 'Negeri 5 Menara', 'image': 'assets/Novel_Negeri_5_Menara__Ahmad_Faudi__Buku_ORI__Soft_Cover.jpg'},
              {'title': 'Ilmu Pengetahuan', 'image': 'assets/ILMU-PENGETAHUAN-DAN-PERILAKU-MANUSIA-001.jpg'},
            ]),
            CategorySection(title: 'Previous Read', books: [
              {'title': 'Siti Nurbaya', 'image': 'assets/siti-nurbaya1.jpg'},
              {'title': 'Perahu Kertas', 'image': 'assets/Cover-Buku-Novel-Perahu-Kertas.jpg'},
              {'title': '5 CM', 'image': 'assets/novel-5-cm.jpg'},
              {'title': 'Bulan', 'image': 'assets/Paket_Novel_Bumi_Dan_Bulan___Tere_Liye__Books_shop.jpg'},
            ]),
            CategorySection(title: 'Most Popular', books: [
              {'title': 'Leadership', 'image': 'assets/image-removebg-preview.png'},
              {'title': 'Mariposa', 'image': 'assets/mariposa.jpg'},
              {'title': 'Ayat-ayat Cinta', 'image': 'assets/image-removebg-preview-51.jpg'},
              {'title': 'Laskar Pelangi', 'image': 'assets/image-removebg-preview-50.jpg'},
            ]),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTap,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections_bookmark),
            label: 'Rak Buku',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Komunitas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections_bookmark_rounded),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}

class SearchBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Cari',
        ),
      ),
    );
  }
}

class SearchProvider extends ChangeNotifier {
  bool _showSearchBar = false;

  bool get showSearchBar => _showSearchBar;

  void toggleSearchBar() {
    _showSearchBar = !_showSearchBar;
    notifyListeners();
  }
}

class CategorySection extends StatelessWidget {
  final String title;
  final List<Map<String, String>> books;

  CategorySection({required this.title, required this.books});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(books[index]['image']!),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Image.asset(
                          books[index]['image']!,
                          fit: BoxFit.cover,
                          errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                            return Container(
                              color: Colors.grey,
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.error,
                                color: Colors.red,
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        books[index]['title']!,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// class AccountScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Akun'),
//       ),
//       body: Center(
//         child: Text('This is the Account Screen'),
//       ),
//     );
//   }
// }
