import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {

  final searchTextContoller = TextEditingController().obs;
  final searchTextFocusNode = FocusNode().obs;

  final hotRecommendedList = [
    {
      "id": "3e27e386df09",
      "title": "Dorehami",
      "items_count": 43,
      "created_at": "2016-06-07T19:57:05-04:00",
      "type": "playlist",
      "subtype": "mp3",
      "share_link": "https://rj.app/pm/LwB7DWng",
      "count": 43,
      "followers": 57559,
      "public": true,
      "last_updated_at": "2026-02-06T15:27:56-05:00",
      "bg_color": "#C1B700",
      "custom_photo": false,
      "show_track_numbers": false,
      "bg_colors": [
          "#C1B700",
          "#C1B700"
      ],
      "photo": "https://assets.rjassets.com/static/playlist/2388276/0ee09cd71aac48b.jpg",
      "thumbnail": "https://assets.rjassets.com/static/playlist/2388276/0ee09cd71aac48b-thumb.jpg",
      "photo_player": "https://assets.rjassets.com/static/playlist/2388276/0ee09cd71aac48b.jpg",
      "default_artwork": "https://assets.rjassets.com/static/playlist/2388276/204b447fdaa196c-artwork.jpg",
      "created_by": "By Radio Javan",
      "created_title": "Radio Javan",
      "owner": {
          "display_name": "Radio Javan",
          "photo": "https://assets.rjassets.com/static/profiles/default-rj-thumb.jpg",
          "thumb": "https://assets.rjassets.com/static/profiles/default-rj-thumb-x.jpg"
      },
      "caption": "Kiyarash, Ashvan, Sohrab MJ, Aaren",
      "myplaylist": false,
      "collab": false
    },
    {
      "id": "397e42de6e4d",
      "title": "Mehmooni",
      "items_count": 40,
      "created_at": "2018-03-05T15:05:59-05:00",
      "type": "playlist",
      "subtype": "mp3",
      "share_link": "https://rj.app/pm/435PkkPw",
      "count": 40,
      "followers": 96511,
      "public": true,
      "last_updated_at": "2026-02-06T14:35:58-05:00",
      "bg_color": "#900405",
      "custom_photo": false,
      "show_track_numbers": false,
      "bg_colors": [
          "#900405",
          "#900405"
      ],
      "photo": "https://assets.rjassets.com/static/playlist/6628501/8bcea08702d5a18.jpg",
      "thumbnail": "https://assets.rjassets.com/static/playlist/6628501/8bcea08702d5a18-thumb.jpg",
      "photo_player": "https://assets.rjassets.com/static/playlist/6628501/8bcea08702d5a18.jpg",
      "default_artwork": "https://assets.rjassets.com/static/playlist/6628501/d2228c207fd8b8e-artwork.jpg",
      "created_by": "By Radio Javan",
      "created_title": "Radio Javan",
      "owner": {
          "display_name": "Radio Javan",
          "photo": "https://assets.rjassets.com/static/profiles/default-rj-thumb.jpg",
          "thumb": "https://assets.rjassets.com/static/profiles/default-rj-thumb-x.jpg"
      },
      "caption": "Donya, Amiaa, Feezer, Fedi",
      "myplaylist": false,
      "collab": false
    },
  ].obs;


}