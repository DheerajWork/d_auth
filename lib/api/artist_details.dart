import 'package:d_auth/model/artist_model.dart';
import 'package:flutter/material.dart';

class ArtistDetails extends StatefulWidget {
  final ArtistModel? artist;

  const ArtistDetails({Key? key, this.artist}) : super(key: key);

  @override
  State<ArtistDetails> createState() => _ArtistDetailsState();
}

class _ArtistDetailsState extends State<ArtistDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${widget.artist!.artisticName}"),
              const SizedBox(
                height: 10,
              ),
              widget.artist!.pictureUrl != "" ? Image.network("${widget.artist!.pictureUrl}") : const SizedBox(),
              const SizedBox(
                height: 10,
              ),
              Text("${widget.artist!.birthCountry}"),
              const SizedBox(
                height: 10,
              ),
              Text("${widget.artist!.show}"),
              const SizedBox(
                height: 10,
              ),
              Column(
                children:
                  List.generate(widget.artist!.type!.length, (index) {
                    return Text("${index+1} ${widget.artist!.type![index]}");
                  })
              ),
              const SizedBox(
                height: 10,
              ),
              Text("${widget.artist!.users!.length}"),
            ],
          ),
        ),
      ),
    );
  }
}
