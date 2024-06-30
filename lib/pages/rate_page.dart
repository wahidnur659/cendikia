import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class RatingPage extends StatefulWidget {
  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  double _rating = 3.5; // Default rating disetengah
  String _ratingText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rating Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Team Reaver',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Muhammad Fachri Agus M',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                'Wahid Nurrohim',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                'Wahyu Adi Nugroho',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20), // Jarak antara teks dan rating bar
              RatingBar.builder(
                initialRating: _rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _rating = rating;
                    if (rating == 1.0) {
                      _ratingText = 'Yah Sayang Sekali';
                    } else if (rating == 2.0) {
                      _ratingText = 'Tambahin Lagi ga sih';
                    } else if (rating == 3.0) {
                      _ratingText = 'Terbaik Kawan';
                    } else if (rating == 4.0) {
                      _ratingText = 'Kamu Keren Kawan';
                    } else if (rating == 5.0) {
                      _ratingText = 'Fantastic Kawan';
                    } else if (rating > 1.0 && rating < 2.0) {
                      _ratingText = 'Yakin Nih Setengah doang?';
                    } else if (rating > 2.0 && rating < 3.0) {
                      _ratingText = 'Yah Masa Setengah doang';
                    } else if (rating > 3.0 && rating < 4.0) {
                      _ratingText = 'Ayoklah Kawan';
                    } else if (rating > 4.0 && rating < 5.0) {
                      _ratingText = 'Kurang ngak sih';
                    }
                  });
                },
              ),
              SizedBox(height: 20),
              if (_ratingText.isNotEmpty)
                AnimationConfiguration.staggeredList(
                  position: 1,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: Text(
                        _ratingText,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}