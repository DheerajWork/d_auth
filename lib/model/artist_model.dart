import 'package:flutter/material.dart';

class ArtistModel {
  String? id;
  Map? users;
  String? artisticName;
  String? bio;
  bool? show;
  int? order;
  String? birthCountry;
  String? pictureUrl;
  List<Media>? media;
  List<String>? type;

  ArtistModel(
      {this.id,
        this.users,
        this.artisticName,
        this.bio,
        this.show,
        this.order,
        this.birthCountry,
        this.pictureUrl,
        this.media,
        this.type});

  ArtistModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if(json['users'] != null){
      users = {};
      users = json['users'];
    }
    artisticName = json['artisticName'];
    bio = json['bio'];
    show = json['show'];
    order = json['order'];
    birthCountry = json['birthCountry'];
    pictureUrl = json['pictureUrl'];
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(Media.fromJson(v));
      });
    }
    type = json['type'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (users != null) {
      data['users'] = users;
    }
    data['artisticName'] = artisticName;
    data['bio'] = bio;
    data['show'] = show;
    data['order'] = order;
    data['birthCountry'] = birthCountry;
    data['pictureUrl'] = pictureUrl;
    if (media != null) {
      data['media'] = media!.map((v) => v.toJson()).toList();
    }
    data['type'] = type;
    return data;
  }
}

class Media {
  String? link;
  String? title;

  Media({this.link, this.title});

  Media.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['link'] = link;
    data['title'] = title;
    return data;
  }
}
