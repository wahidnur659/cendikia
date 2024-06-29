import 'package:flutter/material.dart';

class DirektoriPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Koleksi'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CategorySection(title: 'Koleksi Buku', books: [
              {'title': 'Komet', 'image': 'assets/KOMET-TERE-LIYE.jpg'},
              {'title': 'June', 'image': 'assets/KOMET-TERE-LIYE.jpg'},
              {
                'title': 'Harry Potter',
                'image':
                    'assets/harry-potter-dan-si-anak-terkutuk-harry-potter-and-the-cursed-child.jpg'
              },
            ]),
            CategorySection(title: ' ', books: [
              {'title': 'The Hobbit', 'image': 'assets/the hobbit.jpg'}
            ])
          ],
        ),
      ),
    );
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
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: 90,
                        height: 130,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(books[index]['image']!),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Image.asset(
                          books[index]['image']!,
                          fit: BoxFit.cover,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
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
