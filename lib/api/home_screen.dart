import 'dart:convert';

import 'package:d_auth/api/artist_details.dart';
import 'package:d_auth/model/artist_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ArtistModel> artist = [];

  Future artistData() async {
    Response response = await http.get(Uri.parse('https://dev.api.pointsoftango.app/artists/27022022_TEFNT5798'));
    print(response.body);

    if (response.statusCode == 200) {
      var parsedData = jsonDecode(response.body);
      artist = (parsedData['results'] as List).map((e) => ArtistModel.fromJson(e)).toList();
      searchList = artist;
      setState(() {});
    }
  }

  TextEditingController search = TextEditingController();

  List searchList = [];

  searchVal(String a) {
    searchList = artist.where((element) {
      return element.artisticName!.contains(a);
    }).toList();
    setState(() {});
  }

  @override
  // ignore: must_call_super
  initState() {
    artistData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: search,
              onChanged: (a) {
                searchVal(a);
                print(a);
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchList.length,
              itemBuilder: (c, i) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ArtistDetails(
                                    artist: artist[i],
                                  )));
                    },
                    child: Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.black), borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text("${searchList[i].artisticName}"),
                        ),
                      ),
                    ),
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
