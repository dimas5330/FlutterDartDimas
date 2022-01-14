import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:modul3_kel10/screens/home.dart';

class DetailAir extends StatefulWidget {
  final int item;
  final String anime;
  const DetailAir({Key? key, required this.item, required this.anime})
      : super(key: key);

  @override
  State<DetailAir> createState() => _DetailAirState();
}

class _DetailAirState extends State<DetailAir> {
  late Future<Desc> detailEpisodes;

  @override
  void initState() {
    super.initState();
    detailEpisodes = fetchDesc(widget.item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.anime),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<Desc>(
            future: detailEpisodes,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.network(snapshot.data!.image),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data!.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Score: ${snapshot.data!.score}',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[600]),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Broadcast: ${snapshot.data!.broadcast}',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[600]),
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            Text(
                              snapshot.data!.synopsis,
                              style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.justify,
                            )
                          ],
                        ),
                      ),
                    ]);
              } else if (snapshot.hasError) {
                return const Center(child: Text('Something went wrong :('));
              }
              return CircularProgressIndicator();
            }),
      ),
    );
  }
}

class Desc {
  final int mal_id;
  final String title;
  final String synopsis;
  final String image;
  final num score;
  final String broadcast;

  Desc(
      {required this.mal_id,
      required this.title,
      required this.synopsis,
      required this.image,
      required this.score,
      required this.broadcast});

  factory Desc.fromJson(Map<String, dynamic> json) {
    return Desc(
        mal_id: json['mal_id'],
        title: json['title'],
        synopsis: json['synopsis'],
        image: json['image_url'],
        score: json['score'],
        broadcast: json['broadcast']);
  }
}

Future<Desc> fetchDesc(id) async {
  final response =
      await http.get(Uri.parse('https://api.jikan.moe/v3/anime/$id'));

  if (response.statusCode == 200) {
    var synopsisJson = jsonDecode(response.body);
    return Desc.fromJson(synopsisJson);
  } else {
    throw Exception('Failed to load episodes');
  }
}
