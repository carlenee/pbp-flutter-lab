import 'package:counter_7/pages/watch_list_detail_page.dart';
import 'package:counter_7/widget/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/model/watch_list.dart';

class WatchListPage extends StatefulWidget {
  const WatchListPage({Key? key}) : super(key: key);

  @override
  _WatchListPageState createState() => _WatchListPageState();
}

class _WatchListPageState extends State<WatchListPage> {
  // List _watchlist = [];
  // @override
  // void initState() {
  //   super.initState();

  //   mywatchlist = getWatchList(context);
  // }

  // void initState() {
  //   getWatchList();
  // }

  // Future<void> getWatchList() async {
  //   final String response =
  //       await rootBundle.loadString('assets/watchlist.json');
  //   final data = json.decode(response);
  //   setState(() {
  //     _watchlist = data["items"];
  //   });
  // }
  

  @override
  Widget build(Object context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          'My Watch List',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: Colors.black54,
          ),
        ),
      ),
      drawer: DrawerClass("My Watch List"),
      body: FutureBuilder(
          // future: fetchMyWatchList(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "Tidak ada watch list :(",
                      style:
                          TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black, blurRadius: 2.0)
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${snapshot.data![index].fields.title}",
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // const SizedBox(height: 10),
                              // Text("${snapshot.data![index].completed}"),
                            ],
                          ),
                        ));
              }
            }
          }
        )
      // body: Padding(
      //   padding: const EdgeInsets.all(25),
      //   child: Column(
      //     children: [
      //       // Display the data loaded from sample.json
      //       _watchlist.isNotEmpty
      //           ? Expanded(
      //               child: ListView.builder(
      //                 itemCount: _watchlist.length,
      //                 itemBuilder: (context, index) {
      //                   return Card(
      //                       key: ValueKey(_watchlist[index]["pk"]),
      //                       margin: const EdgeInsets.all(10),
      //                       color: Color(0xFFB2DFDB),
      //                       child: ListTile(
      //                         title: Text(
      //                             _watchlist[index]["fields"]["title"]),
      //                         onTap: () => Navigator.push(
      //                             context,
      //                             MaterialPageRoute(
      //                                 builder: (context) => WatchListDetailPage(
      //                                       title: _watchlist[index]["fields"]
      //                                           ["title"],
      //                                       watched: _watchlist[index]["fields"]
      //                                           ["watched"],
      //                                       rating: _watchlist[index]["fields"]
      //                                           ["rating"],
      //                                       releasedDate: _watchlist[index]
      //                                           ["fields"]["release_date"],
      //                                       review: _watchlist[index]["fields"]
      //                                           ["review"],
      //                                     ))),
      //                       ));
      //                 },
      //               ),
      //             )
      //           : Container()
      //     ],
      //   ),
      // ),
    );
  }
}
