import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:counter_7/model/watch_list.dart';



List<WatchList> futureWatchList = [];

  Future<List<WatchList>> fetchMyWatchList() async {
    var url =
        Uri.parse('https://katalog-carlene.herokuapp.com/mywatchlist/json/');
    var response = await http.get(
      url,
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    List<WatchList> listMyWatchList = [];
    for (var d in data) {
      if (d != null) {
        listMyWatchList.add(WatchList.fromJson(d));
        futureWatchList.add(WatchList.fromJson(d));
      }
    }
    return listMyWatchList;
  }