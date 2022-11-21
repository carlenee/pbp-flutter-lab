import 'package:counter_7/pages/watch_list_detail_page.dart';
import 'package:counter_7/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/function/fecth_watch_list.dart';

class WatchListPage extends StatefulWidget {
  const WatchListPage({Key? key}) : super(key: key);

  @override
  _WatchListPageState createState() => _WatchListPageState();
}

class _WatchListPageState extends State<WatchListPage> {
  // late Future<List<WatchList>> futureWatchList;
  // List _watchlist = [];
  // @override
  // void initState() {
  //   super.initState();

  //   mywatchlist = getWatchList(context);
  // }

  // void initState() {
  //   super.initState();
  //   futureWatchList = fetchMyWatchList();
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
          title: const Text(
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
            future: fetchMyWatchList(),
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
                          horizontal: 8, vertical: 8),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Color(0xffb2d2a4),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WatchListDetailPage(
                                      title:
                                          futureWatchList[index].fields.title,
                                      watched:
                                          futureWatchList[index].fields.watched,
                                      rating:
                                          futureWatchList[index].fields.rating,
                                      releasedDate: futureWatchList[index]
                                          .fields
                                          .releaseDate
                                          .toString(),
                                      review:
                                          futureWatchList[index].fields.review,
                                    ))),
                        child: Row(
                          children: [
                            Text(
                              "${snapshot.data![index].fields.title}",
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 100.0,
                            ),
                            Checkbox(
                                checkColor: Colors.white,
                                activeColor: const Color(0xffb2d2a4),
                                value: futureWatchList[index].fields.watched,
                                onChanged: (bool? value) {
                                  setState(() {
                                    futureWatchList[index].fields.watched =
                                        value!;
                                  });
                                }),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              }
            }));
  }
}
