import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Interface'),
      ),
      body: Container(
        color: Colors.blue[100],
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(10.0),
                children: <Widget>[
                  ChatMessage(
                    sender: 'Kirin',
                    message: 'Buku apa yang bagus?',
                    time: '19.12',
                  ),
                  ChatMessage(
                    sender: 'Anda',
                    message: 'Buku investasi bagus',
                    time: '19.12',
                    isMe: true,
                  ),
                  ChatMessage(
                    sender: 'Dicky',
                    message: 'Buku bintang juga bagus',
                    time: '19.13',
                    imageUrl: 'assets/cover-novel-bintang-karya-tere-liye.jpg',
                  ),
                  ChatMessage(
                    sender: 'Anda',
                    message: 'Oke, Terimakasih...',
                    time: '19.12',
                    isMe: true,
                  ),
                ],
              ),
            ),
            Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
            color: Colors.grey[800],
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.emoji_emotions),
                  color: Colors.blue,
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Ketik pesan',
                      hintStyle: TextStyle(color: Colors.white54),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.attach_file),
                  color: Colors.white54,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.camera_alt),
                  color: Colors.white54,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.mic),
                  color: Colors.blue,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class ChatMessage extends StatelessWidget {
  final String sender;
  final String message;
  final String time;
  final bool isMe;
  final String? imageUrl;

  ChatMessage({
    required this.sender,
    required this.message,
    required this.time,
    this.isMe = false,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (!isMe) ...[
            CircleAvatar(child: Text(sender[0])),
            SizedBox(width: 10.0),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '$sender $time',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 5.0),
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: isMe ? Colors.blue[300] : Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        message,
                        style: TextStyle(
                          color: isMe ? Colors.white : Colors.black87,
                        ),
                      ),
                      if (imageUrl != null) ...[
                        SizedBox(height: 10.0),
                        Image.network(
                          imageUrl!,
                          height: 150.0,
                          width: 100.0,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (isMe) ...[
            SizedBox(width: 10.0),
            CircleAvatar(child: Text(sender[0])),
          ],
        ],
      ),
    );
  }
}
