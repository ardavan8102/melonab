import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melonab/data/models/custom_playlist.dart';

class PlaylistsController extends GetxController {

  RxList<CustomPlaylistModel> playlists = <CustomPlaylistModel>[].obs;

  Map<String, dynamic> fakeData = 
    {
      "playlists" : [
        {
          'id' : 1,
          'title' : 'محبوب ها',
          'count' : 24,
          'color' : Colors.pink,
          'description' : 'لیستی از محبوب ترین',
        },
        {
          'id' : 1,
          'title' : 'معروف ها',
          'count' : 33,
          'color' : Colors.amber,
          'description' : 'لیستی از محبوب ترین',
        },
        {
          'id' : 1,
          'title' : 'شنیده شده ها',
          'count' : 48,
          'color' : Colors.green,
          'description' : 'لیستی از محبوب ترین',
        },
        {
          'id' : 1,
          'title' : 'غمگین ها',
          'count' : 5,
          'color' : Colors.blueAccent,
          'description' : 'لیستی از محبوب ترین',
        },
      ]
    };
  

  @override
  void onInit() {
    super.onInit();

    final List data = fakeData['playlists'];

    playlists.addAll(
      data.map(
        (data) => CustomPlaylistModel.fromJson(data)
      ).toList()
    );
  }
}