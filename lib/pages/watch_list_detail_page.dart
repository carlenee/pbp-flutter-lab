import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WatchListDetailPage extends StatelessWidget {
  final String title;
  final bool watched;
  final String rating;
  final String releasedDate;
  final String review;

  const WatchListDetailPage(
      {Key? key,
      required this.title,
      required this.watched,
      required this.rating,
      required this.releasedDate,
      required this.review})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(
            height: 40.0,
          ),
          Text(
            "Released Date: " + releasedDate,
            style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
          ),
          Text(
            "Rating: " + rating + "/5",
            style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
          ),
          showWatched(),
          Text(
            "Review: " + review,
            style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
            ),
        ],
      ),
    );
  }

  showWatched() {
    if (watched == true) {
      return Text(
        "Watched: watched",
        style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
      );
    } else {
      return Text(
        "Watched: not watched",
        style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
      );
    }
  }
}
