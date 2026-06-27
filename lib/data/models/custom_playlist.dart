import 'package:flutter/material.dart';

class CustomPlaylistModel {

  int id;
  String title;
  int songCount;
  Color playlistColor;
  String description;


  CustomPlaylistModel({
    required this.id,
    required this.title,
    required this.songCount,
    required this.playlistColor,
    required this.description,
  });


  factory CustomPlaylistModel.fromJson(Map<String, dynamic> json){

    return CustomPlaylistModel(
      id: json['id'],
      title: json['title'],
      songCount: json['count'],
      playlistColor: json['color'],
      description: json['description']
    );

  }

}