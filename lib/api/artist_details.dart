import 'package:d_auth/model/artist_model.dart';
import 'package:flutter/material.dart';

class ArtistDetails extends StatefulWidget {
  final ArtistModel? index;

  const ArtistDetails({Key? key, this.index}) : super(key: key);

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
              Text("${widget.index!.artisticName}"),
              const SizedBox(
                height: 10,
              ),
              widget.index!.pictureUrl != "" ? Image.network("${widget.index!.pictureUrl}") : Icon(Icons.image_not_supported_outlined, size: 50),
              const SizedBox(
                height: 10,
              ),
              Text("${widget.index!.birthCountry}"),
              const SizedBox(
                height: 10,
              ),
              Text("${widget.index!.show}"),
              const SizedBox(
                height: 10,
              ),
              Text("${widget.index!.type}"),
            ],
          ),
        ),
      ),
    );
  }
}
